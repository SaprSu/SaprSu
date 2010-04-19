using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace SUPresentation.View.PlowMachine
{
    public interface IPlowMachineView : IView
    {
        SUCore.PlowMachine.PlowMachine CurrentPlowMachine { get; set; }
        
        /// <summary>
        /// Обновляем параметры в БД
        /// </summary>
        event VoidEventHandler Save;

        /// <summary>
        /// Новая струговая установка
        /// </summary>
        event VoidEventHandler New;

        /// <summary>
        /// Удаляем
        /// </summary>
        event VoidEventHandler Delete;
    }
}
