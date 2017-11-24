using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.IO;
using MyClass;

namespace 模拟网上图书馆.主页
{
    public partial class 浏览 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            { maketree(); }

        }
        private void maketree()
        {
            TreeNode tn;
            SqlDataReader dr;

            string sql_type = "select * from [图书类型表]";

            superConn mycon = new superConn();
            mycon.open();
            dr=mycon.GetDataReader(sql_type);

            while (dr.Read())
            {
                tn = new TreeNode();
                tn.Text = dr["类型名称"].ToString();
                tn.Value = dr["类型编号"].ToString();
                tv.Nodes.Add(tn);
            }

            mycon.close();
            /* string sql_books = "select * from books_information";
             cmd = new SqlCommand(sql_books, conn);
             dr = cmd.ExecuteReader();
             while (dr.Read())
             {
                 string value = dr["Bi_typeid"].ToString();
                 par = new TreeNode();
                 foreach (TreeNode t in tv.Nodes)
                 {
                     if (t.Value == value)
                         par = t;
                 }
                 tn = new TreeNode();
                 tn.Text = dr["Bi_name"].ToString();
                 tn.Value = dr["Bi_id"].ToString();
                 par.ChildNodes.Add(tn);
             }
             dr.Close();*/ //用于构建树的二级子节点
        }

        protected void gv_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
    }
}