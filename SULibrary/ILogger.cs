using System;
using System.Collections.Generic;
using System.Text;

namespace SULibrary
{
    /// <summary>
    /// Интерфэйс для логирония
    /// </summary>
    public interface ILogger
    {
        /// <summary>
        /// Произвести запись в лог
        /// </summary>
        /// <param name="message">сообщение</param>
        void Log(string message);
    }
}
