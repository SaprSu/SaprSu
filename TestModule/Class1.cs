using System;
using System.Collections.Generic;
using System.Text;

namespace TestModule
{
    public class Module1 : SULibrary.IComputingPlugin
    {
        public Module1()
        {
        }

        #region IModule Members

        public string[] InputParams
        {
            get { return new string[] { "koef_vl", "ko_zapol" }; }
        }

        public SULibrary.Parameters Calculate(SULibrary.Parameters inputparams)
        {
            //Console.WriteLine(inputparams["arc_chast1"]);
            inputparams.Contains("koef_vl");

            SULibrary.Parameters parameters = new SULibrary.Parameters();
            parameters.Add(new SULibrary.Parameter() { Name = "arc_ustan_rez_b3", Value = 200 });
            
            return parameters;
        }

        #endregion

        #region IModule Members

        public string Name
        {
            get { return "Module1"; }
        }

        #endregion
    }

    public class Module2 : SULibrary.IComputingPlugin
    {
        public Module2()
        {
        }

        #region IModule Members

        public string[] InputParams
        {
            get { return new string[] { "r_nij_osn_korp", "zatr_exp" }; }
        }

        public SULibrary.Parameters Calculate(SULibrary.Parameters inputparams)
        {
            //Console.WriteLine(inputparams["arc_chast2"]);

            SULibrary.Parameters parameters = new SULibrary.Parameters();
            parameters.Add(new SULibrary.Parameter() { Name = "arc_pogr_vishe", Value = 200 });
            return parameters;
        }

        #endregion

        #region IModule Members

        public string Name
        {
            get { return "Module2"; }
        }

        #endregion
    }
}
