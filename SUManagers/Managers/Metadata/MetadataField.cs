using System;
using System.Collections.Generic;
using System.Text;
using System.Data;

namespace SUCore.Managers.Metadata
{
    /// <summary>
    /// Поле
    /// </summary>
    public class MetadataField
    {
        string _name;
        Guid _moduleId;
        SqlDbType _sqlType;
        string _description;
        uint _sqlTypeLength = 0;

        public MetadataField(string name, string description, SqlDbType sqlType, uint sqlTypeLength)
            : this(Guid.Empty, name, description, sqlType, sqlTypeLength)
        {
        }

        internal MetadataField(Guid moduleId, string name, string description, SqlDbType sqlType, uint sqlTypeLength)
        {
            _moduleId = moduleId;
            _name = name;
            _description = description;
            _sqlType = sqlType;

            if (!MetadataField.ValidateFieldType(_sqlType)) throw new ArgumentException("SQL тип '" + _sqlType.ToString() + "' не поддерживается");

            _sqlTypeLength = sqlTypeLength;
        }

        /// <summary>
        /// Определяеться поддерживаеться ли тип
        /// </summary>
        /// <param name="type"></param>
        /// <returns></returns>
        public static bool ValidateFieldType(SqlDbType type)
        {
            switch (type)
            {
                case SqlDbType.NVarChar:
                case SqlDbType.Float:
                case SqlDbType.DateTime:
                case SqlDbType.UniqueIdentifier:
                case SqlDbType.Real: return true;
            }
            
            return false;
        }
        
        public string Name
        {
            get { return _name; }
        }
        public SqlDbType SqlType
        {
            get { return _sqlType; }
        }
        public string Description
        {
            get { return _description; }
        }
        public uint SqlTypeLength
        {
            get { return _sqlTypeLength; }
        }
        public Guid ModuleId
        {
            get { return _moduleId; }
        }
    }
}
