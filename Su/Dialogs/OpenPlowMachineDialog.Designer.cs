namespace Su.Dialogs
{
    partial class OpenPlowMachineDialog
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
            this.components = new System.ComponentModel.Container();
            this.plowMachineDataGridView = new System.Windows.Forms.DataGridView();
            this.dataGridViewTextBoxColumn3 = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.dataGridViewCheckBoxColumn1 = new System.Windows.Forms.DataGridViewCheckBoxColumn();
            this.plowMachineBindingSource = new System.Windows.Forms.BindingSource(this.components);
            this.splitContainer1 = new System.Windows.Forms.SplitContainer();
            this.chxbxSelectPrototype = new System.Windows.Forms.CheckBox();
            this.btnOK = new System.Windows.Forms.Button();
            this.btnCancel = new System.Windows.Forms.Button();
            ((System.ComponentModel.ISupportInitialize)(this.plowMachineDataGridView)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.plowMachineBindingSource)).BeginInit();
            this.splitContainer1.Panel1.SuspendLayout();
            this.splitContainer1.Panel2.SuspendLayout();
            this.splitContainer1.SuspendLayout();
            this.SuspendLayout();
            // 
            // plowMachineDataGridView
            // 
            this.plowMachineDataGridView.AutoGenerateColumns = false;
            this.plowMachineDataGridView.AutoSizeColumnsMode = System.Windows.Forms.DataGridViewAutoSizeColumnsMode.Fill;
            this.plowMachineDataGridView.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.plowMachineDataGridView.Columns.AddRange(new System.Windows.Forms.DataGridViewColumn[] {
            this.dataGridViewTextBoxColumn3,
            this.dataGridViewCheckBoxColumn1});
            this.plowMachineDataGridView.DataSource = this.plowMachineBindingSource;
            this.plowMachineDataGridView.Dock = System.Windows.Forms.DockStyle.Fill;
            this.plowMachineDataGridView.Location = new System.Drawing.Point(0, 0);
            this.plowMachineDataGridView.Name = "plowMachineDataGridView";
            this.plowMachineDataGridView.ReadOnly = true;
            this.plowMachineDataGridView.RowHeadersBorderStyle = System.Windows.Forms.DataGridViewHeaderBorderStyle.None;
            this.plowMachineDataGridView.RowHeadersVisible = false;
            this.plowMachineDataGridView.SelectionMode = System.Windows.Forms.DataGridViewSelectionMode.FullRowSelect;
            this.plowMachineDataGridView.Size = new System.Drawing.Size(383, 272);
            this.plowMachineDataGridView.TabIndex = 1;
            // 
            // dataGridViewTextBoxColumn3
            // 
            this.dataGridViewTextBoxColumn3.DataPropertyName = "Name";
            this.dataGridViewTextBoxColumn3.FillWeight = 98.47716F;
            this.dataGridViewTextBoxColumn3.HeaderText = "Name";
            this.dataGridViewTextBoxColumn3.Name = "dataGridViewTextBoxColumn3";
            this.dataGridViewTextBoxColumn3.ReadOnly = true;
            // 
            // dataGridViewCheckBoxColumn1
            // 
            this.dataGridViewCheckBoxColumn1.AutoSizeMode = System.Windows.Forms.DataGridViewAutoSizeColumnMode.Fill;
            this.dataGridViewCheckBoxColumn1.DataPropertyName = "IsPrototype";
            this.dataGridViewCheckBoxColumn1.FalseValue = "Нет";
            this.dataGridViewCheckBoxColumn1.FillWeight = 101.5228F;
            this.dataGridViewCheckBoxColumn1.HeaderText = "Прототип";
            this.dataGridViewCheckBoxColumn1.Name = "dataGridViewCheckBoxColumn1";
            this.dataGridViewCheckBoxColumn1.ReadOnly = true;
            this.dataGridViewCheckBoxColumn1.TrueValue = "Да";
            // 
            // plowMachineBindingSource
            // 
            this.plowMachineBindingSource.DataSource = typeof(SUCore.PlowMachine.PlowMachine);
            // 
            // splitContainer1
            // 
            this.splitContainer1.Dock = System.Windows.Forms.DockStyle.Fill;
            this.splitContainer1.Location = new System.Drawing.Point(0, 0);
            this.splitContainer1.Name = "splitContainer1";
            this.splitContainer1.Orientation = System.Windows.Forms.Orientation.Horizontal;
            // 
            // splitContainer1.Panel1
            // 
            this.splitContainer1.Panel1.Controls.Add(this.plowMachineDataGridView);
            // 
            // splitContainer1.Panel2
            // 
            this.splitContainer1.Panel2.Controls.Add(this.chxbxSelectPrototype);
            this.splitContainer1.Panel2.Controls.Add(this.btnOK);
            this.splitContainer1.Panel2.Controls.Add(this.btnCancel);
            this.splitContainer1.Size = new System.Drawing.Size(383, 311);
            this.splitContainer1.SplitterDistance = 272;
            this.splitContainer1.TabIndex = 2;
            // 
            // chxbxSelectPrototype
            // 
            this.chxbxSelectPrototype.AutoSize = true;
            this.chxbxSelectPrototype.Checked = true;
            this.chxbxSelectPrototype.CheckState = System.Windows.Forms.CheckState.Checked;
            this.chxbxSelectPrototype.Location = new System.Drawing.Point(12, 10);
            this.chxbxSelectPrototype.Name = "chxbxSelectPrototype";
            this.chxbxSelectPrototype.Size = new System.Drawing.Size(119, 17);
            this.chxbxSelectPrototype.TabIndex = 4;
            this.chxbxSelectPrototype.Text = "Выбрать прототип";
            this.chxbxSelectPrototype.UseVisualStyleBackColor = true;
            this.chxbxSelectPrototype.CheckStateChanged += new System.EventHandler(this.chxbxSelectPrototype_CheckStateChanged);
            // 
            // btnOK
            // 
            this.btnOK.Location = new System.Drawing.Point(211, 6);
            this.btnOK.Name = "btnOK";
            this.btnOK.Size = new System.Drawing.Size(75, 23);
            this.btnOK.TabIndex = 2;
            this.btnOK.Text = "Выбрать";
            this.btnOK.UseVisualStyleBackColor = true;
            this.btnOK.Click += new System.EventHandler(this.btnOK_Click);
            // 
            // btnCancel
            // 
            this.btnCancel.Location = new System.Drawing.Point(297, 6);
            this.btnCancel.Name = "btnCancel";
            this.btnCancel.Size = new System.Drawing.Size(75, 23);
            this.btnCancel.TabIndex = 3;
            this.btnCancel.Text = "Отмена";
            this.btnCancel.UseVisualStyleBackColor = true;
            this.btnCancel.Click += new System.EventHandler(this.btnCancel_Click);
            // 
            // OpenPlowMachineDialog
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(383, 311);
            this.ControlBox = false;
            this.Controls.Add(this.splitContainer1);
            this.FormBorderStyle = System.Windows.Forms.FormBorderStyle.FixedSingle;
            this.Name = "OpenPlowMachineDialog";
            this.StartPosition = System.Windows.Forms.FormStartPosition.CenterScreen;
            this.Text = "Выбрать СУ";
            this.Load += new System.EventHandler(this.OpenPlowMachineDialog_Load);
            this.FormClosed += new System.Windows.Forms.FormClosedEventHandler(this.OpenPlowMachineDialog_FormClosed);
            ((System.ComponentModel.ISupportInitialize)(this.plowMachineDataGridView)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.plowMachineBindingSource)).EndInit();
            this.splitContainer1.Panel1.ResumeLayout(false);
            this.splitContainer1.Panel2.ResumeLayout(false);
            this.splitContainer1.Panel2.PerformLayout();
            this.splitContainer1.ResumeLayout(false);
            this.ResumeLayout(false);

        }

        #endregion

        private System.Windows.Forms.BindingSource plowMachineBindingSource;
        private System.Windows.Forms.DataGridView plowMachineDataGridView;
        private System.Windows.Forms.SplitContainer splitContainer1;
        private System.Windows.Forms.Button btnOK;
        private System.Windows.Forms.Button btnCancel;
        private System.Windows.Forms.DataGridViewTextBoxColumn dataGridViewTextBoxColumn3;
        private System.Windows.Forms.DataGridViewCheckBoxColumn dataGridViewCheckBoxColumn1;
        private System.Windows.Forms.CheckBox chxbxSelectPrototype;
    }
}