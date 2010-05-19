using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using SULibrary;

namespace Su.Modes
{
	/// <summary>
	/// Режим 11
	/// </summary>
	public class Mode11 : IMode
	{
		public string Name
		{
			get { return "11. С опережающим стругом, одноструговая, челноковая"; }
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
			output.Qkr = 0;//... непонятный момент в постановке
			output.K0 = 0;//... непонятный момент в постановке
			output.C = 1 / output.K0;
			var x = output.C;
			var h = input.A2 * x * x + input.A1 * x + input.A0;
			output.MaxHp = h * 10 * input.F * input.Fi2 / (input.MaxH * input.Fi);
			output.MinHp = h * 10 * input.F * input.Fi2 / (input.MinH * input.Fi);
			// todo убедиться, что так и надо
			output.MaxH = output.MaxHp;
			output.MinH = output.MinHp;
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
			[Parameter("a0_pol")]
			public double A0 { get; set; }
			[Parameter("a1_pol")]
			public double A1 { get; set; }
			[Parameter("a2_pol")]
			public double A2 { get; set; }
		}

		class Output
		{
			[Parameter("depth_rez_vst_max")]
			public double MaxH { get; set; }
			[Parameter("depth_rez_vst_min")]
			public double MinH { get; set; }
			[Parameter("depth_rez_pop_max")]
			public double MaxHp { get; set; }
			[Parameter("depth_rez_pop_min")]
			public double MinHp { get; set; }
			[Parameter("ko_skor")]
			public double K0 { get; set; }
			[Parameter("v_konv")]
			public double Vk { get; set; }
			[Parameter("proizv_konv")]
			public double Qkr { get; set; }
			[Parameter("c_sg_konv")]
			public double C { get; set; }
			[Parameter("sko_str")]
			public double Vc { get; set; }
		}
	}
}
