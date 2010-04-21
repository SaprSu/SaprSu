using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using SULibrary;

namespace mod_9
{

	public class DynamicEngine : IComputingPlugin
	{
		private Parameters diffur(Parameters InputParams)
		{
			double[] C;
			C = new double[26];

			double[] dC;
			dC = new double[26];

			int rezhim = 0;//(int)InputParams["rezhim"].Value;

			double Tn1 = (double)InputParams["Tn1"].Value;
			double Tn2 = (double)InputParams["Tn2"].Value;
			double Kn1 = (double)InputParams["Kn1"].Value;
			double Kn2 = (double)InputParams["Kn2"].Value;
			C[0] = (double)InputParams["C1"].Value;
			C[1] = (double)InputParams["C2"].Value;
			C[2] = (double)InputParams["C3"].Value;
			C[3] = (double)InputParams["C4"].Value;
			C[4] = (double)InputParams["C5"].Value;
			C[5] = (double)InputParams["C6"].Value;
			C[6] = (double)InputParams["C7"].Value;
			C[7] = (double)InputParams["C8"].Value;
			C[8] = (double)InputParams["C9"].Value;
			C[9] = (double)InputParams["C10"].Value;
			C[10] = (double)InputParams["C11"].Value;//"M1"];
			C[11] = (double)InputParams["C12"].Value;//"M2"];
			C[12] = (double)InputParams["C13"].Value;//"My1"];
			C[13] = (double)InputParams["C14"].Value;// "My3"];          
			C[16] = (double)InputParams["C17"].Value;
			C[19] = (double)InputParams["C20"].Value;
			double L1 = (double)InputParams["L1"].Value;
			double L2 = (double)InputParams["L2"].Value;
			double Cd1 = (double)InputParams["Cd1"].Value;
			double Cd2 = (double)InputParams["Cd2"].Value;
			double I1 = (double)InputParams["I1"].Value;
			double I2 = (double)InputParams["I2"].Value;
			double c1 = (double)InputParams["c111"].Value;
			double c3 = (double)InputParams["c33"].Value;
			double Mc = (double)InputParams["Mc"].Value;
			double Ic = (double)InputParams["Ic"].Value;
			double Rz1 = (double)InputParams["Rz1"].Value;
			double Rz2 = (double)InputParams["Rz2"].Value;
			double Kd1 = (double)InputParams["Kd1"].Value;
			double Kd3 = (double)InputParams["Kd3"].Value;
			double Trt = (double)InputParams["Trt"].Value;
			double Tz = (double)InputParams["Tz"].Value;
			double Uzc = (double)InputParams["Uzc"].Value;
			double Koc = (double)InputParams["Koc"].Value;
			double Kpc = (double)InputParams["Kpc"].Value;

			if (rezhim == 0)
			{
				dC[0] = 1 / Tn1 * (Kn1 * C[16] - C[0]);
				dC[1] = 1 / Tn2 * (Kn2 * C[19] - C[1]);
				dC[2] = C[7];
				dC[3] = C[8];
				dC[4] = C[9];
				dC[5] = 1 / L1 * (C[0] - Cd1 * C[7] - Rz1 * C[5]);
				dC[6] = 1 / L2 * (C[1] - Cd2 * C[8] - Rz2 * C[6]);
				dC[7] = 1 / I1 * (C[10] - C[12] + C[13]);
				dC[8] = 1 / I2 * (C[11] - C[13]);
				dC[9] = 1 / Ic * (C[12] - Mc);
				C[12] = c1 * (C[2] - C[4]);
				C[13] = c3 * (C[3] - C[2]);
				C[10] = Cd1 * C[5];
				C[11] = Cd2 * C[6];
			}
			else
			{
				C[17] = C[5] * 0.0214;
				C[20] = C[6] * 0.0214;
				C[14] = (C[7] - C[9]) * Kd1;
				C[15] = (C[8] - C[7]) * Kd3;
				C[23] = Uzc - C[9] * Koc;
				C[22] = C[23] * Kpc;
				C[25] = C[22];
				C[24] = C[25];
				C[18] = C[24] - C[17] - C[14];
				C[21] = C[25] - C[20] - C[15];
				//double dC17 = 1 / Trt * (dC19 * Tz + C19);
				//double dC20 = 1 / Trt * (dC22 * Tz + C22);              
			}
			Parameters diff_param = new Parameters();

			diff_param.Add("dC", dC);
			diff_param.Add("C", C);

			return diff_param;
		}

