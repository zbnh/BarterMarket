<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Reg.aspx.cs" Inherits="Reg" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .auto-style1 {
            margin-right:;
        width: 100%;
        margin-top:80px;
        margin-bottom:80px;
    }
        .auto-style7 {
            width: 476px;
        }
        .auto-style14 {
            width: 476px;
            text-align: center;
            font-size: large;
            height: 30px;
            color:rgb(240,240,240);
            font-weight:bold;
        }
        .auto-style15 {
            height: 30px;
        }
        table span{color:rgb(40,40,40);font-weight:bold;}
</style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table class="auto-style1">
    <%--  <tr>
        <td class="auto-style2" colspan="2">注册账号</td>
    </tr>--%>
    <tr>
        <td class="auto-style14">&nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 账号：</td>
        <td class="auto-style15">
            <asp:TextBox ID="TextBox1" runat="server" Height="20px"></asp:TextBox>
            *<asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TextBox1" ErrorMessage="账号不得为空"></asp:RequiredFieldValidator>
            <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ControlToValidate="TextBox1" ErrorMessage="账号需由6~20位英文字母、数字或常用英文符号组成" ValidationExpression="^[a-zA-Z0-9]{6,20}$"></asp:RegularExpressionValidator>
        </td>
    </tr>
     <tr>
        <td class="auto-style14">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 密码：</td>
        <td class="auto-style15">
            <asp:TextBox ID="TextBox2" runat="server" TextMode="Password" Height="20px"></asp:TextBox>
            *<asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="TextBox2" ErrorMessage="密码不得为空"></asp:RequiredFieldValidator>
            <asp:RegularExpressionValidator ID="RegularExpressionValidator4" runat="server" ControlToValidate="TextBox2" ErrorMessage="密码需由6~16位英文字母、数字或常用英文符号组成" ValidationExpression="^[a-zA-Z0-9]{6,16}$"></asp:RegularExpressionValidator>
        </td>
    </tr>
    <tr>
        <td class="auto-style14">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 确认密码：</td>
        <td class="auto-style15">
            <asp:TextBox ID="TextBox3" runat="server" TextMode="Password" Height="20px"></asp:TextBox>
            *<asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="TextBox3" ErrorMessage="确认密码不得为空"></asp:RequiredFieldValidator>
            <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToCompare="TextBox2" ControlToValidate="TextBox3" ErrorMessage="两次输入的密码不一致，请重新输入"></asp:CompareValidator>
        </td>
    </tr>
    <tr>
        <td class="auto-style14">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 性别：</td>
        <td class="auto-style15">
            <asp:DropDownList ID="DropDownList1" runat="server">
                <asp:ListItem Selected="True">男</asp:ListItem>
                <asp:ListItem>女</asp:ListItem>
            </asp:DropDownList>
        </td>
    </tr>
      <tr>
        <td class="auto-style14">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 地址：</td>
        <td class="auto-style15">
            <asp:TextBox ID="TextBox4" runat="server" Height="20px"></asp:TextBox>
            *<asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="TextBox4" ErrorMessage="地址不得为空"></asp:RequiredFieldValidator>
        </td>
    </tr>
    <tr>
         <td class="auto-style14">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Email：</td>
        <td class="auto-style15">
            <asp:TextBox ID="TextBox5" runat="server"  Height="20px"></asp:TextBox>
            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="TextBox5" ErrorMessage="Email格式错误" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
        </td>
    </tr>
     <tr>
        <td class="auto-style14">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 电话：</td>
        <td class="auto-style15">
            <asp:TextBox ID="TextBox6" runat="server"  Height="20px"></asp:TextBox>
            <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="TextBox6" ErrorMessage="电话格式错误" ValidationExpression="^1[358]\d{9}$"></asp:RegularExpressionValidator>
        </td>
    </tr>
    <tr>
        <td class="auto-style14">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 昵称：</td>
        <td class="auto-style15">
            <asp:TextBox ID="TextBox7" runat="server" Height="20px"></asp:TextBox>
            *<asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="TextBox7" ErrorMessage="昵称不得为空"></asp:RequiredFieldValidator>
        </td>
    </tr>
     <tr>
        <td class="auto-style7">
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        </td>
        <td>
            <asp:Button ID="Button1" runat="server" Text="注册" style="text-align:center;font-size:18px;font-weight:bold;margin-top:30px;margin-left:-33px;" OnClick="Button1_Click" Height="33px" Width="75px" />
            <asp:ValidationSummary ID="ValidationSummary1" runat="server" ShowMessageBox="True" ShowSummary="False" />
        </td>
    </tr>
</table>
</asp:Content>

