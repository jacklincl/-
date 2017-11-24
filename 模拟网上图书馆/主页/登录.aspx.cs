using System;
using System.Web;
using System.Data.SqlClient;
using MyClass;

namespace 模拟网上图书馆.主页
{
    public partial class 登录 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if ((bool)Session["isLogin"]==true)
            {
                Login.SetActiveView(Logined);//????
            }
            else
            {
                Login.SetActiveView(unLogin);
                if (!IsPostBack)
                {
                    ReadCookies();
                }
            }
        }

        /// <summary>
        /// 读者登录
        /// </summary>
        protected void userLogin()
        {
            int count = 0;
            string userID = username.Text.Trim();
            string userPSW = password.Text.Trim();

            string sql = string.Format("select * from [读者信息表] where [读者账号]='{0}' and [读者密码]= '{1}'", userID, userPSW);

            superConn mycon = new superConn();
            mycon.open();
            count = mycon.count(sql);
            mycon.close();

            if (count == 1)
            {
                Session["isLogin"] = true;
                Session["userID"] = userID;
                SetCookies();
                Response.Redirect("../读者/订阅.aspx");
            }
            else
            {
                error.Text = "错误的用户";
            }
        }

        protected void adminLogin()
        {
            int count = 0;//"????
            string adminID = username.Text.Trim();
            string adminPSW = password.Text.Trim();

            string sql = string.Format("select * from [管理员信息表] where [管理员账号]='{0}' and [管理员密码]= '{1}'", adminID, adminPSW);

            superConn mycon = new superConn();
            mycon.open();
            count = mycon.count(sql);
            mycon.close();

            if (count == 1)
            {
                Session["aisLogin"] = true;
                Session["adminID"] = adminID;
                Response.Redirect("../管理/读者.aspx");
            }
            else
            {
                error.Text = "错误的用户";
            }
        }



        /// <summary>
        /// 设置cookies
        /// </summary>
        protected void SetCookies()
        {
            if (cb_cookies.Checked==true)
            {
                string userID = username.Text.Trim();
                string userPSW = password.Text.Trim();
                HttpCookie ck = new HttpCookie("user");
                ck.Values.Clear();//先清空
                ck.Values.Add("name", userID);
                ck.Values.Add("psw", userPSW);
                ck.Expires = DateTime.MaxValue;
                Response.Cookies.Add(ck);
            }
            else
            {
                Response.Cookies["user"].Expires = DateTime.MinValue;//????
            }
        }



        /// <summary>
        /// 读取cookies
        /// </summary>
        protected void ReadCookies()
        {
            if (Request.Cookies["user"] != null)
            {
                HttpCookie ck = Request.Cookies["user"];
                    username.Text = ck.Values["name"];
                    password.Text = ck.Values["psw"]; //把TextMode设置成Psaaword后显示不成功
                    cb_cookies.Checked = true;
                    ckl_logintye.SelectedIndex = 0;       
            }
            else
            {
                password.Text = "";
                text_yzm.Text = "";
                cb_cookies.Checked = false;
            }
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            Session["isLogin"] = false;
            Session["userID"] = "";
            Session["userPSW"] = "";
            string url = Request.Url.LocalPath;
            Response.Redirect(url);
        }

        protected void btnShow_Click(object sender, EventArgs e)
        {
            string yzm, checkcode;
            yzm = text_yzm.Text.Trim();
            checkcode = Session["CheckCode"].ToString();
            if (yzm == checkcode)
            {
                if (ckl_logintye.SelectedIndex == 0)
                    userLogin();
                else
                    adminLogin();
            }
            else
                error.Text = "验证码错误";
        }
    }
}