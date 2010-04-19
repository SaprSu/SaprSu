using System;
using System.Collections.Generic;
using System.Text;

namespace SULibrary
{
    public class Parameter : ICloneable<Parameter>
    {
        /// <summary>
        /// Имя
        /// </summary>
        public string Name { get; set; }
        /// <summary>
        /// Описание
        /// </summary>
        public string Description{ get; set; }
       
        /// <summary>
        /// Значение
        /// </summary>
        public object Value { get; set; }

        /// <summary>
        /// Тип значения
        /// </summary>
        public Type ValueType { get; set; }


        #region ICloneable Members

        public object Clone()
        {
            Parameter p = new Parameter();
            p.Name = Name;
            p.Description = Description;
            p.Value = Value;
            p.ValueType = ValueType;

            return p;
        }

        #endregion

        #region ICloneable<Parameter> Members

        Parameter ICloneable<Parameter>.Clone()
        {
            return (this as ICloneable).Clone() as Parameter;
        }

        #endregion
    }
}
