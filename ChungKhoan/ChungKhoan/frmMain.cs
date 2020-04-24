using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Text;
using System.Linq;
using System.Threading.Tasks;
using System.Windows.Forms;
using DevExpress.XtraBars;

namespace ChungKhoan
{
    public partial class frmMain : DevExpress.XtraBars.Ribbon.RibbonForm
    {
        public frmMain()
        {
            InitializeComponent();
        }

        private void btnBangGia_ItemClick(object sender, ItemClickEventArgs e)
        {
            if (!CheckExistForm("frmBangGia"))
            {
                frmBangGia frmBangGia = new frmBangGia();
                frmBangGia.MdiParent = this;
                frmBangGia.Show();
            }
            else
            {
                ActiveChildForm("frmBangGia");
            }
        }

        private void btnDatLenh_ItemClick(object sender, ItemClickEventArgs e)
        {
            if (!CheckExistForm("frmDatLenh"))
            {
                frmDatLenh frmDatLenh = new frmDatLenh();
                frmDatLenh.MdiParent = this;
                frmDatLenh.Show();
            }
            else
            {
                ActiveChildForm("frmDatLenh");
            }
        }

        private void btnThoat_ItemClick(object sender, ItemClickEventArgs e)
        {
            if (MessageBox.Show("Bạn thật sự muốn thoát khỏi chương trình?", "", MessageBoxButtons.OKCancel) == DialogResult.OK)
            {
                this.Close();
            }
        }

        private void frmChinh_Load(object sender, EventArgs e)
        {

        }


        private bool CheckExistForm(string name)
        {
            bool check = false;
            foreach (Form frm in this.MdiChildren)
            {
                if (frm.Name == name)
                {
                    check = true;
                    break;
                }
            }
            return check;
        }

        private void ActiveChildForm(string name)
        {
            foreach (Form frm in this.MdiChildren)
            {
                if (frm.Name == name)
                {
                    frm.Activate();
                    break;
                }
            }
        }
    }
}