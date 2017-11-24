using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;

namespace 模拟网上图书馆.主页
{
    public partial class 搜索 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
          
        }

        protected void BulletedList1_Click(object sender, BulletedListEventArgs e)
        {
            text_selected_PopupControlExtender.Commit(BulletedList1.Items[e.Index].Value);
        }

        protected void gv_find_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

    }
}