using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Boo.Lang.Compiler;
using Boo.Lang.Compiler.Pipelines;
using Boo.Lang.Compiler.IO;
using System.IO;
using System.Reflection;

namespace BooEulerTool
{
    public class BooBatchCompiler
    {
        BooCompiler booc = new BooCompiler();
        public BooBatchCompiler()
        {
            booc.Parameters.Pipeline = new CompileToMemory();
        }

        public Action<string[]> Compile(string file)
        {
            booc.Parameters.Input.Clear();
            booc.Parameters.Input.Add(new FileInput(file));
            booc.Parameters.OutputType = CompilerOutputType.Library;
            var ctx = booc.Run();
            if (ctx.Errors.Count > 0)
                throw ctx.Errors[0];
            var assembly = ctx.GeneratedAssembly;
            var method = assembly.GetTypes().First(x => x.Name.EndsWith("Module")).GetMethod("Main", BindingFlags.NonPublic | BindingFlags.Static);

            return args => method.Invoke(null, new object[] { args });
        }

    }
}
