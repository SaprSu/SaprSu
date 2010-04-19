using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data.EntityClient;

namespace SUCore.PlowMachine
{
    using SUCore.Modules;
    using SULibrary;

    public class PlowMachineManager : IDisposable
    {
        static readonly string ENTITY_METADATA = @"res://*/PlowMachineModel.csdl | 
                                                   res://*/PlowMachineModel.ssdl |
                                                   res://*/PlowMachineModel.msl";

        PlowMachineEntities _context;
        ModuleManager _moduleManager;
      

        public PlowMachineManager()
        {
            
            #region Контекст подкючения к БД

            string connectionString = DBConnectionHelper.GetConnectionString();
          
            EntityConnectionStringBuilder bldr = new EntityConnectionStringBuilder();
            bldr.Metadata = ENTITY_METADATA;
            bldr.ProviderConnectionString = connectionString;
            bldr.Provider = "System.Data.SqlClient";

            EntityConnection connection = new EntityConnection(bldr.ToString());

            _context = new PlowMachineEntities(bldr.ConnectionString); 
            #endregion

            _moduleManager = new ModuleManager();
        }        
       

        /// <summary>
        /// Создаём новую струговую установку
        /// </summary>
        /// <returns></returns>
        public PlowMachine CreatePlowMachine()
        {
            PlowMachine result = new PlowMachine();
            _moduleManager.InitModules(result.PlowMachineId, result.Modules);
            return result;
        }

        /// <summary>
        /// Сохранение струговой установки
        /// </summary>
        /// <param name="plowmachine"></param>
        public void SavePlowMachine(PlowMachine plowmachine)
        {

            var q = from pm in _context.PlowMachineEntitySet
                    where pm.PlowMachineId == plowmachine.PlowMachineId
                    select pm;


            if (q.Count() == 0)
            {
                #region новая

                PlowMachineEntity pm = new PlowMachineEntity()
                {
                    PlowMachineId = plowmachine.PlowMachineId,
                    Name = plowmachine.Name ?? string.Empty,
                    ModifidedOn = DateTime.Now,
                    CreatedOn = DateTime.Now,
                    IsPrototype = plowmachine.IsPrototype
                };

                _context.AddToPlowMachineEntitySet(pm);
                _context.SaveChanges();

                #endregion
            }
            else
            {
                #region обновляем

                PlowMachineEntity pm = q.First();

                pm.Name = plowmachine.Name ?? string.Empty;
                pm.IsPrototype = plowmachine.IsPrototype;
                pm.ModifidedOn = DateTime.Now;

                _context.SaveChanges();

                #endregion
            }

            foreach (var module in plowmachine.Modules.Values)
            {
                _moduleManager.UpdateParameters(module);
            }
        }
       

        #region IDisposable Members

        public void Dispose()
        {
            _context.Dispose();
            _moduleManager.Dispose();
        }

        #endregion

        /// <summary>
        /// Загрузить струговую установку
        /// </summary>
        /// <param name="id">идентификатор струговой установки</param>
        public PlowMachine LoadPlowMachine(Guid id)
        {
            var q = from pm in _context.PlowMachineEntitySet
                    where pm.PlowMachineId == id
                    select pm;

            if (q.Count() == 0) return null;

            PlowMachineEntity pme = q.First();

            PlowMachine result = new PlowMachine(id)
            {
                Name = pme.Name,
                IsPrototype = pme.IsPrototype
            };

            _moduleManager.InitModules(id, result.Modules);

            return result;
        }

        /// <summary>
        /// Клонирует струговую установку
        /// </summary>
        /// <param name="id">уникальный идентификатор струговой установки, которую нужно клонировать</param>
        public PlowMachine ClonePlowMachine(PlowMachine pm)
        {           
            PlowMachine newPlow = CreatePlowMachine();

            foreach (var item in pm.Modules)
            {
                Module currentModule = item.Value;
                Module newModule = newPlow.Modules[currentModule.Name];              

                foreach (var p in currentModule.ModuleParams)
                {
                    Parameter newP = p.Clone() as Parameter;

                    if (!newModule.ModuleParams.Contains(newP))
                    {
                        newModule.ModuleParams.Add(newP);
                    }
                    else
                    {
                        newModule.ModuleParams[p.Name].ValueType   = p.ValueType;
                        newModule.ModuleParams[p.Name].Value       = p.Value;
                        newModule.ModuleParams[p.Name].Description = p.Description;                      
                    }
                }
            }

            return newPlow;
        }

        /// <summary>
        /// Список струговых установок
        /// </summary>
        public List<PlowMachine> GetPlowMachineList()
        {
            var query = from pm in _context.PlowMachineEntitySet
                        select pm;

            List<PlowMachine> result = new List<PlowMachine>();

            foreach (var pm in query)
            {
                result.Add(new PlowMachine(pm.PlowMachineId)
                {
                   Name = pm.Name,
                   IsPrototype = pm.IsPrototype
                });
            }

            return result;
        }

        public List<PlowMachine> GetPrototypesList()
        {
            var query = from pm in _context.PlowMachineEntitySet
                        where pm.IsPrototype == true
                        select pm;

            List<PlowMachine> result = new List<PlowMachine>();

            foreach (var pm in query)
            {
                result.Add(new PlowMachine(pm.PlowMachineId)
                {
                   Name = pm.Name,
                   IsPrototype = pm.IsPrototype
                });
            }

            return result;
        }

        public void DeletePlowMachine(PlowMachine plowMachine)
        {
            var pm = from p in _context.PlowMachineEntitySet 
                                   where p.PlowMachineId == plowMachine.PlowMachineId 
                                   select p;

            if (pm.Count() == 0)            
                throw new Exception("Данной СУ не существует в БД");

            _context.DeleteObject(pm.First());
            _context.SaveChanges();

        }
    }
}
