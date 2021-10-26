<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ItemGUI.aspx.cs" Inherits="SE1441_Chap23_02.ItemGUI" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <style type="text/css">
        .auto-style1 {
            width: 226px;
        }
        .auto-style2 {
            width: 215px;
        }
        .auto-style3 {
            margin-left: 200px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <p>
        Bidder:
        <asp:DropDownList ID="ddlBidder" runat="server">
        </asp:DropDownList>
        <br />
        <table style="width:100%;">
            <tr>
                <td class="auto-style1">Item name:<asp:DropDownList ID="ddlItemName" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddlItemName_SelectedIndexChanged">
                    </asp:DropDownList>
                </td>
                <td class="auto-style2">&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style1">Item Description: </td>
                <td class="auto-style2">
                    <asp:TextBox ID="txtItemDescription" runat="server"></asp:TextBox>
                </td>
                <td>Seller:<asp:TextBox ID="txtSeller" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style1">Current price:</td>
                <td class="auto-style2">
                    <asp:TextBox ID="txtCurrentPrice" runat="server"></asp:TextBox>
                </td>
                <td>Minimum bid increment:<asp:TextBox ID="txtMbi" runat="server"></asp:TextBox>
                </td>
            </tr>
        </table>
    </p>
    <p>
        End date time:<asp:TextBox ID="txtEdt" runat="server"></asp:TextBox>
    </p>
    <p>
        Bid date time:<asp:Label ID="labelTime" runat="server" Text="Label"></asp:Label>
    </p>
    <p>
        Time remaining(dd, hh:mm):<asp:Label ID="labelTimeRe" runat="server" Text="Label"></asp:Label>
    </p>
    <p>
        Bid price:<asp:TextBox ID="txtBidPirce" runat="server"></asp:TextBox>
    </p>
    <p>
        &nbsp;</p>
    <p class="auto-style3">
        <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Bid" />
    </p>
    <p>
        &nbsp;</p>
    <p>
    </p>
</asp:Content>