		private Parameters rk_4(Parameters InputParams)
		{
			double n = (double)InputParams["n"].Value;
			const double dX = 0.005;

			Parameters diffurResult = diffur(InputParams);
			double[] dC = (double[])diffurResult["dC"].Value;
			double[] C = (double[])diffurResult["C"].Value;

			for (int i = 0; i < n; i++)
			{
				C[i] = C[i] + dC[i] * (dX / 2);
			}
			#region (Rewrite C)
			InputParams["C1"].Value = C[0];
			InputParams["C2"].Value = C[1];
			InputParams["C3"].Value = C[2];
			InputParams["C4"].Value = C[3];
			InputParams["C5"].Value = C[4];
			InputParams["C6"].Value = C[5];
			InputParams["C7"].Value = C[6];
			InputParams["C8"].Value = C[7];
			InputParams["C9"].Value = C[8];
			InputParams["C10"].Value = C[9];
			InputParams["C11"].Value = C[10];
			InputParams["C12"].Value = C[11];
			InputParams["C13"].Value = C[12];
			InputParams["C14"].Value = C[13];
			InputParams["C17"].Value = C[16];
			InputParams["C20"].Value = C[19];
			#endregion

			diffurResult = diffur(InputParams);
			dC = (double[])diffurResult["dC"].Value;
			C = (double[])diffurResult["C"].Value;
			for (int i = 0; i < n; i++)
			{
				C[i] = C[i] + dC[i] * (dX / 2);
			}
			#region (Rewrite C)
			InputParams["C1"].Value = C[0];
			InputParams["C2"].Value = C[1];
			InputParams["C3"].Value = C[2];
			InputParams["C4"].Value = C[3];
			InputParams["C5"].Value = C[4];
			InputParams["C6"].Value = C[5];
			InputParams["C7"].Value = C[6];
			InputParams["C8"].Value = C[7];
			InputParams["C9"].Value = C[8];
			InputParams["C10"].Value = C[9];
			InputParams["C11"].Value = C[10];
			InputParams["C12"].Value = C[11];
			InputParams["C13"].Value = C[12];
			InputParams["C14"].Value = C[13];
			InputParams["C17"].Value = C[16];
			InputParams["C20"].Value = C[19];
			#endregion

			diffurResult = diffur(InputParams);
			dC = (double[])diffurResult["dC"].Value;
			C = (double[])diffurResult["C"].Value;
			for (int i = 0; i < n; i++)
			{
				C[i] = C[i] + dC[i] * (dX / 2);
			}
			#region (Rewrite C)
			InputParams["C1"].Value = C[0];
			InputParams["C2"].Value = C[1];
			InputParams["C3"].Value = C[2];
			InputParams["C4"].Value = C[3];
			InputParams["C5"].Value = C[4];
			InputParams["C6"].Value = C[5];
			InputParams["C7"].Value = C[6];
			InputParams["C8"].Value = C[7];
			InputParams["C9"].Value = C[8];
			InputParams["C10"].Value = C[9];
			InputParams["C11"].Value = C[10];
			InputParams["C12"].Value = C[11];
			InputParams["C13"].Value = C[12];
			InputParams["C14"].Value = C[13];
			InputParams["C17"].Value = C[16];
			InputParams["C20"].Value = C[19];
			#endregion

			diffurResult = diffur(InputParams);
			C = (double[])diffurResult["C"].Value; //последний расчет параметров

			Parameters rk_4resl = new Parameters();
			rk_4resl.Add("rk4C", C);

			return rk_4resl;
		}

