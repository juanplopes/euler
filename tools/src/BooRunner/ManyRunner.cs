using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.IO;

namespace BooEulerTool
{
    public class ManyRunner
    {
        public static int Run(string[] files, int timeout)
        {
            var compiler = new BooEulerCompiler();
            long accum = 0;
            int failed = 0;
            int fColumn = files.Max(x => Path.GetFileName(x).Length) + 1;
            foreach (var file in files)
            {
                Console.ForegroundColor = ConsoleColor.Gray;

                Console.Write("{0,-" + fColumn + "}", Path.GetFileName(file));
                try
                {
                    var result = RunSingleOfMany(timeout, compiler, file);
                    accum += (long)result.Elapsed.TotalMilliseconds;
                    if (result.HasException) failed++;
                    Console.WriteLine();
                }
                catch (Exception e)
                {
                    failed++;
                    Console.ForegroundColor = ConsoleColor.Red;
                    Console.WriteLine("{0}: {1}", e.GetType().Name, e.Message);
                }
            }
            Console.ForegroundColor = ConsoleColor.Gray;
            Console.Write("Total: {0} examples in {1}ms", files.Length, accum);
            if (failed > 0) Console.Write("  Failed: {0}", failed);
            Console.WriteLine();
            return failed == 0 ? 0 : 3;
        }

        private static RunnerResult RunSingleOfMany(int timeout, BooEulerCompiler compiler, string file)
        {
            var runner = new TimeoutRunner();
            var action = compiler.Compile(file);
            var result = runner.Run(action, timeout);
            Console.Write(" {0,6}ms", (long)result.Elapsed.TotalMilliseconds);

            if (result.HasException)
            {
                Console.ForegroundColor = ConsoleColor.Red;
                Console.Write(" ({0}) {1}: {2}", result.LastLine, result.Exception.GetType().Name, result.Exception.Message);
            }
            else
            {
                Console.Write(" {0}", result.LastLine);
                Console.ForegroundColor = ConsoleColor.Yellow;
                Console.Write(" {0}", result.HasMoreThanOneLine ? "(+)" : "");
            }
            return result;
        }
    }
}
