﻿//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated by a tool.
//     Runtime Version:2.0.50727.3053
//
//     Changes to this file may cause incorrect behavior and will be lost if
//     the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

[assembly: global::System.Data.Objects.DataClasses.EdmSchemaAttribute()]

// Original file name:
// Generation date: 29.11.2008 14:58:17
namespace SUCore.PlowMachine
{
    
    /// <summary>
    /// There are no comments for PlowMachineEntities in the schema.
    /// </summary>
    public partial class PlowMachineEntities : global::System.Data.Objects.ObjectContext
    {
        /// <summary>
        /// Initializes a new PlowMachineEntities object using the connection string found in the 'PlowMachineEntities' section of the application configuration file.
        /// </summary>
        public PlowMachineEntities() : 
                base("name=PlowMachineEntities", "PlowMachineEntities")
        {
            this.OnContextCreated();
        }
        /// <summary>
        /// Initialize a new PlowMachineEntities object.
        /// </summary>
        public PlowMachineEntities(string connectionString) : 
                base(connectionString, "PlowMachineEntities")
        {
            this.OnContextCreated();
        }
        /// <summary>
        /// Initialize a new PlowMachineEntities object.
        /// </summary>
        public PlowMachineEntities(global::System.Data.EntityClient.EntityConnection connection) : 
                base(connection, "PlowMachineEntities")
        {
            this.OnContextCreated();
        }
        partial void OnContextCreated();
        /// <summary>
        /// There are no comments for PlowMachineEntitySet in the schema.
        /// </summary>
        public global::System.Data.Objects.ObjectQuery<PlowMachineEntity> PlowMachineEntitySet
        {
            get
            {
                if ((this._PlowMachineEntitySet == null))
                {
                    this._PlowMachineEntitySet = base.CreateQuery<PlowMachineEntity>("[PlowMachineEntitySet]");
                }
                return this._PlowMachineEntitySet;
            }
        }
        private global::System.Data.Objects.ObjectQuery<PlowMachineEntity> _PlowMachineEntitySet;
        /// <summary>
        /// There are no comments for PlowMachineEntitySet in the schema.
        /// </summary>
        public void AddToPlowMachineEntitySet(PlowMachineEntity plowMachineEntity)
        {
            base.AddObject("PlowMachineEntitySet", plowMachineEntity);
        }
    }
    /// <summary>
    /// There are no comments for PlowMachineModel.PlowMachineEntity in the schema.
    /// </summary>
    /// <KeyProperties>
    /// PlowMachineId
    /// </KeyProperties>
    [global::System.Data.Objects.DataClasses.EdmEntityTypeAttribute(NamespaceName="PlowMachineModel", Name="PlowMachineEntity")]
    [global::System.Runtime.Serialization.DataContractAttribute(IsReference=true)]
    [global::System.Serializable()]
    public partial class PlowMachineEntity : global::System.Data.Objects.DataClasses.EntityObject
    {
        /// <summary>
        /// Create a new PlowMachineEntity object.
        /// </summary>
        /// <param name="plowMachineId">Initial value of PlowMachineId.</param>
        /// <param name="name">Initial value of Name.</param>
        /// <param name="isPrototype">Initial value of IsPrototype.</param>
        /// <param name="createdOn">Initial value of CreatedOn.</param>
        public static PlowMachineEntity CreatePlowMachineEntity(global::System.Guid plowMachineId, string name, bool isPrototype, global::System.DateTime createdOn)
        {
            PlowMachineEntity plowMachineEntity = new PlowMachineEntity();
            plowMachineEntity.PlowMachineId = plowMachineId;
            plowMachineEntity.Name = name;
            plowMachineEntity.IsPrototype = isPrototype;
            plowMachineEntity.CreatedOn = createdOn;
            return plowMachineEntity;
        }
        /// <summary>
        /// There are no comments for Property PlowMachineId in the schema.
        /// </summary>
        [global::System.Data.Objects.DataClasses.EdmScalarPropertyAttribute(EntityKeyProperty=true, IsNullable=false)]
        [global::System.Runtime.Serialization.DataMemberAttribute()]
        public global::System.Guid PlowMachineId
        {
            get
            {
                return this._PlowMachineId;
            }
            set
            {
                this.OnPlowMachineIdChanging(value);
                this.ReportPropertyChanging("PlowMachineId");
                this._PlowMachineId = global::System.Data.Objects.DataClasses.StructuralObject.SetValidValue(value);
                this.ReportPropertyChanged("PlowMachineId");
                this.OnPlowMachineIdChanged();
            }
        }
        private global::System.Guid _PlowMachineId;
        partial void OnPlowMachineIdChanging(global::System.Guid value);
        partial void OnPlowMachineIdChanged();
        /// <summary>
        /// There are no comments for Property Name in the schema.
        /// </summary>
        [global::System.Data.Objects.DataClasses.EdmScalarPropertyAttribute(IsNullable=false)]
        [global::System.Runtime.Serialization.DataMemberAttribute()]
        public string Name
        {
            get
            {
                return this._Name;
            }
            set
            {
                this.OnNameChanging(value);
                this.ReportPropertyChanging("Name");
                this._Name = global::System.Data.Objects.DataClasses.StructuralObject.SetValidValue(value, false);
                this.ReportPropertyChanged("Name");
                this.OnNameChanged();
            }
        }
        private string _Name;
        partial void OnNameChanging(string value);
        partial void OnNameChanged();
        /// <summary>
        /// There are no comments for Property IsPrototype in the schema.
        /// </summary>
        [global::System.Data.Objects.DataClasses.EdmScalarPropertyAttribute(IsNullable=false)]
        [global::System.Runtime.Serialization.DataMemberAttribute()]
        public bool IsPrototype
        {
            get
            {
                return this._IsPrototype;
            }
            set
            {
                this.OnIsPrototypeChanging(value);
                this.ReportPropertyChanging("IsPrototype");
                this._IsPrototype = global::System.Data.Objects.DataClasses.StructuralObject.SetValidValue(value);
                this.ReportPropertyChanged("IsPrototype");
                this.OnIsPrototypeChanged();
            }
        }
        private bool _IsPrototype;
        partial void OnIsPrototypeChanging(bool value);
        partial void OnIsPrototypeChanged();
        /// <summary>
        /// There are no comments for Property CreatedOn in the schema.
        /// </summary>
        [global::System.Data.Objects.DataClasses.EdmScalarPropertyAttribute(IsNullable=false)]
        [global::System.Runtime.Serialization.DataMemberAttribute()]
        public global::System.DateTime CreatedOn
        {
            get
            {
                return this._CreatedOn;
            }
            set
            {
                this.OnCreatedOnChanging(value);
                this.ReportPropertyChanging("CreatedOn");
                this._CreatedOn = global::System.Data.Objects.DataClasses.StructuralObject.SetValidValue(value);
                this.ReportPropertyChanged("CreatedOn");
                this.OnCreatedOnChanged();
            }
        }
        private global::System.DateTime _CreatedOn;
        partial void OnCreatedOnChanging(global::System.DateTime value);
        partial void OnCreatedOnChanged();
        /// <summary>
        /// There are no comments for Property ModifidedOn in the schema.
        /// </summary>
        [global::System.Data.Objects.DataClasses.EdmScalarPropertyAttribute()]
        [global::System.Runtime.Serialization.DataMemberAttribute()]
        public global::System.Nullable<global::System.DateTime> ModifidedOn
        {
            get
            {
                return this._ModifidedOn;
            }
            set
            {
                this.OnModifidedOnChanging(value);
                this.ReportPropertyChanging("ModifidedOn");
                this._ModifidedOn = global::System.Data.Objects.DataClasses.StructuralObject.SetValidValue(value);
                this.ReportPropertyChanged("ModifidedOn");
                this.OnModifidedOnChanged();
            }
        }
        private global::System.Nullable<global::System.DateTime> _ModifidedOn;
        partial void OnModifidedOnChanging(global::System.Nullable<global::System.DateTime> value);
        partial void OnModifidedOnChanged();
    }
}
