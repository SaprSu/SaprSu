using System;
using System.Collections.Generic;
using System.Text;
using System.Collections;

namespace SULibrary
{    
    /// <summary>
    /// Параметры
    /// </summary>
    public class Parameters : ICollection<Parameter>, ICloneable<Parameters>
    {
        Dictionary<string, Parameter> _internalDictionary;

        public Parameters()
        {
            _internalDictionary = new Dictionary<string, Parameter>();
        }

        public Parameter this[string name]
        {
            get
            {
                Parameter result = null;

                try
                {
                    result = _internalDictionary[name.ToLower()];
                }
                catch (KeyNotFoundException)
                {
                    throw new KeyNotFoundException("Параметр с именем '" + name + "' отсутствует.");
                }

                return result;
            }
            set
            {
                _internalDictionary[name] = value;
            }
        }

        #region ICollection<Parameter> Members

        public void Add(Parameter item)
        {
            _internalDictionary.Add(item.Name.ToLower(), item);
        }

        public void Add(string name, object value)
        {
            _internalDictionary.Add(name, new Parameter() { Name = name.ToLower(), Value = value });
        }

        public void Clear()
        {
            _internalDictionary.Clear();
        }

        public bool Contains(Parameter item)
        {
            return _internalDictionary.ContainsKey(item.Name.ToLower());
        }

        public bool Contains(string paramName)
        {
            return _internalDictionary.ContainsKey(paramName.ToLower());
        }

        public void CopyTo(Parameter[] array, int arrayIndex)
        {
            throw new NotImplementedException();
        }

        public int Count
        {
            get { return _internalDictionary.Count; }
        }

        public bool IsReadOnly
        {
            get { return false; }
        }

        public bool Remove(Parameter item)
        {
            return _internalDictionary.Remove(item.Name.ToLower());
        }

        #endregion

        #region IEnumerable<Parameter> Members

        public IEnumerator<Parameter> GetEnumerator()
        {
            return new ParametersEnumertor(_internalDictionary);
        }

        #endregion

        #region IEnumerable Members

        System.Collections.IEnumerator System.Collections.IEnumerable.GetEnumerator()
        {
            return (IEnumerator)((IEnumerable<Parameter>)this).GetEnumerator();
        }

        #endregion

        #region Enumerator
        class ParametersEnumertor : IEnumerator<Parameter>
        {
            IEnumerator<Parameter> _parametersEnum;

            public ParametersEnumertor(Dictionary<string, Parameter> _internalDictionary)
            {
                _parametersEnum = _internalDictionary.Values.GetEnumerator();
            }

            #region IEnumerator<Parameter> Members

            public Parameter Current
            {
                get { return _parametersEnum.Current; }
            }

            #endregion

            #region IDisposable Members

            public void Dispose()
            {
                _parametersEnum.Dispose();
            }

            #endregion

            #region IEnumerator Members

            object IEnumerator.Current
            {
                get { return _parametersEnum.Current; }
            }

            public bool MoveNext()
            {
                return _parametersEnum.MoveNext();
            }

            public void Reset()
            {
                _parametersEnum.Reset();
            }

            #endregion
        } 
        #endregion

        #region ICloneable<Parameters> Members

        public Parameters Clone()
        {
            return (this as ICloneable).Clone() as Parameters;
        }

        #endregion

        #region ICloneable Members

        object ICloneable.Clone()
        {
            Parameters ps = new Parameters();

            foreach (ICloneable<Parameter> item in _internalDictionary.Values)
            {
                ps.Add(item.Clone());
            }

            return ps;
        }

        #endregion
    }
}
