<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="悬浮窗.ascx.cs" Inherits="模拟网上图书馆.简单的自定义控件.悬浮窗" %>

<link href="../样式表/悬浮窗.css" rel="stylesheet" />
<script src="../Scripts/jquery-3.1.1.js"></script>
<script src="../js、jQuery/悬浮窗.js"></script>

<div id="div_ctr">
<p id="btn_open"><img src="../图片/右指示.jpg" /><a>点<br/>击<br/>查<br/>看<br/>收<br/>藏</a></p>  

<div id="myctr">
   <img id="btn_close" src="../图片/左指示.jpg" />
    <asp:MultiView ID="MultiView1" runat="server">
        <asp:View ID="unlogin" runat="server">
            <p><a href="../主页/登录.aspx">登录</a>后可查看你的借阅和收藏书目</p>
          <asp:UpdatePanel ID="UpdatePanel2" runat="server">
        <ContentTemplate>
          <p> <%=DateTime.Now.ToString () %> </p> 
          <asp:Timer ID="Timer2" runat="server" Interval="1000"></asp:Timer>
        </ContentTemplate>
    </asp:UpdatePanel>
        </asp:View>

        <asp:View ID="logined" runat="server">
            <p>读者:<%=Session["userID"].ToString () %>的借阅收藏目录</p>
            <asp:BulletedList ID="BulletedList1" runat="server" DataSourceID="SqlDataSource1" DataTextField="书名" DataValueField="图书信_图书编号" DisplayMode="LinkButton" OnClick="BulletedList1_Click" Target="_blank" ></asp:BulletedList>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=G:\C-sharp\ASP\模拟网上图书馆\模拟网上图书馆\数据\模拟图书馆.mdf;Integrated Security=True;Connect Timeout=30" ProviderName="System.Data.SqlClient" SelectCommand="SELECT 借阅信息表.图书信_图书编号, 图书信息表.书名 FROM 借阅信息表 INNER JOIN 图书信息表 ON 借阅信息表.图书信_图书编号 = 图书信息表.图书编号 WHERE (借阅信息表.读者信_读者账号 = @读者信_读者账号)">
                <SelectParameters>
                    <asp:SessionParameter Name="读者信_读者账号" SessionField="userID" Type="String" />
                </SelectParameters>
            </asp:SqlDataSource>
            <asp:Button ID="outlogin" runat="server" Text="退出登录" OnClick="outlogin_Click" BorderStyle="None" />
            
               <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
          <p> <%=DateTime.Now.ToString () %> </p> 
          <asp:Timer ID="Timer1" runat="server" Interval="1000"></asp:Timer>
        </ContentTemplate>
    </asp:UpdatePanel>
        </asp:View>

    </asp:MultiView>

</div>
    </div>
<!--
    自定义控件中ScriptManager会与页面原有的冲突
    -->