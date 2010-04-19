namespace Su.Views
{
    partial class PluginsView
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
            this.tabctrlPlugins = new System.Windows.Forms.TabControl();
            this.tabPage1 = new System.Windows.Forms.TabPage();
            this.parametersView1 = new Su.ParametersView();
            this.tabPage2 = new System.Windows.Forms.TabPage();
            this.parametersView2 = new Su.ParametersView();
            this.tabctrlPlugins.SuspendLayout();
            this.tabPage1.SuspendLayout();
            this.tabPage2.SuspendLayout();
            this.SuspendLayout();
            // 
            // tabctrlPlugins
            // 
            this.tabctrlPlugins.Controls.Add(this.tabPage1);
            this.tabctrlPlugins.Controls.Add(this.tabPage2);
            this.tabctrlPlugins.Dock = System.Windows.Forms.DockStyle.Fill;
            this.tabctrlPlugins.Location = new System.Drawing.Point(0, 0);
            this.tabctrlPlugins.Name = "tabctrlPlugins";
            this.tabctrlPlugins.SelectedIndex = 0;
            this.tabctrlPlugins.Size = new System.Drawing.Size(288, 285);
            this.tabctrlPlugins.TabIndex = 0;
            // 
            // tabPage1
            // 
            this.tabPage1.Controls.Add(this.parametersView1);
            this.tabPage1.Location = new System.Drawing.Point(4, 22);
            this.tabPage1.Name = "tabPage1";
            this.tabPage1.Padding = new System.Windows.Forms.Padding(3);
            this.tabPage1.Size = new System.Drawing.Size(280, 259);
            this.tabPage1.TabIndex = 0;
            this.tabPage1.Text = "tabPage1";
            this.tabPage1.UseVisualStyleBackColor = true;
            // 
            // parametersView1
            // 
            this.parametersView1.Dock = System.Windows.Forms.DockStyle.Fill;
            this.parametersView1.Location = new System.Drawing.Point(3, 3);
            this.parametersView1.Name = "parametersView1";
            this.parametersView1.Params = null;
            this.parametersView1.Size = new System.Drawing.Size(274, 253);
            this.parametersView1.TabIndex = 1;
            // 
            // tabPage2
            // 
            this.tabPage2.Controls.Add(this.parametersView2);
            this.tabPage2.Location = new System.Drawing.Point(4, 22);
            this.tabPage2.Name = "tabPage2";
            this.tabPage2.Padding = new System.Windows.Forms.Padding(3);
            this.tabPage2.Size = new System.Drawing.Size(280, 259);
            this.tabPage2.TabIndex = 1;
            this.tabPage2.Text = "tabPage2";
            this.tabPage2.UseVisualStyleBackColor = true;
            // 
            // parametersView2
            // 
            this.parametersView2.Dock = System.Windows.Forms.DockStyle.Fill;
            this.parametersView2.Location = new System.Drawing.Point(3, 3);
            this.parametersView2.Name = "parametersView2";
            this.parametersView2.Params = null;
            this.parametersView2.Size = new System.Drawing.Size(274, 253);
            this.parametersView2.TabIndex = 0;
            // 
            // PluginsView
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.Controls.Add(this.tabctrlPlugins);
            this.Name = "PluginsView";
            this.Size = new System.Drawing.Size(288, 285);
            this.tabctrlPlugins.ResumeLayout(false);
            this.tabPage1.ResumeLayout(false);
            this.tabPage2.ResumeLayout(false);
            this.ResumeLayout(false);

        }

        #endregion

        private System.Windows.Forms.TabControl tabctrlPlugins;
        private System.Windows.Forms.TabPage tabPage1;
        private System.Windows.Forms.TabPage tabPage2;
        private ParametersView parametersView1;
        private ParametersView parametersView2;
    }
}
