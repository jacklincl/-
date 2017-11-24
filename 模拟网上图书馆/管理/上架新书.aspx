<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="上架新书.aspx.cs" Inherits="模拟网上图书馆.管理.上架新书" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css" >
        .water_style {
            color: silver;
            background-color: #eaeaea;
        }
    </style>
    </head>
<body>
    <form id="form1" runat="server">
    <div class="main">

        <myatk:ToolkitScriptManager runat="server"></myatk:ToolkitScriptManager>

    <h1 style="width: 300px;position: relative;left: 400px;">在下面填写新书信息</h1>
        <asp:Label ID="Label1" runat="server" Text="编号"  style="text-align :right;height :30px;" Width="500px"></asp:Label>
        <asp:TextBox ID="text_id" runat="server" autocomplete="off" ></asp:TextBox>

            <myatk:FilteredTextBoxExtender ID="text_id_FilteredTextBoxExtender" runat="server" Enabled="True" TargetControlID="text_id" FilterType="Numbers">
        </myatk:FilteredTextBoxExtender>

            <myatk:TextBoxWatermarkExtender ID="text_id_TextBoxWatermarkExtender" 
                runat="server" Enabled="True" 
                TargetControlID="text_id"
                WatermarkText="输入纯数字" WatermarkCssClass="water_style"></myatk:TextBoxWatermarkExtender>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="新书编号不能为空" ControlToValidate="text_id"></asp:RequiredFieldValidator>
        <br />
        <asp:Label ID="Label2" runat="server" Text="书名" style="text-align :right ;height :30px;" Width="500px"></asp:Label>
        <asp:TextBox ID="text_name" runat="server" autocomplete="off" ></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="新书书名不能为空" ControlToValidate="text_name"></asp:RequiredFieldValidator>
        <br />
        <asp:Label ID="Label3" runat="server" Text="作者" style="text-align :right;height :30px;" Width="500px"></asp:Label>
        <asp:TextBox ID="text_writer" runat="server" autocomplete="off" ></asp:TextBox>
        <br />
        <asp:Label ID="Label4" runat="server" Text="出版社" style="text-align :right ;height :30px;" Width="500px"></asp:Label>
        <asp:TextBox ID="text_press" runat="server" autocomplete="off" ></asp:TextBox>

        <br />
        <asp:Label ID="Label5" runat="server" Text="出版日期" style="text-align :right ;height :30px;" Width="500px"></asp:Label>
        <asp:TextBox ID="text_date" runat="server" autocomplete="off" ></asp:TextBox>

        <myatk:FilteredTextBoxExtender ID="text_date_FilteredTextBoxExtender" runat="server" Enabled="True" FilterType="Custom, Numbers" TargetControlID="text_date" ValidChars="/">
        </myatk:FilteredTextBoxExtender>

        <myatk:TextBoxWatermarkExtender ID="text_date_TextBoxWatermarkExtender" runat="server" Enabled="True" TargetControlID="text_date" WatermarkText="yyyy/mm/dd" WatermarkCssClass="water_style">
        </myatk:TextBoxWatermarkExtender>

        <br />
        <asp:Label ID="Label6" runat="server" Text="上架日期" style="text-align :right ;height :30px;" Width="500px"></asp:Label>
        <asp:TextBox ID="text_pressdate" runat="server" autocomplete="off" Enabled="False" ></asp:TextBox>
        <br />
        <asp:Label ID="Label7" runat="server" Text="简介" style="text-align :right ;height :30px;" Width="500px"></asp:Label>
        <asp:TextBox ID="text_brief" runat="server" autocomplete="off" ></asp:TextBox>
        <br />
        <asp:Label ID="Label8" runat="server" Text="所属类型" style="text-align :right ;height :30px;" Width="500px"></asp:Label>
        <asp:DropDownList ID="DropDownList1" runat="server" Width="153px" DataSourceID="SqlDataSource1" DataTextField="类型名称" DataValueField="类型编号">
            <asp:ListItem></asp:ListItem>
            <asp:ListItem></asp:ListItem>
            <asp:ListItem></asp:ListItem>
        </asp:DropDownList>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=F:\终极闪光版\模拟网上图书馆\模拟网上图书馆\数据\模拟图书馆.mdf;Integrated Security=True;Connect Timeout=30" ProviderName="System.Data.SqlClient" SelectCommand="SELECT * FROM [图书类型表]"></asp:SqlDataSource>
        <br />
        <asp:Label ID="Label9" runat="server" Text="单价" style="text-align :right ;height :30px;" Width="500px"></asp:Label>
        <asp:TextBox ID="text_price" runat="server"  autocomplete="off" ></asp:TextBox>
        <br />
        <asp:Label ID="Label10" runat="server" Text="上架数量" style="text-align :right ;height :30px;" Width="500px"></asp:Label>
        <asp:TextBox ID="text_number" runat="server"  autocomplete="off" ></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="text_number" ErrorMessage="上架数量应该大于0" MinimumValue="1" Type="Integer" ></asp:RequiredFieldValidator>
        <br />
        <br />
        <asp:Label ID="Label11" runat="server" Text="选择文件源" style="text-align :right ;height :30px;" Width="500px"></asp:Label>
        <asp:FileUpload ID="upload" runat="server" />
        <br />
        <br />
        <br />
        <asp:Button ID="Button1" style=" position: relative;left: 530px;top: -100px;width: 100px;height: 30px;" runat="server" Text="上传" OnClick="Button1_Click" />
        <asp:TextBox ID="error" runat="server" style="text-align :center;position: relative;left: 100px;top: 30px" Width="800px" Height="100px" TextMode="MultiLine"></asp:TextBox>
    </div>
    </form>
</body>
</html>
