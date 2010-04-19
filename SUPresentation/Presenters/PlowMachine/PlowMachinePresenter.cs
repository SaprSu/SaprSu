using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using SUPresentation.View.PlowMachine;
using SUCore.PlowMachine;

namespace SUPresentation.Presenters.PlowMachine
{
    public class PlowMachinePresenter
    {
        IPlowMachineView _view;

        public PlowMachinePresenter(IPlowMachineView plowMachineView)
        {
            _view = plowMachineView;
            
            _view.Save += new VoidEventHandler(Save);
            _view.New += new VoidEventHandler(New);
            _view.Delete += new VoidEventHandler(Delete);
        }

        /// <summary>
        /// Создаем новую СУ
        /// </summary>
        private void New()
        {
            using (PlowMachineManager manager = new PlowMachineManager())
            {
                _view.CurrentPlowMachine = manager.CreatePlowMachine();               
            }

            _view.RefreshView();
        }       
        
        /// <summary>
        /// Сохраняем СУ в БД
        /// </summary>
        private void Save()
        {
            using (PlowMachineManager manager = new PlowMachineManager())
            {
                manager.SavePlowMachine(_view.CurrentPlowMachine);
            }

            _view.RefreshView();
        }

        private void Delete()
        {
            using (PlowMachineManager manager = new PlowMachineManager())
            {
                manager.DeletePlowMachine(_view.CurrentPlowMachine);
            }

            _view.CurrentPlowMachine = null;
            _view.RefreshView();
        }
    }
}
