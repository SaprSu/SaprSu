using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace SULibrary
{
    public interface ICloneable<T> : ICloneable
    {
        T Clone();
    }
}
