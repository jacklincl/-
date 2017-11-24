<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="搜索.aspx.cs" Inherits="模拟网上图书馆.主页.搜索" Theme="Skin1" %>
<%@ Register Src="~/简单的自定义控件/悬浮窗.ascx" TagName="myxfc" TagPrefix="xfc" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>搜索图书</title>
    <link href="../样式表/搜索.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
       
         <myatk:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server"></myatk:ToolkitScriptManager>

            <xfc:myxfc id="myxfc" runat="server"/>
        
    <div>
       
    <p>在这里搜索你需要的图书</p>
        输入搜索<asp:TextBox ID="text_selected" runat="server" onfocus="this.blur()"></asp:TextBox>
        <!--onfocus="this.blur()" 设置文本框不能被输入但可以被赋值-->

        <myatk:PopupControlExtender ID="text_selected_PopupControlExtender" 
            runat="server" DynamicServicePath="" Enabled="True" 
            ExtenderControlID="" TargetControlID="text_selected" 
            PopupControlID="Panel1" Position="Bottom">
        </myatk:PopupControlExtender>

        <asp:Panel ID="Panel1" runat="server">
            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                <ContentTemplate>
                    <asp:TextBox ID="TextBox1" runat="server" AutoPostBack="true"></asp:TextBox>
                    <asp:BulletedList ID="BulletedList1" runat="server" DisplayMode="LinkButton" OnClick="BulletedList1_Click"
                         DataSourceID="SqlDataSource1" DataTextField="书名" DataValueField="书名"></asp:BulletedList>
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                        ConnectionString="Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=G:\C-sharp\ASP\模拟网上图书馆\模拟网上图书馆\数据\模拟图书馆.mdf;Integrated Security=True;Connect Timeout=30"
                         ProviderName="System.Data.SqlClient" SelectCommand="SELECT [书名] FROM [图书信息表] WHERE ([书名] LIKE '%' + @书名 + '%')">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="TextBox1" Name="书名" PropertyName="Text" Type="String" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                </ContentTemplate>
            </asp:UpdatePanel>
        </asp:Panel>

        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
        <hr />

        <asp:UpdatePanel ID="UpdatePanel2" runat="server">
            <ContentTemplate>
                <asp:Button ID="Button1" runat="server" Text="开始搜索" OnClick="Button1_Click" />
        <asp:GridView ID="gv_find" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource2" DataKeyNames="图书编号" >
            <Columns>
                <asp:BoundField DataField="图书编号" HeaderText="图书编号" ReadOnly="True" SortExpression="图书编号" />
                <asp:BoundField DataField="书名" HeaderText="书名" SortExpression="书名" />
                <asp:BoundField DataField="作者" HeaderText="作者" SortExpression="作者" />
                <asp:BoundField DataField="出版社" HeaderText="出版社" SortExpression="出版社" />
                <asp:BoundField DataField="出版日期" HeaderText="出版日期" SortExpression="出版日期" DataFormatString="{0:D}"/>
                <asp:BoundField DataField="上架日期" HeaderText="上架日期" SortExpression="上架日期" >
                </asp:BoundField>
                <asp:BoundField DataField="图书简介" HeaderText="图书简介" SortExpression="图书简介">
                <ItemStyle CssClass="brief" />
                </asp:BoundField>
                <asp:BoundField DataField="图书单价" HeaderText="图书单价" SortExpression="图书单价" DataFormatString="{0:C2}"/>
                <asp:BoundField DataField="上架数量" HeaderText="上架数量" SortExpression="上架数量" />
                <asp:BoundField DataField="剩余数量" HeaderText="剩余数量" SortExpression="剩余数量" />
                <asp:BoundField DataField="文本路径" HeaderText="文本路径" SortExpression="文本路径" />
                    <asp:HyperLinkField DataNavigateUrlFields="图书编号" DataNavigateUrlFormatString="图书详情页.aspx?bookid={0}" HeaderText="查看详情" Text="转到详细信息">
                    <ItemStyle Width="100px" />
                    </asp:HyperLinkField>
                    <asp:HyperLinkField DataNavigateUrlFields="图书编号" DataNavigateUrlFormatString="收藏借阅.aspx?bookid={0}" HeaderText="收藏借阅" Text="转到收藏、借阅">
                    <ItemStyle Width="100px" />
                    </asp:HyperLinkField>
            </Columns>
        </asp:GridView>
                <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=G:\C-sharp\ASP\模拟网上图书馆\模拟网上图书馆\数据\模拟图书馆.mdf;Integrated Security=True;Connect Timeout=30" ProviderName="System.Data.SqlClient" SelectCommand="SELECT * FROM [图书信息表] WHERE ([书名] = @书名)">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="text_selected" Name="书名" PropertyName="Text" Type="String" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </ContentTemplate>
        </asp:UpdatePanel>

        
        <br />
    </div>
    </form>
</body>
</html>
