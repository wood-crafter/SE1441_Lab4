<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="PlaceItem.aspx.cs" Inherits="SE1441_Chap23_02.PlaceItem" %>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <p>
        <table style="width:100%;">
            <tr>
                <td class="auto-style12">
                    <asp:Label ID="Label1" runat="server" Text="Seller:"></asp:Label>
                </td>
                <td class="auto-style13">
                    <asp:DropDownList ID="ddlSeller" runat="server" AutoPostBack="True">
                    </asp:DropDownList>
                </td>
                <td class="auto-style14"></td>
            </tr>
            <tr>
                <td class="auto-style15">
                    <asp:Label ID="Label2" runat="server" Text="Item type:"></asp:Label>
                </td>
                <td class="auto-style16">
                    <asp:DropDownList ID="ddlItemType" runat="server" AutoPostBack="True">
                    </asp:DropDownList>
                </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style15">
                    <asp:Label ID="Label3" runat="server" Text="Item name:"></asp:Label>
                </td>
                <td class="auto-style16">
                    <asp:TextBox ID="txtItemName" runat="server" CssClass="auto-style27" Width="247px"></asp:TextBox>
                </td>
                <td>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtItemName" ErrorMessage="Item name required!"></asp:RequiredFieldValidator>
                </td>
            </tr>
        </table>
        <table class="auto-style23">
            <tr>
                <td class="auto-style10">
                    <asp:Label ID="Label4" runat="server" Text="Item Description:"></asp:Label>
                </td>
                <td class="auto-style24">
                    <asp:TextBox ID="txtItemDes" runat="server" Width="247px"></asp:TextBox>
                </td>
                <td class="auto-style22">&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style10">
                    <asp:Label ID="Label5" runat="server" Text="Current price:"></asp:Label>
                </td>
                <td class="auto-style24">
                    <asp:TextBox ID="txtCurrent" runat="server" Width="248px"></asp:TextBox>
                </td>
                <td class="auto-style22">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtCurrent" ErrorMessage="Current price required!"></asp:RequiredFieldValidator>
                    <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToValidate="txtCurrent" ErrorMessage="Price &gt;= 0" Operator="GreaterThanEqual" Type="Double" ValueToCompare="0"></asp:CompareValidator>
                    <asp:CompareValidator ID="CompareValidator3" runat="server" ControlToValidate="txtCurrent" ErrorMessage="Must be a double!" Type="Double"></asp:CompareValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style10">
                    <asp:Label ID="Label6" runat="server" Text="Minimum bid increment:"></asp:Label>
                </td>
                <td class="auto-style24">
                    <asp:TextBox ID="txtMinimum" runat="server" Width="248px"></asp:TextBox>
                </td>
                <td class="auto-style22">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtMinimum" ErrorMessage="Minimum bid increment required!"></asp:RequiredFieldValidator>
                    <asp:CompareValidator ID="CompareValidator2" runat="server" ControlToValidate="txtMinimum" ErrorMessage="Minimum bid increment &gt; 0" Operator="GreaterThan" Type="Double" ValueToCompare="0"></asp:CompareValidator>
                </td>
            </tr>
        </table>
        <table style="width:100%;">
            <tr>
                <td class="auto-style25">
                    <asp:Label ID="Label7" runat="server" Text="End date time (dd/MM/yyyy ,HH:mm)"></asp:Label>
                    :</td>
                <td class="auto-style21">
                    <asp:TextBox ID="txtEndDateTime" runat="server" Width="249px"></asp:TextBox>
                </td>
                <td class="auto-style14">
                    <asp:CustomValidator ID="CustomValidator1" runat="server" ControlToValidate="txtEndDateTime" ErrorMessage="Format must be dd/MM/yyyy, HH:mm" OnServerValidate="CustomValidator1_ServerValidate"></asp:CustomValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style26">&nbsp;</td>
                <td class="auto-style20">
                    <asp:Button ID="btnPlace" runat="server" OnClick="btnPlace_Click" Text="Place" Width="70px" />
                </td>
                <td>
                    <asp:Button ID="btnCancer" runat="server" OnClick="btnCancer_Click" Text="Cancel" />
                </td>
            </tr>
            <tr>
                <td class="auto-style26">&nbsp;</td>
                <td class="auto-style20">&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
        </table>
    </p>
</asp:Content>
<asp:Content ID="Content3" runat="server" contentplaceholderid="HeadContent">
    <style type="text/css">
        .auto-style10 {
            width: 266px;
        }
        .auto-style12 {
            width: 265px;
            height: 29px;
        }
        .auto-style13 {
            width: 290px;
            height: 29px;
        }
        .auto-style14 {
            height: 29px;
        }
        .auto-style15 {
            width: 265px;
        }
        .auto-style16 {
            width: 290px;
        }
        .auto-style20 {
            width: 289px;
        }
        .auto-style21 {
            width: 289px;
            height: 29px;
        }
        .auto-style22 {
            width: 442px;
        }
        .auto-style23 {
            width: 100%;
        }
        .auto-style24 {
            width: 292px;
        }
        .auto-style25 {
            width: 262px;
            height: 29px;
        }
        .auto-style26 {
            width: 262px;
        }
        .auto-style27 {
            margin-left: 0px;
        }
    </style>
</asp:Content>

