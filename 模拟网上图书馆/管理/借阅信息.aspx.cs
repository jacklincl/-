using System;
using MyClass;
using System.Net;
using System.Net.Mail;
using System.Data.SqlClient;
using System.Web.UI.WebControls;

namespace 模拟网上图书馆.管理
{
    public partial class 借阅信息 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
           // showyuqi();
        }

        protected void showyuqi()
        {
            SqlDataReader dr;
            superConn mycon = new superConn();
            string sql = string.Format("select * from [借阅信息表] where datediff(day,借阅日期,getdate())>=day(借阅时长)");
            mycon.open();
            dr = mycon.GetDataReader(sql);           

            if (dr!=null)
            {
             //   string id = dr["读者信_读者账号"].ToString();
                gv_yuqi.DataSource = dr;
                gv_yuqi.DataBind();
            }
            mycon.close();
        }


        protected void gv_yuqi_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            try
            {
                int index = int.Parse(e.CommandArgument.ToString());//得到点击列的索引

                string id, mail, name, time;
                DateTime date;
                id = gv_yuqi.Rows[index].Cells[2].Text;
                mail = gv_yuqi.Rows[index].Cells[3].Text;
                name = gv_yuqi.Rows[index].Cells[5].Text;
                date = DateTime.Parse(gv_yuqi.Rows[index].Cells[7].Text);
                time = gv_yuqi.Rows[index].Cells[8].Text;

                string _mail = string.Format("读者 {0} 你好，你于 {1} 在本馆借阅的图书 《{2}》 已超过借阅时长 {3} 天。<br/>请你及时归还，方便更多人借阅！<br/><br/><br/>系统邮件,不用回复", id, date.ToLongDateString(), name, time);
                //构建邮件内容

                MailMessage _msg = new MailMessage("vs_testmail@163.com", mail, "超时未还提醒", _mail);
                _msg.IsBodyHtml = true;
                SmtpClient _client = new SmtpClient("smtp.163.com", 25);
                _client.DeliveryMethod = SmtpDeliveryMethod.Network;
                _client.Credentials = new NetworkCredential("vs_testmail@163.com", "950915cbb");

                _client.Send(_msg);

                //完成邮件发送

                Response.Write("<script>alert('已成功发送邮件至" + mail + "');</script>");
            }
            catch
            {
                Response.Write("<script>alert('邮件发送失败！');</script>");
            }
        }
    }
}