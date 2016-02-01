<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="SearchType.aspx.cs" Inherits="SearchType" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:ListView ID="ListView1" runat="server" DataKeyNames="Item_ID" DataSourceID="SqlDataSource1" GroupItemCount="3">
        <AlternatingItemTemplate>
            <td runat="server" style="background-color: #FFFFFF;color: #284775;">
                <asp:Label ID="Item_NameLabel" runat="server" Text='<%# Eval("Item_Name") %>' />
                <br />
                <%--<asp:Label ID="Item_PicLabel" runat="server" Text='<%# Eval("Item_Pic") %>' />--%>
                 <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl='<%# Bind("Item_ID","ItemDetailDemo.aspx?Item_ID={0}")%>'>
                <asp:Image ID="Item_PicLabel" ImageUrl='<%# Bind("Item_Pic","userpic/{0}")%>' width="326" height="183" runat="server" />
              </asp:HyperLink> 
                <br />
                <asp:Label ID="Item_ConditionLabel" runat="server" Text='<%# Eval("Item_Condition") %>' />
                <br />
                <asp:Label ID="AddTimeLabel" runat="server" Text='<%# Eval("AddTime") %>' />
                <br />
                <asp:Label ID="UserNameLabel" runat="server" Text='<%# Eval("UserName") %>' />
                <br />
                <asp:Label ID="Type_NameLabel" runat="server" Text='<%# Eval("Type_Name") %>' />
                <br />
                <asp:Label ID="Hope_DestLabel" runat="server" Text='<%# Eval("Hope_Dest") %>' />
                <br />Item_ID:
                <asp:Label ID="Item_IDLabel" runat="server" Text='<%# Eval("Item_ID") %>' />
                <br /></td>
        </AlternatingItemTemplate>
        <EditItemTemplate>
            <td runat="server" style="background-color: #999999;">Item_Name:
                <asp:TextBox ID="Item_NameTextBox" runat="server" Text='<%# Bind("Item_Name") %>' />
                <br />Item_Pic:
                <asp:TextBox ID="Item_PicTextBox" runat="server" Text='<%# Bind("Item_Pic") %>' />
                <br />Item_Condition:
                <asp:TextBox ID="Item_ConditionTextBox" runat="server" Text='<%# Bind("Item_Condition") %>' />
                <br />AddTime:
                <asp:TextBox ID="AddTimeTextBox" runat="server" Text='<%# Bind("AddTime") %>' />
                <br />UserName:
                <asp:TextBox ID="UserNameTextBox" runat="server" Text='<%# Bind("UserName") %>' />
                <br />Type_Name:
                <asp:TextBox ID="Type_NameTextBox" runat="server" Text='<%# Bind("Type_Name") %>' />
                <br />Hope_Dest:
                <asp:TextBox ID="Hope_DestTextBox" runat="server" Text='<%# Bind("Hope_Dest") %>' />
                <br />Item_ID:
                <asp:Label ID="Item_IDLabel1" runat="server" Text='<%# Eval("Item_ID") %>' />
                <br />
                <asp:Button ID="UpdateButton" runat="server" CommandName="Update" Text="Update" />
                <br />
                <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Cancel" />
                <br /></td>
        </EditItemTemplate>
        <EmptyDataTemplate>
            <table runat="server" style="background-color: #FFFFFF;border-collapse: collapse;border-color: #999999;border-style:none;border-width:1px;">
                <tr>
                    <td>No data was returned.</td>
                </tr>
            </table>
        </EmptyDataTemplate>
        <EmptyItemTemplate>
