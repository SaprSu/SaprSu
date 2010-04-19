using System;
using System.Collections.Generic;
using System.Text;


namespace SUCore.Managers.Module
{
    /// <summary>
    /// Менеджер модулей
    /// </summary>
    public class ModulesManager
    {
        public static Module[] GetModules()
        {
            List<Module> exp_modules = new List<Module>();

            using (SUCore.Managers.Metadata.MetadataManager manager = new SUCore.Managers.Metadata.MetadataManager())
            {
                SULibrary.IComputingPlugin[] modules = ModulesLoader.LoadModules();

                foreach (SULibrary.IComputingPlugin module in modules)
                {
                    //   запрашиваем информацию о модуле из БД
                    SUCore.Managers.Metadata.MetadataModule metamodule = manager.GetModuleByName(module.Name);
                    exp_modules.Add(new Module(metamodule.Id, module));
                }
            }

            return exp_modules.ToArray();
        }
    }
}
