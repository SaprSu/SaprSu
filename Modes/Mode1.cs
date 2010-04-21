using System.Linq;
using SULibrary;

namespace Su.Modes
{
	/// <summary>
	/// Режим 1
	/// </summary>
	public class Mode1 : IMode
	{
		public string Name
		{
			get { return "Режим 1"; }
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

			var lambdaN = input.Lambda / input.Fi;

			output.Qkr = 60 * input.F * input.Fi * input.MaxVk * lambdaN;

			output.Kp = input.Q / output.Qkr;

			output.C = 1 - output.Kp;

			output.Vc = output.Vk * output.C;

			return ParametersMapper.Map(output);
		}

		class Input
		{
			[Parameter("max_proizv")]
			public double Q { get; set; }
			[Parameter("max_mopl")]
			public double MaxH { get; set; }
			[Parameter("min_mopl")]
			public double MinH { get; set; }
			[Parameter("depth_rez_max")]
			public double MaxDepth { get; set; }
			[Parameter("depth_rez_min")]
			public double MinDepth { get; set; }
			[Parameter("sko_konv_max")]
			public double MaxVk { get; set; }
			[Parameter("s_sech_konv")]
			public double F { get; set; }
			[Parameter("pl_ug")]
			public double Lambda { get; set; }
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
			[Parameter("proizv_konv")]
			public double Qkr { get; set; }
			[Parameter("ko_gruz")]
			public double Kp { get; set; }
			[Parameter("c_sg_konv")]
			public double C { get; set; }
			[Parameter("sko_str")]
			public double Vc { get; set; }
			[Parameter("v_konv")]
			public double Vk { get; set; }
		}
	}
}
