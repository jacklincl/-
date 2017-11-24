using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using 模拟网上图书馆.数据;

namespace 模拟网上图书馆
{
    public partial class Site1 : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            user.Text = "读者 " + Session["userID"].ToString();
        }

        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            Session["isLogin"] = false;
            Response.Redirect("~/主页/主页.aspx");
        }
    }
}