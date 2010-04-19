namespace Su
{
	partial class ModesForm
	{
		/// <summary>
		/// Required designer variable.
		/// </summary>
		private System.ComponentModel.IContainer components = null;

		/// <summary>
		/// Clean up any resources being used.
		/// </summary>
		/// <param name="disposing">true if managed resources should be disposed; otherwise, false.</param>
		protected override void Dispose(bool disposing)
		{
			if (disposing && (components != null))
			{
				components.Dispose();
			}
			base.Dispose(disposing);
		}

		#region Windows Form Designer generated code

		/// <summary>
		/// Required method for Designer support - do not modify
		/// the contents of this method with the code editor.
		/// </summary>
		private void InitializeComponent()
		{
			this.tableLayoutPanel1 = new System.Windows.Forms.TableLayoutPanel();
			this.btnCalculate = new System.Windows.Forms.Button();
			this.cbModes = new System.Windows.Forms.ComboBox();
			this.parametersView = new Su.ParametersView();
			this.tableLayoutPanel1.SuspendLayout();
			this.SuspendLayout();
			// 
			// tableLayoutPanel1
			// 
			this.tableLayoutPanel1.ColumnCount = 2;
			this.tableLayoutPanel1.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Percent, 81.16761F));
			this.tableLayoutPanel1.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Percent, 18.83239F));
			this.tableLayoutPanel1.Controls.Add(this.btnCalculate, 1, 1);
			this.tableLayoutPanel1.Controls.Add(this.cbModes, 0, 1);
			this.tableLayoutPanel1.Controls.Add(this.parametersView, 0, 0);
			this.tableLayoutPanel1.Dock = System.Windows.Forms.DockStyle.Fill;
			this.tableLayoutPanel1.Location = new System.Drawing.Point(0, 0);
			this.tableLayoutPanel1.Name = "tableLayoutPanel1";
			this.tableLayoutPanel1.RowCount = 2;
			this.tableLayoutPanel1.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Percent, 92.02898F));
			this.tableLayoutPanel1.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Percent, 7.971014F));
			this.tableLayoutPanel1.Size = new System.Drawing.Size(531, 414);
			this.tableLayoutPanel1.TabIndex = 1;
			// 
			// btnCalculate
			// 
			this.btnCalculate.Enabled = false;
			this.btnCalculate.Location = new System.Drawing.Point(434, 383);
			this.btnCalculate.Name = "btnCalculate";
			this.btnCalculate.Size = new System.Drawing.Size(85, 23);
			this.btnCalculate.TabIndex = 1;
			this.btnCalculate.Text = "Расчитать";
			this.btnCalculate.UseVisualStyleBackColor = true;
			this.btnCalculate.Click += new System.EventHandler(this.btnCalculate_Click);
			// 
			// cbModes
			// 
			this.cbModes.DropDownStyle = System.Windows.Forms.ComboBoxStyle.DropDownList;
			this.cbModes.FormattingEnabled = true;
			this.cbModes.Location = new System.Drawing.Point(3, 383);
			this.cbModes.Name = "cbModes";
			this.cbModes.Size = new System.Drawing.Size(388, 21);
			this.cbModes.TabIndex = 2;
			this.cbModes.SelectedIndexChanged += new System.EventHandler(this.cbModes_SelectedIndexChanged);
			// 
			// parametersView
			// 
			this.tableLayoutPanel1.SetColumnSpan(this.parametersView, 2);
			this.parametersView.Dock = System.Windows.Forms.DockStyle.Fill;
			this.parametersView.Location = new System.Drawing.Point(3, 3);
			this.parametersView.Name = "parametersView";
			this.parametersView.Params = null;
			this.parametersView.Size = new System.Drawing.Size(525, 374);
			this.parametersView.TabIndex = 3;
			// 
			// ModesForm
			// 
			this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
			this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
			this.ClientSize = new System.Drawing.Size(531, 414);
			this.Controls.Add(this.tableLayoutPanel1);
			this.Name = "ModesForm";
			this.ShowInTaskbar = false;
			this.Text = "Режимы";
			this.tableLayoutPanel1.ResumeLayout(false);
			this.ResumeLayout(false);

		}

		#endregion

		private System.Windows.Forms.TableLayoutPanel tableLayoutPanel1;
		private System.Windows.Forms.Button btnCalculate;
		private System.Windows.Forms.ComboBox cbModes;
		private ParametersView parametersView;
	}
}