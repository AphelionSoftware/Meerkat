namespace PW.CustomCodeConverter
{
    partial class ProgramForm
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
            this.txtsrcConnectionString = new System.Windows.Forms.TextBox();
            this.label1 = new System.Windows.Forms.Label();
            this.label2 = new System.Windows.Forms.Label();
            this.txtsrcDatabase = new System.Windows.Forms.TextBox();
            this.label3 = new System.Windows.Forms.Label();
            this.txtsrcCube = new System.Windows.Forms.TextBox();
            this.tstConvert = new System.Windows.Forms.Button();
            this.label4 = new System.Windows.Forms.Label();
            this.txtdestCube = new System.Windows.Forms.TextBox();
            this.label5 = new System.Windows.Forms.Label();
            this.txtdestDatabase = new System.Windows.Forms.TextBox();
            this.label6 = new System.Windows.Forms.Label();
            this.txtdestConnectionString = new System.Windows.Forms.TextBox();
            this.label7 = new System.Windows.Forms.Label();
            this.txtFilename = new System.Windows.Forms.TextBox();
            this.btnCreateExcel = new System.Windows.Forms.Button();
            this.label8 = new System.Windows.Forms.Label();
            this.txtTabularSrcCube = new System.Windows.Forms.TextBox();
            this.label9 = new System.Windows.Forms.Label();
            this.txtTabularSrcDB = new System.Windows.Forms.TextBox();
            this.label10 = new System.Windows.Forms.Label();
            this.txtTabularConnection = new System.Windows.Forms.TextBox();
            this.label11 = new System.Windows.Forms.Label();
            this.txtTemplateFileName = new System.Windows.Forms.TextBox();
            this.SuspendLayout();
            // 
            // txtsrcConnectionString
            // 
            this.txtsrcConnectionString.Location = new System.Drawing.Point(145, 12);
            this.txtsrcConnectionString.Name = "txtsrcConnectionString";
            this.txtsrcConnectionString.Size = new System.Drawing.Size(935, 20);
            this.txtsrcConnectionString.TabIndex = 0;
            this.txtsrcConnectionString.Text = "Provider=MSOLAP.4;Integrated Security=SSPI;Persist Security Info=True;Data Source" +
    "=.\\sql2k8r2;Initial Catalog=TimesheetsCube\r\n";
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Location = new System.Drawing.Point(13, 17);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(91, 13);
            this.label1.TabIndex = 1;
            this.label1.Text = "Connection String";
            // 
            // label2
            // 
            this.label2.AutoSize = true;
            this.label2.Location = new System.Drawing.Point(13, 43);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(53, 13);
            this.label2.TabIndex = 3;
            this.label2.Text = "Database";
            // 
            // txtsrcDatabase
            // 
            this.txtsrcDatabase.Location = new System.Drawing.Point(145, 38);
            this.txtsrcDatabase.Name = "txtsrcDatabase";
            this.txtsrcDatabase.Size = new System.Drawing.Size(935, 20);
            this.txtsrcDatabase.TabIndex = 2;
            this.txtsrcDatabase.Text = "MDM_ToConvert";
            // 
            // label3
            // 
            this.label3.AutoSize = true;
            this.label3.Location = new System.Drawing.Point(13, 69);
            this.label3.Name = "label3";
            this.label3.Size = new System.Drawing.Size(32, 13);
            this.label3.TabIndex = 5;
            this.label3.Text = "Cube";
            // 
            // txtsrcCube
            // 
            this.txtsrcCube.Location = new System.Drawing.Point(145, 64);
            this.txtsrcCube.Name = "txtsrcCube";
            this.txtsrcCube.Size = new System.Drawing.Size(935, 20);
            this.txtsrcCube.TabIndex = 4;
            this.txtsrcCube.Text = "Timesheets";
            // 
            // tstConvert
            // 
            this.tstConvert.Location = new System.Drawing.Point(917, 189);
            this.tstConvert.Name = "tstConvert";
            this.tstConvert.Size = new System.Drawing.Size(163, 23);
            this.tstConvert.TabIndex = 6;
            this.tstConvert.Text = "Convert MDM to Tabular";
            this.tstConvert.UseVisualStyleBackColor = true;
            this.tstConvert.Click += new System.EventHandler(this.tstConvert_Click);
            // 
            // label4
            // 
            this.label4.AutoSize = true;
            this.label4.Location = new System.Drawing.Point(13, 168);
            this.label4.Name = "label4";
            this.label4.Size = new System.Drawing.Size(67, 13);
            this.label4.TabIndex = 12;
            this.label4.Text = "Output Cube";
            // 
            // txtdestCube
            // 
            this.txtdestCube.Enabled = false;
            this.txtdestCube.Location = new System.Drawing.Point(145, 163);
            this.txtdestCube.Name = "txtdestCube";
            this.txtdestCube.Size = new System.Drawing.Size(935, 20);
            this.txtdestCube.TabIndex = 11;
            this.txtdestCube.Text = "Model";
            // 
            // label5
            // 
            this.label5.AutoSize = true;
            this.label5.Location = new System.Drawing.Point(13, 142);
            this.label5.Name = "label5";
            this.label5.Size = new System.Drawing.Size(88, 13);
            this.label5.TabIndex = 10;
            this.label5.Text = "Output Database";
            // 
            // txtdestDatabase
            // 
            this.txtdestDatabase.Location = new System.Drawing.Point(145, 137);
            this.txtdestDatabase.Name = "txtdestDatabase";
            this.txtdestDatabase.Size = new System.Drawing.Size(935, 20);
            this.txtdestDatabase.TabIndex = 9;
            this.txtdestDatabase.Text = "ConvertTest";
            // 
            // label6
            // 
            this.label6.AutoSize = true;
            this.label6.Location = new System.Drawing.Point(13, 116);
            this.label6.Name = "label6";
            this.label6.Size = new System.Drawing.Size(126, 13);
            this.label6.TabIndex = 8;
            this.label6.Text = "Output Connection String";
            // 
            // txtdestConnectionString
            // 
            this.txtdestConnectionString.Location = new System.Drawing.Point(145, 111);
            this.txtdestConnectionString.Name = "txtdestConnectionString";
            this.txtdestConnectionString.Size = new System.Drawing.Size(935, 20);
            this.txtdestConnectionString.TabIndex = 7;
            this.txtdestConnectionString.Text = "Provider=MSOLAP.4;Integrated Security=SSPI;Persist Security Info=True;Data Source" +
    "=.\\sql2012Tabular;Initial Catalog=TimesheetsCube\r\n";
            // 
            // label7
            // 
            this.label7.AutoSize = true;
            this.label7.Location = new System.Drawing.Point(13, 352);
            this.label7.Name = "label7";
            this.label7.Size = new System.Drawing.Size(118, 13);
            this.label7.TabIndex = 14;
            this.label7.Text = "Output Excel File Name";
            // 
            // txtFilename
            // 
            this.txtFilename.Location = new System.Drawing.Point(145, 347);
            this.txtFilename.Name = "txtFilename";
            this.txtFilename.Size = new System.Drawing.Size(935, 20);
            this.txtFilename.TabIndex = 13;
            this.txtFilename.Text = "D:\\Dropbox\\Clients\\XMLA_TabularConverter\\TestXXX.xlsx ";
            // 
            // btnCreateExcel
            // 
            this.btnCreateExcel.Location = new System.Drawing.Point(917, 373);
            this.btnCreateExcel.Name = "btnCreateExcel";
            this.btnCreateExcel.Size = new System.Drawing.Size(163, 23);
            this.btnCreateExcel.TabIndex = 15;
            this.btnCreateExcel.Text = "Create Excel From Tabular";
            this.btnCreateExcel.UseVisualStyleBackColor = true;
            this.btnCreateExcel.Click += new System.EventHandler(this.btnCreateExcel_Click);
            // 
            // label8
            // 
            this.label8.AutoSize = true;
            this.label8.Location = new System.Drawing.Point(13, 275);
            this.label8.Name = "label8";
            this.label8.Size = new System.Drawing.Size(32, 13);
            this.label8.TabIndex = 21;
            this.label8.Text = "Cube";
            // 
            // txtTabularSrcCube
            // 
            this.txtTabularSrcCube.Location = new System.Drawing.Point(145, 270);
            this.txtTabularSrcCube.Name = "txtTabularSrcCube";
            this.txtTabularSrcCube.Size = new System.Drawing.Size(935, 20);
            this.txtTabularSrcCube.TabIndex = 20;
            this.txtTabularSrcCube.Text = "Model";
            // 
            // label9
            // 
            this.label9.AutoSize = true;
            this.label9.Location = new System.Drawing.Point(13, 249);
            this.label9.Name = "label9";
            this.label9.Size = new System.Drawing.Size(53, 13);
            this.label9.TabIndex = 19;
            this.label9.Text = "Database";
            // 
            // txtTabularSrcDB
            // 
            this.txtTabularSrcDB.Location = new System.Drawing.Point(145, 244);
            this.txtTabularSrcDB.Name = "txtTabularSrcDB";
            this.txtTabularSrcDB.Size = new System.Drawing.Size(935, 20);
            this.txtTabularSrcDB.TabIndex = 18;
            this.txtTabularSrcDB.Text = "PWZero1RCS";
            // 
            // label10
            // 
            this.label10.AutoSize = true;
            this.label10.Location = new System.Drawing.Point(13, 223);
            this.label10.Name = "label10";
            this.label10.Size = new System.Drawing.Size(91, 13);
            this.label10.TabIndex = 17;
            this.label10.Text = "Connection String";
            // 
            // txtTabularConnection
            // 
            this.txtTabularConnection.Location = new System.Drawing.Point(145, 218);
            this.txtTabularConnection.Name = "txtTabularConnection";
            this.txtTabularConnection.Size = new System.Drawing.Size(935, 20);
            this.txtTabularConnection.TabIndex = 16;
            this.txtTabularConnection.Text = "Provider=MSOLAP.4;Integrated Security=SSPI;Persist Security Info=True;Data Source" +
    "=.\\sql2012Tabular;Initial Catalog=PWZero1RCS";
            // 
            // label11
            // 
            this.label11.AutoSize = true;
            this.label11.Location = new System.Drawing.Point(13, 326);
            this.label11.Name = "label11";
            this.label11.Size = new System.Drawing.Size(99, 13);
            this.label11.TabIndex = 23;
            this.label11.Text = "Template Excel File";
            // 
            // txtTemplateFileName
            // 
            this.txtTemplateFileName.Location = new System.Drawing.Point(145, 321);
            this.txtTemplateFileName.Name = "txtTemplateFileName";
            this.txtTemplateFileName.Size = new System.Drawing.Size(935, 20);
            this.txtTemplateFileName.TabIndex = 22;
            this.txtTemplateFileName.Text = "D:\\Dropbox\\Clients\\XMLA_TabularConverter\\ExcelCode\\PW.PowerPivotTemplate.xlsx";
            // 
            // ProgramForm
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(1111, 499);
            this.Controls.Add(this.label11);
            this.Controls.Add(this.txtTemplateFileName);
            this.Controls.Add(this.label8);
            this.Controls.Add(this.txtTabularSrcCube);
            this.Controls.Add(this.label9);
            this.Controls.Add(this.txtTabularSrcDB);
            this.Controls.Add(this.label10);
            this.Controls.Add(this.txtTabularConnection);
            this.Controls.Add(this.btnCreateExcel);
            this.Controls.Add(this.label7);
            this.Controls.Add(this.txtFilename);
            this.Controls.Add(this.label4);
            this.Controls.Add(this.txtdestCube);
            this.Controls.Add(this.label5);
            this.Controls.Add(this.txtdestDatabase);
            this.Controls.Add(this.label6);
            this.Controls.Add(this.txtdestConnectionString);
            this.Controls.Add(this.tstConvert);
            this.Controls.Add(this.label3);
            this.Controls.Add(this.txtsrcCube);
            this.Controls.Add(this.label2);
            this.Controls.Add(this.txtsrcDatabase);
            this.Controls.Add(this.label1);
            this.Controls.Add(this.txtsrcConnectionString);
            this.Name = "ProgramForm";
            this.Text = "ConverterTest";
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.TextBox txtsrcConnectionString;
        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.Label label2;
        private System.Windows.Forms.TextBox txtsrcDatabase;
        private System.Windows.Forms.Label label3;
        private System.Windows.Forms.TextBox txtsrcCube;
        private System.Windows.Forms.Button tstConvert;
        private System.Windows.Forms.Label label4;
        private System.Windows.Forms.TextBox txtdestCube;
        private System.Windows.Forms.Label label5;
        private System.Windows.Forms.TextBox txtdestDatabase;
        private System.Windows.Forms.Label label6;
        private System.Windows.Forms.TextBox txtdestConnectionString;
        private System.Windows.Forms.Label label7;
        private System.Windows.Forms.TextBox txtFilename;
        private System.Windows.Forms.Button btnCreateExcel;
        private System.Windows.Forms.Label label8;
        private System.Windows.Forms.TextBox txtTabularSrcCube;
        private System.Windows.Forms.Label label9;
        private System.Windows.Forms.TextBox txtTabularSrcDB;
        private System.Windows.Forms.Label label10;
        private System.Windows.Forms.TextBox txtTabularConnection;
        private System.Windows.Forms.Label label11;
        private System.Windows.Forms.TextBox txtTemplateFileName;
    }
}

