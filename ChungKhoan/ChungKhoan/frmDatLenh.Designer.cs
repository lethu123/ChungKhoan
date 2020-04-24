namespace ChungKhoan
{
    partial class frmDatLenh
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
            this.groupControl1 = new DevExpress.XtraEditors.GroupControl();
            this.btnRefresh = new System.Windows.Forms.Button();
            this.dtpNgayGiaoDich = new System.Windows.Forms.DateTimePicker();
            this.label8 = new System.Windows.Forms.Label();
            this.label7 = new System.Windows.Forms.Label();
            this.btnThoat = new System.Windows.Forms.Button();
            this.btnXacNhan = new System.Windows.Forms.Button();
            this.txtTongTien = new System.Windows.Forms.Label();
            this.label6 = new System.Windows.Forms.Label();
            this.label5 = new System.Windows.Forms.Label();
            this.txtSoluong = new System.Windows.Forms.TextBox();
            this.label4 = new System.Windows.Forms.Label();
            this.cmbLoaiLenh = new System.Windows.Forms.ComboBox();
            this.label3 = new System.Windows.Forms.Label();
            this.txtGia = new System.Windows.Forms.TextBox();
            this.label1 = new System.Windows.Forms.Label();
            this.label2 = new System.Windows.Forms.Label();
            this.cmbMaCP = new System.Windows.Forms.ComboBox();
            this.toggleLoaiGD = new DevExpress.XtraEditors.ToggleSwitch();
            this.label9 = new System.Windows.Forms.Label();
            ((System.ComponentModel.ISupportInitialize)(this.groupControl1)).BeginInit();
            this.groupControl1.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.toggleLoaiGD.Properties)).BeginInit();
            this.SuspendLayout();
            // 
            // groupControl1
            // 
            this.groupControl1.Controls.Add(this.label9);
            this.groupControl1.Controls.Add(this.btnRefresh);
            this.groupControl1.Controls.Add(this.dtpNgayGiaoDich);
            this.groupControl1.Controls.Add(this.label8);
            this.groupControl1.Controls.Add(this.label7);
            this.groupControl1.Controls.Add(this.btnThoat);
            this.groupControl1.Controls.Add(this.btnXacNhan);
            this.groupControl1.Controls.Add(this.txtTongTien);
            this.groupControl1.Controls.Add(this.label6);
            this.groupControl1.Controls.Add(this.label5);
            this.groupControl1.Controls.Add(this.txtSoluong);
            this.groupControl1.Controls.Add(this.label4);
            this.groupControl1.Controls.Add(this.cmbLoaiLenh);
            this.groupControl1.Controls.Add(this.label3);
            this.groupControl1.Controls.Add(this.txtGia);
            this.groupControl1.Controls.Add(this.label1);
            this.groupControl1.Controls.Add(this.label2);
            this.groupControl1.Controls.Add(this.cmbMaCP);
            this.groupControl1.Controls.Add(this.toggleLoaiGD);
            this.groupControl1.Dock = System.Windows.Forms.DockStyle.Fill;
            this.groupControl1.Location = new System.Drawing.Point(0, 0);
            this.groupControl1.Name = "groupControl1";
            this.groupControl1.Size = new System.Drawing.Size(1335, 635);
            this.groupControl1.TabIndex = 0;
            this.groupControl1.Text = "Mua bán";
            this.groupControl1.Paint += new System.Windows.Forms.PaintEventHandler(this.groupControl1_Paint);
            // 
            // btnRefresh
            // 
            this.btnRefresh.Location = new System.Drawing.Point(1230, 40);
            this.btnRefresh.Name = "btnRefresh";
            this.btnRefresh.Size = new System.Drawing.Size(75, 41);
            this.btnRefresh.TabIndex = 17;
            this.btnRefresh.Text = "Refresh";
            this.btnRefresh.UseVisualStyleBackColor = true;
            this.btnRefresh.Click += new System.EventHandler(this.btnRefresh_Click);
            // 
            // dtpNgayGiaoDich
            // 
            this.dtpNgayGiaoDich.Enabled = false;
            this.dtpNgayGiaoDich.Location = new System.Drawing.Point(590, 84);
            this.dtpNgayGiaoDich.Name = "dtpNgayGiaoDich";
            this.dtpNgayGiaoDich.Size = new System.Drawing.Size(261, 23);
            this.dtpNgayGiaoDich.TabIndex = 16;
            // 
            // label8
            // 
            this.label8.AutoSize = true;
            this.label8.Font = new System.Drawing.Font("Tahoma", 10F);
            this.label8.Location = new System.Drawing.Point(437, 84);
            this.label8.Name = "label8";
            this.label8.Size = new System.Drawing.Size(118, 21);
            this.label8.TabIndex = 15;
            this.label8.Text = "Ngày giao dịch";
            // 
            // label7
            // 
            this.label7.AutoSize = true;
            this.label7.ForeColor = System.Drawing.Color.Red;
            this.label7.Location = new System.Drawing.Point(888, 338);
            this.label7.Name = "label7";
            this.label7.Size = new System.Drawing.Size(92, 17);
            this.label7.TabIndex = 14;
            this.label7.Text = "(* Giá x1000)";
            // 
            // btnThoat
            // 
            this.btnThoat.Font = new System.Drawing.Font("Tahoma", 10F);
            this.btnThoat.ForeColor = System.Drawing.Color.Black;
            this.btnThoat.Location = new System.Drawing.Point(749, 529);
            this.btnThoat.Name = "btnThoat";
            this.btnThoat.Size = new System.Drawing.Size(101, 36);
            this.btnThoat.TabIndex = 13;
            this.btnThoat.Text = "THOÁT";
            this.btnThoat.UseVisualStyleBackColor = true;
            this.btnThoat.Click += new System.EventHandler(this.btnThoat_Click);
            // 
            // btnXacNhan
            // 
            this.btnXacNhan.Font = new System.Drawing.Font("Tahoma", 10F);
            this.btnXacNhan.ForeColor = System.Drawing.Color.Black;
            this.btnXacNhan.Location = new System.Drawing.Point(590, 529);
            this.btnXacNhan.Name = "btnXacNhan";
            this.btnXacNhan.Size = new System.Drawing.Size(101, 36);
            this.btnXacNhan.TabIndex = 12;
            this.btnXacNhan.Text = "XÁC NHẬN";
            this.btnXacNhan.UseVisualStyleBackColor = true;
            this.btnXacNhan.Click += new System.EventHandler(this.btnXacNhan_Click);
            // 
            // txtTongTien
            // 
            this.txtTongTien.Font = new System.Drawing.Font("Tahoma", 10F);
            this.txtTongTien.ForeColor = System.Drawing.Color.Red;
            this.txtTongTien.Location = new System.Drawing.Point(587, 466);
            this.txtTongTien.Name = "txtTongTien";
            this.txtTongTien.Size = new System.Drawing.Size(264, 21);
            this.txtTongTien.TabIndex = 11;
            this.txtTongTien.Text = "_ _ _";
            this.txtTongTien.TextAlign = System.Drawing.ContentAlignment.MiddleRight;
            // 
            // label6
            // 
            this.label6.AutoSize = true;
            this.label6.Font = new System.Drawing.Font("Tahoma", 10F);
            this.label6.Location = new System.Drawing.Point(467, 466);
            this.label6.Name = "label6";
            this.label6.Size = new System.Drawing.Size(80, 21);
            this.label6.TabIndex = 10;
            this.label6.Text = "Tổng tiền";
            // 
            // label5
            // 
            this.label5.AutoSize = true;
            this.label5.Font = new System.Drawing.Font("Tahoma", 10F);
            this.label5.Location = new System.Drawing.Point(470, 405);
            this.label5.Name = "label5";
            this.label5.Size = new System.Drawing.Size(74, 21);
            this.label5.TabIndex = 9;
            this.label5.Text = "Số lượng";
            // 
            // txtSoluong
            // 
            this.txtSoluong.Font = new System.Drawing.Font("Tahoma", 10F);
            this.txtSoluong.Location = new System.Drawing.Point(590, 402);
            this.txtSoluong.Name = "txtSoluong";
            this.txtSoluong.Size = new System.Drawing.Size(260, 28);
            this.txtSoluong.TabIndex = 8;
            this.txtSoluong.Text = "0";
            this.txtSoluong.TextAlign = System.Windows.Forms.HorizontalAlignment.Right;
            this.txtSoluong.TextChanged += new System.EventHandler(this.txtSoluong_TextChanged);
            this.txtSoluong.KeyPress += new System.Windows.Forms.KeyPressEventHandler(this.txtSoluong_KeyPress);
            // 
            // label4
            // 
            this.label4.AutoSize = true;
            this.label4.Font = new System.Drawing.Font("Tahoma", 10F);
            this.label4.Location = new System.Drawing.Point(507, 334);
            this.label4.Name = "label4";
            this.label4.Size = new System.Drawing.Size(34, 21);
            this.label4.TabIndex = 7;
            this.label4.Text = "Giá";
            // 
            // cmbLoaiLenh
            // 
            this.cmbLoaiLenh.DropDownStyle = System.Windows.Forms.ComboBoxStyle.DropDownList;
            this.cmbLoaiLenh.Font = new System.Drawing.Font("Tahoma", 10F);
            this.cmbLoaiLenh.FormattingEnabled = true;
            this.cmbLoaiLenh.Items.AddRange(new object[] {
            "LO",
            "ATO",
            "ATC",
            "MP"});
            this.cmbLoaiLenh.Location = new System.Drawing.Point(590, 263);
            this.cmbLoaiLenh.Name = "cmbLoaiLenh";
            this.cmbLoaiLenh.Size = new System.Drawing.Size(260, 29);
            this.cmbLoaiLenh.TabIndex = 6;
            // 
            // label3
            // 
            this.label3.AutoSize = true;
            this.label3.Font = new System.Drawing.Font("Tahoma", 10F);
            this.label3.Location = new System.Drawing.Point(472, 266);
            this.label3.Name = "label3";
            this.label3.Size = new System.Drawing.Size(76, 21);
            this.label3.TabIndex = 5;
            this.label3.Text = "Loại lệnh";
            // 
            // txtGia
            // 
            this.txtGia.Font = new System.Drawing.Font("Tahoma", 10F);
            this.txtGia.Location = new System.Drawing.Point(590, 331);
            this.txtGia.Name = "txtGia";
            this.txtGia.Size = new System.Drawing.Size(260, 28);
            this.txtGia.TabIndex = 2;
            this.txtGia.Text = "0";
            this.txtGia.TextAlign = System.Windows.Forms.HorizontalAlignment.Right;
            this.txtGia.TextChanged += new System.EventHandler(this.txtGia_TextChanged);
            this.txtGia.KeyPress += new System.Windows.Forms.KeyPressEventHandler(this.txtGia_KeyPress);
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Font = new System.Drawing.Font("Tahoma", 10F);
            this.label1.Location = new System.Drawing.Point(443, 139);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(111, 21);
            this.label1.TabIndex = 3;
            this.label1.Text = "Loại giao dịch";
            // 
            // label2
            // 
            this.label2.AutoSize = true;
            this.label2.Font = new System.Drawing.Font("Tahoma", 10F);
            this.label2.Location = new System.Drawing.Point(452, 206);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(99, 21);
            this.label2.TabIndex = 4;
            this.label2.Text = "Mã cổ phiếu";
            // 
            // cmbMaCP
            // 
            this.cmbMaCP.DropDownStyle = System.Windows.Forms.ComboBoxStyle.DropDownList;
            this.cmbMaCP.Font = new System.Drawing.Font("Tahoma", 10F);
            this.cmbMaCP.FormattingEnabled = true;
            this.cmbMaCP.Items.AddRange(new object[] {
            "ACB",
            "BID",
            "TCB",
            "VPB"});
            this.cmbMaCP.Location = new System.Drawing.Point(591, 198);
            this.cmbMaCP.Name = "cmbMaCP";
            this.cmbMaCP.Size = new System.Drawing.Size(260, 29);
            this.cmbMaCP.TabIndex = 1;
            // 
            // toggleLoaiGD
            // 
            this.toggleLoaiGD.Location = new System.Drawing.Point(590, 134);
            this.toggleLoaiGD.Name = "toggleLoaiGD";
            this.toggleLoaiGD.Properties.Appearance.Font = new System.Drawing.Font("Tahoma", 10F);
            this.toggleLoaiGD.Properties.Appearance.Options.UseFont = true;
            this.toggleLoaiGD.Properties.GlyphAlignment = DevExpress.Utils.HorzAlignment.Default;
            this.toggleLoaiGD.Properties.OffText = "MUA";
            this.toggleLoaiGD.Properties.OnText = "BÁN";
            this.toggleLoaiGD.Size = new System.Drawing.Size(260, 31);
            this.toggleLoaiGD.TabIndex = 0;
            // 
            // label9
            // 
            this.label9.AutoSize = true;
            this.label9.Font = new System.Drawing.Font("Tahoma", 10F);
            this.label9.Location = new System.Drawing.Point(887, 466);
            this.label9.Name = "label9";
            this.label9.Size = new System.Drawing.Size(43, 21);
            this.label9.TabIndex = 18;
            this.label9.Text = "VNĐ";
            // 
            // frmDatLenh
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(7F, 16F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(1335, 635);
            this.Controls.Add(this.groupControl1);
            this.Name = "frmDatLenh";
            this.Text = "frmDatLenh";
            this.WindowState = System.Windows.Forms.FormWindowState.Maximized;
            this.Load += new System.EventHandler(this.frmDatLenh_Load);
            ((System.ComponentModel.ISupportInitialize)(this.groupControl1)).EndInit();
            this.groupControl1.ResumeLayout(false);
            this.groupControl1.PerformLayout();
            ((System.ComponentModel.ISupportInitialize)(this.toggleLoaiGD.Properties)).EndInit();
            this.ResumeLayout(false);

        }

        #endregion

        private DevExpress.XtraEditors.GroupControl groupControl1;
        private DevExpress.XtraEditors.ToggleSwitch toggleLoaiGD;
        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.Label label2;
        private System.Windows.Forms.TextBox txtGia;
        private System.Windows.Forms.ComboBox cmbMaCP;
        private System.Windows.Forms.Label label4;
        private System.Windows.Forms.ComboBox cmbLoaiLenh;
        private System.Windows.Forms.Label label3;
        private System.Windows.Forms.Button btnThoat;
        private System.Windows.Forms.Button btnXacNhan;
        private System.Windows.Forms.Label txtTongTien;
        private System.Windows.Forms.Label label6;
        private System.Windows.Forms.Label label5;
        private System.Windows.Forms.TextBox txtSoluong;
        private System.Windows.Forms.Label label7;
        private System.Windows.Forms.Label label8;
        private System.Windows.Forms.DateTimePicker dtpNgayGiaoDich;
        private System.Windows.Forms.Button btnRefresh;
        private System.Windows.Forms.Label label9;
    }
}