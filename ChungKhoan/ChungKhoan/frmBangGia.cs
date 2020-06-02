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
using System.Security.Permissions;


namespace ChungKhoan
{
    public partial class frmBangGia : DevExpress.XtraEditors.XtraForm
    {
        private int changeCount = 0;
        private const string tableName = "GIATRUCTUYEN";

        private SqlConnection connection = null;
        private SqlCommand command = null;
        private DataSet dataToWatch = null;

        private string sqlQuery = "SELECT  MACP AS 'Mã cổ phiếu',GIADUMUA1 AS 'Giá dư mua 1',SLDUMUA1 AS 'KL dư mua 1',GIADUMUA2 AS 'Giá dư mua 2',SLDUMUA2 AS 'KL dư mua 2',GIAKHOP AS 'Giá khớp',SLKHOP AS 'KL khớp',GIADUBAN1 AS 'Giá dư bán 1',SLDUBAN1 AS 'KL dư bán 1',GIADUBAN2 AS 'Giá dư bán 2',SLDUBAN2 AS 'KL dư bán 2' FROM dbo.GIATRUCTUYEN";
        public frmBangGia()
        {
            InitializeComponent();
        }
        public static string GetConnectionString()
        {
            return Program.connstr = "Data Source=" + Program.servername + ";Initial Catalog=" +
                    Program.database + ";User ID=" +
                    Program.mlogin + ";password=" + Program.password;
        }
        private bool CanRequestNotifications()
        {
            try
            {
                SqlClientPermission perm = new SqlClientPermission(PermissionState.Unrestricted);
                perm.Demand();
                return true;
            }
            catch (Exception ex)
            {
                MessageBox.Show("Loi: " + ex);
                return false;
            }
        }
        private void frmBangGia_Load(object sender, EventArgs e)
        {
            // TODO: This line of code loads data into the 'cHUNGKHOANDataSet.GIATRUCTUYEN' table. You can move, or remove it, as needed.
            // this.gIATRUCTUYENTableAdapter.Fill(this.cHUNGKHOANDataSet.GIATRUCTUYEN);

            

            if (CanRequestNotifications() == true)
            {
                //clearBangGia();
                Start();
            }
            else
            {
                MessageBox.Show("Bạn chưa kích hoạt dịch vụ Broker");
            }

        }

        private void Start()
        {
            changeCount = 0;
            SqlDependency.Stop(GetConnectionString());
            try
            {
                SqlDependency.Start(GetConnectionString());
            }
            catch (Exception ex)
            {
                MessageBox.Show("Loi: " + ex);
                return;
            }
            if (connection == null)
            {
                connection = new SqlConnection(GetConnectionString());
                connection.Open();
            }
            if (command == null)
                command = new SqlCommand(sqlQuery, connection);

            if (dataToWatch == null)
                dataToWatch = new DataSet();
            GetData();
        }

        private void GetData()
        {
            dataToWatch.Clear();
            command.Notification = null;

            SqlDependency dependency = new SqlDependency(command);
            dependency.OnChange += dependency_OnChange;

            using (SqlDataAdapter adapter = new SqlDataAdapter(command))
            {
                adapter.Fill(dataToWatch, tableName);
                dtNgayGiaoDich.Text = DateTime.Now.ToString("dd/MM/yyyy");
                this.dataGridView1.DataSource = dataToWatch;
                this.dataGridView1.DataMember = tableName;
            }
        }

        private void dependency_OnChange(object sender, SqlNotificationEventArgs e)
        {
            ISynchronizeInvoke i = (ISynchronizeInvoke)this;
            if (i.InvokeRequired)
            {
                OnChangeEventHandler tempDelegate = new OnChangeEventHandler(dependency_OnChange);

                object[] args = new[] { sender, e };

                i.BeginInvoke(tempDelegate, args);

                return;
            }

            SqlDependency dependency = (SqlDependency)sender;

            dependency.OnChange -= dependency_OnChange;

            changeCount += 1;
            GetData();
        }

        private void btnThoat_Click(object sender, EventArgs e)
        {
            if (MessageBox.Show("Bạn thật sự muốn thoát?", "", MessageBoxButtons.OKCancel) == DialogResult.OK)
            {
                this.Close();
            }
        }

        /*
        private void clearBangGia()
        {
            SqlConnection con = new SqlConnection(GetConnectionString());
            SqlCommand sqlCommand = new SqlCommand();
            sqlCommand.Connection = con;
            con.Open();
            sqlCommand.CommandType = CommandType.StoredProcedure;
            sqlCommand.CommandText = "SP_clear_GiaTrucTuyen";
            sqlCommand.ExecuteNonQuery();
        }
        */
        private void dataGridView1_CellContentClick(object sender, DataGridViewCellEventArgs e)
        {

        }
    }
}