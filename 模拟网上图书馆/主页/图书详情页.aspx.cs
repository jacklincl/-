using System;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Drawing;
using System.IO;
using MyClass;


namespace 模拟网上图书馆.主页
{
    public partial class 图书详情页 : System.Web.UI.Page
    {
        int size;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Request.QueryString["bookid"] != null)
                {
                    string id = Request.QueryString["bookid"].ToString();
                    Session.Add("bookid", id);
                    text_id.Text = Session["bookid"].ToString();
                    MultiView1.SetActiveView(View1);
                    showdetails();
                    showtext();
                    showpl();
                }
                else
                {
                    MultiView1.SetActiveView(View2);
                    Response.Clear();
                    string strRedirectPage = "浏览.aspx";//中文地址乱码的问题
                    string strRedirectTime = "5";
                    string strRedirect = string.Format("{0};url={1}", strRedirectTime, strRedirectPage);
                    Response.AddHeader("refresh", strRedirect);
                }
            }
            else
            {
                text_id.Text = Session["bookid"].ToString();
                showdetails();
                showpl();
            }
        }

        protected void showtext()
        {
            string id;
            id = Session["bookid"].ToString();
            detail.Text = "";
            string path = MapPath("~/数据/"+id+".txt");
            if (File.Exists(path))
            {
                StreamReader sr = new StreamReader(path, System.Text.Encoding.Default);
                while (!sr.EndOfStream)
                    detail.Text += sr.ReadLine() + "\n";
                sr.Close();
            }
            else
                detail.Text = "暂无文本预览";
        }

        protected void showdetails()
        {
            string id;
            id = Session["bookid"].ToString();
           
            string sql =string.Format("select * from [图书信息表] where [图书编号]='{0}'", id);
            SqlDataAdapter sa;
            superConn mycon = new superConn();
            DataTable dt = new DataTable();

            mycon.open();
            sa= mycon.GetDataAdapter(sql);
            sa.Fill(dt);
            mycon.close();
            for (int i = 0; i < dt.Columns.Count; i++)
            {
                Label label = new Label();
                TextBox textbox = new TextBox();
                label.Text = dt.Columns[i].ColumnName;
                label.Width = 300; label.Height = 40;
                textbox.Text = dt.Rows[0][i].ToString();
                textbox.Width = 300;textbox.Height = 40;textbox.BackColor=Color.AntiqueWhite; textbox.ForeColor = Color.Black; textbox.ReadOnly = true;
                pn.Controls.Add(label);
                pn.Controls.Add(textbox);
            }
        }

        protected void download_Click(object sender, EventArgs e)
        {
            if ((bool)Session["isLogin"] == true)
            {
                string id;
                id = Session["bookid"].ToString();
                string name = id + ".txt";
                string path = Server.MapPath("~/数据/" + name);
                if (File.Exists(path))
                {
                    Response.Clear();
                    Response.Buffer = true;

                    Response.AddHeader("Content-Disposition", "attachment;filename=" + name);
                    Response.ContentType = "application/unknow";
                    Response.TransmitFile(path);
                    Response.End();

                    //在IE中文件名乱码
                }
                else
                {
                    Response.Write("<script>alert('此书目暂无文本文件!');</script>");
                }
            }
            else
                Response.Write("<script>alert('未登陆的用户暂不能下载文件,请先登陆或注册');</script>");
        }

        protected void showpl()
        {
            string book;
            book= Request.QueryString["bookid"].ToString();
            string sql = string.Format("select * from [评论信息表] where [图书信_图书编号]='{0}'",book);
            SqlDataReader dr;
            superConn mycon = new superConn();
            mycon.open();
            dr = mycon.GetDataReader(sql);
      
            while (dr.Read())
            {
                Label lab_bq = new Label();Label lab_content = new Label();
                lab_bq.CssClass = "css_bq";lab_content.CssClass="css_content";
                lab_bq.Text = dr["评论日期"].ToString() + dr["读者信_读者账号"].ToString();
                lab_content.Text = "<br/><br/>&nbsp&nbsp&nbsp" + dr["评论内容"].ToString()+"<hr/>";
                P_pl.Controls.Add(lab_bq);
                P_pl.Controls.Add(lab_content);
            }
            mycon.close();
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            Random ran = new Random();
            int RandKey = ran.Next(100, 999);
            string bookid = Session["bookid"].ToString();            
            string  plid = bookid + RandKey;
            string pl = text_new.Text.Trim();
            string readerid = Session["userID"].ToString();
            string date = DateTime.Now.ToString();
            if (pl != "")
            {
                string sql = string.Format("insert into[评论信息表] values('{0}','{1}','{2}','{3}','{4}')", plid, readerid, bookid, date, pl);
                try
                {
                    superConn mycon = new superConn();
                    mycon.open();
                    mycon.NoQuery(sql);
                    mycon.close();
                    text_new.Text = "";
                }
                catch
                {
                    text_new.Text = "";
                }
            }

        }
    }
  
}