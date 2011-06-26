using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.IO;

namespace BooEulerTool
{
    public class Options
    {
        public string[] Files { get; private set; }
        public int? Timeout { get; private set; }
        public bool ForceOne { get; private set; }
        public bool ForceMany { get; private set; }
        public bool Sort { get; private set; }

        public Options(string[] args)
        {
            var files = new List<string>();
            for (int i = 0; i < args.Length; i++)
            {
                switch (args[i])
                {
                    case "-t":
                        if (++i < args.Length)
                            Timeout = int.Parse(args[i]);
                        break;
                    case "-fo": ForceOne = true; break;
                    case "-fm": ForceMany = true; break;
                    case "-sort": Sort = true; break;
                    default:
                        files.Add(args[i]);
                        break;
                }
            }
            Files = files.SelectMany(pattern =>
            {
                var dir = Path.GetDirectoryName(pattern);
                if (string.IsNullOrEmpty(dir)) dir = ".";
                return Directory.GetFiles(dir, Path.GetFileName(pattern));
            }).ToArray();
        }
    }
}
