namespace Su
{
    partial class SettingsForm
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
            this.btnCancel = new System.Windows.Forms.Button();
            this.btnSave = new System.Windows.Forms.Button();
            this.folderBrowserDialog1 = new System.Windows.Forms.FolderBrowserDialog();
            this.connectionSettingsTabPage = new System.Windows.Forms.TabPage();
            this.lblServer = new System.Windows.Forms.Label();
            this.txbxServer = new System.Windows.Forms.TextBox();
            this.lblDBName = new System.Windows.Forms.Label();
            this.txbxDatabase = new System.Windows.Forms.TextBox();
            this.btnTestConnection = new System.Windows.Forms.Button();
            this.tabControl1 = new System.Windows.Forms.TabControl();
            this.connectionSettingsTabPage.SuspendLayout();
            this.tabControl1.SuspendLayout();
            this.SuspendLayout();
            // 
            // btnCancel
            // 
            this.btnCancel.Location = new System.Drawing.Point(429, 295);
            this.btnCancel.Name = "btnCancel";
            this.btnCancel.Size = new System.Drawing.Size(75, 23);
            this.btnCancel.TabIndex = 0;
            this.btnCancel.Text = "Отмена";
            this.btnCancel.UseVisualStyleBackColor = true;
            this.btnCancel.Click += new System.EventHandler(this.btnCancel_Click);
            // 
            // btnSave
            // 
            this.btnSave.Location = new System.Drawing.Point(348, 295);
            this.btnSave.Name = "btnSave";
            this.btnSave.Size = new System.Drawing.Size(75, 23);
            this.btnSave.TabIndex = 1;
            this.btnSave.Text = "Сохранить";
            this.btnSave.UseVisualStyleBackColor = true;
            this.btnSave.Click += new System.EventHandler(this.btnSave_Click);
            // 
            // connectionSettingsTabPage
            // 
            this.connectionSettingsTabPage.Controls.Add(this.btnTestConnection);
            this.connectionSettingsTabPage.Controls.Add(this.txbxDatabase);
            this.connectionSettingsTabPage.Controls.Add(this.txbxServer);
            this.connectionSettingsTabPage.Controls.Add(this.lblDBName);
            this.connectionSettingsTabPage.Controls.Add(this.lblServer);
            this.connectionSettingsTabPage.Location = new System.Drawing.Point(4, 22);
            this.connectionSettingsTabPage.Name = "connectionSettingsTabPage";
            this.connectionSettingsTabPage.Padding = new System.Windows.Forms.Padding(3);
            this.connectionSettingsTabPage.Size = new System.Drawing.Size(488, 240);
            this.connectionSettingsTabPage.TabIndex = 0;
            this.connectionSettingsTabPage.Text = "Подключение к БД";
            this.connectionSettingsTabPage.UseVisualStyleBackColor = true;
            // 
            // lblServer
            // 
            this.lblServer.AutoSize = true;
            this.lblServer.Location = new System.Drawing.Point(15, 15);
            this.lblServer.Name = "lblServer";
            this.lblServer.Size = new System.Drawing.Size(44, 13);
            this.lblServer.TabIndex = 0;
            this.lblServer.Text = "Сервер";
            // 
            // txbxServer
            // 
            this.txbxServer.Location = new System.Drawing.Point(95, 12);
            this.txbxServer.Name = "txbxServer";
            this.txbxServer.Size = new System.Drawing.Size(376, 20);
            this.txbxServer.TabIndex = 1;
            // 
            // lblDBName
            // 
            this.lblDBName.AutoSize = true;
            this.lblDBName.Location = new System.Drawing.Point(15, 41);
            this.lblDBName.Name = "lblDBName";
            this.lblDBName.Size = new System.Drawing.Size(48, 13);
            this.lblDBName.TabIndex = 2;
            this.lblDBName.Text = "Имя БД";
            // 
            // txbxDatabase
            // 
            this.txbxDatabase.Location = new System.Drawing.Point(95, 38);
            this.txbxDatabase.Name = "txbxDatabase";
            this.txbxDatabase.Size = new System.Drawing.Size(376, 20);
            this.txbxDatabase.TabIndex = 3;
            // 
            // btnTestConnection
            // 
            this.btnTestConnection.Location = new System.Drawing.Point(18, 77);
            this.btnTestConnection.Name = "btnTestConnection";
            this.btnTestConnection.Size = new System.Drawing.Size(142, 23);
            this.btnTestConnection.TabIndex = 4;
            this.btnTestConnection.Text = "Проверка соединения";
            this.btnTestConnection.UseVisualStyleBackColor = true;
            this.btnTestConnection.Click += new System.EventHandler(this.btnTestConnection_Click);
            // 
            // tabControl1
            // 
            this.tabControl1.Controls.Add(this.connectionSettingsTabPage);
            this.tabControl1.Location = new System.Drawing.Point(12, 12);
            this.tabControl1.Name = "tabControl1";
            this.tabControl1.SelectedIndex = 0;
            this.tabControl1.Size = new System.Drawing.Size(496, 266);
            this.tabControl1.TabIndex = 2;
            // 
            // SettingsForm
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(522, 332);
            this.Controls.Add(this.tabControl1);
            this.Controls.Add(this.btnSave);
            this.Controls.Add(this.btnCancel);
            this.FormBorderStyle = System.Windows.Forms.FormBorderStyle.FixedSingle;
            this.MaximizeBox = false;
            this.MinimizeBox = false;
            this.Name = "SettingsForm";
            this.StartPosition = System.Windows.Forms.FormStartPosition.CenterScreen;
            this.Text = "Настройки";
            this.Load += new System.EventHandler(this.SettingsForm_Load);
            this.connectionSettingsTabPage.ResumeLayout(false);
            this.connectionSettingsTabPage.PerformLayout();
            this.tabControl1.ResumeLayout(false);
            this.ResumeLayout(false);

        }

        #endregion

        private System.Windows.Forms.Button btnCancel;
        private System.Windows.Forms.Button btnSave;
        private System.Windows.Forms.FolderBrowserDialog folderBrowserDialog1;
        private System.Windows.Forms.TabPage connectionSettingsTabPage;
        private System.Windows.Forms.Button btnTestConnection;
        private System.Windows.Forms.TextBox txbxDatabase;
        private System.Windows.Forms.TextBox txbxServer;
        private System.Windows.Forms.Label lblDBName;
        private System.Windows.Forms.Label lblServer;
        private System.Windows.Forms.TabControl tabControl1;
    }
}