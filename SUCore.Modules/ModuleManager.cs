using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using SUCore.Metadata;

namespace SUCore.Modules
{
    /// <summary>
    /// Менеджер модулей
    /// </summary>
    public sealed class ModuleManager : IDisposable
    {
        MetadataManager _metadataManager;
        ParametersAdapter _paramadapter;

        public ModuleManager()
        {
            _paramadapter = new ParametersAdapter();
            _metadataManager = new MetadataManager();
        }

        /// <summary>
        /// Заливаем параметры из БД
        /// </summary>
        /// <param name="module">модуль</param>
        public void FillParameters(Module module)
        {
            _paramadapter.FillParams(module);
        }
     
        /// <summary>
        /// Обновляем параметры в БД
        /// </summary>
        public void UpdateParameters(Module module)
        {
            _paramadapter.UpdateParams(module);
        }

        /// <summary>
        /// Заливаем только схему
        /// </summary>
        /// <param name="module"></param>
        public void FillSchema(Module module)
        {
            _paramadapter.FillParamsSchema(module);
        }

        /// <summary>
        /// Заливаем только схему
        /// </summary>
        /// <param name="modules"></param>
        public void FillSchema(ModulesCollection modules)
        {
            foreach (var m in modules.Values)
            {
                FillSchema(m);
            }
        }

        public void InitModules(Guid plowmachineId, ModulesCollection modules)
        {
            foreach (var mm in _metadataManager.GetModulesList())
            {
                Module module = new Module(mm.ModuleName, plowmachineId);              
                FillSchema(module);
                FillParameters(module);
                modules.Add(mm.ModuleName, module);
            }
        }


        #region IDisposable Members

        public void Dispose()
        {
            _paramadapter.Dispose();
            _metadataManager.Dispose();
        }

        #endregion
    }
}
