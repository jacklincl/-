using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace 模拟网上图书馆.简单的自定义控件
{
    public partial class 悬浮窗 : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["userID"].ToString() != "")
            {
                MultiView1.SetActiveView(logined);               
            }
            else
            {
                MultiView1.SetActiveView(unlogin);
            }
        }

        protected void outlogin_Click(object sender, EventArgs e)
        {
            Session["isLogin"] = false;
            Session["userID"] = "";
            MultiView1.SetActiveView(unlogin);
        }

        protected void BulletedList1_Click(object sender, BulletedListEventArgs e)
        {
            string url = string.Format("主页/图书详情页.aspx?bookid={0}", BulletedList1.Items[e.Index].Value);//构建地址
             Response.Redirect(url);
           // Response.Write(url);
        }
    }
}