using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;

namespace SUPresentation.View
{
    /// <summary>
    /// Базовый класс для View
    /// </summary>
    public interface IView
    {
        void RefreshView();
        ViewMode Mode { get; set; }      
    }
}