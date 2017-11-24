using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using MyClass;

namespace 模拟网上图书馆.主页
{
    public partial class 注册 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            string new_id = text_id.Text;
            string new_pw = text_pw.Text;
            string new_mail = text_mail.Text;
            string sql_add = string.Format("insert into [读者信息表](读者账号,读者密码,联系方式)values('{0}','{1}','{2}')", new_id, new_pw, new_mail);

            superConn mycon = new superConn();
            mycon.open();
            try
            {
                mycon.NoQuery(sql_add);
                Session["userID"] = new_id;
                Session["userPSW"] = new_pw;
                Session["isLogin"] = true;
                Response.Redirect("../读者/个人页.aspx");               
            }
            catch
            {
                result.Text = "存在相同的账号，注册失败";
            }
            mycon.close();
        }
    }
}