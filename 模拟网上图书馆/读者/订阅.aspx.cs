using MyClass;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;


namespace 模拟网上图书馆.读者
{
    public partial class 订阅1 : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if ((bool)Session["isLogin"] == false)
            {
                Response.Redirect("~/主页/登录.aspx");
            }
            else
            {
                if(Request.QueryString["bookid"] != null)
                {
                    show_jiey();
                    MultiView1.SetActiveView(borrow);
                }
                else
                {
                    MultiView1.SetActiveView(@return);
                }
                showyuqi();
            }
        }

        protected void Page_PreRender(object sender, EventArgs e)
        {
           
        }

        protected void showyuqi()
        {
            string id = Session["userID"].ToString();
            SqlDataReader dr;
            superConn mycon = new superConn();
            string sql = string.Format("select * from [借阅信息表] where [读者信_读者账号]='{0}' and datediff(day,借阅日期,getdate())>=day(借阅时长)", id);//查询结果一行有误
            mycon.open();
            dr = mycon.GetDataReader(sql);
           

            if (dr.HasRows)
            {
                text_show.Text = "你已有逾期未还书目";
                gv_yuqi.DataSource = dr;
                gv_yuqi.DataBind();
            }

            mycon.close();
        }


        protected void show_jiey()
        {
            string readerid = Session["userID"].ToString();
            string bookid = Request.QueryString["bookid"];
            string sql_reader = string.Format("select [读者账号],[读者姓名],[联系方式] from[读者信息表] where [读者账号]= '{0}'", readerid);
            string sql_book = string.Format("select [书名],[作者],[图书单价] from[图书信息表] where [图书编号]= '{0}'", bookid);

            SqlDataReader dr;
            superConn mycon = new superConn();
            mycon.open();
            dr = mycon.GetDataReader(sql_reader);
            while (dr.Read())
            {
                text_sure.Text += "读者账号：" + dr[0].ToString() + "\n";
                text_sure.Text += "读者姓名：" + dr[1].ToString() + "\n";
                text_sure.Text += "联系方式：" + dr[2].ToString() + "\n";
            }
            mycon.close();
            mycon.open();
            dr = mycon.GetDataReader(sql_book);
            while (dr.Read())
            {
                text_sure.Text += "书名：" + dr[0].ToString() + "\n";
                text_sure.Text += "作者：" + dr[1].ToString() + "\n";
                text_sure.Text += "单价：" + dr[2].ToString() + "\n";
            }
            mycon.close();

        }
        protected void Button1_Click(object sender, EventArgs e)
        {
            Random ran = new Random();
            int RandKey = ran.Next(100, 999);
            string jyid = Request.QueryString["bookid"] + RandKey;
            string readerid = Session["userID"].ToString();
            string bookid = Request.QueryString["bookid"];
            string date = DateTime.Now.ToString();
            string time = DropDownList1.SelectedValue;

            string sql_1 = string.Format("update [图书信息表] set [剩余数量] = [剩余数量] - 1 where [图书编号] = '{0}'", bookid);
            string sql_2 = string.Format("insert into[借阅信息表] values('{0}', '{1}', '{2}', '{3}', '{4}')", jyid, readerid, bookid, date, time);
            superConn mycon = new superConn();
            mycon.open();
            mycon.NoQuery(sql_1);
            mycon.NoQuery(sql_2);
            mycon.close();

            string url = Request.Url.LocalPath;
            Response.Redirect(url);
        }

        protected void btn_sure_Click(object sender, EventArgs e)
        {
            string bookid = ddl_book.SelectedValue;
            string readerid = Session["userID"].ToString();
            string sql_1 = string.Format("delete from [借阅信息表] where [图书信_图书编号] ='{0}' and [读者信_读者账号] ='{1}'", bookid, readerid);
            string sql_2 = string.Format("update [图书信息表] set [剩余数量] = [剩余数量] + 1 where [图书编号] = '{0}'", bookid);

            superConn mycon = new superConn();
            mycon.open();
            mycon.NoQuery(sql_1);
            mycon.NoQuery(sql_2);
            mycon.close();

            string url = Request.Url.LocalPath;
            Response.Redirect(url);
        }
    }
}