<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage2.master" AutoEventWireup="true" CodeFile="requestReceived.aspx.cs" Inherits="requestReceived" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <p  style="height: 40px;margin-top:10px;margin-left:45px;font-size:20px;font-weight:bold; padding-bottom:10px;">我收到的交换请求</p>
    <div class="div_rq_sent" style="padding-left:60px;">
    <asp:GridView ID="GridView1" Cssclass="border_rq_sent" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="Exchange_ID" DataSourceID="SqlDataSource1" OnRowCommand="GridView1_RowCommand">
         <Columns>
            <asp:BoundField DataField="Exchange_ID" HeaderText="交换单号" InsertVisible="False" ReadOnly="True" SortExpression="Exchange_ID" />
            <asp:BoundField DataField="我的" HeaderText="我的" SortExpression="我的" />
            <asp:BoundField DataField="TA的" HeaderText="TA的" ReadOnly="True" SortExpression="TA的" />
            <asp:BoundField DataField="交换申请时间" HeaderText="交换申请时间" SortExpression="交换申请时间" />
            <asp:BoundField DataField="留言" HeaderText="留言" SortExpression="留言" />
            <asp:BoundField DataField="谁" HeaderText="昵称" SortExpression="谁" />
            <asp:BoundField DataField="交换状态" HeaderText="交换状态" ReadOnly="True" SortExpression="交换状态" />
            <asp:TemplateField HeaderText="操作" >
                <ItemTemplate>
                    <asp:Button ID="agree" CommandName="agree" CommandArgument='<%# Eval("Exchange_ID") %>' runat="server" Text="同意"/>
                    <asp:Button ID="disagree" CommandName="disagree" CommandArgument='<%# Eval("Exchange_ID") %>' runat="server" Text="拒绝"  />
                </ItemTemplate>
            </asp:TemplateField>

        </Columns>
    </asp:GridView></div>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:conn %>" SelectCommand="SELECT t_exchange.Exchange_ID, t_item_1.Item_Name AS 我的, (SELECT Item_Name FROM t_item WHERE (Item_ID = t_exchange.ItemIown_ID)) AS TA的, t_exchange.Exchange_ReDate AS 交换申请时间, t_exchange.Exchange_Message AS 留言, t_user.UserName AS 谁, CASE Exchange_State WHEN '0' THEN '交换中' WHEN '1' THEN '交换成功' WHEN '2' THEN '交换失败' END AS 交换状态 FROM t_exchange INNER JOIN t_item AS t_item_1 ON t_exchange.ItemWanna_ID = t_item_1.Item_ID INNER JOIN t_user ON t_exchange.Exchange_User = t_user.UserID WHERE (t_exchange.ToUser_ID = @UserID and t_exchange.exchange_state =0) ORDER BY 交换申请时间 DESC">
        <SelectParameters>
            <asp:SessionParameter Name="UserID" SessionField="UserID" />
        </SelectParameters>
    </asp:SqlDataSource>
    </asp:Content>

