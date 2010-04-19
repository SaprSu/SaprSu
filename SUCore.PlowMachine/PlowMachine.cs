using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace SUCore.PlowMachine
{
    using Modules;
    using SULibrary;
    

    /// <summary>
    /// Струговая установка
    /// </summary>
    public class PlowMachine
    {
        internal PlowMachine()
        {
            PlowMachineId = Guid.NewGuid();
            Modules = new ModulesCollection();
        }

        public PlowMachine(Guid id)
        {
            PlowMachineId = id;
            Modules = new ModulesCollection();
        }

        /// <summary>
        /// Идентификатор
        /// </summary>
        public Guid PlowMachineId { get; internal set; }

        /// <summary>
        /// Модули
        /// </summary>
        public ModulesCollection Modules { get; private set; }

        /// <summary>
        /// Имя
        /// </summary>
        public string Name { get; set; }

        /// <summary>
        /// Являеться прототипом
        /// </summary>
        public bool IsPrototype { get; set; }
    }
}
