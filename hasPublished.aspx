<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage2.master" AutoEventWireup="true" CodeFile="hasPublished.aspx.cs" Inherits="hasPublished" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style>
        .hpids{
            float:right;
            padding-right:10px;
        }
        .hpititle{
            padding-left:8px;
            font-size:15px;font-weight:bold;
        }
        .hpbutton1{float:left;margin-left:70px;margin-top:10px;margin-bottom:10px;}
        .hpbutton2{float:right;margin-right:70px;margin-top:-7px;}
        .hpbutton3{float:left;margin-left:70px;margin-top:10px;margin-bottom:10px;}
        .hpbutton4{float:right;margin-right:70px;margin-top:-6px;}
        .hpimgdiv{width:253px;height:190px;border:1px solid rgba(150,150,150,0.5);}
        .hpedit{font-size:15px;font-weight:bold;padding-left:5px;padding-top:5px;padding-bottom:5px;}
        .hpifloat{margin-left:78px;}
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
      <p style="height: 40px;margin-top:10px;margin-left:45px;font-size:20px;font-weight:bold; padding-bottom:30px;" >查看已发布</p>
   <div  style="font-size:14px;">
     <asp:ListView ID="ListView1" class="has_publish" runat="server" DataKeyNames="Item_ID" DataSourceID="SqlDataSource1" GroupItemCount="3">
        <AlternatingItemTemplate>
            <td runat="server" style="background-color: rgba(240,240,240,0.7);width:253px;color:rgb(100,100,100);">
               <span class="hpititle"> 物品ID:</span>
                <asp:Label ID="Item_IDLabel" runat="server" Text='<%# Eval("Item_ID") %>'  CssClass="hpids"/>
                <br />
               <span class="hpititle"> 物品名称:</span>
            
                <asp:Label ID="Item_NameLabel" runat="server" Text='<%# Eval("Item_Name") %>'  CssClass="hpids"/>
                <br />
               <span class="hpititle"> 物品图片:</span>
                
                <%--<asp:Label ID="Item_PicLabel" runat="server" Text='<%# Eval("Item_Pic") %>' />--%>
                <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl='<%# Bind("Item_ID","ItemDetailDemo.aspx?Item_ID={0}")%>'>
                <asp:Image ID="Item_PicLabel" ImageUrl='<%# Bind("Item_Pic","userpic/{0}")%>' width="250" runat="server" CssClass="hpimgdiv" />
              </asp:HyperLink> 
                <br />
               <span class="hpititle"> 新旧程度:</span>
               
                <asp:Label ID="Item_ConditionLabel" runat="server" Text='<%# Eval("Item_Condition") %>'  CssClass="hpids" />
                <br />
               <span class="hpititle"> 物品详情:</span>
                
                <asp:Label ID="Item_DescribeLabel" runat="server" Text='<%# Eval("Item_Describe") %>'  CssClass="hpids" />
                <br />
               <span class="hpititle"> 希望交换物品:</span>
               
                <asp:Label ID="Hope_ItemNameLabel" runat="server" Text='<%# Eval("Hope_ItemName") %>'  CssClass="hpids" />
                <br />
               <span class="hpititle"> 希望交换地:</span>
                
                <asp:Label ID="Hope_DestLabel" runat="server" Text='<%# Eval("Hope_Dest") %>'  CssClass="hpids"/>
                <br />
               <span class="hpititle"> 物品状态:</span>
               
                <asp:Label ID="Item_StateLabel" runat="server" Text='<%# Eval("Item_State") %>'  CssClass="hpids"/>
                <br />
               <span class="hpititle"> 发布时间:</span>
                
                <asp:Label ID="AddTimeLabel" runat="server" Text='<%# Eval("AddTime") %>'  CssClass="hpids"/>
                <br />
               <span class="hpititle"> 物品分类:</span>
                
                <asp:Label ID="Type_NameLabel" runat="server" Text='<%# Eval("Type_Name") %>'  CssClass="hpids"/>
                <br />
                <asp:Button ID="DeleteButton" runat="server" CommandName="Delete" Text="删除" CssClass="hpbutton1"/>
                <br />
                <asp:Button ID="EditButton" runat="server" CommandName="Edit" Text="修改" CssClass="hpbutton2"/>
                <br />
            </td>
        </AlternatingItemTemplate>
        <EditItemTemplate>
            <td runat="server" style="background-color: rgba(0,138,140,0.5); color: #FFFFFF;width:263px;">
                <span class="hpedit"> 物品ID:</span>
                <asp:Label ID="Item_IDLabel1" runat="server" Text='<%# Eval("Item_ID") %>' />
                <br />
                <span class="hpedit"> 物品名称:</span>
                <asp:TextBox ID="Item_NameTextBox" runat="server" Text='<%# Bind("Item_Name") %>'  />
                <br />
               <span class="hpedit"> 新旧程度:</span>
                <asp:TextBox ID="Item_ConditionTextBox" runat="server" Text='<%# Bind("Item_Condition") %>' />
                <br />
                <span class="hpedit"> 物品详情:</span>
                <asp:TextBox ID="Item_DescribeTextBox" runat="server" Text='<%# Bind("Item_Describe") %>' />
                <br />
                <span class="hpedit"> 希望交换物品:</span>
                <asp:TextBox ID="Hope_ItemNameTextBox" runat="server" Text='<%# Bind("Hope_ItemName") %>' CssClass="hpifloat"/>
                <br />
                <span class="hpedit"> 希望交换地:</span>
                <asp:TextBox ID="Hope_DestTextBox" runat="server" Text='<%# Bind("Hope_Dest") %>'  CssClass="hpifloat"/>
                <br />
               <%-- Item_State:
                <asp:TextBox ID="Item_StateTextBox" runat="server" Text='<%# Bind("Item_State") %>' />
                <br />--%>
               <%-- AddTime:
                <asp:TextBox ID="AddTimeTextBox" runat="server" Text='<%# Bind("AddTime") %>' />
                <br />--%>
                <%--Type_Name:
                <asp:TextBox ID="Type_NameTextBox" runat="server" Text='<%# Bind("Type_Name") %>' />
                <br />--%>
                <asp:Button ID="UpdateButton" runat="server" CommandName="Update" Text="更新" CssClass="hpbutton3" />
                <br />
                <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="取消"  CssClass="hpbutton4"/>
                <br />
            </td>
        </EditItemTemplate>
        <EmptyDataTemplate>
            <table runat="server" style="/*background-color: #FFFFFF;border-collapse: collapse;border-color: #999999;border-style:none;border-width:1px;*/">
                <tr>
                    <td style="padding-left:120px;">没有</td>
                </tr>
            </table>
        </EmptyDataTemplate>
        <EmptyItemTemplate>
            <td runat="server" style="background:rgba(0,0,0,0)" />
        </EmptyItemTemplate>
        <GroupTemplate>
            <tr id="itemPlaceholderContainer" runat="server">
                <td id="itemPlaceholder" runat="server"></td>
            </tr>
        </GroupTemplate>
        <InsertItemTemplate>
            <td runat="server" style="width:263px;">物品名称:
                <asp:TextBox ID="Item_NameTextBox" runat="server" Text='<%# Bind("Item_Name") %>' />
                <br />
               物品图片:
                <asp:TextBox ID="Item_PicTextBox" runat="server" Text='<%# Bind("Item_Pic") %>' />
                <br />
                新旧程度:
                <asp:TextBox ID="Item_ConditionTextBox" runat="server" Text='<%# Bind("Item_Condition") %>' />
                <br />
                物品详情:
                <asp:TextBox ID="Item_DescribeTextBox" runat="server" Text='<%# Bind("Item_Describe") %>' />
                <br />
                希望交换物品:
                <asp:TextBox ID="Hope_ItemNameTextBox" runat="server" Text='<%# Bind("Hope_ItemName") %>' />
                <br />
                希望交换地:
                <asp:TextBox ID="Hope_DestTextBox" runat="server" Text='<%# Bind("Hope_Dest") %>' />
                <br />
                物品状态:
                <asp:TextBox ID="Item_StateTextBox" runat="server" Text='<%# Bind("Item_State") %>' />
                <br />
                发布时间:
                <asp:TextBox ID="AddTimeTextBox" runat="server" Text='<%# Bind("AddTime") %>' />
                <br />
                物品分类:
                <asp:TextBox ID="Type_NameTextBox" runat="server" Text='<%# Bind("Type_Name") %>' />
                <br />
                <asp:Button ID="InsertButton" runat="server" CommandName="Insert" Text="插入" />
                <br />
                <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="清除" />
                <br />
            </td>
        </InsertItemTemplate>
        <ItemTemplate>
            <td runat="server" style="background-color: rgba(200,200,200,0.7); color: #000000;width:253px;">
                <span class="hpititle">物品ID:</span>
                <asp:Label ID="Item_IDLabel" runat="server" Text='<%# Eval("Item_ID") %>'   CssClass="hpids" />
                <br />
               <span class="hpititle"> 物品名称:</span>
                <asp:Label ID="Item_NameLabel" runat="server" Text='<%# Eval("Item_Name") %>'   CssClass="hpids"/>
                <br />
                <span class="hpititle"> 物品图片:</span>
                <%--<asp:Label ID="Item_PicLabel" runat="server" Text='<%# Eval("Item_Pic") %>' />--%>
                <asp:HyperLink ID="HyperLink2" runat="server" NavigateUrl='<%# Bind("Item_ID","ItemDetailDemo.aspx?Item_ID={0}")%>'>
                <asp:Image ID="Item_PicLabel" ImageUrl='<%# Bind("Item_Pic","userpic/{0}")%>' width="253"  runat="server" CssClass="hpimgdiv"/>
              </asp:HyperLink> 
                <br />
               <span class="hpititle"> 新旧程度:</span>
                <asp:Label ID="Item_ConditionLabel" runat="server" Text='<%# Eval("Item_Condition") %>'  CssClass="hpids" />
                <br />
                <span class="hpititle"> 物品详情:</span>
                <asp:Label ID="Item_DescribeLabel" runat="server" Text='<%# Eval("Item_Describe") %>'   CssClass="hpids"/>
                <br />
                <span class="hpititle"> 希望交换物品:</span>
                <asp:Label ID="Hope_ItemNameLabel" runat="server" Text='<%# Eval("Hope_ItemName") %>'  CssClass="hpids" />
                <br />
                <span class="hpititle"> 希望交易地:</span>
                <asp:Label ID="Hope_DestLabel" runat="server" Text='<%# Eval("Hope_Dest") %>'   CssClass="hpids"/>
                <br />
                <span class="hpititle"> 物品状态:</span>
                <asp:Label ID="Item_StateLabel" runat="server" Text='<%# Eval("Item_State") %>'  CssClass="hpids" />
                <br />
                <span class="hpititle"> 发布时间:</span>
                <asp:Label ID="AddTimeLabel" runat="server" Text='<%# Eval("AddTime") %>'  CssClass="hpids" />
                <br />
                <span class="hpititle"> 物品分类:</span>
                <asp:Label ID="Type_NameLabel" runat="server" Text='<%# Eval("Type_Name") %>'   CssClass="hpids"/>
                <br />
                <asp:Button ID="DeleteButton" runat="server" CommandName="Delete" Text="删除" CssClass="hpbutton1" />
                <br />
                <asp:Button ID="EditButton" runat="server" CommandName="Edit" Text="修改" CssClass="hpbutton2" />
                <br />
            </td>
        </ItemTemplate>
        <LayoutTemplate>
            <table runat="server">
                <tr runat="server">
                    <td runat="server">
                        <table id="groupPlaceholderContainer" runat="server" style="background-color: rgba(0,0,0,0);border-collapse: collapse;border-color: #999999;border-style:none;border-width:1px;font-family: Verdana, Arial, Helvetica, sans-serif;">
                            <tr id="groupPlaceholder" runat="server">
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr runat="server">
                    <td runat="server" style="text-align: center;background-color: #CCCCCC; font-family: Verdana, Arial, Helvetica, sans-serif;color: #000000">
                        <asp:DataPager ID="DataPager1" runat="server" PageSize="12">
                            <Fields>
                                <asp:NextPreviousPagerField ButtonType="Button" ShowFirstPageButton="True" ShowLastPageButton="True" />
                            </Fields>
                        </asp:DataPager>
                    </td>
                </tr>
            </table>
        </LayoutTemplate>
        <SelectedItemTemplate>
            <td runat="server" style="background-color: #008A8C; font-weight: bold;color: #FFFFFF;width:263px;">Item_ID:
                <asp:Label ID="Item_IDLabel" runat="server" Text='<%# Eval("Item_ID") %>' />
                <br />
                物品名称:
                <asp:Label ID="Item_NameLabel" runat="server" Text='<%# Eval("Item_Name") %>' />
                <br />
                物品图片:
                <asp:Label ID="Item_PicLabel" runat="server" Text='<%# Eval("Item_Pic") %>' />
                <br />
                新旧程度:
                <asp:Label ID="Item_ConditionLabel" runat="server" Text='<%# Eval("Item_Condition") %>' />
                <br />
                物品描述:
                <asp:Label ID="Item_DescribeLabel" runat="server" Text='<%# Eval("Item_Describe") %>' />
                <br />
                希望交换物品:
                <asp:Label ID="Hope_ItemNameLabel" runat="server" Text='<%# Eval("Hope_ItemName") %>' />
                <br />
                希望交易地:
                <asp:Label ID="Hope_DestLabel" runat="server" Text='<%# Eval("Hope_Dest") %>' />
                <br />
                物品状态:
                <asp:Label ID="Item_StateLabel" runat="server" Text='<%# Eval("Item_State") %>' />
                <br />
                发布时间:
                <asp:Label ID="AddTimeLabel" runat="server" Text='<%# Eval("AddTime") %>' />
                <br />
                物品分类:
                <asp:Label ID="Type_NameLabel" runat="server" Text='<%# Eval("Type_Name") %>' />
                <br />
                <asp:Button ID="DeleteButton" runat="server" CommandName="Delete" Text="删除" />
                <br />
                <asp:Button ID="EditButton" runat="server" CommandName="Edit" Text="修改" />
                <br />
            </td>
        </SelectedItemTemplate>
    </asp:ListView>
    </div>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:conn %>" DeleteCommand="DELETE FROM t_item WHERE (Item_ID = @Item_ID)" SelectCommand="SELECT t_item.Item_ID, t_item.Item_Name, t_item.Item_Pic, t_item.Item_Condition, t_item.Item_Describe, t_item.Hope_ItemName, t_item.Hope_Dest,CASE t_item.item_state WHEN '0' THEN '未交换' WHEN '1' THEN '已被交换' END AS Item_State,t_item.AddTime, t_itemtype.Type_Name FROM t_item INNER JOIN t_itemtype ON t_item.Item_Type = t_itemtype.Type_ID WHERE (t_item.Item_User = @UserID)" UpdateCommand="UPDATE t_item 
SET Item_Name = @Item_Name, Item_Condition =@Item_Condition, Item_Describe =@Item_Describe, Hope_ItemName =@Hope_ItemName 
WHERE (Item_ID = @Item_ID)">
        <DeleteParameters>
            <asp:Parameter Name="Item_ID" />
        </DeleteParameters>
        <SelectParameters>
            <asp:SessionParameter Name="UserID" SessionField="UserID" />
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="Item_Name" />
            <asp:Parameter Name="Item_Condition" />
            <asp:Parameter Name="Item_Describe" />
            <asp:Parameter Name="Hope_ItemName" />
            <asp:Parameter Name="Item_ID" />
        </UpdateParameters>
    </asp:SqlDataSource>
    
</asp:Content>

