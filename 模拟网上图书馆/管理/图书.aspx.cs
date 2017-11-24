using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace 模拟网上图书馆.读者
{
    public partial class 图书 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if ((bool)Session["aisLogin"] == true)
                {
                    Label1.Text = "欢迎管理员 " + Session["adminID"].ToString();
                }
                else
                {
                    Response.Redirect("../主页/登录.aspx");
                }
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Session["aisLogin"] = false;
            Session["adminID"] = "";
            Response.Redirect("../主页/登录.aspx");
        }
    }
}