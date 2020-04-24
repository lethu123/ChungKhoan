namespace ChungKhoan
{
    partial class frmBangGia
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
            this.dataGridView1 = new System.Windows.Forms.DataGridView();
            this.cHUNGKHOANDataSet = new ChungKhoan.CHUNGKHOANDataSet();
            this.gIATRUCTUYENBindingSource = new System.Windows.Forms.BindingSource(this.components);
            this.gIATRUCTUYENTableAdapter = new ChungKhoan.CHUNGKHOANDataSetTableAdapters.GIATRUCTUYENTableAdapter();
            this.btnThoat = new System.Windows.Forms.Button();
            ((System.ComponentModel.ISupportInitialize)(this.dataGridView1)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.cHUNGKHOANDataSet)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.gIATRUCTUYENBindingSource)).BeginInit();
            this.SuspendLayout();
            // 
            // dataGridView1
            // 
            this.dataGridView1.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.dataGridView1.Location = new System.Drawing.Point(0, 169);
            this.dataGridView1.Name = "dataGridView1";
            this.dataGridView1.RowTemplate.Height = 24;
            this.dataGridView1.Size = new System.Drawing.Size(1519, 154);
            this.dataGridView1.TabIndex = 0;
            // 
            // cHUNGKHOANDataSet
            // 
            this.cHUNGKHOANDataSet.DataSetName = "CHUNGKHOANDataSet";
            this.cHUNGKHOANDataSet.SchemaSerializationMode = System.Data.SchemaSerializationMode.IncludeSchema;
            // 
            // gIATRUCTUYENBindingSource
            // 
            this.gIATRUCTUYENBindingSource.DataMember = "GIATRUCTUYEN";
            this.gIATRUCTUYENBindingSource.DataSource = this.cHUNGKHOANDataSet;
            // 
            // gIATRUCTUYENTableAdapter
            // 
            this.gIATRUCTUYENTableAdapter.ClearBeforeFill = true;
            // 
            // btnThoat
            // 
            this.btnThoat.Location = new System.Drawing.Point(63, 68);
            this.btnThoat.Name = "btnThoat";
            this.btnThoat.Size = new System.Drawing.Size(111, 35);
            this.btnThoat.TabIndex = 1;
            this.btnThoat.Text = "Thoát";
            this.btnThoat.UseVisualStyleBackColor = true;
            this.btnThoat.Click += new System.EventHandler(this.btnThoat_Click);
            // 
            // frmBangGia
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(7F, 16F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(1522, 335);
            this.Controls.Add(this.btnThoat);
            this.Controls.Add(this.dataGridView1);
            this.Name = "frmBangGia";
            this.Text = "frmBangGia";
            this.Load += new System.EventHandler(this.frmBangGia_Load);
            ((System.ComponentModel.ISupportInitialize)(this.dataGridView1)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.cHUNGKHOANDataSet)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.gIATRUCTUYENBindingSource)).EndInit();
            this.ResumeLayout(false);

        }

        #endregion

        private System.Windows.Forms.DataGridView dataGridView1;
        private CHUNGKHOANDataSet cHUNGKHOANDataSet;
        private System.Windows.Forms.BindingSource gIATRUCTUYENBindingSource;
        private CHUNGKHOANDataSetTableAdapters.GIATRUCTUYENTableAdapter gIATRUCTUYENTableAdapter;
        private System.Windows.Forms.Button btnThoat;
    }
}