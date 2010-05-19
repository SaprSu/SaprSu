using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using SULibrary;

namespace Su.Modes
{
	/// <summary>
	/// Режим 7
	/// </summary>
	public class Mode7 : IMode
	{
		public string Name
		{
			get { return "07. Двухструговая, одна полоса, челноковая"; }
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

			output.Vk = input.MaxVk;
			var gammaN = input.Gamma / input.Fi;
			var qkr = 60 * input.F * input.Psi * output.Vk * gammaN;
			output.Kp = input.Q / qkr;
			var tmp = (input.Gamma - 1) / (input.Gamma + 1);
			output.C = (output.Kp * tmp) +
				Math.Sqrt(Math.Pow(output.Kp, 2) / 4 * (Math.Pow(tmp, 2) + 1 - output.Kp));

			output.MaxHp = input.F / (input.MaxH * input.Fi * output.C) *
				(1 - Math.Pow(output.C, 2)) / (input.Lambda * (1 - output.C) + 1 + output.C);

			output.MinHp = input.F / (input.MinH * input.Fi * output.C) *
				(1 - Math.Pow(output.C, 2)) / (input.Lambda * (1 - output.C) + 1 + output.C);

			output.MaxHb = input.Lambda * output.MaxHp;
			output.MinHb = input.Lambda * output.MinHp;
			output.Vc = output.Vk * output.C;
			return ParametersMapper.Map(output);
		}

		class Input
		{
			[Parameter("max_proizv")]
			public double Q { get; set; }
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
			[Parameter("ko_zap_tab")]
			public double Fi2 { get; set; }
			[Parameter("ko_zap")]
			public double Psi { get; set; }
			[Parameter("ko_reg_tol")]
			public double Lambda { get; set; }
			[Parameter("a0_pol")]
			public double A0 { get; set; }
			[Parameter("a1_pol")]
			public double A1 { get; set; }
			[Parameter("a2_pol")]
			public double A2 { get; set; }
		}

		class Output
		{
			[Parameter("depth_rez_pop_max")]
			public double MaxHp { get; set; }
			[Parameter("depth_rez_pop_min")]
			public double MinHp { get; set; }
			[Parameter("depth_rez_vst_max")]
			public double MaxHb { get; set; }
			[Parameter("depth_rez_vst_min")]
			public double MinHb { get; set; }
			[Parameter("c_sg_konv")]
			public double C { get; set; }
			[Parameter("proizv_konv")]
			public double Qkr { get; set; }
			[Parameter("ko_gruz")]
			public double Kp { get; set; }
			[Parameter("sko_str")]
			public double Vc { get; set; }
			[Parameter("v_konv")]
			public double Vk { get; set; }
		}
	}
}
