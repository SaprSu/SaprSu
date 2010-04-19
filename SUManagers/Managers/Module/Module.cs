using System;
using System.Collections.Generic;
using System.Text;
using SULibrary;

namespace SUCore.Managers.Module
{
    /// <summary>
    /// Модуль
    /// </summary>
    public class Module : IComputingPlugin
    {
        SULibrary.IComputingPlugin _module;
        Guid _moduleId;

        public Module(Guid moduleId, IComputingPlugin module)
        {
            _module = module;
            _moduleId = moduleId;
        }       

        public Guid ModuleId
        {
            get
            {
                return _moduleId;
            }
        }

        #region IModule Members

        public string Name
        {
            get
            {
                return _module.Name;
            }
        }

        public string[] InputParams
        {
            get { return _module.InputParams; }
        }

        public Parameters Calculate(Parameters inputparams)
        {
            return _module.Calculate(inputparams);
        }

        #endregion
    }
}
