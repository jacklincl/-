using System;
using MyClass;

namespace 模拟网上图书馆.读者
{
    public partial class 修改密码 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if ((bool)Session["isLogin"] == false)
            {
                Response.Redirect("~/主页/登录.aspx");
            }
            else
            {
                Label1.Text = "读者" + Session["userID"].ToString();
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            string userID,old_str, new_str;
            old_str = old_psw.Text.Trim();
            new_str = old_psw.Text.Trim();
            userID = Session["userID"].ToString();
            string sql = string.Format("update [读者信息表] set [读者密码]='{0}' where [读者账号]='{1}' and [读者密码] = '{2}'", new_str, userID, old_str);
                try
                {
                    superConn mycon = new superConn();
                    mycon.open();
                    mycon.NoQuery(sql);
                    mycon.close();
                    result.Text = "修改成功";
                }
                catch
                {
                    result.Text = "修改失败，请重试";
                }
        }
    }
}