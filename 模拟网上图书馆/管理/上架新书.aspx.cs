using System.Data.SqlClient;
using System;
using MyClass;

namespace 模拟网上图书馆.管理
{
    public partial class 上架新书 : System.Web.UI.Page
    {
        private double price;
        private int number, leftnumber;
        private string id, name, writer, press, date, pressdate, brief, path, type, url, readerid;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if ((bool)Session["aisLogin"] == true)
                {
                    text_pressdate.Text = DateTime.Now.ToShortDateString();
                }
                else
                {
                    Response.Redirect("../主页/登录.aspx");
                }
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            if (text_price.Text.Trim() != "")
                price = new superString(text_price.Text.Trim()).toDouble();
            id = text_id.Text.Trim(); name = text_name.Text.Trim(); writer = text_writer.Text.Trim(); press = text_press.Text.Trim();
            pressdate = text_date.Text; date = text_pressdate.Text; brief = text_brief.Text; type = DropDownList1.SelectedValue.ToString();
            leftnumber = number = new superString(text_number.Text.Trim()).toInt();

            updata();
        }

        protected void updata()
        {
            string text = "";
            superConn mycon = new superConn();
            try
            {
                string sql1 = string.Format("select * from [图书信息表] where [图书编号] ='{0}' or [书名] ='{1}'", id, name);
                mycon.open();
                if (mycon.count(sql1) > 0)
                    text = "书名或编号重复";

                else
                {
                    if (upload.HasFile)
                    {
                        path = MapPath("~/数据/") + id + ".txt";//为文本设置统一的文件名和路径
                        upload.SaveAs(path);
                    }
                    string sql = string.Format("insert into [图书信息表] values('{0}','{1}','{2}','{3}','{4}','{5}','{6}','{7}','{8}','{9}','{10}','{11}')", id, name, writer, press, date, pressdate, brief, type, price, number, leftnumber, path);
                    mycon.NoQuery(sql);
                    text = "添加成功";
                }
            }
            catch(Exception e)
            {
                text = "添加失败，请重试"+e.ToString();
            }
            finally
            {
                mycon.close();
                error.Text = text;
            }

        }
    }
}