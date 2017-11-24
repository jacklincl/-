using System;
using System.Web;
using System.Data.SqlClient;

namespace MyClass
{
    public class superString
    {
        public string orgString;
        private int _i;
        private double _d;
        private DateTime _dt;

        public superString(string _s)
        {
            orgString = _s;
        }

        public int toInt()
        {
            _i = 0;
            try { _i = int.Parse(orgString); }
            catch { }
            return _i;
        }

        public double toDouble()
        {
            _d = 0;
            try { _d = double.Parse(orgString); }
            catch { }
            return _d;
        }

        public DateTime toDatetime()
        {
            _dt = DateTime.Now;
            try { _dt = DateTime.Parse(orgString); }
            catch { }
            return _dt;
        }
    }

    public class superConn
    {
        private SqlConnection conn;
        private SqlCommand cmd;
        private SqlDataReader dr;
        public superConn()
        {
            string _path = "~\\数据\\模拟图书馆.mdf" ;
            string str_conn = @"Data Source = (LocalDB)\MSSQLLocalDB;AttachDbFilename=" + HttpContext.Current.Server.MapPath(_path) + ";Integrated Security = True; Connect Timeout = 30";
            //string str_conn = @"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=G:\C-sharp\ASP\模拟网上图书馆\模拟网上图书馆\数据\模拟网上图书馆.mdf;Integrated Security=True;Connect Timeout=30";
            conn = new SqlConnection(str_conn);
        }

        public void open()
        {
            conn.Open();
        }

        public void close()
        {
            conn.Close();
        }

        public SqlDataReader GetDataReader(string _sql)
        {
            cmd = new SqlCommand(_sql, conn);
            dr = cmd.ExecuteReader();
            return dr;
        }

        public SqlDataAdapter GetDataAdapter(string _sql)
        {
            SqlDataAdapter sa = new SqlDataAdapter(_sql, conn);
            return sa;
        } 
        public void NoQuery(string _sql)
        {
            cmd = new SqlCommand(_sql, conn);
            cmd.ExecuteNonQuery();
        }

        public int count(string _sql)
        {
            int i = 0;
            cmd = new SqlCommand(_sql, conn);
            dr = cmd.ExecuteReader();
            while(dr.Read())
            { i++; }
            dr.Close();
            return i;
        }
    }
}