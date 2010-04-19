using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace SULibrary
{
	/// <summary>
	/// Режим
	/// </summary>
	public interface IMode
	{
		/// <summary>
		/// название режима
		/// </summary>
		string Name { get; }
		/// <summary>
		/// входные параметры
		/// </summary>
		string[] InputParams { get; }
		/// <summary>
		/// расчитать режим
		/// </summary>
		/// <param name="parameters"></param>
		/// <returns></returns>
		Parameters Calculate(Parameters parameters);
	}
}