		public Parameters Calculate(Parameters InputParams)
		{
			//double Xn = (double)InputParams["Xn"].Value;
			//double Xk = (double)InputParams["Xk"].Value;
			//double dp = (double)InputParams["dp"].Value;
			//double eps = (double)InputParams["eps"].Value;
			//double p = (double)InputParams["p"].Value;
			//double n = (double)InputParams["n"].Value;

			//double x = Xn;
			//double dX = 0.005;

			//List<double[]> arrayC0 = new List<double[]>();
			//List<double[]> arrayC1 = new List<double[]>();
			//List<double[]> arrayC5 = new List<double[]>();
			//List<double[]> arrayC6 = new List<double[]>();
			//List<double[]> arrayC12 = new List<double[]>();
			//List<double[]> arrayC13 = new List<double[]>();
			//List<double[]> arrayC18 = new List<double[]>();
			//List<double[]> arraydC2 = new List<double[]>();
			//List<double[]> arraydC3 = new List<double[]>();
			//List<double[]> arraydC4 = new List<double[]>();
			//List<double[]> arrayX = new List<double[]>();



			//do
			//{
			//    if (Math.Abs(x - p) < eps)
			//    {                    
			//        Parameters diffurResult = diffur(InputParams);                    
			//        double[] C = (double[])diffurResult["C"].Value;
			//        double[] dC = (double[])diffurResult["dC"].Value;

			//        double[] tmpC0 = new double[1];
			//        tmpC0[0] = C[0];
			//        arrayC0.Add(tmpC0);

			//        double[] tmpC1 = new double[1];
			//        tmpC1[0] = C[1];
			//        arrayC1.Add(tmpC1);

			//        double[] tmpC5 = new double[1];
			//        tmpC5[0] = C[5];
			//        arrayC5.Add(tmpC5);

			//        double[] tmpC6 = new double[1];
			//        tmpC6[0] = C[6];
			//        arrayC6.Add(tmpC6);

			//        double[] tmpC12 = new double[1];
			//        tmpC12[0] = C[12];
			//        arrayC12.Add(tmpC12);

			//        double[] tmpC13 = new double[1];
			//        tmpC13[0] = C[13];
			//        arrayC13.Add(tmpC13);

			//        double[] tmpC18 = new double[1];
			//        tmpC18[0] = C[18];
			//        arrayC18.Add(tmpC18);

			//        double[] tmpdC2 = new double[1];
			//        tmpdC2[0] = dC[2];
			//        arraydC2.Add(tmpdC2);

			//        double[] tmpdC3 = new double[1];
			//        tmpdC3[0] = dC[3];
			//        arraydC3.Add(tmpdC3);

			//        double[] tmpdC4 = new double[1];
			//        tmpdC4[0] = dC[4];
			//        arraydC4.Add(tmpdC4);                   

			//        p = p + dp;                    
			//    }

			//    Parameters rk_4Result = rk_4(InputParams);

			//    double[] tmpC = new double[1];
			//    tmpC[0] = x;
			//    arrayX.Add(tmpC);
			//    x = x + dX;
			//}
			//while (x < Xk);
			Parameters result = new Parameters();
			//result.Add("ep1", arrayC0.ToArray());
			//result.Add("ep2", arrayC1.ToArray());
			//result.Add("Iy1", arrayC5.ToArray());
			//result.Add("Iy2", arrayC6.ToArray());
			//result.Add("z1", arraydC2.ToArray());
			//result.Add("z2", arraydC3.ToArray());
			//result.Add("zc", arraydC4.ToArray());
			//result.Add("My1", arrayC12.ToArray());
			//result.Add("My3", arrayC13.ToArray());
			//result.Add("Uvihrt1", arrayC18.ToArray());
			//result.Add("x", arrayX.ToArray());


			using (Diagrams d = new Diagrams())
			{
				d.ShowDialog();
			}
			return result;
		}

		public string[] InputParams
		{
			get
			{
				return new string[]
                {
                   /* "rezhim",*/
                    "C1",
                    "C2",
                    "C3",
                    "C4",
                    "C5",
                    "C6",
                    "C7",
                    "C8",
                    "C9",
                    "C10",
                    "Mc",
                    "Tn1",
                    "Tn2",
                    "Kn1",
                    "Kn2",
                    "C17",
                    "C20",
                    "L1",
                    "L2",
                    "Cd1",
                    "Cd2",
                    "Rz1",
                    "Rz2",
                    "c111",
                    "c33",
                    "I1",
                    "I2",
                    "Ic",
                    "C12",//"M2",
                    "C13",//"My1",
                    "C14",// "My3",
                    "C11",//"M1",
                    //
                    "Kd1",
                    "Kd3",
                    "Trt",
                    "Tz",
                    "Uzc",
                    "Koc",
                    "Kpc",
                    //
                    "Xn",
                    "Xk",
                    "dp",
                    "n",
                    "eps",
                    "p"
                };
			}
		}

		public string Name
		{
			get { return "ƒинамический режим"; }
		}
	}
}
