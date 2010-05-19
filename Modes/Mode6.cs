using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using SULibrary;

namespace Su.Modes
{
	/// <summary>
	/// Режим 6
	/// </summary>
	public class Mode6 : IMode
	{
		public string Name
		{
			get { return "06. Двухструговая, одна полоса, с отстающим стругом, челноковая"; }
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
			output.Vk = input.Vk;
			var gammaN = input.Gamma / input.Fi;
			output.Qkr = 60 * input.F * input.Fi * output.Vk + gammaN;
			output.Kp = input.Q / output.Qkr;
			output.C = Math.Sqrt(1 - output.Kp);
			output.Vc = output.Vk * output.C;
			var x = output.C;
			var h = input.A2 * x * x + input.A1 * x + input.A0;
			output.MaxH = h * input.F * 10 * input.Fi2 / (input.MaxH * input.Fi);
			output.MinH = h * input.F * 10 * input.Fi2 / (input.MinH * input.Fi);
			return ParametersMapper.Map<Output>(output);
		}

		class Input
		{
			[Parameter("sko_konv_max")]
			public double Vk { get; set; }
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
			[Parameter("ko_zap_tab")]
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
			[Parameter("sko_str")]
			public double Vc { get; set; }
			[Parameter("c_sg_konv")]
			public double C { get; set; }
			[Parameter("v_konv")]
			public double Vk { get; set; }
			[Parameter("proizv_konv")]
			public double Qkr { get; set; }
			[Parameter("depth_rez_max")]
			public double MaxH { get; set; }
			[Parameter("depth_rez_min")]
			public double MinH { get; set; }
			[Parameter("ko_gruz")]
			public double Kp { get; set; }
		}
	}
}
