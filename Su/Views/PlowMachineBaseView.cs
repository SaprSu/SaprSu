using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Drawing;
using System.Data;
using System.Linq;
using System.Text;
using System.Windows.Forms;
using SUPresentation.View.PlowMachine;
using SUPresentation.Presenters.PlowMachine;
using SUPresentation;
using SUCore.PlowMachine;
using SUPresentation.View;

namespace Su
{
    public partial class PlowMachineBaseView : UserControl, IPlowMachineView
    {
        PlowMachinePresenter _presenter;

        public PlowMachineBaseView()           
        {
            InitializeComponent();
            _presenter = new PlowMachinePresenter(this);
        }

        public void SavePlowMachine()
        {
            //  пробрасываем событие в презентатор 
            VoidEventHandler temp = Save;
            if (temp != null) temp();
        }

        public void CreteNewPlowMachine()
        {
            //  пробрасываем событие в презентатор 
            VoidEventHandler temp = New;
            if (temp != null) temp();
        }

        public void DeletePlowMachine()
        {
            //  пробрасываем событие в презентатор 
            VoidEventHandler temp = Delete;
            if (temp != null) temp();
        }
       

        #region IPlowMachineView Members

        public SUCore.PlowMachine.PlowMachine CurrentPlowMachine
        {
            get;
            set;
        }

        #endregion

        #region IView Members
       
        public event VoidEventHandler Save;
        public event VoidEventHandler New;
        public event VoidEventHandler Delete;

        public SUPresentation.View.ViewMode Mode
        {
            get;
            set;
        }

        public void RefreshView()
        {
            if (CurrentPlowMachine != null)
            {
                plowMachineBindingSource.DataSource = CurrentPlowMachine;
                baseParametersView.Params = CurrentPlowMachine.Modules["PlowMachineBase"].ModuleParams;           
            }
            else
            {
                plowMachineBindingSource.Clear();              
                baseParametersView.Params = null;
            }
        }

        #endregion

        /// <summary>
        /// Отображает графическое представление СУ
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private void btnShowModel_Click(object sender, EventArgs e)
        {
            SUSchematicRepresentation psr = new SUSchematicRepresentation();
          
            var ps = ParametersHelper.GetParams(psr.InputParams, CurrentPlowMachine);
            psr.Initialize(ps);

            try
            {
                psr.WinForm.ShowDialog();
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message, "Ошибка", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
            finally
            {
                psr.WinForm.Dispose();
            }
            //SUSchematicRepresentation 
         
        }
    }
}
