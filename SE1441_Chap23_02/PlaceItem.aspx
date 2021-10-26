<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="PlaceItem.aspx.cs" Inherits="SE1441_Chap23_02.PlaceItem" %>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <p>
        <table style="width:100%;">
            <tr>
                <td class="auto-style12">
                    <asp:Label ID="Label1" runat="server" Text="Seller:"></asp:Label>
                </td>
                <td class="auto-style13">
                    <asp:DropDownList ID="ddlSeller" runat="server">
                    </asp:DropDownList>
                </td>
                <td class="auto-style14"></td>
            </tr>
            <tr>
                <td class="auto-style15">
                    <asp:Label ID="Label2" runat="server" Text="Item type:"></asp:Label>
                </td>
                <td class="auto-style16">
                    <asp:DropDownList ID="ddlItemType" runat="server">
                    </asp:DropDownList>
                </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style15">
                    <asp:Label ID="Label3" runat="server" Text="Item name:"></asp:Label>
                </td>
                <td class="auto-style16">
                    <asp:TextBox ID="txtItemName" runat="server" Width="247px"></asp:TextBox>
                </td>
                <td>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtItemName" ErrorMessage="Item name required!"></asp:RequiredFieldValidator>
                </td>
            </tr>
        </table>
        <table style="width:100%;">
            <tr>
                <td class="auto-style10">
                    <asp:Label ID="Label4" runat="server" Text="Item Description:"></asp:Label>
                </td>
                <td class="auto-style20">
                    <asp:TextBox ID="txtItemDes" runat="server" Width="247px"></asp:TextBox>
                </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style10">
                    <asp:Label ID="Label5" runat="server" Text="Current price:"></asp:Label>
                </td>
                <td class="auto-style20">
                    <asp:TextBox ID="txtCurrent" runat="server" Width="248px"></asp:TextBox>
                </td>
                <td>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtCurrent" ErrorMessage="Current price required!"></asp:RequiredFieldValidator>
                    <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToValidate="txtCurrent" ErrorMessage="Price &gt;= 0" Operator="GreaterThanEqual" ValueToCompare="0"></asp:CompareValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style10">
                    <asp:Label ID="Label6" runat="server" Text="Minimum bid increment:"></asp:Label>
                </td>
                <td class="auto-style20">
                    <asp:TextBox ID="txtMinimum" runat="server" Width="252px"></asp:TextBox>
                </td>
                <td>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtMinimum" ErrorMessage="Minimum bid increment required!"></asp:RequiredFieldValidator>
                    <asp:CompareValidator ID="CompareValidator2" runat="server" ControlToValidate="txtMinimum" ErrorMessage="Minimum bid increment &gt; 0" Operator="GreaterThan" ValueToCompare="0"></asp:CompareValidator>
                </td>
            </tr>
        </table>
        <table style="width:100%;">
            <tr>
                <td class="auto-style18">
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
                <td class="auto-style10">&nbsp;</td>
                <td class="auto-style20">
                    <asp:Button ID="btnPlace" runat="server" OnClick="btnPlace_Click" Text="Place" />
                </td>
                <td>
                    <asp:Button ID="btnCancer" runat="server" OnClick="btnCancer_Click" Text="Cancer" />
                </td>
            </tr>
            <tr>
                <td class="auto-style10">&nbsp;</td>
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
        .auto-style18 {
            width: 266px;
            height: 29px;
        }
        .auto-style20 {
            width: 289px;
        }
        .auto-style21 {
            width: 289px;
            height: 29px;
        }
    </style>
</asp:Content>

