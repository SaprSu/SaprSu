using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace SUCore.Modules
{
    /// <summary>
    /// Коллекция модулей
    /// </summary>
    public class ModulesCollection  : IDictionary<string, Module>
    {
        Dictionary<string, Module> _internalModulesList;

        public ModulesCollection()
        {
            _internalModulesList = new Dictionary<string, Module>();
        }

        #region IDictionary<string,Module> Members

        public void Add(string key, Module value)
        {
            _internalModulesList.Add(key, value);
        }

        public bool ContainsKey(string key)
        {
           return _internalModulesList.ContainsKey(key);
        }

        public ICollection<string> Keys
        {
            get { return _internalModulesList.Keys; }
        }

        public bool Remove(string key)
        {
            return _internalModulesList.Remove(key);
        }

        public bool TryGetValue(string key, out Module value)
        {
           return _internalModulesList.TryGetValue(key, out value);
        }

        public ICollection<Module> Values
        {
            get { return _internalModulesList.Values; }
        }

        public Module this[string key]
        {
            get
            {
                return _internalModulesList[key];
            }
            set
            {
               _internalModulesList[key] = value;
            }
        }

        #endregion

        #region ICollection<KeyValuePair<string,Module>> Members

        public void Add(KeyValuePair<string, Module> item)
        {
            _internalModulesList.Add(item.Key, item.Value);
        }

        public void Clear()
        {
           _internalModulesList.Clear();
        }

        public bool Contains(KeyValuePair<string, Module> item)
        {
            return _internalModulesList.Contains(item) ;
        }

        public void CopyTo(KeyValuePair<string, Module>[] array, int arrayIndex)
        {
            array = _internalModulesList.ToArray();
        }

        public int Count
        {
            get { return _internalModulesList.Count; }
        }

        public bool IsReadOnly
        {
            get { return false; }
        }

        public bool Remove(KeyValuePair<string, Module> item)
        {
           return _internalModulesList.Remove(item.Key);
        }

        #endregion

        #region IEnumerable<KeyValuePair<string,Module>> Members

        public IEnumerator<KeyValuePair<string, Module>> GetEnumerator()
        {
            return _internalModulesList.GetEnumerator();
        }

        #endregion

        #region IEnumerable Members

        System.Collections.IEnumerator System.Collections.IEnumerable.GetEnumerator()
        {
            return (System.Collections.IEnumerator)_internalModulesList.GetEnumerator();
        }

        #endregion
    }
}
