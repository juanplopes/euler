using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Reflection;
using System.IO;
using System.Threading;

namespace BooEulerTool
{
    public class CompilationResult
    {
        string[] lastRun;
        public string[] LastRun { get { return lastRun; } }

        public string[] Run(Action<string[]> action, int timeout)
        {
            using (var stream = new MemoryStream())
            {
                var writer = new StreamWriter(stream);
                var defOut = Console.Out;
                Console.SetOut(writer);
                try
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
                    t.Start();
                    if (!t.Join(timeout))
                    {
                        t.Abort();
                        throw new TimeoutException();
                    }
                    if (threadEx != null) throw threadEx;
                }
                finally
                {
                    writer.Flush();
                    stream.Seek(0, SeekOrigin.Begin);
                    var reader = new StreamReader(stream);
                    lastRun = Enumerate(reader).ToArray();
                    Console.SetOut(defOut);
                }
                return lastRun;
            }
        }

        IEnumerable<string> Enumerate(StreamReader reader)
        {
            string line;
            while ((line = reader.ReadLine()) != null)
                yield return line;
        }
    }
}
