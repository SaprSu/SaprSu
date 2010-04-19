namespace Su.Controls
{
    partial class LabeledTextBox
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
            this.tbllayout = new System.Windows.Forms.TableLayoutPanel();
            this.txbxText = new System.Windows.Forms.TextBox();
            this.lblCaption = new System.Windows.Forms.Label();
            this.tbllayout.SuspendLayout();
            this.SuspendLayout();
            // 
            // tbllayout
            // 
            this.tbllayout.ColumnCount = 2;
            this.tbllayout.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Percent, 50F));
            this.tbllayout.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Percent, 50F));
            this.tbllayout.Controls.Add(this.txbxText, 0, 1);
            this.tbllayout.Controls.Add(this.lblCaption, 0, 0);
            this.tbllayout.Dock = System.Windows.Forms.DockStyle.Fill;
            this.tbllayout.Location = new System.Drawing.Point(0, 0);
            this.tbllayout.Name = "tbllayout";
            this.tbllayout.RowCount = 2;
            this.tbllayout.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Absolute, 20F));
            this.tbllayout.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Absolute, 20F));
            this.tbllayout.Size = new System.Drawing.Size(419, 47);
            this.tbllayout.TabIndex = 0;
            // 
            // txbxText
            // 
            this.tbllayout.SetColumnSpan(this.txbxText, 2);
            this.txbxText.Dock = System.Windows.Forms.DockStyle.Fill;
            this.txbxText.Location = new System.Drawing.Point(3, 23);
            this.txbxText.Name = "txbxText";
            this.txbxText.Size = new System.Drawing.Size(413, 20);
            this.txbxText.TabIndex = 1;
            // 
            // lblCaption
            // 
            this.lblCaption.AutoSize = true;
            this.tbllayout.SetColumnSpan(this.lblCaption, 2);
            this.lblCaption.Dock = System.Windows.Forms.DockStyle.Fill;
            this.lblCaption.Location = new System.Drawing.Point(3, 0);
            this.lblCaption.Name = "lblCaption";
            this.lblCaption.Size = new System.Drawing.Size(413, 20);
            this.lblCaption.TabIndex = 0;
            this.lblCaption.Text = "[CAPTION]";
            // 
            // LabeledTextBox
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.Controls.Add(this.tbllayout);
            this.Name = "LabeledTextBox";
            this.Size = new System.Drawing.Size(419, 47);
            this.tbllayout.ResumeLayout(false);
            this.tbllayout.PerformLayout();
            this.ResumeLayout(false);

        }

        #endregion

        private System.Windows.Forms.TableLayoutPanel tbllayout;
        private System.Windows.Forms.Label lblCaption;
        private System.Windows.Forms.TextBox txbxText;
    }
}
