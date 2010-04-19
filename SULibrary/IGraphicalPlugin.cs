using System;
using System.Collections.Generic;
using System.Text;
using System.Windows.Forms;

namespace SULibrary
{
    public interface IGraphicalPlugin
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
        /// Инициализация графического плагина
        /// </summary>
        /// <param name="inputparams"></param>
        void Initialize(Parameters inputparams);

        /// <summary>
        /// 
        /// </summary>
        Form WinForm { get; }
    }
}
