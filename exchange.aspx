<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="exchange.aspx.cs" Inherits="exchange" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .auto-style1 {
            width: 100%;
            border:0px;
            margin:0px;
            padding:0px;
            background:rgba(102,197,189,0.7);
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="ititle" style="background-color: rgba(62,170,236,0.7)";>开始交换</div>
    <table class="auto-style1">
        <tr  >
            <td style="font-size:22px;font-weight:bold;color:white; margin-right:0px;">选择你的交换物：</td>
            <td>
                <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSource1" DataTextField="Item_Name" DataValueField="Item_ID">
                </asp:DropDownList>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:conn %>" SelectCommand="SELECT Item_ID, Item_User, Item_Type, Item_Name, Item_Pic, Item_Condition, Item_Describe, Hope_ItemName, Hope_Dest, Item_State, ClickNum, AddTime FROM t_item WHERE (Item_User = @UserID and Item_state = '0' )">
                    <SelectParameters>
                        <asp:SessionParameter Name="UserID" SessionField="UserID" />
                    </SelectParameters>
                </asp:SqlDataSource>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="DropDownList1" ErrorMessage="请选择你的物品！！！"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td style="font-size:22px;font-weight:bold;color:white; margin-right:0px;">备注:</td>
            <td>
                <asp:TextBox ID="TextBox1" runat="server" Columns="80" Rows="20" TextMode="MultiLine"></asp:TextBox>
            </td>
        </tr>
        <tr class="iexchangetop">
            <td>&nbsp;</td>
            <td>
                <asp:Button ID="Button2" runat="server" OnClick="Button2_Click" Text="申请" />
            </td>
        </tr>
    </table>
</asp:Content>

