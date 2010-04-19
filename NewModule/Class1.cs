using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Windows.Forms;

namespace NewModule
{
    public class Class1 : SULibrary.IComputingPlugin
    {
        #region IComputingPlugin Members

        public string Name
        {
            get { return "Новый модуль"; }
        }

        public string[] InputParams
        {
            get { return new string[] { "depth_rez1" }; }
        }

        public SULibrary.Parameters Calculate(SULibrary.Parameters inputparams)
        {
            MessageBox.Show("OK");

            return new SULibrary.Parameters();
        }

        #endregion
    }
}
