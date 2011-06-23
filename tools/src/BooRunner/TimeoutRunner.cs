using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Reflection;
using System.IO;
using System.Threading;
using System.Diagnostics;

namespace BooEulerTool
{
    public class TimeoutRunner
    {
        public RunnerResult Run(Action<string[]> action, int timeout)
        {
            using (var stream = new MemoryStream())
            {
                var writer = new StreamWriter(stream);
                var defOut = Console.Out;
                Console.SetOut(writer);

                Exception ex;
                string[] lines;
                var sw = Stopwatch.StartNew();
                try
                {
                     ex = RunAction(action, timeout);
                }
                finally
                {
                    lines = FinishStream(stream, writer);
                    Console.SetOut(defOut);
                }
                return new RunnerResult(sw.Elapsed, lines, ex);
            }
        }

        private string[] FinishStream(MemoryStream stream, StreamWriter writer)
        {
            writer.Flush();
            stream.Seek(0, SeekOrigin.Begin);
            var reader = new StreamReader(stream);
            return Enumerate(reader).ToArray();
        }

        private static Exception RunAction(Action<string[]> action, int timeout)
        {
            Exception threadEx = null;
            var t = new Thread(() =>
            {
                try
                {
                    action(null);
                }
                catch (Exception e)
                {
                    threadEx = e;
                }
            });
            threadEx = threadEx ?? JoinWithTimeout(t, timeout);
            return threadEx;
        }

        private static Exception JoinWithTimeout(Thread t, int timeout)
        {
            t.Start();
            if (!t.Join(timeout))
            {
                t.Abort();
                return new TimeoutException();
            }
            return null;
        }

        IEnumerable<string> Enumerate(StreamReader reader)
        {
            string line;
            while ((line = reader.ReadLine()) != null)
                yield return line;
        }
    }
}
