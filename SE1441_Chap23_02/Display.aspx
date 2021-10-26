<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Display.aspx.cs" Inherits="SE1441_Chap23_02.Display" %>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<asp:Label ID="Label1" runat="server" Text="Seller:"></asp:Label>
<asp:DropDownList ID="DropDownListSeller" runat="server" Height="49px" style="margin-left: 65px" Width="322px" OnSelectedIndexChanged="DropDownListSeller_SelectedIndexChanged" AutoPostBack="True">
</asp:DropDownList>
<br />
<br />
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<asp:Label ID="Label2" runat="server" Text="Item:"></asp:Label>
<asp:DropDownList ID="DropDownListItem" runat="server" Height="25px" style="margin-left: 62px" Width="327px" AutoPostBack="True">
</asp:DropDownList>
&nbsp;&nbsp;&nbsp;
    <asp:Label ID="lblCheck" runat="server" Text="  "></asp:Label>
<asp:Button ID="Button1" runat="server" style="margin-left: 70px" Text="Search" OnClick="Button1_Click" />
<br />
<br />
<asp:Label ID="Label3" runat="server" Text="List of bids:"></asp:Label>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <asp:Label ID="lblResult" runat="server" Text="    "></asp:Label>
    <br />
    <asp:GridView ID="GridView1" runat="server" Height="160px" Width="521px" style="margin-top: 20px">

    </asp:GridView>
<br />
&nbsp;&nbsp;&nbsp;
&nbsp;&nbsp;
<br />
<br />
</asp:Content>
<asp:Content ID="Content3" runat="server" contentplaceholderid="HeadContent">
    </asp:Content>

