using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Diagnostics;
using System.IO;
using System.Threading;
using System.Reflection;
using Boo.Lang.Compiler;

namespace BooEulerTool
{
    class Program
    {
        static int Main(string[] args)
        {
            var files = GetFiles(args);

            if (files.Length == 0)
            {
                Console.WriteLine("no input files found");
                return 2;
            }

            var exit = Run(files, null);
            //Console.ReadLine();
            return exit;
        }

        private static string[] GetFiles(string[] args)
        {
            var files = args.SelectMany(pattern =>
            {
                var dir = Path.GetDirectoryName(pattern);
                if (string.IsNullOrEmpty(dir)) dir = ".";
                return Directory.GetFiles(dir, Path.GetFileName(pattern));
            }).ToArray();
            return files;
        }

        private static int Run(string[] files, int? timeout)
        {
            if (files.Length > 1)
                return ManyRunner.Run(files, timeout ?? 5000);
            else if (files.Length == 1)
                return OneRunner.Run(files[0], timeout ?? Timeout.Infinite);

            return 2;
        }





    }
}
