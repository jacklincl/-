<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="浏览.aspx.cs" Inherits="模拟网上图书馆.主页.浏览" %>
<%@ Register Src="~/简单的自定义控件/悬浮窗.ascx" TagName="myxfc" TagPrefix="xfc" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="../样式表/浏览.css" rel="stylesheet" />
    <script src="../Scripts/jquery-3.1.1.js"></script>
    <script type="text/javascript" >
        $(document).ready(function () {
            $("td.num", "#gv").text(function(){
                var _num=$(this).text();
                if(_num<3)
                {
                    $(this).css("color","red");
                }
            });
        });
    </script><!--为剩余数量少于3的增加红色标记-->
</head>
<body>
    <form id="form1" runat="server">
        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <xfc:myxfc id="myxfc" runat="server"/>
<div class="header">
    <a class="a1" href="主页.aspx" >主页</a>
    <a class="a2" href="../读者/个人页.aspx" target="_blank" >我的图书</a>
    <a class="a3" href="登录.aspx" target="_blank">登录</a>
</div>
        
            <div class="tv">
            <asp:TreeView ID="tv" runat="server" ExpandDepth="0">
                <LevelStyles>
                    <asp:TreeNodeStyle CssClass="lv1" Font-Underline="False" />
                    <asp:TreeNodeStyle CssClass="lv2" Font-Underline="False" />
                    <asp:TreeNodeStyle CssClass="lv3" Font-Underline="False" />
                </LevelStyles>
                </asp:TreeView>
                </div>
            <div class="gv">
            <asp:GridView ID="gv" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" AllowPaging="True" DataKeyNames="图书编号" OnSelectedIndexChanged="gv_SelectedIndexChanged" EmptyDataText="此类型下暂没有收录书籍" ShowHeader="true">
                <Columns>
                    <asp:BoundField DataField="图书编号" HeaderText="图书编号" SortExpression="图书编号" ReadOnly="True">
                    </asp:BoundField>
                    <asp:BoundField DataField="书名" HeaderText="书名" SortExpression="书名" />
                    <asp:BoundField DataField="作者" HeaderText="作者" SortExpression="作者" />
                    <asp:BoundField DataField="出版社" HeaderText="出版社" SortExpression="出版社" />
                    <asp:BoundField DataField="出版日期" HeaderText="出版日期" SortExpression="出版日期" DataFormatString="{0:D}" />
                    <asp:BoundField DataField="图书简介" HeaderText="图书简介" SortExpression="图书简介" >
                   
                    <ItemStyle CssClass="brief" />
                   
                    </asp:BoundField>
                    <asp:BoundField DataField="图书单价" HeaderText="图书单价" SortExpression="图书单价" DataFormatString="{0:C2}" />
                    <asp:BoundField DataField="剩余数量" HeaderText="剩余数量" SortExpression="剩余数量" >
                    <ItemStyle CssClass="num" />
                    </asp:BoundField>
                    <asp:BoundField DataField="类型名称" HeaderText="类型名称" SortExpression="类型名称" />
                    <asp:HyperLinkField DataNavigateUrlFields="图书编号" DataNavigateUrlFormatString="图书详情页.aspx?bookid={0}" HeaderText="查看详情" Text="转到详细信息">
                    <ItemStyle Width="100px" />
                    </asp:HyperLinkField>
                    <asp:HyperLinkField DataNavigateUrlFields="图书编号" DataNavigateUrlFormatString="../读者/订阅.aspx?bookid={0}" HeaderText="收藏借阅" Text="转到收藏、借阅">
                    <ItemStyle Width="100px" />
                    </asp:HyperLinkField>
                </Columns>
                </asp:GridView>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=F:\终极闪光版\模拟网上图书馆\模拟网上图书馆\数据\模拟图书馆.mdf ;Integrated Security=True;Connect Timeout=30" ProviderName="System.Data.SqlClient" SelectCommand="SELECT 图书信息表.图书编号, 图书信息表.书名, 图书信息表.作者, 图书信息表.出版社, 图书信息表.出版日期, 图书信息表.图书简介, 图书信息表.图书单价, 图书信息表.剩余数量, 图书类型表.类型名称 FROM 图书信息表 INNER JOIN 图书类型表 ON 图书信息表.图书类_类型编号 = 图书类型表.类型编号 WHERE (图书信息表.图书类_类型编号 = @图书类_类型编号)">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="tv" DefaultValue="1" Name="图书类_类型编号" PropertyName="SelectedValue" Type="Int32" />
                    </SelectParameters>
                </asp:SqlDataSource>
                </div>
 

        <div class="foot">
            <ul><li><a href="注册.aspx" target="_blank">注册</a></li><li><a href="http://www.cqjtu.edu.cn" target="_blank">重庆交大</a></li><li><a href="http://library.cqjtu.edu.cn/" target="_blank">交大图书馆</a></li></ul>
        </div>
    </form>
</body>
</html>