<td runat="server" />
        </EmptyItemTemplate>
        <GroupTemplate>
            <tr id="itemPlaceholderContainer" runat="server">
                <td id="itemPlaceholder" runat="server"></td>
            </tr>
        </GroupTemplate>
        <InsertItemTemplate>
            <td runat="server" style="">Item_Name:
                <asp:TextBox ID="Item_NameTextBox" runat="server" Text='<%# Bind("Item_Name") %>' />
                <br />Item_Pic:
                <asp:TextBox ID="Item_PicTextBox" runat="server" Text='<%# Bind("Item_Pic") %>' />
                <br />Item_Condition:
                <asp:TextBox ID="Item_ConditionTextBox" runat="server" Text='<%# Bind("Item_Condition") %>' />
                <br />AddTime:
                <asp:TextBox ID="AddTimeTextBox" runat="server" Text='<%# Bind("AddTime") %>' />
                <br />UserName:
                <asp:TextBox ID="UserNameTextBox" runat="server" Text='<%# Bind("UserName") %>' />
                <br />Type_Name:
                <asp:TextBox ID="Type_NameTextBox" runat="server" Text='<%# Bind("Type_Name") %>' />
                <br />Hope_Dest:
                <asp:TextBox ID="Hope_DestTextBox" runat="server" Text='<%# Bind("Hope_Dest") %>' />
                <br />
                <asp:Button ID="InsertButton" runat="server" CommandName="Insert" Text="Insert" />
                <br />
                <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Clear" />
                <br /></td>
        </InsertItemTemplate>
        <ItemTemplate>
            <td runat="server" style="background-color: #E0FFFF;color: #333333;">
                <asp:Label ID="Item_NameLabel" runat="server" Text='<%# Eval("Item_Name") %>' />
                <br />
            <%--    <asp:Label ID="Item_PicLabel" runat="server" Text='<%# Eval("Item_Pic") %>' />--%>
                 <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl='<%# Bind("Item_ID","ItemDetailDemo.aspx?Item_ID={0}")%>'>
                <asp:Image ID="Item_PicLabel" ImageUrl='<%# Bind("Item_Pic","userpic/{0}")%>' width="326" height="183" runat="server" />
              </asp:HyperLink> 
                <br />
                <asp:Label ID="Item_ConditionLabel" runat="server" Text='<%# Eval("Item_Condition") %>' />
                <br />
                <asp:Label ID="AddTimeLabel" runat="server" Text='<%# Eval("AddTime") %>' />
                <br />
                <asp:Label ID="UserNameLabel" runat="server" Text='<%# Eval("UserName") %>' />
                <br />
                <asp:Label ID="Type_NameLabel" runat="server" Text='<%# Eval("Type_Name") %>' />
                <br />
                <asp:Label ID="Hope_DestLabel" runat="server" Text='<%# Eval("Hope_Dest") %>' />
                <br />Item_ID:
                <asp:Label ID="Item_IDLabel" runat="server" Text='<%# Eval("Item_ID") %>' />
                <br /></td>
        </ItemTemplate>
        <LayoutTemplate>
            <table runat="server">
                <tr runat="server">
                    <td runat="server">
                        <table id="groupPlaceholderContainer" runat="server" border="1" style="background-color: #FFFFFF;border-collapse: collapse;border-color: #999999;border-style:none;border-width:1px;font-family: Verdana, Arial, Helvetica, sans-serif;">
                            <tr id="groupPlaceholder" runat="server">
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr runat="server">
                    <td runat="server" style="text-align: center;background-color: #5D7B9D;font-family: Verdana, Arial, Helvetica, sans-serif;color: #FFFFFF">
                        <asp:DataPager ID="DataPager1" runat="server" PageSize="12">
                            <Fields>
                                <asp:NextPreviousPagerField ButtonType="Button" ShowFirstPageButton="True" ShowNextPageButton="False" ShowPreviousPageButton="False" />
                                <asp:NumericPagerField />
                                <asp:NextPreviousPagerField ButtonType="Button" ShowLastPageButton="True" ShowNextPageButton="False" ShowPreviousPageButton="False" />
                            </Fields>
                        </asp:DataPager>
                    </td>
                </tr>
            </table>
        </LayoutTemplate>
        <SelectedItemTemplate>
            <td runat="server" style="background-color: #E2DED6;font-weight: bold;color: #333333;">Item_Name:
                <asp:Label ID="Item_NameLabel" runat="server" Text='<%# Eval("Item_Name") %>' />
                <br />Item_Pic:
                <asp:Label ID="Item_PicLabel" runat="server" Text='<%# Eval("Item_Pic") %>' />
                <br />Item_Condition:
                <asp:Label ID="Item_ConditionLabel" runat="server" Text='<%# Eval("Item_Condition") %>' />
                <br />AddTime:
                <asp:Label ID="AddTimeLabel" runat="server" Text='<%# Eval("AddTime") %>' />
                <br />UserName:
                <asp:Label ID="UserNameLabel" runat="server" Text='<%# Eval("UserName") %>' />
                <br />Type_Name:
                <asp:Label ID="Type_NameLabel" runat="server" Text='<%# Eval("Type_Name") %>' />
                <br />Hope_Dest:
                <asp:Label ID="Hope_DestLabel" runat="server" Text='<%# Eval("Hope_Dest") %>' />
                <br />Item_ID:
                <asp:Label ID="Item_IDLabel" runat="server" Text='<%# Eval("Item_ID") %>' />
                <br /></td>
        </SelectedItemTemplate>
    </asp:ListView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:conn %>" SelectCommand="SELECT t_item.Item_Name, t_item.Item_Pic, t_item.Item_Condition, t_item.AddTime, t_user.UserName, t_itemtype.Type_Name, t_item.Hope_Dest, t_item.Item_ID FROM t_item INNER JOIN t_user ON t_item.Item_User = t_user.UserID INNER JOIN t_itemtype ON t_item.Item_Type = t_itemtype.Type_ID WHERE (t_item.Item_Type LIKE @Item_Type and t_item.Item_State ='0') ORDER BY t_item.AddTime DESC">
        <SelectParameters>
            <asp:QueryStringParameter Name="Item_Type" QueryStringField="Item_Type" />
        </SelectParameters>
    </asp:SqlDataSource>
</asp:Content>

