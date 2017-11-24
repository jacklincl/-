<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="读者.aspx.cs" Inherits="模拟网上图书馆.管理.读者" %>
<%@ Register TagName="foot" TagPrefix="myctl" Src="~/简单的自定义控件/footer.ascx"%>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="../样式表/管理.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
        <myctl:foot ID="myfoot" runat="server" />
    <div class="header">
        <asp:Label ID="Label1" runat="server" CssClass="a1"></asp:Label>
        <asp:Button ID="Button1" class="a2" runat="server" Text="退出登录" OnClick="Button1_Click" />
        </div>
        <div class="main">
            <div class="left">
                <asp:Calendar ID="Calendar1" runat="server" CssClass="c1"></asp:Calendar>
                <a class="a1" href="读者.aspx">已注册读者</a>
                <a class="a2" href="图书.aspx">已上架图书</a>
                <a class="a3" href="上架新书.aspx" target="_blank">上架新书</a>
                <a class="a4" href="借阅信息.aspx" target="_blank">管理借阅</a>
            </div>
            <div class="chart">
                <h2>已注册用户</h2>
                <asp:GridView ID="gv" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" CssClass="g1" DataKeyNames="读者账号">
                    <Columns>
                        <asp:BoundField DataField="读者账号" HeaderText="读者账号" SortExpression="读者账号" ReadOnly="True" />
                        <asp:BoundField DataField="读者姓名" HeaderText="读者姓名" SortExpression="读者姓名" />
                        <asp:BoundField DataField="读者密码" HeaderText="读者密码" SortExpression="读者密码"/>
                        <asp:BoundField DataField="性别" HeaderText="性别" SortExpression="性别" />
                        <asp:BoundField DataField="出生日期" HeaderText="出生日期" SortExpression="出生日期" />
                        <asp:BoundField DataField="联系方式" HeaderText="联系方式" SortExpression="联系方式" />
                        <asp:BoundField DataField="签名" HeaderText="签名" SortExpression="签名" >
                        <ItemStyle CssClass="brief" />
                        </asp:BoundField>
                    </Columns>
                </asp:GridView>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=F:\终极闪光版\模拟网上图书馆\模拟网上图书馆\数据\模拟图书馆.mdf;Integrated Security=True;Connect Timeout=30" ProviderName="System.Data.SqlClient" SelectCommand="SELECT * FROM [读者信息表]"></asp:SqlDataSource>
            </div>
        </div>



            
    </form>
</body>
</html>
