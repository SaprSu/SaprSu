namespace Su.Controls
{
    partial class ComputingProcessorControl
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
            this.groupBox1 = new System.Windows.Forms.GroupBox();
            this.tableLayoutPanel1 = new System.Windows.Forms.TableLayoutPanel();
            this.grpbxAutoMode = new System.Windows.Forms.GroupBox();
            this.btnAutoModeSettings = new System.Windows.Forms.Button();
            this.chxbxDebugMode = new System.Windows.Forms.CheckBox();
            this.chxbxAutoMode = new System.Windows.Forms.CheckBox();
            this.grpbxUserMode = new System.Windows.Forms.GroupBox();
            this.chxbxStepByStepMode = new System.Windows.Forms.CheckBox();
            this.btnUserModeSettings = new System.Windows.Forms.Button();
            this.chxbxLogParameters = new System.Windows.Forms.CheckBox();
            this.flowLayoutPanel1 = new System.Windows.Forms.FlowLayoutPanel();
            this.btnNext = new System.Windows.Forms.Button();
            this.btnStartStop = new System.Windows.Forms.Button();
            this.groupBox1.SuspendLayout();
            this.tableLayoutPanel1.SuspendLayout();
            this.grpbxAutoMode.SuspendLayout();
            this.grpbxUserMode.SuspendLayout();
            this.flowLayoutPanel1.SuspendLayout();
            this.SuspendLayout();
            // 
            // groupBox1
            // 
            this.groupBox1.Controls.Add(this.tableLayoutPanel1);
            this.groupBox1.Dock = System.Windows.Forms.DockStyle.Fill;
            this.groupBox1.Location = new System.Drawing.Point(0, 0);
            this.groupBox1.Name = "groupBox1";
            this.groupBox1.Size = new System.Drawing.Size(498, 214);
            this.groupBox1.TabIndex = 0;
            this.groupBox1.TabStop = false;
            this.groupBox1.Text = "Расчёты";
            // 
            // tableLayoutPanel1
            // 
            this.tableLayoutPanel1.ColumnCount = 2;
            this.tableLayoutPanel1.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Percent, 50F));
            this.tableLayoutPanel1.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Percent, 50F));
            this.tableLayoutPanel1.Controls.Add(this.grpbxAutoMode, 0, 1);
            this.tableLayoutPanel1.Controls.Add(this.chxbxAutoMode, 0, 0);
            this.tableLayoutPanel1.Controls.Add(this.grpbxUserMode, 1, 1);
            this.tableLayoutPanel1.Controls.Add(this.chxbxLogParameters, 0, 2);
            this.tableLayoutPanel1.Controls.Add(this.flowLayoutPanel1, 0, 3);
            this.tableLayoutPanel1.Dock = System.Windows.Forms.DockStyle.Fill;
            this.tableLayoutPanel1.Location = new System.Drawing.Point(3, 16);
            this.tableLayoutPanel1.Name = "tableLayoutPanel1";
            this.tableLayoutPanel1.RowCount = 4;
            this.tableLayoutPanel1.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Absolute, 35F));
            this.tableLayoutPanel1.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Absolute, 85F));
            this.tableLayoutPanel1.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Absolute, 35F));
            this.tableLayoutPanel1.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Percent, 100F));
            this.tableLayoutPanel1.Size = new System.Drawing.Size(492, 195);
            this.tableLayoutPanel1.TabIndex = 6;
            // 
            // grpbxAutoMode
            // 
            this.grpbxAutoMode.Controls.Add(this.btnAutoModeSettings);
            this.grpbxAutoMode.Controls.Add(this.chxbxDebugMode);
            this.grpbxAutoMode.Dock = System.Windows.Forms.DockStyle.Fill;
            this.grpbxAutoMode.Enabled = false;
            this.grpbxAutoMode.Location = new System.Drawing.Point(3, 38);
            this.grpbxAutoMode.Name = "grpbxAutoMode";
            this.grpbxAutoMode.Size = new System.Drawing.Size(240, 79);
            this.grpbxAutoMode.TabIndex = 1;
            this.grpbxAutoMode.TabStop = false;
            this.grpbxAutoMode.Text = "Автоматический режим";
            // 
            // btnAutoModeSettings
            // 
            this.btnAutoModeSettings.Location = new System.Drawing.Point(6, 46);
            this.btnAutoModeSettings.Name = "btnAutoModeSettings";
            this.btnAutoModeSettings.Size = new System.Drawing.Size(85, 23);
            this.btnAutoModeSettings.TabIndex = 4;
            this.btnAutoModeSettings.Text = "Настроить...";
            this.btnAutoModeSettings.UseVisualStyleBackColor = true;
            this.btnAutoModeSettings.Click += new System.EventHandler(this.btnAutoModeSettings_Click);
            // 
            // chxbxDebugMode
            // 
            this.chxbxDebugMode.AutoSize = true;
            this.chxbxDebugMode.Checked = global::Su.Properties.Settings.Default.IsDebugAutoMode;
            this.chxbxDebugMode.DataBindings.Add(new System.Windows.Forms.Binding("Checked", global::Su.Properties.Settings.Default, "IsDebugAutoMode", true, System.Windows.Forms.DataSourceUpdateMode.OnPropertyChanged));
            this.chxbxDebugMode.Location = new System.Drawing.Point(6, 23);
            this.chxbxDebugMode.Name = "chxbxDebugMode";
            this.chxbxDebugMode.Size = new System.Drawing.Size(180, 17);
            this.chxbxDebugMode.TabIndex = 2;
            this.chxbxDebugMode.Text = "Использовать режим отладки";
            this.chxbxDebugMode.UseVisualStyleBackColor = true;
            // 
            // chxbxAutoMode
            // 
            this.chxbxAutoMode.AutoSize = true;
            this.chxbxAutoMode.Checked = global::Su.Properties.Settings.Default.IsAutoComputingMode;
            this.tableLayoutPanel1.SetColumnSpan(this.chxbxAutoMode, 2);
            this.chxbxAutoMode.DataBindings.Add(new System.Windows.Forms.Binding("Checked", global::Su.Properties.Settings.Default, "IsAutoComputingMode", true, System.Windows.Forms.DataSourceUpdateMode.OnPropertyChanged));
            this.chxbxAutoMode.Dock = System.Windows.Forms.DockStyle.Fill;
            this.chxbxAutoMode.Location = new System.Drawing.Point(3, 3);
            this.chxbxAutoMode.Name = "chxbxAutoMode";
            this.chxbxAutoMode.Padding = new System.Windows.Forms.Padding(5);
            this.chxbxAutoMode.Size = new System.Drawing.Size(486, 29);
            this.chxbxAutoMode.TabIndex = 1;
            this.chxbxAutoMode.Text = "Автоматический режим";
            this.chxbxAutoMode.UseVisualStyleBackColor = true;
            this.chxbxAutoMode.CheckedChanged += new System.EventHandler(this.chxbxAutoMode_CheckedChanged);
            // 
            // grpbxUserMode
            // 
            this.grpbxUserMode.Controls.Add(this.chxbxStepByStepMode);
            this.grpbxUserMode.Controls.Add(this.btnUserModeSettings);
            this.grpbxUserMode.Dock = System.Windows.Forms.DockStyle.Fill;
            this.grpbxUserMode.Location = new System.Drawing.Point(249, 38);
            this.grpbxUserMode.Name = "grpbxUserMode";
            this.grpbxUserMode.Size = new System.Drawing.Size(240, 79);
            this.grpbxUserMode.TabIndex = 4;
            this.grpbxUserMode.TabStop = false;
            this.grpbxUserMode.Text = "Пользовательский режим";
            // 
            // chxbxStepByStepMode
            // 
            this.chxbxStepByStepMode.AutoSize = true;
            this.chxbxStepByStepMode.Checked = global::Su.Properties.Settings.Default.IsStepByStepUserMode;
            this.chxbxStepByStepMode.DataBindings.Add(new System.Windows.Forms.Binding("Checked", global::Su.Properties.Settings.Default, "IsStepByStepUserMode", true, System.Windows.Forms.DataSourceUpdateMode.OnPropertyChanged));
            this.chxbxStepByStepMode.Location = new System.Drawing.Point(6, 23);
            this.chxbxStepByStepMode.Name = "chxbxStepByStepMode";
            this.chxbxStepByStepMode.Size = new System.Drawing.Size(85, 17);
            this.chxbxStepByStepMode.TabIndex = 1;
            this.chxbxStepByStepMode.Text = "Пошаговый";
            this.chxbxStepByStepMode.UseVisualStyleBackColor = true;
            // 
            // btnUserModeSettings
            // 
            this.btnUserModeSettings.Location = new System.Drawing.Point(6, 46);
            this.btnUserModeSettings.Name = "btnUserModeSettings";
            this.btnUserModeSettings.Size = new System.Drawing.Size(85, 23);
            this.btnUserModeSettings.TabIndex = 0;
            this.btnUserModeSettings.Text = "Настроить...";
            this.btnUserModeSettings.UseVisualStyleBackColor = true;
            this.btnUserModeSettings.Click += new System.EventHandler(this.btnUserModeSettings_Click);
            // 
            // chxbxLogParameters
            // 
            this.chxbxLogParameters.AutoSize = true;
            this.chxbxLogParameters.Checked = global::Su.Properties.Settings.Default.IsLogPassingParams;
            this.tableLayoutPanel1.SetColumnSpan(this.chxbxLogParameters, 2);
            this.chxbxLogParameters.DataBindings.Add(new System.Windows.Forms.Binding("Checked", global::Su.Properties.Settings.Default, "IsLogPassingParams", true, System.Windows.Forms.DataSourceUpdateMode.OnPropertyChanged));
            this.chxbxLogParameters.Dock = System.Windows.Forms.DockStyle.Fill;
            this.chxbxLogParameters.Location = new System.Drawing.Point(3, 123);
            this.chxbxLogParameters.Name = "chxbxLogParameters";
            this.chxbxLogParameters.Padding = new System.Windows.Forms.Padding(5);
            this.chxbxLogParameters.Size = new System.Drawing.Size(486, 29);
            this.chxbxLogParameters.TabIndex = 5;
            this.chxbxLogParameters.Text = "Логировать передачу параметров";
            this.chxbxLogParameters.UseVisualStyleBackColor = true;
            this.chxbxLogParameters.CheckedChanged += new System.EventHandler(this.chxbxLogParameters_CheckedChanged);
            // 
            // flowLayoutPanel1
            // 
            this.tableLayoutPanel1.SetColumnSpan(this.flowLayoutPanel1, 2);
            this.flowLayoutPanel1.Controls.Add(this.btnNext);
            this.flowLayoutPanel1.Controls.Add(this.btnStartStop);
            this.flowLayoutPanel1.Dock = System.Windows.Forms.DockStyle.Fill;
            this.flowLayoutPanel1.FlowDirection = System.Windows.Forms.FlowDirection.RightToLeft;
            this.flowLayoutPanel1.Location = new System.Drawing.Point(3, 158);
            this.flowLayoutPanel1.Name = "flowLayoutPanel1";
            this.flowLayoutPanel1.Size = new System.Drawing.Size(486, 34);
            this.flowLayoutPanel1.TabIndex = 2;
            // 
            // btnNext
            // 
            this.btnNext.Enabled = false;
            this.btnNext.Location = new System.Drawing.Point(406, 5);
            this.btnNext.Margin = new System.Windows.Forms.Padding(5);
            this.btnNext.Name = "btnNext";
            this.btnNext.Size = new System.Drawing.Size(75, 23);
            this.btnNext.TabIndex = 0;
            this.btnNext.Text = "Дальше";
            this.btnNext.UseVisualStyleBackColor = true;
            this.btnNext.Click += new System.EventHandler(this.btnNext_Click);
            // 
            // btnStartStop
            // 
            this.btnStartStop.Location = new System.Drawing.Point(321, 5);
            this.btnStartStop.Margin = new System.Windows.Forms.Padding(5);
            this.btnStartStop.Name = "btnStartStop";
            this.btnStartStop.Size = new System.Drawing.Size(75, 23);
            this.btnStartStop.TabIndex = 1;
            this.btnStartStop.Text = "Запуск";
            this.btnStartStop.UseVisualStyleBackColor = true;
            this.btnStartStop.Click += new System.EventHandler(this.btnStartStop_Click);
            // 
            // ComputingProcessorControl
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.Controls.Add(this.groupBox1);
            this.MinimumSize = new System.Drawing.Size(0, 200);
            this.Name = "ComputingProcessorControl";
            this.Size = new System.Drawing.Size(498, 214);
            this.Load += new System.EventHandler(this.ComputingProcessorControl_Load);
            this.groupBox1.ResumeLayout(false);
            this.tableLayoutPanel1.ResumeLayout(false);
            this.tableLayoutPanel1.PerformLayout();
            this.grpbxAutoMode.ResumeLayout(false);
            this.grpbxAutoMode.PerformLayout();
            this.grpbxUserMode.ResumeLayout(false);
            this.grpbxUserMode.PerformLayout();
            this.flowLayoutPanel1.ResumeLayout(false);
            this.ResumeLayout(false);

        }

        #endregion

        private System.Windows.Forms.GroupBox groupBox1;
        private System.Windows.Forms.CheckBox chxbxDebugMode;
        private System.Windows.Forms.CheckBox chxbxAutoMode;
        private System.Windows.Forms.GroupBox grpbxUserMode;
        private System.Windows.Forms.Button btnUserModeSettings;
        private System.Windows.Forms.GroupBox grpbxAutoMode;
        private System.Windows.Forms.Button btnAutoModeSettings;
        private System.Windows.Forms.CheckBox chxbxStepByStepMode;
        private System.Windows.Forms.TableLayoutPanel tableLayoutPanel1;
        private System.Windows.Forms.CheckBox chxbxLogParameters;
        private System.Windows.Forms.FlowLayoutPanel flowLayoutPanel1;
        private System.Windows.Forms.Button btnNext;
        private System.Windows.Forms.Button btnStartStop;
    }
}
