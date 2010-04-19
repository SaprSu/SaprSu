using System;
using System.Collections.Generic;
using System.Linq;
using System.Reflection;
using SULibrary;

namespace Su.Modes
{
	public class ParametersMapper
	{
		private static Dictionary<Type, Dictionary<string, PropertyInfo>> propertiesCache = new Dictionary<Type, Dictionary<string, PropertyInfo>>();

		public static Dictionary<string, PropertyInfo> GetProperties(Type type)
		{
			if (!propertiesCache.ContainsKey(type))
			{
				UpdateCache(type);
			}
			return propertiesCache[type];
		}

		public static T Map<T>(Parameters parameters) where T : new()
		{
			Type type = typeof(T);
			var propertyByName = GetProperties(type);
			T t = new T();
			foreach (string key in propertyByName.Keys)
			{
				if (parameters.FirstOrDefault(a => a.Name == key) != null)
				{
					propertyByName[key].SetValue(t, parameters[key].Value, null);
				}
			}
			return t;
		}

		private static void UpdateCache(Type type)
		{
			Dictionary<string, PropertyInfo> propertyByName = new Dictionary<string, PropertyInfo>();
			PropertyInfo[] props = type.GetProperties();
			foreach (PropertyInfo pi in props)
			{
				var attribute = pi.GetCustomAttributes(typeof(ParameterAttribute), true)
									.Where(a => a is ParameterAttribute)
									.SingleOrDefault() as ParameterAttribute;
				if (attribute != null)
				{
					propertyByName[attribute.Name] = pi;
				}
			}
			propertiesCache[type] = propertyByName;
		}

		public static Parameters Map<T>(T parameterObject)
		{
			Type type = typeof(T);
			var propertyByName = GetProperties(type);
			Dictionary<string, object> dictionary = new Dictionary<string, object>();
			foreach (string key in propertyByName.Keys)
			{
				dictionary[key] = propertyByName[key].GetValue(parameterObject, null);
			}
			Parameters result = new Parameters();
			foreach (var pair in dictionary)
			{
				result.Add(pair.Key, pair.Value);
			}
			return result;
		}
	}
}