namespace GEOJSONForm
{
    partial class GeoJSONTests
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
            this.txtConn = new System.Windows.Forms.TextBox();
            this.label1 = new System.Windows.Forms.Label();
            this.btnRun = new System.Windows.Forms.Button();
            this.label2 = new System.Windows.Forms.Label();
            this.textBox1 = new System.Windows.Forms.TextBox();
            this.txtJSON = new System.Windows.Forms.TextBox();
            this.textBox2 = new System.Windows.Forms.TextBox();
            this.txtSQL = new System.Windows.Forms.TextBox();
            this.SuspendLayout();
            // 
            // txtConn
            // 
            this.txtConn.Location = new System.Drawing.Point(118, 12);
            this.txtConn.Name = "txtConn";
            this.txtConn.Size = new System.Drawing.Size(862, 22);
            this.txtConn.TabIndex = 0;
            this.txtConn.Text = "Data Source=.\\sql2012;Initial Catalog=Meerkat;Integrated Security=True";
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Location = new System.Drawing.Point(12, 17);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(79, 17);
            this.label1.TabIndex = 1;
            this.label1.Text = "Connection";
            // 
            // btnRun
            // 
            this.btnRun.BackColor = System.Drawing.Color.LightSeaGreen;
            this.btnRun.FlatAppearance.BorderSize = 0;
            this.btnRun.FlatStyle = System.Windows.Forms.FlatStyle.Flat;
            this.btnRun.Location = new System.Drawing.Point(1249, 68);
            this.btnRun.Name = "btnRun";
            this.btnRun.Size = new System.Drawing.Size(75, 35);
            this.btnRun.TabIndex = 2;
            this.btnRun.Text = "Run";
            this.btnRun.UseVisualStyleBackColor = false;
            this.btnRun.Click += new System.EventHandler(this.btnRun_Click);
            // 
            // label2
            // 
            this.label2.AutoSize = true;
            this.label2.Location = new System.Drawing.Point(12, 45);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(36, 17);
            this.label2.TabIndex = 4;
            this.label2.Text = "SQL";
            // 
            // textBox1
            // 
            this.textBox1.Location = new System.Drawing.Point(118, 40);
            this.textBox1.Name = "textBox1";
            this.textBox1.Size = new System.Drawing.Size(862, 22);
            this.textBox1.TabIndex = 3;
            this.textBox1.Text = "select geog from maps.ProjectReachAreas";
            // 
            // txtJSON
            // 
            this.txtJSON.Location = new System.Drawing.Point(15, 118);
            this.txtJSON.Multiline = true;
            this.txtJSON.Name = "txtJSON";
            this.txtJSON.Size = new System.Drawing.Size(1309, 380);
            this.txtJSON.TabIndex = 5;
            // 
            // textBox2
            // 
            this.textBox2.Location = new System.Drawing.Point(118, 12);
            this.textBox2.Name = "textBox2";
            this.textBox2.Size = new System.Drawing.Size(1206, 22);
            this.textBox2.TabIndex = 0;
            this.textBox2.Text = "Data Source=.\\sql2012;Initial Catalog=Meerkat;Integrated Security=True";
            // 
            // txtSQL
            // 
            this.txtSQL.Location = new System.Drawing.Point(118, 40);
            this.txtSQL.Name = "txtSQL";
            this.txtSQL.Size = new System.Drawing.Size(1206, 22);
            this.txtSQL.TabIndex = 3;
            this.txtSQL.Text = "select geog from maps.ProjectReachAreas";
            // 
            // GeoJSONTests
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(8F, 16F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(1336, 510);
            this.Controls.Add(this.txtJSON);
            this.Controls.Add(this.label2);
            this.Controls.Add(this.txtSQL);
            this.Controls.Add(this.textBox1);
            this.Controls.Add(this.btnRun);
            this.Controls.Add(this.label1);
            this.Controls.Add(this.textBox2);
            this.Controls.Add(this.txtConn);
            this.Name = "GeoJSONTests";
            this.Text = "Form1";
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.TextBox txtConn;
        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.Button btnRun;
        private System.Windows.Forms.Label label2;
        private System.Windows.Forms.TextBox textBox1;
        private System.Windows.Forms.TextBox txtJSON;
        private System.Windows.Forms.TextBox textBox2;
        private System.Windows.Forms.TextBox txtSQL;
    }
}

