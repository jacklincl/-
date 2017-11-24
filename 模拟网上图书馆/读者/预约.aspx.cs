using System;

namespace 模拟网上图书馆.读者
{
    public partial class 预约 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if ((bool)Session["isLogin"] == false)
            {
                Response.Redirect("~/主页/登录.aspx");
            }
        }
    }
}