using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.IO;

namespace BooEulerTool
{
    public class ManyRunner
    {
        public static int Run(string[] files, int timeout, bool sorted)
        {
            var compiler = new BooEulerCompiler();
            var runner = new TimeoutRunner(timeout);

            IList<RunnerResult> results = files.Select(x => new RunnerResult(x)).ToList();
            var columns = results.Max(x => x.RecommendedWidth);
            if (sorted)
            {
                results = results.Select(x => x.RunWith(compiler, runner).PrintSilent())
                    .OrderBy(x => x.HasException).ThenBy(x => x.Elapsed).ToList();
                Console.Error.WriteLine();
                foreach (var result in results)
                    result.PrintFile(columns).PrintResult();
            }
            else
            {
                results = results.Select(x => x.PrintFile(columns).RunWith(compiler, runner).PrintResult()).ToList();
            }


            return PrintFinish(files, results);
        }
        private static int PrintFinish(string[] files, IEnumerable<RunnerResult> results)
        {
            var failed = results.Where(x => x.HasException).Count();
            var time = results.Select(x => x.Elapsed.TotalMilliseconds).Sum();

            Console.Error.Write("Total: {0} examples in {1:0.0}ms", files.Length, time);
            if (failed > 0) Console.Error.Write("  Failed: {0}", failed);
            Console.Error.WriteLine();
            return failed == 0 ? 0 : 3;
        }


    }
}
