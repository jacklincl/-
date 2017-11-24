using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient;

namespace 模拟网上图书馆.数据
{
    public class userInfo
    {
        public string userID;
        public string userPSW;
        private bool isLogin;

        public userInfo()
        {
            userID = "";
            userPSW = "";
            isLogin = false;
        }
        public bool tryLogin()
        {

            isLogin = false;
            string connectionString;
            connectionString = @"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=F:\终极闪光版\模拟网上图书馆\模拟网上图书馆\数据\模拟图书馆.mdf;Integrated Security=True;Connect Timeout=30";
            string sql = string.Format("select count(*) from reader_information where [读者账号]='{0}' and [个人密码]= '{1}'", userID, userPSW);

            try
            {
                SqlConnection conn = new SqlConnection(connectionString);
                conn.Open();
                SqlCommand cmd = new SqlCommand(sql, conn);
                int count = cmd.ExecuteNonQuery();
                conn.Close();
                if (count > 0)
                    isLogin = true;
            }
            catch
            {
                isLogin = true;
            }
            return isLogin;
        }

        public void outLogin()
        {
            isLogin = false;
        }

       public bool GetisLogin()
        {
            return isLogin;
        }
    }
}