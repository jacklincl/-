<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="显示时间.ascx.cs" Inherits="模拟网上图书馆.简单的自定义控件.显示时间" %>

<style type="text/css" >

</style>
<script src="../Scripts/jquery-3.1.1.js" type="text/javascript" ></script>
<script>

</script>


<div>
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
          <p> <%=DateTime.Now.ToString () %> </p> 
          <asp:Timer ID="Timer1" runat="server" Interval="1000"></asp:Timer>
        </ContentTemplate>
    </asp:UpdatePanel>

</div>