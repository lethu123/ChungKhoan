using System;
using System.Collections.Generic;
using System.Linq;
using System.Windows.Forms;
using DevExpress.UserSkins;
using DevExpress.Skins;
using System.Data;
using System.Data.SqlClient;

namespace ChungKhoan
{
    static class Program
    {
        public static SqlConnection conn = new SqlConnection();
        public static String connstr;
        //public static String servername = @"DESKTOP-15HJU7S";
        public static String servername = @"DESKTOP-2Q5B6UG\LETHITHU";
        public static String mlogin = "sa";
        public static String password = "123";
        public static String database = "CHUNGKHOAN";

        public static DataTable ExecSqlDataTable(String cmd)
        {
            DataTable dt = new DataTable();
            if (Program.conn.State == ConnectionState.Closed) Program.conn.Open();
            SqlDataAdapter da = new SqlDataAdapter(cmd, conn);
            da.Fill(dt);
            conn.Close();
            return dt;
        }

        [STAThread]
        static void Main()
        {
            Application.EnableVisualStyles();
            Application.SetCompatibleTextRenderingDefault(false);
            Application.Run(new frmMain());
        }
    }
}
