﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using 模拟网上图书馆.数据;

namespace 模拟网上图书馆.读者
{
    public partial class 推荐 : System.Web.UI.Page
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