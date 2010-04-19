using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Drawing;
using System.Data;
using System.Linq;
using System.Text;
using System.Windows.Forms;
using SULibrary;
using System.Reflection;

namespace Su
{
    public partial class ParametersView : UserControl
    {
        Parameters _parameters;

        public ParametersView()
        {
            InitializeComponent();
        }

        public ParametersView(Parameters parameters) : this()
        {
            _parameters = parameters;
            parametersBindingSource.DataSource = _parameters;
        }

        public Parameters Params 
        {
            get
            {
                return _parameters;
            }
            set
            {
                if (value == null)
                {
                    _parameters = value;
                    parametersBindingSource.Clear();
                    parameterDataGridView.Refresh();
                }
                else
                {
                    _parameters = value;
                    parametersBindingSource.DataSource = _parameters;
                }
            }
        }

        private void parameterDataGridView_RowLeave(object sender, DataGridViewCellEventArgs e)
        {
           
        }

        private void parameterDataGridView_CellEndEdit(object sender, DataGridViewCellEventArgs e)
        {
            Parameter p = (Parameter)parameterDataGridView.Rows[e.RowIndex].DataBoundItem;

            if (p != null)
            {

                Type valueClrType = p.ValueType;
                MethodInfo mi = valueClrType.GetMethod("Parse", new Type[] { typeof(String) });

                if (valueClrType != typeof(String))
                {
                    try
                    {
                        object targetValue = mi.Invoke(null, new object[] { p.Value.ToString() });
                        p.Value = targetValue;
                    }
                    catch (TargetInvocationException)
                    {
                        MessageBox.Show("Неверный тип значения. Параметр " + p.Name, "Ошибка", MessageBoxButtons.OK, MessageBoxIcon.Error);
                        p.Value = null;
                    }
                }
            }
        }
    }
}
