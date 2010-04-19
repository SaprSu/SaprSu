using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;
using SULibrary;

namespace SUPresentation.View.ComputingPlugin
{
    public interface IComputingPluginView : IView
    {
        IComputingPlugin Plugin {get;set;}
        Parameters InputParametes { get; set; }
        Parameters OutputParameters { get; set; }
    }
}
