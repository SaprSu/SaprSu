namespace Su
{
    partial class PlowMachineBaseView
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

        #region Component Designer generated code

        /// <summary> 
        /// Required method for Designer support - do not modify 
        /// the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            this.components = new System.ComponentModel.Container();
            System.Windows.Forms.Label isPrototypeLabel;
            System.Windows.Forms.Label nameLabel1;
            this.splitContainer2 = new System.Windows.Forms.SplitContainer();
            this.groupBox2 = new System.Windows.Forms.GroupBox();
            this.nameLabel2 = new System.Windows.Forms.Label();
            this.plowMachineBindingSource = new System.Windows.Forms.BindingSource(this.components);
            this.isPrototypeCheckBox = new System.Windows.Forms.CheckBox();
            this.groupBox1 = new System.Windows.Forms.GroupBox();
            this.baseParametersView = new Su.ParametersView();
            this.btnShowModel = new System.Windows.Forms.Button();
            isPrototypeLabel = new System.Windows.Forms.Label();
            nameLabel1 = new System.Windows.Forms.Label();
            this.splitContainer2.Panel1.SuspendLayout();
            this.splitContainer2.Panel2.SuspendLayout();
            this.splitContainer2.SuspendLayout();
            this.groupBox2.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.plowMachineBindingSource)).BeginInit();
            this.groupBox1.SuspendLayout();
            this.SuspendLayout();
            // 
            // isPrototypeLabel
            // 
            isPrototypeLabel.AutoSize = true;
            isPrototypeLabel.Location = new System.Drawing.Point(14, 53);
            isPrototypeLabel.Name = "isPrototypeLabel";
            isPrototypeLabel.Size = new System.Drawing.Size(55, 13);
            isPrototypeLabel.TabIndex = 2;
            isPrototypeLabel.Text = "Прототип";
            // 
            // nameLabel1
            // 
            nameLabel1.AutoSize = true;
            nameLabel1.Location = new System.Drawing.Point(14, 22);
            nameLabel1.Name = "nameLabel1";
            nameLabel1.Size = new System.Drawing.Size(57, 13);
            nameLabel1.TabIndex = 4;
            nameLabel1.Text = "Название";
            // 
            // splitContainer2
            // 
            this.splitContainer2.Dock = System.Windows.Forms.DockStyle.Fill;
            this.splitContainer2.FixedPanel = System.Windows.Forms.FixedPanel.Panel1;
            this.splitContainer2.Location = new System.Drawing.Point(0, 0);
            this.splitContainer2.Name = "splitContainer2";
            this.splitContainer2.Orientation = System.Windows.Forms.Orientation.Horizontal;
            // 
            // splitContainer2.Panel1
            // 
            this.splitContainer2.Panel1.AutoScroll = true;
            this.splitContainer2.Panel1.Controls.Add(this.groupBox2);
            // 
            // splitContainer2.Panel2
            // 
            this.splitContainer2.Panel2.Controls.Add(this.groupBox1);
            this.splitContainer2.Size = new System.Drawing.Size(376, 430);
            this.splitContainer2.SplitterDistance = 114;
            this.splitContainer2.TabIndex = 1;
            // 
            // groupBox2
            // 
            this.groupBox2.Controls.Add(this.btnShowModel);
            this.groupBox2.Controls.Add(nameLabel1);
            this.groupBox2.Controls.Add(this.nameLabel2);
            this.groupBox2.Controls.Add(isPrototypeLabel);
            this.groupBox2.Controls.Add(this.isPrototypeCheckBox);
            this.groupBox2.Dock = System.Windows.Forms.DockStyle.Fill;
            this.groupBox2.Location = new System.Drawing.Point(0, 0);
            this.groupBox2.Name = "groupBox2";
            this.groupBox2.Size = new System.Drawing.Size(376, 114);
            this.groupBox2.TabIndex = 1;
            this.groupBox2.TabStop = false;
            // 
            // nameLabel2
            // 
            this.nameLabel2.DataBindings.Add(new System.Windows.Forms.Binding("Text", this.plowMachineBindingSource, "Name", true));
            this.nameLabel2.Location = new System.Drawing.Point(108, 22);
            this.nameLabel2.Name = "nameLabel2";
            this.nameLabel2.Size = new System.Drawing.Size(100, 23);
            this.nameLabel2.TabIndex = 5;
            this.nameLabel2.Text = "...";
            // 
            // plowMachineBindingSource
            // 
            this.plowMachineBindingSource.DataSource = typeof(SUCore.PlowMachine.PlowMachine);
            // 
            // isPrototypeCheckBox
            // 
            this.isPrototypeCheckBox.DataBindings.Add(new System.Windows.Forms.Binding("CheckState", this.plowMachineBindingSource, "IsPrototype", true));
            this.isPrototypeCheckBox.DataBindings.Add(new System.Windows.Forms.Binding("Checked", this.plowMachineBindingSource, "IsPrototype", true));
            this.isPrototypeCheckBox.Location = new System.Drawing.Point(111, 48);
            this.isPrototypeCheckBox.Name = "isPrototypeCheckBox";
            this.isPrototypeCheckBox.Size = new System.Drawing.Size(104, 24);
            this.isPrototypeCheckBox.TabIndex = 3;
            this.isPrototypeCheckBox.UseVisualStyleBackColor = true;
            // 
            // groupBox1
            // 
            this.groupBox1.Controls.Add(this.baseParametersView);
            this.groupBox1.Dock = System.Windows.Forms.DockStyle.Fill;
            this.groupBox1.Location = new System.Drawing.Point(0, 0);
            this.groupBox1.Name = "groupBox1";
            this.groupBox1.Size = new System.Drawing.Size(376, 312);
            this.groupBox1.TabIndex = 0;
            this.groupBox1.TabStop = false;
            this.groupBox1.Text = "Базовые параметры";
            // 
            // baseParametersView
            // 
            this.baseParametersView.Dock = System.Windows.Forms.DockStyle.Fill;
            this.baseParametersView.Location = new System.Drawing.Point(3, 16);
            this.baseParametersView.Name = "baseParametersView";
            this.baseParametersView.Params = null;
            this.baseParametersView.Size = new System.Drawing.Size(370, 293);
            this.baseParametersView.TabIndex = 0;
            // 
            // btnShowModel
            // 
            this.btnShowModel.Location = new System.Drawing.Point(17, 80);
            this.btnShowModel.Name = "btnShowModel";
            this.btnShowModel.Size = new System.Drawing.Size(198, 23);
            this.btnShowModel.TabIndex = 2;
            this.btnShowModel.Text = "Показать графическую модель...";
            this.btnShowModel.UseVisualStyleBackColor = true;
            this.btnShowModel.Click += new System.EventHandler(this.btnShowModel_Click);
            // 
            // PlowMachineBaseView
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.Controls.Add(this.splitContainer2);
            this.Name = "PlowMachineBaseView";
            this.Size = new System.Drawing.Size(376, 430);
            this.splitContainer2.Panel1.ResumeLayout(false);
            this.splitContainer2.Panel2.ResumeLayout(false);
            this.splitContainer2.ResumeLayout(false);
            this.groupBox2.ResumeLayout(false);
            this.groupBox2.PerformLayout();
            ((System.ComponentModel.ISupportInitialize)(this.plowMachineBindingSource)).EndInit();
            this.groupBox1.ResumeLayout(false);
            this.ResumeLayout(false);

        }

        #endregion

        private System.Windows.Forms.SplitContainer splitContainer2;
        private System.Windows.Forms.GroupBox groupBox1;
        private ParametersView baseParametersView;
        private System.Windows.Forms.BindingSource plowMachineBindingSource;
        private System.Windows.Forms.CheckBox isPrototypeCheckBox;
        private System.Windows.Forms.Label nameLabel2;
        private System.Windows.Forms.GroupBox groupBox2;
        private System.Windows.Forms.Button btnShowModel;

    }
}
