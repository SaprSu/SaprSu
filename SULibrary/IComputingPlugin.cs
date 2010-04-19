using System;
using System.Collections.Generic;
using System.Text;
using System.Windows.Forms;

namespace SULibrary
{
    public interface IComputingPlugin
    {
        /// <summary>
        /// Название плагина
        /// </summary>
        string Name { get; }

        /// <summary>
        /// Входные параметры
        /// </summary>
        string[] InputParams { get; }

        /// <summary>
        /// Расчёт
        /// </summary>
        /// <param name="inputparams">входные параметры</param>
        /// <returns>выходынй параметры, расчитанные в модуле</returns>
        Parameters Calculate(Parameters inputparams);
    }
}