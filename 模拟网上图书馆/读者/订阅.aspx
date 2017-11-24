<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="订阅.aspx.cs" Inherits="模拟网上图书馆.读者.订阅1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="mysite" runat="server">

      <div class="divhtml"><a>我的订阅</a></div>       
            
            <div class="divhtml2">
                <asp:GridView ID="gv_jieyue" runat="server" AutoGenerateColumns="False" DataKeyNames="借阅编号" DataSourceID="SqlDataSource1">
                    <Columns>
                        <asp:BoundField DataField="借阅编号" HeaderText="借阅编号" ReadOnly="True" SortExpression="借阅编号" />
                        <asp:BoundField DataField="读者信_读者账号" HeaderText="读者信_读者账号" SortExpression="读者信_读者账号" />
                        <asp:BoundField DataField="图书信_图书编号" HeaderText="图书信_图书编号" SortExpression="图书信_图书编号" />
                        <asp:BoundField DataField="借阅日期" HeaderText="借阅日期" SortExpression="借阅日期" />
                        <asp:BoundField DataField="借阅时长" HeaderText="借阅时长" SortExpression="借阅时长" />
                    </Columns>
                </asp:GridView>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=F:\终极闪光版\模拟网上图书馆\模拟网上图书馆\数据\模拟图书馆.mdf;Integrated Security=True;Connect Timeout=30" ProviderName="System.Data.SqlClient" SelectCommand="SELECT * FROM [借阅信息表] WHERE ([读者信_读者账号] = @读者信_读者账号)">
                    <SelectParameters>
                        <asp:SessionParameter Name="读者信_读者账号" SessionField="userID" Type="String" />
                    </SelectParameters>
                </asp:SqlDataSource>
                <asp:Label ID="text_show" runat="server" ></asp:Label>
                <asp:GridView ID="gv_yuqi" runat="server"></asp:GridView>

                <asp:MultiView ID="MultiView1" runat="server">
                    <asp:View ID="borrow" runat="server">
                        <asp:Label ID="Label1" runat="server" Text="请确认以下信息无误："></asp:Label>
                        <asp:TextBox ID="text_sure" runat="server" TextMode="MultiLine" Height="200px" style="width: 300px; height: 150px; font-size: 18px;" ReadOnly="true" ></asp:TextBox>
                        <asp:Label ID="Label2" runat="server" Text="选择时长"></asp:Label>
                        <asp:DropDownList ID="DropDownList1" runat="server">
                            <asp:ListItem Value="10">10天</asp:ListItem>
                            <asp:ListItem Value="15">15天</asp:ListItem>
                            <asp:ListItem Value="25">25天</asp:ListItem>
                            <asp:ListItem Value="30">30天</asp:ListItem>
                            <asp:ListItem Value="45">45天</asp:ListItem>
                            <asp:ListItem Value="60">60天</asp:ListItem>
                        </asp:DropDownList>
                        <asp:Button ID="Button1" runat="server" Text="借阅" OnClick="Button1_Click" />
                    </asp:View>

                    <asp:View ID="return" runat="server">
                        <p>选择你要归还的图书：</p>
                        <asp:DropDownList ID="ddl_book" runat="server" DataSourceID="SqlDataSource2" DataTextField="图书信_图书编号" DataValueField="图书信_图书编号"></asp:DropDownList>
                        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=F:\终极闪光版\模拟网上图书馆\模拟网上图书馆\数据\模拟图书馆.mdf;Integrated Security=True;Connect Timeout=30" ProviderName="System.Data.SqlClient" SelectCommand="SELECT [图书信_图书编号] FROM [借阅信息表] WHERE ([读者信_读者账号] = @读者信_读者账号)">
                            <SelectParameters>
                                <asp:SessionParameter Name="读者信_读者账号" SessionField="userID" Type="String" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                        <asp:Button ID="btn_sure" runat="server" Text="确认归还" OnClick="btn_sure_Click" />
                    </asp:View>
                </asp:MultiView>
            </div>
</asp:Content>
