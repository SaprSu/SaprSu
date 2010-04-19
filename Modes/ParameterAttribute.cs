using System;

namespace Su.Modes
{
	public class ParameterAttribute : Attribute
	{
		public string Name { get; set; }

		public ParameterAttribute(string name)
		{
			Name = name;
		}
	}
}