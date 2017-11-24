<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="登录.aspx.cs" Inherits="模拟网上图书馆.主页.登录" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="../样式表/登录.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <asp:MultiView ID="Login" runat="server">

            <asp:View ID="Logined" runat="server">
                <p>你已登录，请先退出当前账户！</p> 
                <p>
                    <asp:Button ID="Button2" runat="server" Text="退出" OnClick="Button2_Click" />
                </p>
            </asp:View>

            <asp:View ID="unLogin" runat="server">
       <div class="wapper">

    <div class="logobox">
    	<a class="logo">
            <img src="../图片/cquc.gif" />
            <img id="loginPic" src="../图片/Libra.jpg" />
    	</a>
    </div>

        <div id="loginbox">
            <div id="login"> 
                <h1>用户登录</h1>
                <ul>
                    <li>
              <asp:Label ID="Label1" runat="server" Text="用户名"></asp:Label>
              <asp:TextBox ID="username" runat="server"></asp:TextBox>
                    </li>
                    <li>
              <asp:Label ID="Label2" runat="server" Text="密      码"></asp:Label>
              <asp:TextBox ID="password" runat="server"  ></asp:TextBox>
                    </li>
                    <li>
              <asp:Label ID="Label3" runat="server" Text="验证码"></asp:Label>
              <asp:TextBox ID="text_yzm" runat="server"></asp:TextBox>
                        <img id="yzm" src="验证码.aspx"/> 
                    </li>
                </ul>

                
                <div id="checkbox">
                <asp:RadioButtonList ID="ckl_logintye" runat="server" RepeatDirection="Horizontal">
                    <asp:ListItem Value="0">读者登录</asp:ListItem>
                    <asp:ListItem Value="1">管理员登录</asp:ListItem>
                </asp:RadioButtonList>
                <asp:CheckBox ID="cb_cookies" runat="server" Text="设置cookies" ToolTip="只保留读者信息" />
            </div>

                <div class="lbtn"> 
              <asp:Button ID="btnShow" runat="server" Text="登录" OnClick="btnShow_Click" />    
            <a href= "注册.aspx">注册</a>
                    <asp:Label ID="error" runat="server"></asp:Label>
          </div>
  
            </div>
        </div>

         <div id="footer">
    	<p>Copyright&copy;模拟网上图书馆 All rights reserved</p>
        <p><span><a href="http://library.cqjtu.edu.cn/" target="_blank" style="color:#606060">重庆交通大学图书馆</a></span></p>
    </div>
    </div>

            </asp:View>

        </asp:MultiView>
    </div>
    </form>
</body>
</html>
