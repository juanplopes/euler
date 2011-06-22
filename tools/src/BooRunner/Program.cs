using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Diagnostics;
using System.IO;
using System.Threading;
using System.Reflection;

namespace BooEulerTool
{
    class Program
    {
        static int Main(string[] args)
        {
            if (args.Length == 0)
            {
                Console.WriteLine("specify input files");
                return 1;
            }

            var files = args.SelectMany(pattern =>
            {
                var dir = Path.GetDirectoryName(pattern);
                if (string.IsNullOrEmpty(dir)) dir = ".";
                return Directory.GetFiles(dir, Path.GetFileName(pattern));
            }).ToArray();

            Stopwatch totalTime = Stopwatch.StartNew();

            long running = Run(files, 3000);

            Console.ForegroundColor = ConsoleColor.Gray;
            Console.WriteLine("Total: {0}ms Running: {1}ms", totalTime.ElapsedMilliseconds, running);
            return 0;
        }

        private static long Run(string[] files, int timeout)
        {
            long running = 0;
            if (files.Length > 1)
                running = RunMany(files, timeout);
            else if (files.Length == 1)
                running = RunOne(files[0], timeout);
            return running;
        }

        public static long RunOne(string file, int timeout)
        {
            var compiler = new BooBatchCompiler();

            try
            {
                var action = compiler.Compile(file);
                Stopwatch run = Stopwatch.StartNew();
                action(null);
                return run.ElapsedMilliseconds;
            }
            catch (Exception e)
            {
                if (e is TargetInvocationException) e = (e as TargetInvocationException).InnerException;
                Console.Error.WriteLine("Unhandled exception.");
                while (e != null)
                {
                    Console.Error.WriteLine("{0}: {1}", e.GetType().Name, e.Message);
                    Console.Error.WriteLine(e.StackTrace);
                    e = e.InnerException;
                }
            }
            return 0;
            
        }


        public static long RunMany(string[] files, int timeout)
        {
            var compiler = new BooBatchCompiler();
            var result = new CompilationResult();
            long accum = 0;
            foreach (var file in files)
            {
                Console.ForegroundColor = ConsoleColor.Gray;

                Console.Write("{0,-10}", Path.GetFileName(file));
                try
                {
                    var action = compiler.Compile(file);
                    var stopwatch = Stopwatch.StartNew();
                    string[] lines = new string[0];

                    try
                    {
                        lines = result.Run(action, timeout);
                    }
                    catch (Exception e)
                    {
                        if (e is TargetInvocationException) e = (e as TargetInvocationException).InnerException;
                        Console.ForegroundColor = ConsoleColor.Red;
                        lines = new[] { string.Format("({0}) {1}: {2}", result.LastRun.FirstOrDefault(), e.GetType().Name, e.Message) };
                    }
                    finally
                    {
                        accum += stopwatch.ElapsedMilliseconds;
                    }

                    Console.Write(" {0,6}ms", stopwatch.ElapsedMilliseconds);
                    Console.Write(" {0}", lines.FirstOrDefault());
                    Console.ForegroundColor = ConsoleColor.Yellow;
                    Console.Write(" {0}", lines.Length > 1 ? "(+)" : "");
                    Console.WriteLine();
                }
                catch (Exception e)
                {
                    Console.ForegroundColor = ConsoleColor.Red;
                    Console.WriteLine(e.Message);
                }
            }
            return accum;

        }
    }
}
