using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Text;
using System.Linq;
using System.Threading.Tasks;
using System.Windows.Forms;
using DevExpress.XtraEditors;
using System.Data.SqlClient;

namespace ChungKhoan
{
    public partial class frmDatLenh : DevExpress.XtraEditors.XtraForm
    {
        private float tongtien = 0;
        public frmDatLenh()
        {
            InitializeComponent();
            cmbLoaiLenh.SelectedIndex = 0;
            cmbMaCP.SelectedIndex = 0;
            txtTongTien.Text = string.Format("{0:#,##0}", tongtien);
        }

        public static string GetConnectionString()
        {
            return Program.connstr = "Data Source=" + Program.servername + ";Initial Catalog=" +
                                Program.database + ";User ID=" +
                                Program.mlogin + ";password=" + Program.password;
        }

        

        private void btnThoat_Click(object sender, EventArgs e)
        {
            if (MessageBox.Show("Bạn thật sự muốn thoát khỏi đặt lệnh?", "", MessageBoxButtons.OKCancel) == DialogResult.OK)
            {
                this.Close();
            }
        }

        private void btnXacNhan_Click(object sender, EventArgs e)
        {
            if (KiemTraTruocKhiXacNhan())
            {
                char loaiGD = 'M';
                if (toggleLoaiGD.IsOn)
                {
                    loaiGD = 'B';
                }
                SqlConnection con = new SqlConnection(GetConnectionString());
                SqlCommand sqlCommand = new SqlCommand();
                SqlParameter input = new SqlParameter();
                SqlParameter returnValue = new SqlParameter();

                returnValue.ParameterName = "@returnValue";
                returnValue.SqlDbType = SqlDbType.Int;
                returnValue.Direction = ParameterDirection.ReturnValue;

                sqlCommand.Connection = con;
                con.Open();
                sqlCommand.CommandType = CommandType.StoredProcedure;
                sqlCommand.CommandText = "SP_KHOPLENH_LO";
                sqlCommand.Parameters.Add("@macp", SqlDbType.NVarChar, 10).Value = cmbMaCP.Text;
                sqlCommand.Parameters.Add("@Ngay", SqlDbType.NVarChar, 50).Value = dtpNgayGiaoDich.Text;
                sqlCommand.Parameters.Add("@LoaiGD", SqlDbType.Char,1).Value = loaiGD;

                int soluongMB = int.Parse(txtSoluong.Text);
                sqlCommand.Parameters.Add("@soluongMB", SqlDbType.Int).Value = soluongMB;

                float giaMB = float.Parse(txtGia.Text);
                sqlCommand.Parameters.Add("@giadatMB", SqlDbType.Float).Value = giaMB;
                sqlCommand.Parameters.Add(returnValue);
                sqlCommand.ExecuteNonQuery();
                int soluongkhop = 0;
                soluongkhop = (int)returnValue.Value;

                if (loaiGD == 'M')
                {
                    MessageBox.Show("Đặt lệnh mua thành công!");
                    refreshDatLenh();
                }
                else
                {
                    MessageBox.Show("Đặt lệnh bán thành công!");
                    refreshDatLenh();
                }
                
                if (soluongkhop > 0)
                {
                    MessageBox.Show("Tổng số lượng khớp: " + soluongkhop + " cổ phiếu");
                    return;
                }
                else
                {
                    if (loaiGD == 'M')
                    {
                        MessageBox.Show("Lệnh mua của bạn chưa khớp!");
                        return;
                    }
                    else
                    {
                        MessageBox.Show("Lệnh bán của bạn chưa khớp!");
                        return;
                    }
                }

            }
        }

        private void frmDatLenh_Load(object sender, EventArgs e)
        {
            cmbLoaiLenh.SelectedIndex = 0;
            cmbMaCP.SelectedIndex = 0;
            dtpNgayGiaoDich.Format = DateTimePickerFormat.Custom;
            dtpNgayGiaoDich.CustomFormat = "dd/MM/yyyy";
        }

        private void txtGia_KeyPress(object sender, KeyPressEventArgs e)
        {
            if (!Char.IsDigit(e.KeyChar) && !Char.IsControl(e.KeyChar))
            {
                e.Handled = true;
            }
        }

        private void txtSoluong_KeyPress(object sender, KeyPressEventArgs e)
        {
            if (!Char.IsDigit(e.KeyChar) && !Char.IsControl(e.KeyChar))
            {
                e.Handled = true;
            }
        }

        private void groupControl1_Paint(object sender, PaintEventArgs e)
        {

        }

        private bool KiemTraTruocKhiXacNhan()
        {
            if (txtGia.Text == "")
            {
                MessageBox.Show("Giá phải là 1 giá trị lớn hơn 0");
                txtGia.Focus();
                return false;
            }
            if (txtSoluong.Text == "")
            {
                MessageBox.Show("Số lượng là 1 giá trị lớn hơn 0");
                txtSoluong.Focus();
                return false;
            }
            int soluong = int.Parse(txtSoluong.Text);
            if (soluong > 500000)
            {
                MessageBox.Show("Số lượng không quá 500,000 cổ phiếu cho 1 lần giao dịch");
                txtSoluong.Focus();
                return false;
            }
            return true;
        }

        private void refreshDatLenh()
        {
            txtGia.Text = "0";
            txtSoluong.Text = "0";
            toggleLoaiGD.IsOn = false;
            cmbLoaiLenh.SelectedIndex = 0;
            cmbMaCP.SelectedIndex = 0;
        }

        private void btnRefresh_Click(object sender, EventArgs e)
        {
            refreshDatLenh();
        }

        private void txtGia_TextChanged(object sender, EventArgs e)
        {
            if (KiemTraTruocKhiXacNhan())
            {
                float giaMB = float.Parse(txtGia.Text);
                int soluongMB = int.Parse(txtSoluong.Text);
                tongtien = giaMB * soluongMB;
                txtTongTien.Text = tongtien.ToString();
                txtTongTien.Text = string.Format("{0:#,##0}", tongtien);
            }
            else
            {
                tongtien = 0;
                txtTongTien.Text = string.Format("{0:#,##0}", tongtien);
            }
            
        }

        private void txtSoluong_TextChanged(object sender, EventArgs e)
        {
            if (KiemTraTruocKhiXacNhan())
            {
                float giaMB = float.Parse(txtGia.Text);
                int soluongMB = int.Parse(txtSoluong.Text);
                tongtien = giaMB * soluongMB;
                txtTongTien.Text = tongtien.ToString();
                txtTongTien.Text = string.Format("{0:#,##0}", tongtien);
            }
            else
            {
                tongtien = 0;
                txtTongTien.Text = string.Format("{0:#,##0}", tongtien);
            }
        }
    }
}