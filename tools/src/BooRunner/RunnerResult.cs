using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Reflection;
using System.IO;

namespace BooEulerTool
{
    public class RunnerResult
    {
        string file;
        Exception exception;
        string[] lines;
        TimeSpan? elapsed;

        public TimeSpan Elapsed { get { return elapsed ?? TimeSpan.Zero; } }
        public Exception Exception { get { return exception; } }

        public bool HasTime { get { return elapsed != null; } }
        public bool HasException { get { return exception != null; } }

        public string LastLine { get { return lines.LastOrDefault() ?? "<none>"; } }
        public bool HasMoreThanOneLine { get { return lines.Length > 1; } }
        public int RecommendedWidth { get { return Path.GetFileName(file).Length + 1; } }


        public RunnerResult(string file) : this(file, null) { }
        public RunnerResult(string file, Exception exception) : this(file, null, new string[0], exception) { }
        public RunnerResult(string file, TimeSpan? elapsed, string[] lines, Exception exception)
        {
            this.file = file;
            this.lines = lines;

            while (exception is TargetInvocationException)
                exception = exception.InnerException;

            this.exception = exception;
            this.elapsed = elapsed;
        }

        public RunnerResult PrintFile(int columns)
        {
            Console.ForegroundColor = ConsoleColor.Gray;
            Console.Write("{0,-" + columns + "}", Path.GetFileName(file));
            return this;
        }

        public RunnerResult PrintResult()
        {
            if (HasTime)
                Console.Write(" {0,6}ms", (long)Elapsed.TotalMilliseconds);

            if (HasException)
            {
                Console.ForegroundColor = ConsoleColor.Red;
                Console.Write(" ({0}) {1}: {2}", LastLine, Exception.GetType().Name, Exception.Message);
            }
            else
            {
                Console.Write(" {0}", LastLine);
                Console.ForegroundColor = ConsoleColor.Yellow;
                Console.Write(" {0}", HasMoreThanOneLine ? "(+)" : "");
            }
            Console.WriteLine(new string(' ', Console.WindowWidth - Console.CursorLeft - 1));
            Console.ForegroundColor = ConsoleColor.Gray;
            return this;
        }

        public RunnerResult RunWith(BooEulerCompiler compiler, TimeoutRunner runner)
        {
            try
            {
                return runner.Run(file, compiler.Compile(file));
            }
            catch (Exception e)
            {
                return new RunnerResult(file, e);
            }
        }

        public RunnerResult PrintSilent()
        {
            if (HasException)
                Console.Error.Write("F");
            else
                Console.Error.Write(".");
            return this;
        }
    }
}
