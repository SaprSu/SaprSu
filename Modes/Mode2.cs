﻿using System.Linq;
using SULibrary;

namespace Su.Modes
{
	/// <summary>
	/// Режим 2
	/// </summary>
	public class Mode2 : IMode
	{
		public string Name
		{
			get { return "02. Одноструговая, с отстающим стругом, челноковая"; }
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
			output.Qkr = 60 * input.F * input.Fi * input.MaxVk * gammaN;
			var kp = input.Q / output.Qkr;
			var vsv = input.MaxVc;
			output.Cv = input.MaxVc;
			output.Cp = output.Cv*(2 - kp)/(2*output.Cv + kp);
			output.Vcp = input.MaxVk*output.Cp;
			// h' и полином
			var x = output.Cp;
			var h = input.A2 * x * x + input.A1 * x + input.A0;

			output.MaxH = h * input.F / (input.Psi * input.MaxH) * 10 * input.Fi2;
			output.MinH = h * input.F / (input.Psi * input.MinH) * 10 * input.Fi2;

			output.Ku = vsv / output.Vcp;

			return ParametersMapper.Map<Output>(output);
		}

		class Input
		{
			[Parameter("max_proizv")]
			public double Q { get; set; }
			[Parameter("max_mopl")]
			public double MaxH { get; set; }
			[Parameter("min_mopl")]
			public double MinH { get; set; }
			[Parameter("sko_str_max")]
			public double MaxVc { get; set; }
			[Parameter("sko_konv_max")]
			public double MaxVk { get; set; }
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
			[Parameter("sko_str_pop")]
			public double Vcp { get; set; }
			[Parameter("c_sg_konv_pop")]
			public double Cp { get; set; }
			[Parameter("otn_skor_vn/vpop")]
			public double Ku { get; set; }
			[Parameter("proizv_konv")]
			public double Qkr { get; set; }
			[Parameter("c_sg_konv_vst")]
			public double Cv { get; set; }
			[Parameter("v_konv")]
			public double Vk { get; set; }
		}
	}
}
