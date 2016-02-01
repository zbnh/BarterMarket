<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage2.master" AutoEventWireup="true" CodeFile="publish.aspx.cs" Inherits="publish" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .auto-style1 {
            width: 100%;
        }
        .publishtext{resize:none;}
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
     <p  style="height: 40px;margin-top:10px;margin-left:45px;font-size:20px;font-weight:bold; padding-bottom:10px;">物品发布</p>
    <table  style="margin-left:80px"  class="auto-style1">
        <tr>
            <td>&nbsp;&nbsp;&nbsp;&nbsp;物品名称：</td>
            <td>
                <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
                （*必填）<asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TextBox1" ErrorMessage="物品名称不得为空"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td>&nbsp;&nbsp;&nbsp;&nbsp;物品分类：</td>
            <td>
                <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSource1" DataTextField="Type_Name" DataValueField="Type_ID">
                </asp:DropDownList>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:conn %>" SelectCommand="SELECT * FROM [t_itemtype]"></asp:SqlDataSource>
            </td>
        </tr>
        <tr>
            <td>&nbsp;&nbsp;&nbsp;&nbsp;物品新旧程度:</td>
            <td>
                <asp:DropDownList ID="DropDownList2" runat="server">
                    <asp:ListItem>全新</asp:ListItem>
                    <asp:ListItem>9成新</asp:ListItem>
                    <asp:ListItem>8成新</asp:ListItem>
                    <asp:ListItem>7成新</asp:ListItem>
                    <asp:ListItem>6成新</asp:ListItem>
                    <asp:ListItem>5成新</asp:ListItem>
                    <asp:ListItem>4成新</asp:ListItem>
                    <asp:ListItem>3成新</asp:ListItem>
                    <asp:ListItem>2成新</asp:ListItem>
                    <asp:ListItem>1成新</asp:ListItem>
                </asp:DropDownList>
                （*必填）<asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="DropDownList2" ErrorMessage="请选择新旧程度"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td style="padding-left:6px;">&nbsp;&nbsp;&nbsp;  想换什么：</td>
            <td>
                <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
                （*必填）<asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="TextBox2" ErrorMessage="想换什么不得为空"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td>&nbsp;&nbsp;&nbsp;&nbsp;希望的交易地：</td>
            <td>
                <asp:TextBox ID="TextBox5" runat="server"></asp:TextBox>
                （*必填）<asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="TextBox5" ErrorMessage="请填写希望的交易地点"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td>&nbsp;&nbsp;&nbsp;&nbsp;图片：</td>
            <td>
                <asp:FileUpload ID="FileUpload1" runat="server" />
            </td>
        </tr>
        <tr>
            <td>&nbsp;&nbsp;&nbsp;&nbsp;物品详情：</td>
            <td>
                <asp:TextBox ID="TextBox4" runat="server" Height="89px" TextMode="MultiLine" Width="270px" CssClass="publishtext"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <asp:Button ID="Button2" runat="server" Text="提交" OnClick="Button2_Click" style="margin-left:410px" />
            </td>
        </tr>
    </table>
</asp:Content>

