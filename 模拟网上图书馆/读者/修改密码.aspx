<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="修改密码.aspx.cs" Inherits="模拟网上图书馆.读者.修改密码" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="../样式表/信息.css" rel="stylesheet" />
    <link href="../样式表/修改密码.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
   <div class="header">
       <a class="a1" href="读者个人页.aspx">个人图书馆</a><a class="a2" href="../主页/主页.aspx">首页</a><a class="a3" href="订阅.aspx">我的图书馆</a>
       <a class="a4" href="../主界面.aspx">退出</a>
   </div>

        <div class="mainbox">
            
            <div class="main"><a class="a1" href="订阅.aspx">我的图书馆</a><a class="a2" href="个人页.aspx">关于我</a></div>

            <div class="handname">
                <asp:BulletedList ID="BulletedList1" runat="server" DisplayMode="HyperLink">
                    <asp:ListItem Value="个人信息.aspx">个人信息</asp:ListItem>
                    <asp:ListItem>个人设置</asp:ListItem>
                    <asp:ListItem Value="修改密码.aspx">修改密码</asp:ListItem>
                </asp:BulletedList>
                <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
            </div>
            <div class="info">
                <p>修改你的密码</p>
                <asp:Label ID="Label2" runat="server" Text="你的旧密码"></asp:Label> <asp:TextBox ID="old_psw" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="old_psw" ErrorMessage="密码格式不正确"></asp:RequiredFieldValidator>
                <br />
                <asp:Label ID="Label3" runat="server" Text="你的新密码"></asp:Label>  <asp:TextBox ID="new_psw" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" ControlToValidate="new_psw" runat="server" ErrorMessage="密码格式不正确"></asp:RequiredFieldValidator>
                <br />
                <asp:Button ID="Button1" Text="确认修改" runat="server" OnClick="Button1_Click" />
                <asp:TextBox ID="result" runat="server"></asp:TextBox>
            </div>
        </div>

        <div class="foot"></div>
    </form>
</body>
</html>
