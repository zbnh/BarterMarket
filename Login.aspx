<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="Login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
 .auto-style1 {
        width: 100%;
            height: 279px;
        }
    .auto-style3 {
            padding-left:470px;
            height: 5px;
            font-size:20px;font-weight:bold;
            padding-top:30px;padding-bottom:30px;
            color:#efefef;
        }
        #Button2{text-align:center;font-size:20px;
            margin-top: 3px;
        }
        #Button1{text-align:center;font-size:20px;
            margin-top: 3px;
        }
        .auto-style11 {
            height: 25px;
           padding-bottom:30px;
        }
        .auto-style17 {
            text-align: right;
            width: 434px;
            height: 12px;
            color:rgb(240,240,240);
            font-weight:bold;
        }
        .auto-style18 {
            height: 12px;
        }
        table a{color:rgb(140,140,140);}
</style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table class="auto-style1">
    <tr>
        <td class="auto-style3" colspan="2">登录</td>
    </tr>
    <tr>
        <td class="auto-style17">账号：</td>
        <td class="auto-style18">
            <asp:TextBox ID="TextBox1" runat="server" Height="20px" style="margin-bottom: 0px"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TextBox1" ErrorMessage="账号不得为空"></asp:RequiredFieldValidator>
            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="TextBox1" ErrorMessage="账号格式错误" ValidationExpression="^[a-zA-Z0-9]{6,20}$"></asp:RegularExpressionValidator>
        </td>
    </tr>
   <tr>
        <td class="auto-style17">密码：</td>
        <td class="auto-style18">
            <asp:TextBox ID="TextBox2" runat="server" TextMode="Password" Height="20px"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="TextBox2" ErrorMessage="密码不得为空"></asp:RequiredFieldValidator>
            <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="TextBox2" ErrorMessage="密码格式错误" ValidationExpression="^[a-zA-Z0-9]{6,16}$"></asp:RegularExpressionValidator>
        </td>
    </tr>
   <tr>
        <td class="auto-style17">验证码：</td>
        <td class="auto-style18">
            <asp:TextBox ID="TextBox3" runat="server"></asp:TextBox>
            <%--<img alt="看不清？请点击" src="~/ValidateCode.ashx" style="height: 16px"  onclick="this.src = '~/ValidateCode.ashx?'" runat="server"/>--%>
            <asp:Image ID="Image1" runat="server" ImageUrl="~/ValidateCode.ashx" />
            <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False">看不清？点击刷新验证码</asp:LinkButton>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="TextBox3" ErrorMessage="验证码不得为空"></asp:RequiredFieldValidator>
            
        </td>
    </tr>
   <tr>
        <td colspan="2" class="auto-style11">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:Button ID="Button1" runat="server" OnClick="Button1_Click" style="text-align: center;margin-left:395px;" Text="登录" Height="35px" Width="60px" />
            &nbsp;&nbsp;&nbsp;
            <asp:Button ID="Button2" runat="server" OnClick="Button2_Click" Text="注册" CausesValidation="False" PostBackUrl="~/Reg.aspx" UseSubmitBehavior="False" Height="35px" Width="60px" />
        </td>
    </tr>
</table>
</asp:Content>

