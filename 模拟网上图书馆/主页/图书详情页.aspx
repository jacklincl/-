<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="图书详情页.aspx.cs" Inherits="模拟网上图书馆.主页.图书详情页" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>图书详情页</title>
    <link href="../样式表/图书详情.css" rel="stylesheet" />
    <script src="../Scripts/jquery-3.1.1.js" type="text/javascript"></script>
    <script src="../js、jQuery/图书详情.js"></script>

</head>
<body>
       <form id="form1" runat="server">
    <asp:MultiView ID="MultiView1" runat="server">
        <asp:View ID="View1" runat="server">
            <myatk:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server"></myatk:ToolkitScriptManager>
            图书详细信息
            <hr />
             <div class="left">
        <asp:Panel ID="pn" runat="server">
           
        </asp:Panel>
    </div>
        <div class="right">
            <asp:TextBox ID="text_id" runat="server" ></asp:TextBox>
            <asp:Button ID="download" runat="server" Text="下载此文本" OnClick="download_Click" />
            <asp:Button ID="Button1" runat="server" Text="更多" />

            <myatk:ModalPopupExtender ID="Button1_ModalPopupExtender" runat="server" 
                DynamicServicePath="" Enabled="True" 
                TargetControlID="Button1" 
                PopupControlID="Panel1" 
                BackgroundCssClass="popBack"
                OkControlID="btn_souc"
                CancelControlID="btn_jiey">
            </myatk:ModalPopupExtender>

            <asp:Panel ID="Panel1" runat="server" CssClass="popOuter">
                 <div>                    
                <asp:Button ID="btn_souc" CssClass="btn" runat="server" Text="收藏" />
                <asp:Button ID="btn_jiey" CssClass="btn" runat="server" Text="借阅" />
            </div>
            </asp:Panel>

            <asp:UpdatePanel ID="UpdatePanel1" runat="server">

                <ContentTemplate >
                    <asp:Label ID="Label1" runat="server" Text="设置当前字体大小"></asp:Label>
                    <asp:TextBox ID="TextBox1" runat="server" Text="20"></asp:TextBox>
                    <asp:TextBox ID="detail" runat="server" Height="503" ReadOnly="true" TextMode="MultiLine" Width="500"></asp:TextBox>

                </ContentTemplate>
            </asp:UpdatePanel>



        </div>  
                   
            <asp:Panel ID="pl" runat="server">
                    <asp:TextBox ID="text_new" runat="server" TextMode="MultiLine"></asp:TextBox>
                    <asp:Button ID="Button2" runat="server" Text="发布评论" OnClick="Button2_Click" />
                    <myatk:TextBoxWatermarkExtender ID="text_new_TextBoxWatermarkExtender" runat="server" Enabled="True" TargetControlID="text_new" WatermarkText="在这里留下你的评价，以帮助更多读者了解这本书！" WatermarkCssClass="water_new">
                    </myatk:TextBoxWatermarkExtender>
                <asp:Panel ID="P_pl" runat="server">    
                </asp:Panel>
            </asp:Panel>
        </asp:View>
        <asp:View ID="View2" runat="server">

            <h1>&nbsp这个页面表示你使用了不允许的浏览方式<br/>&nbsp&nbsp5秒钟后将跳回浏览页...</h1>
        </asp:View>


    </asp:MultiView>
 
   
    </form>
</body>
</html>
