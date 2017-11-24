using System;

namespace 模拟网上图书馆
{
    public class Global : System.Web.HttpApplication
    {

        protected void Application_Start(object sender, EventArgs e)
        {

        }

        protected void Session_Start(object sender, EventArgs e)
        {
            Session["aisLogin"] = false;
            Session["adminID"] = "";

            Session["isLogin"] = false ;
            Session["userID"] = "";
            Session["id"] = "";

            //Session是一个object型，存储大小受内存限制，会话开始自动创建，会话结束自动回收
        }

        protected void Application_BeginRequest(object sender, EventArgs e)
        {

        }

        protected void Application_AuthenticateRequest(object sender, EventArgs e)
        {

        }

        protected void Application_Error(object sender, EventArgs e)
        {

        }

        protected void Session_End(object sender, EventArgs e)
        {

        }

        protected void Application_End(object sender, EventArgs e)
        {

        }
    }
}