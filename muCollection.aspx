<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage2.master" AutoEventWireup="true" CodeFile="muCollection.aspx.cs" Inherits="muCollection" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style>
        #ContentPlaceHolder1_ListView1_ctr10_itemPlaceholderContainer td{text-align:center;}
        #ContentPlaceHolder1_ListView1_DataPager1{margin-left:310px;} 
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <table style="width: 800px;">
        <tr>
            <td>
                <asp:ListView ID="ListView1" runat="server" DataSourceID="SqlDataSource1" GroupItemCount="3" DataKeyNames="Item_ID,UserID">
                    <AlternatingItemTemplate>
                        <td runat="server" style="">
                
                            <div style="width:253px;height:253px;">
                            <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl='<%# Eval("Item_ID","ItemDetailDemo.aspx?Item_ID={0}")%>' Target="_blank">
                            <asp:Image ID="物品图片Label" ImageUrl='<%# Eval("物品图片","userpic/{0}")%>' width="253"  runat="server" />
                                </asp:HyperLink> 
                            </div>
                            
                            <br />
                              <asp:HyperLink ID="HyperLink2" runat="server" NavigateUrl='<%# Eval("Item_ID","ItemDetailDemo.aspx?Item_ID={0}")%>' Target="_blank">
                            <asp:Label ID="物品名称Label" runat="server" Text='<%# Eval("物品名称") %>' />
                                  </asp:HyperLink> 
                            <br />
                <asp:Label ID="物品状态Label" runat="server" Text='<%# Eval("物品状态") %>' />
                            <br />
                           
                            <asp:Button ID="DeleteButton" runat="server" CommandName="Delete" Text="删除" />
                            <br />
                        </td>
                    </AlternatingItemTemplate>
                    
                    <EmptyDataTemplate>
                        <table runat="server" style="">
                            <tr>
                                <td style="padding-left: 50px;">您没有收藏物品</td>
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
                    
                    <ItemTemplate>
                        <td runat="server" style="">
                
                            <div style="width:253px;height:253px;vertical-align:middle;">
                            <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl='<%# Eval("Item_ID","ItemDetailDemo.aspx?Item_ID={0}")%>' Target="_blank">
                            <asp:Image ID="Image1" ImageUrl='<%# Eval("物品图片","userpic/{0}")%>' width="253"  runat="server" />
                                </asp:HyperLink> 
                                </div>
                            <br />
                            <asp:HyperLink ID="HyperLink2" runat="server" NavigateUrl='<%# Eval("Item_ID","ItemDetailDemo.aspx?Item_ID={0}")%>' Target="_blank">
                            <asp:Label ID="物品名称Label" runat="server" Text='<%# Eval("物品名称") %>' />
                                </asp:HyperLink>
                            <br />
                            
                <asp:Label ID="物品状态Label" runat="server" Text='<%# Eval("物品状态") %>' />
                            <br />
                            <asp:Button ID="DeleteButton" runat="server" CommandName="Delete" Text="删除" />
                            <br />
                        </td>
                    </ItemTemplate>
                    <LayoutTemplate>
                        <table runat="server">
                            <tr runat="server">
                                <td runat="server">
                                    <table id="groupPlaceholderContainer" runat="server" border="0" style="">
                                        <tr id="groupPlaceholder" runat="server">
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                            <tr runat="server">
                                <td runat="server" style="">
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
                        <td runat="server" style="">物品名称:
                <asp:Label ID="物品名称Label" runat="server" Text='<%# Eval("物品名称") %>' />
                            <br />
                            物品图片:
                <asp:Label ID="物品图片Label" runat="server" Text='<%# Eval("物品图片") %>' />
                            <br />
                            物品状态:
                <asp:Label ID="物品状态Label" runat="server" Text='<%# Eval("物品状态") %>' />
                            <br />
                            <asp:Button ID="DeleteButton" runat="server" CommandName="Delete" Text="删除" />
                            <br />
                        </td>
                    </SelectedItemTemplate>
                </asp:ListView>
            </td>
        </tr>
    </table>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:conn %>" DeleteCommand="DELETE FROM t_collection WHERE (Item_ID = @Item_ID) AND (UserID = @UserID)" SelectCommand="SELECT t_collection.Item_ID,t_collection.UserID,t_item.Item_Name AS 物品名称, t_item.Item_Pic AS 物品图片, CASE t_item.item_state WHEN '0' THEN '未交换' WHEN '1' THEN '已被交换' END AS 物品状态 FROM t_collection INNER JOIN t_item ON t_collection.Item_ID = t_item.Item_ID AND t_collection.Item_ID = t_item.Item_ID WHERE (t_collection.UserID = @UserID)">
        <DeleteParameters>
            <asp:Parameter Name="Item_ID" />
            <asp:Parameter Name="UserID" />
        </DeleteParameters>
        <SelectParameters>
            <asp:SessionParameter Name="UserID" SessionField="UserID" />
        </SelectParameters>
    </asp:SqlDataSource>
</asp:Content>

