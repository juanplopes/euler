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
            var options = new Options(args);

            if (!options.Files.Any())
            {
                Console.WriteLine("no input files found");
                return 2;
            }

            var exit = Run(options);
            //Console.ReadLine();
            return exit;
        }



        private static int Run(Options option)
        {
            if ((option.Files.Length == 1 || option.ForceOne) && !option.ForceMany)
                return option.Files.Select(x => OneRunner.Run(x, option.Timeout ?? Timeout.Infinite)).Max();
            else
                return ManyRunner.Run(option.Files, option.Timeout ?? 5000);
        }





    }
}
