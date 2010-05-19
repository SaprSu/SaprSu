using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using SULibrary;

namespace Su.Modes
{
	/// <summary>
	/// Режим 9
	/// </summary>
	public class Mode9 : IMode
	{
		public string Name
		{
			get { return "09. С опережающим стругом, одноструговая, челноковая"; }
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
			output.Vc = input.MaxVc;
			var gammaN = input.Gamma / input.Fi;
			output.Qkr = 60 * input.F * input.MaxVc * input.Gamma;
			//... непонятный момент в постановке
			output.Vk = output.Vc / output.C;
			var x = output.C;
			var h = input.A2 * x * x + input.A1 * x + input.A0;
			var h2 = h * input.F * 10 * input.Fi2 / (input.MaxH * input.Fi);
			output.MaxH = h2 / input.MaxH;
			output.MinH = h2 / input.MinH;
			return ParametersMapper.Map<Output>(output);
		}

		class Input
		{
			[Parameter("max_proizv")]
			public double Q { get; set; }
			[Parameter("sko_str_max")]
			public double MaxVc { get; set; }
			[Parameter("sko_str_min")]
			public double MinVc { get; set; }
			[Parameter("max_mopl")]
			public double MaxH { get; set; }
			[Parameter("min_mopl")]
			public double MinH { get; set; }
			[Parameter("otn_skor_Vn/Vpop")]
			public double Ku { get; set; }
			[Parameter("otn_skor_Vn/Vpop_max")]
			public double MaxKu { get; set; }
			[Parameter("s_sech_konv")]
			public double F { get; set; }
			[Parameter("pl_ug")]
			public double Gamma { get; set; }
			[Parameter("ko_razr")]
			public double Fi { get; set; }
			[Parameter("ko_razr_tab")]
			public double Fi2 { get; set; }
			[Parameter("a0_pol")]
			public double A0 { get; set; }
			[Parameter("a1_pol")]
			public double A1 { get; set; }
			[Parameter("a2_pol")]
			public double A2 { get; set; }
		}

		class Output
		{
			[Parameter("c_sg_konv")]
			public double C { get; set; }
			[Parameter("ko_zap")]
			public double Psi { get; set; }
			[Parameter("ko_zap_tab")]
			public double Psi2 { get; set; }
			[Parameter("depth_rez_max")]
			public double MaxH { get; set; }
			[Parameter("depth_rez_min")]
			public double MinH { get; set; }
			[Parameter("ko_skor")]
			public double K0 { get; set; }
			[Parameter("v_konv")]
			public double Vk { get; set; }
			[Parameter("proizv_konv")]
			public double Qkr { get; set; }
			[Parameter("sko_str")]
			public double Vc { get; set; }
		}
	}
}
