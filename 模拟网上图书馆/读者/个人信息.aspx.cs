using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using MyClass;

namespace 模拟网上图书馆.读者
{
    public partial class 个人信息 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if( (bool)Session["isLogin" ]== false)
            {
                Response.Redirect("~/主页/登录.aspx");
            }
            else
            {
                Label1.Text = "读者" + Session["userID"].ToString();
                showinfo();
            }
            
        }

        protected void showinfo()
        {
            
            string id;
            id = Session["userID"].ToString();
            try
            {
                string sql = string.Format("select * from [读者信息表] where 读者账号='{0}'", id);                
                SqlDataAdapter sa;
                DataTable dt = new DataTable();
                superConn mycon = new superConn();
                mycon.open();
                sa = mycon.GetDataAdapter(sql);
                sa.Fill(dt);
                mycon.close();
            for (int i = 0; i < dt.Columns.Count; i++)
            {
                Label label = new Label();
                TextBox textbox = new TextBox();
                label.Text = dt.Columns[i].ColumnName;
                label.Width = 250; label.Height = 60;
                textbox.Text = dt.Rows[0][i].ToString();
                textbox.Width = 250; textbox.Height = 60; textbox.BackColor = Color.AntiqueWhite; textbox.ForeColor = Color.Black; textbox.ReadOnly = true;
                pn.Controls.Add(label);
                pn.Controls.Add(textbox);
            }
            }
            catch { }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Session["isLogin"] = false;
            Response.Redirect("~/主页/主页.aspx");
        }
    }
}