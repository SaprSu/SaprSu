using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.IO;
using System.Reflection;
using SULibrary;

namespace SUCore.Computing
{
	/// <summary>
	/// Загрузчик "калкуляторов" модулей
	/// </summary>
	public class PluginsLoader
	{
		/// <summary>
		/// загрузить режимы
		/// </summary>
		/// <returns></returns>
		public static List<IMode> LoadModes()
		{
			Type iMode = typeof(IMode);
			List<IMode> result = new List<IMode>();
			string directory = System.Configuration.ConfigurationManager.AppSettings.Get("PluginsFolder");
			string[] files = Directory.GetFiles(directory, "*.dll");
			foreach (string assemblyFile in files)
			{
				Assembly assembly = Assembly.LoadFrom(assemblyFile);
				foreach (Type type in assembly.GetExportedTypes())
				{
					if (type.IsClass && iMode.IsAssignableFrom(type))
					{
						result.Add((IMode)Activator.CreateInstance(type));
					}
				}
			}
			return result.OrderBy(a => a.Name).ToList();
		}

		public static List<SULibrary.IComputingPlugin> LoadPlugins()
		{
			string modulesFolder = System.Configuration.ConfigurationManager.AppSettings.Get("PluginsFolder");
			string executingFolder = Path.GetDirectoryName(Assembly.GetEntryAssembly().Location);

			if (!Directory.Exists(executingFolder + "\\" + modulesFolder))
			{
				throw new DirectoryNotFoundException("Директория '" + executingFolder + "\\" + modulesFolder + "' не найдена.");
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

			return modules;
		}
	}
}
