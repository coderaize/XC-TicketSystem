namespace TicketMailer
{
    partial class Home
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
            this.profileTxt = new System.Windows.Forms.TextBox();
            this.label1 = new System.Windows.Forms.Label();
            this.StartButton = new System.Windows.Forms.Button();
            this.checkBox1 = new System.Windows.Forms.CheckBox();
            this.logPathTxt = new System.Windows.Forms.TextBox();
            this.label2 = new System.Windows.Forms.Label();
            this.statusTxt = new System.Windows.Forms.Label();
            this.stopBtn = new System.Windows.Forms.Button();
            this.logTxt = new System.Windows.Forms.RichTextBox();
            this.label3 = new System.Windows.Forms.Label();
            this.attachmentPathTxt = new System.Windows.Forms.TextBox();
            this.SuspendLayout();
            // 
            // profileTxt
            // 
            this.profileTxt.Location = new System.Drawing.Point(12, 34);
            this.profileTxt.Name = "profileTxt";
            this.profileTxt.Size = new System.Drawing.Size(552, 20);
            this.profileTxt.TabIndex = 0;
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Location = new System.Drawing.Point(9, 18);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(76, 13);
            this.label1.TabIndex = 1;
            this.label1.Text = "Outlook Profile";
            // 
            // StartButton
            // 
            this.StartButton.Location = new System.Drawing.Point(12, 163);
            this.StartButton.Name = "StartButton";
            this.StartButton.Size = new System.Drawing.Size(106, 49);
            this.StartButton.TabIndex = 2;
            this.StartButton.Text = "Start";
            this.StartButton.UseVisualStyleBackColor = true;
            this.StartButton.Click += new System.EventHandler(this.StartButton_Click);
            // 
            // checkBox1
            // 
            this.checkBox1.AutoSize = true;
            this.checkBox1.Location = new System.Drawing.Point(12, 101);
            this.checkBox1.Name = "checkBox1";
            this.checkBox1.Size = new System.Drawing.Size(90, 17);
            this.checkBox1.TabIndex = 3;
            this.checkBox1.Text = "Do Text Logs";
            this.checkBox1.UseVisualStyleBackColor = true;
            // 
            // logPathTxt
            // 
            this.logPathTxt.Location = new System.Drawing.Point(12, 137);
            this.logPathTxt.Name = "logPathTxt";
            this.logPathTxt.Size = new System.Drawing.Size(552, 20);
            this.logPathTxt.TabIndex = 4;
            // 
            // label2
            // 
            this.label2.AutoSize = true;
            this.label2.Location = new System.Drawing.Point(9, 121);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(79, 13);
            this.label2.TabIndex = 5;
            this.label2.Text = "Text Logs Path";
            // 
            // statusTxt
            // 
            this.statusTxt.Location = new System.Drawing.Point(120, 181);
            this.statusTxt.Name = "statusTxt";
            this.statusTxt.Size = new System.Drawing.Size(332, 23);
            this.statusTxt.TabIndex = 6;
            // 
            // stopBtn
            // 
            this.stopBtn.Location = new System.Drawing.Point(458, 163);
            this.stopBtn.Name = "stopBtn";
            this.stopBtn.Size = new System.Drawing.Size(106, 49);
            this.stopBtn.TabIndex = 7;
            this.stopBtn.Text = "Stop";
            this.stopBtn.UseVisualStyleBackColor = true;
            this.stopBtn.Click += new System.EventHandler(this.stopBtn_Click);
            // 
            // logTxt
            // 
            this.logTxt.Location = new System.Drawing.Point(14, 218);
            this.logTxt.Name = "logTxt";
            this.logTxt.Size = new System.Drawing.Size(549, 165);
            this.logTxt.TabIndex = 8;
            this.logTxt.Text = "";
            // 
            // label3
            // 
            this.label3.AutoSize = true;
            this.label3.Location = new System.Drawing.Point(13, 59);
            this.label3.Name = "label3";
            this.label3.Size = new System.Drawing.Size(86, 13);
            this.label3.TabIndex = 10;
            this.label3.Text = "Attachment Path";
            // 
            // attachmentPathTxt
            // 
            this.attachmentPathTxt.Location = new System.Drawing.Point(11, 75);
            this.attachmentPathTxt.Name = "attachmentPathTxt";
            this.attachmentPathTxt.Size = new System.Drawing.Size(552, 20);
            this.attachmentPathTxt.TabIndex = 9;
            // 
            // Home
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(580, 397);
            this.Controls.Add(this.label3);
            this.Controls.Add(this.attachmentPathTxt);
            this.Controls.Add(this.logTxt);
            this.Controls.Add(this.stopBtn);
            this.Controls.Add(this.statusTxt);
            this.Controls.Add(this.label2);
            this.Controls.Add(this.logPathTxt);
            this.Controls.Add(this.checkBox1);
            this.Controls.Add(this.StartButton);
            this.Controls.Add(this.label1);
            this.Controls.Add(this.profileTxt);
            this.FormBorderStyle = System.Windows.Forms.FormBorderStyle.Fixed3D;
            this.MaximumSize = new System.Drawing.Size(600, 440);
            this.MinimumSize = new System.Drawing.Size(600, 440);
            this.Name = "Home";
            this.Text = "Home";
            this.Load += new System.EventHandler(this.Home_Load);
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.TextBox profileTxt;
        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.Button StartButton;
        private System.Windows.Forms.CheckBox checkBox1;
        private System.Windows.Forms.TextBox logPathTxt;
        private System.Windows.Forms.Label label2;
        private System.Windows.Forms.Label statusTxt;
        private System.Windows.Forms.Button stopBtn;
        private System.Windows.Forms.RichTextBox logTxt;
        private System.Windows.Forms.Label label3;
        private System.Windows.Forms.TextBox attachmentPathTxt;
    }
}