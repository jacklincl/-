<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="注册.aspx.cs" Inherits="模拟网上图书馆.主页.注册" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="../样式表/注册.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
    <div class="header">
    
    </div>
        <div class="left">
            <img src="../图片/b4061f5e7f4ab7f59459d6e6647c3066.jpg" />
            <h2>游戏和书本对你都是好的</h2>
        </div>

        <div class="right">
            <asp:Label ID="Label1" runat="server" Text="注册到图书馆"></asp:Label>
            <br />
            <asp:Label ID="id" runat="server" Text="账  号"></asp:Label><asp:TextBox ID="text_id" runat="server"></asp:TextBox>
            <asp:RequiredFieldValidator ID="rfv_id" runat="server" ControlToValidate="text_id" ErrorMessage="账号应该是字母开头"></asp:RequiredFieldValidator>
            <br />
            <asp:Label ID="pw" runat="server" Text="密  码"></asp:Label>
            <asp:TextBox ID="text_pw" runat="server" TextMode="Password" ></asp:TextBox>
            <asp:RequiredFieldValidator ID="rfv_pw" runat="server" ControlToValidate="text_pw" ErrorMessage="密码最少6位"></asp:RequiredFieldValidator>
            <asp:Label ID="mail" runat="server" Text="邮  箱"></asp:Label>
            <asp:TextBox ID="text_mail" runat="server"></asp:TextBox>
            <asp:RequiredFieldValidator ID="rfv_mail" runat="server" ErrorMessage="邮箱格式不正确" ControlToValidate="text_mail" ValidationExpression="[A-Za-z0-9_\-\.]{1,}@[A-Za-z0-9_\-\.]{3,}"></asp:RequiredFieldValidator>
            <br />
            <asp:Label ID="result" runat="server"></asp:Label>
            <asp:Button ID="Button1" runat="server" Text="注册" OnClick="Button1_Click" />
            <br />
        </div>

        <div class="foot"><a class="a1" href="主页.aspx">回到主页</a><asp:Label ID="Label2" runat="server" Text="为什么要注册" CssClass="a2" ToolTip="注册后才可以收藏、借阅和下载文本"></asp:Label>
        </div>
    </form>
</body>
</html>
