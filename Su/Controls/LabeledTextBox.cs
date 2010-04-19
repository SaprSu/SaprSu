using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Drawing;
using System.Data;
using System.Linq;
using System.Text;
using System.Windows.Forms;

namespace Su.Controls
{
    public partial class LabeledTextBox : UserControl
    {
        public LabeledTextBox()
        {
            InitializeComponent();
        }

        public string Caption 
        {
            get 
            {
                return lblCaption.Text;
            }
            set
            {
                lblCaption.Text = value;
            }
        }

        public new string Text
        {
            get
            {
                return txbxText.Text;
            }
            set
            {
                txbxText.Text = value;
            }
        }

        
    }
}
