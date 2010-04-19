using System;
using System.Collections.Generic;
using System.Text;
using System.Reflection;
using System.IO;

namespace SUCore.Managers.Module
{
    /// <summary>
    /// Загрузчик модулей
    /// </summary>
    class ModulesLoader
    {
        public static SULibrary.IComputingPlugin[] LoadModules()
        {
            string modulesFolder   = System.Configuration.ConfigurationManager.AppSettings.Get("ModulesFolder");
            string executingFolder = Path.GetDirectoryName(Assembly.GetEntryAssembly().Location);
            
            if (!Directory.Exists(executingFolder + "\\" + modulesFolder))
            {
                throw new DirectoryNotFoundException("Директория '" + executingFolder + "\\" + modulesFolder + "' не найдена");
            }

            string[] modulesFiles = Directory.GetFiles(executingFolder + "\\" + modulesFolder, "*.dll");

            List<SULibrary.IComputingPlugin> modules = new List<SULibrary.IComputingPlugin>();

            foreach (string moduleFile in modulesFiles)
            {
                Assembly moduleAssembly = Assembly.LoadFrom(moduleFile);

                foreach (Type t in moduleAssembly.GetExportedTypes())
                {
                    if (t.IsClass && typeof(SULibrary.IComputingPlugin).IsAssignableFrom(t))
                    {
                        SULibrary.IComputingPlugin module = (SULibrary.IComputingPlugin)Activator.CreateInstance(t);
                        modules.Add(module);
                    }
                }
            }

            return modules.ToArray();
        }
    }
}
