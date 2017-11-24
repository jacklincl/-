<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="借阅信息.aspx.cs" Inherits="模拟网上图书馆.管理.借阅信息" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css" >
        th {
            color: black;
            font-size: 20px;
            width: 100px;
            text-align: center;
        }
        td {
            padding: 10px;
            font-size: 20px;
            color: gray;
            width: 60px;
            text-align: center;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div id="header">
    <p>这里展示了图书借阅详细信息</p>
    </div>

        <div id="main">
            <asp:GridView ID="gv_jieyu" runat="server" AutoGenerateColumns="False" DataKeyNames="借阅编号" DataSourceID="SqlDataSource1">
                <Columns>
                    <asp:BoundField DataField="借阅编号" HeaderText="借阅编号" ReadOnly="True" SortExpression="借阅编号" />
                    <asp:BoundField DataField="读者信_读者账号" HeaderText="读者信_读者账号" SortExpression="读者信_读者账号" />
                    <asp:BoundField DataField="读者姓名" HeaderText="读者姓名" SortExpression="读者姓名" />
                    <asp:BoundField DataField="联系方式" HeaderText="联系方式" SortExpression="联系方式" />
                    <asp:BoundField DataField="图书信_图书编号" HeaderText="图书信_图书编号" SortExpression="图书信_图书编号" />
                    <asp:BoundField DataField="书名" HeaderText="书名" SortExpression="书名" />
                    <asp:BoundField DataField="剩余数量" HeaderText="剩余数量" SortExpression="剩余数量" />
                    <asp:BoundField DataField="借阅日期" HeaderText="借阅日期" SortExpression="借阅日期" />
                    <asp:BoundField DataField="借阅时长" HeaderText="借阅时长" SortExpression="借阅时长" />
                </Columns>
            </asp:GridView>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=F:\终极闪光版\模拟网上图书馆\模拟网上图书馆\数据\模拟图书馆.mdf;Integrated Security=True;Connect Timeout=30" ProviderName="System.Data.SqlClient" SelectCommand="SELECT 借阅信息表.借阅编号, 借阅信息表.读者信_读者账号, 读者信息表.读者姓名, 读者信息表.联系方式, 借阅信息表.图书信_图书编号, 图书信息表.书名, 图书信息表.剩余数量, 借阅信息表.借阅日期, 借阅信息表.借阅时长 FROM 借阅信息表 INNER JOIN 读者信息表 ON 借阅信息表.读者信_读者账号 = 读者信息表.读者账号 INNER JOIN 图书信息表 ON 借阅信息表.图书信_图书编号 = 图书信息表.图书编号"></asp:SqlDataSource>
           <hr />
            <br />
            <br />


            预期未还图书

            <br />
            <br />
             <asp:GridView ID="gv_yuqi" runat="server" AutoGenerateColumns="False" DataKeyNames="借阅编号" DataSourceID="SqlDataSource2" OnRowCommand="gv_yuqi_RowCommand">
                 <Columns>
                     <asp:BoundField DataField="借阅编号" HeaderText="借阅编号" ReadOnly="True" SortExpression="借阅编号" />
                     <asp:BoundField DataField="读者信_读者账号" HeaderText="读者信_读者账号" SortExpression="读者信_读者账号" />
                     <asp:BoundField DataField="读者姓名" HeaderText="读者姓名" SortExpression="读者姓名" />
                     <asp:BoundField DataField="联系方式" HeaderText="联系方式" SortExpression="联系方式" />
                     <asp:BoundField DataField="图书信_图书编号" HeaderText="图书信_图书编号" SortExpression="图书信_图书编号" />
                     <asp:BoundField DataField="书名" HeaderText="书名" SortExpression="书名" />
                     <asp:BoundField DataField="剩余数量" HeaderText="剩余数量" SortExpression="剩余数量" />
                     <asp:BoundField DataField="借阅日期" HeaderText="借阅日期" SortExpression="借阅日期" />
                     <asp:BoundField DataField="借阅时长" HeaderText="借阅时长" SortExpression="借阅时长" />
                     <asp:ButtonField HeaderText="邮件提醒" Text="发送邮件" />
                 </Columns>
            </asp:GridView>
            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=F:\终极闪光版\模拟网上图书馆\模拟网上图书馆\数据\模拟图书馆.mdf;Integrated Security=True;Connect Timeout=30" ProviderName="System.Data.SqlClient" SelectCommand="SELECT 借阅信息表.借阅编号, 借阅信息表.读者信_读者账号, 读者信息表.读者姓名, 读者信息表.联系方式, 借阅信息表.图书信_图书编号, 图书信息表.书名, 图书信息表.剩余数量, 借阅信息表.借阅日期, 借阅信息表.借阅时长 FROM 借阅信息表 INNER JOIN 读者信息表 ON 借阅信息表.读者信_读者账号 = 读者信息表.读者账号 INNER JOIN 图书信息表 ON 借阅信息表.图书信_图书编号 = 图书信息表.图书编号 where datediff(day,借阅日期,getdate())&gt;=day(借阅时长)"></asp:SqlDataSource>
    </div>


    </form>
</body>
</html>
