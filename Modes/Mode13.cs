using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using SULibrary;

namespace Su.Modes
{
	/// <summary>
	/// Режим 13
	/// </summary>
	public class Mode13 : IMode
	{
		public string Name
		{
			get { return "13. С опережающим стругом, одноструговая, односторонняя"; }
		}

		public string[] InputParams
		{
			get
			{
				return ParametersMapper.GetProperties(typeof(Input)).Keys.ToArray();
			}
		}

		public Parameters Calculate(Parameters parameters)
		{
			var input = ParametersMapper.Map<Input>(parameters);
			var output = new Output();
			output.C = 1 / output.K0;
			var x = output.C;
			var h = input.A2 * x * x + input.A1 * x + input.A0;
			output.MaxH = h * 10 * input.F * input.Fi2 / (input.MaxH * input.Fi);
			output.MinH = h * 10 * input.F * input.Fi2 / (input.MinH * input.Fi);
			return ParametersMapper.Map<Output>(output);
		}

		class Input
		{
			[Parameter("sko_str_max")]
			public double MaxVc { get; set; }
			[Parameter("sko_konv_max")]
			public double MaxVk { get; set; }
			[Parameter("max_mopl")]
			public double MaxH { get; set; }
			[Parameter("min_mopl")]
			public double MinH { get; set; }
			[Parameter("s_sech_konv")]
			public double F { get; set; }
			[Parameter("ko_razr")]
			public double Fi { get; set; }
			[Parameter("ko_razr_tab")]
			public double Fi2 { get; set; }
			[Parameter("ko_zap")]
			public double Psi { get; set; }
			[Parameter("max_proizv")]
			public double Q { get; set; }
			[Parameter("a0_pol")]
			public double A0 { get; set; }
			[Parameter("a1_pol")]
			public double A1 { get; set; }
			[Parameter("a2_pol")]
			public double A2 { get; set; }
		}

		class Output
		{
			[Parameter("depth_rez_max")]
			public double MaxH { get; set; }
			[Parameter("depth_rez_min")]
			public double MinH { get; set; }
			[Parameter("ko_skor")]
			public double K0 { get; set; }
			[Parameter("v_konv")]
			public double Vk { get; set; }
			[Parameter("sko_str")]
			public double Vc { get; set; }
			[Parameter("c_sg_konv")]
			public double C { get; set; } // в постановке нет
		}
	}
}
