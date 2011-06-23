using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Diagnostics;
using System.Reflection;
using Boo.Lang.Compiler;

namespace BooEulerTool
{
    public class OneRunner
    {
        public static int Run(string file, int timeout)
        {
            var compiler = new BooEulerCompiler();
            Stopwatch run = new Stopwatch();
            int exit = 0;
            try
            {
                var action = compiler.Compile(file);
                run.Start();
                action(null);
            }
            catch (Exception e)
            {
                while (e is TargetInvocationException) e = (e as TargetInvocationException).InnerException;
                Console.ForegroundColor = ConsoleColor.Yellow;
                while (e != null)
                {
                    Console.Error.WriteLine("{0}: {1}", e.GetType().Name, e.Message);
                    if (e is CompilerError)
                        Console.Error.WriteLine("{0} {1}", (e as CompilerError).Code, (e as CompilerError).LexicalInfo);
                    Console.Error.WriteLine(e.StackTrace);
                    e = e.InnerException;
                }
                exit = 3;
            }
            Console.ForegroundColor = ConsoleColor.Gray;
            Console.WriteLine("Time: {0}ms", run.ElapsedMilliseconds);
            return exit;
        }
    }
}
