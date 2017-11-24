<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="个人页.aspx.cs" Inherits="模拟网上图书馆.读者.个人页" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="../样式表/信息.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
   <div class="header">
       <a class="a1" href="../主页/浏览.aspx">转到浏览页</a><a class="a2" href="../主页/主页.aspx">首页</a><a class="a3" href="订阅.aspx">我的图书馆</a>
<asp:LinkButton ID="LinkButton1" class="a4"  runat="server" OnClick="LinkButton1_Click">退出登录</asp:LinkButton>
   </div>

        <div class="mainbox">
            
            <div class="main"><a class="a1" href="订阅.aspx">我的图书馆</a><a class="a2" href="个人信息.aspx">关于我</a></div>

            <div class="handname">
                <asp:BulletedList ID="BulletedList1" runat="server" DisplayMode="HyperLink">
                    <asp:ListItem Value="个人信息.aspx">个人信息</asp:ListItem>
                    <asp:ListItem>个人设置</asp:ListItem>
                    <asp:ListItem Value="修改密码.aspx">修改密码</asp:ListItem>
                </asp:BulletedList>
                <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
            </div>
            <div class="info">
            </div>
            <div class="divhtml2"></div>
        </div>

        <div class="foot"></div>
    </form>
</body>
</html>
