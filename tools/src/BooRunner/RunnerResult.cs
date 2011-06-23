using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Reflection;

namespace BooEulerTool
{
    public class RunnerResult
    {
        Exception exception;
        string[] lines;
        TimeSpan elapsed;

        public TimeSpan Elapsed { get { return elapsed; } }
        public Exception Exception { get { return exception; } }
        public bool HasException { get { return exception != null; } }
        public string LastLine { get { return lines.LastOrDefault() ?? "<none>"; } }
        public bool HasMoreThanOneLine { get { return lines.Length > 1; } }

        public RunnerResult(TimeSpan elapsed, string[] lines, Exception exception)
        {
            this.lines = lines;

            while (exception is TargetInvocationException)
                exception = exception.InnerException;

            this.exception = exception;
            this.elapsed = elapsed;
        }
    }
}
