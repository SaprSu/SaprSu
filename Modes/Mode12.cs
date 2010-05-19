using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using SULibrary;

namespace Su.Modes
{
	/// <summary>
	/// Режим 12
	/// </summary>
	public class Mode12 : IMode
	{
		public string Name
		{
			get { return "12. С опережающим стругом, одноструговая, челноковая"; }
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
			output.Qkr = 60 * input.F * input.Psi * input.MaxVk * gammaN;
			output.K0 = input.Q / output.Qkr * input.MaxVk / output.Vc / input.Psi;
			output.Vkv = input.MaxVk;
			output.Cv = output.Cv / output.Vkv;
			output.Cp = 2 * output.Cv / (output.Cv - 1);
			var x = output.Cp;
			var hp = input.A2 * x * x + input.A1 * x + input.A0;
			output.MaxHp = hp * 10 * input.F * input.Fi2 / (input.MaxH * input.Fi);
			output.MinHp = hp * 10 * input.F * input.Fi2 / (input.MinH * input.Fi);
			x = output.Cp;
			var h = input.A2 * x * x + input.A1 * x + input.A0;
			output.MaxH = h * 10 * input.F * input.Fi2 / (input.MaxH * input.Fi);
			output.MinH = h * 10 * input.F * input.Fi2 / (input.MinH * input.Fi);
			return ParametersMapper.Map<Output>(output);
		}

		class Input
		{
			[Parameter("max_proizv")]
			public double Q { get; set; }
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
			[Parameter("pl_ug")]
			public double Gamma { get; set; }
			[Parameter("ko_razr")]
			public double Fi { get; set; }
			[Parameter("ko_razr_tab")]
			public double Fi2 { get; set; }
			[Parameter("ko_zap")]
			public double Psi { get; set; }
			[Parameter("a0_pol")]
			public double A0 { get; set; }
			[Parameter("a1_pol")]
			public double A1 { get; set; }
			[Parameter("a2_pol")]
			public double A2 { get; set; }
		}

		class Output
		{
			[Parameter("proizv_konv")]
			public double Qkr { get; set; }
			[Parameter("ko_skor")]
			public double K0 { get; set; }
			[Parameter("c_sg_konv_p")]
			public double Cp { get; set; }
			[Parameter("c_sg_konv_vst")]
			public double Cv { get; set; }
			[Parameter("v_konv_vst")]
			public double Vkv { get; set; }
			[Parameter("sko_str")]
			public double Vc { get; set; }
			[Parameter("depth_rez_vst_max")]
			public double MaxH { get; set; }
			[Parameter("depth_rez_vst_min")]
			public double MinH { get; set; }
			[Parameter("depth_rez_pop_max")]
			public double MaxHp { get; set; }
			[Parameter("depth_rez_pop_min")]
			public double MinHp { get; set; }
		}
	}
}
