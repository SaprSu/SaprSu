using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using SULibrary;

namespace SUCore.Modules
{
    /// <summary>
    /// Модуль
    /// </summary>
    public class Module
    {
        internal Module(string name, Guid plowMachineId)
        {
            PlowMachineId = plowMachineId;
            Name = name;
            ModuleParams = new Parameters();
        }

        /// <summary>
        /// Параметры модуля
        /// </summary>
        public Parameters ModuleParams { get; internal set; }

        /// <summary>
        /// Название модуля
        /// </summary>
        public string Name { get; private set; }

        /// <summary>
        /// Идентификатор струговой установки
        /// </summary>
        public Guid PlowMachineId { get; private set; }
    
    }
}
