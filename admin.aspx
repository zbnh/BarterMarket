<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="admin.aspx.cs" Inherits="admin" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <br />
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConflictDetection="CompareAllValues" ConnectionString="<%$ ConnectionStrings:conn %>" DeleteCommand="DELETE FROM [t_user] WHERE [UserID] = @original_UserID AND [LoginName] = @original_LoginName AND [PassWord] = @original_PassWord AND (([Address] = @original_Address) OR ([Address] IS NULL AND @original_Address IS NULL)) AND [UserName] = @original_UserName AND (([Tel] = @original_Tel) OR ([Tel] IS NULL AND @original_Tel IS NULL)) AND (([EMail] = @original_EMail) OR ([EMail] IS NULL AND @original_EMail IS NULL)) AND (([RegTime] = @original_RegTime) OR ([RegTime] IS NULL AND @original_RegTime IS NULL)) AND (([Introduction] = @original_Introduction) OR ([Introduction] IS NULL AND @original_Introduction IS NULL)) AND (([Age] = @original_Age) OR ([Age] IS NULL AND @original_Age IS NULL))" InsertCommand="INSERT INTO [t_user] ([LoginName], [PassWord], [Address], [UserName], [Tel], [EMail], [RegTime], [Introduction], [Age]) VALUES (@LoginName, @PassWord, @Address, @UserName, @Tel, @EMail, @RegTime, @Introduction, @Age)" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT * FROM [t_user] ORDER BY [UserID]" UpdateCommand="UPDATE [t_user] SET [LoginName] = @LoginName, [PassWord] = @PassWord, [Address] = @Address, [UserName] = @UserName, [Tel] = @Tel, [EMail] = @EMail, [RegTime] = @RegTime, [Introduction] = @Introduction, [Age] = @Age WHERE [UserID] = @original_UserID AND [LoginName] = @original_LoginName AND [PassWord] = @original_PassWord AND (([Address] = @original_Address) OR ([Address] IS NULL AND @original_Address IS NULL)) AND [UserName] = @original_UserName AND (([Tel] = @original_Tel) OR ([Tel] IS NULL AND @original_Tel IS NULL)) AND (([EMail] = @original_EMail) OR ([EMail] IS NULL AND @original_EMail IS NULL)) AND (([RegTime] = @original_RegTime) OR ([RegTime] IS NULL AND @original_RegTime IS NULL)) AND (([Introduction] = @original_Introduction) OR ([Introduction] IS NULL AND @original_Introduction IS NULL)) AND (([Age] = @original_Age) OR ([Age] IS NULL AND @original_Age IS NULL))">
        <DeleteParameters>
            <asp:Parameter Name="original_UserID" Type="Int32" />
            <asp:Parameter Name="original_LoginName" Type="String" />
            <asp:Parameter Name="original_PassWord" Type="String" />
            <asp:Parameter Name="original_Address" Type="String" />
            <asp:Parameter Name="original_UserName" Type="String" />
            <asp:Parameter Name="original_Tel" Type="String" />
            <asp:Parameter Name="original_EMail" Type="String" />
            <asp:Parameter Name="original_RegTime" Type="DateTime" />
            <asp:Parameter Name="original_Introduction" Type="String" />
            <asp:Parameter Name="original_Age" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="LoginName" Type="String" />
            <asp:Parameter Name="PassWord" Type="String" />
            <asp:Parameter Name="Address" Type="String" />
            <asp:Parameter Name="UserName" Type="String" />
            <asp:Parameter Name="Tel" Type="String" />
            <asp:Parameter Name="EMail" Type="String" />
            <asp:Parameter Name="RegTime" Type="DateTime" />
            <asp:Parameter Name="Introduction" Type="String" />
            <asp:Parameter Name="Age" Type="Int32" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="LoginName" Type="String" />
            <asp:Parameter Name="PassWord" Type="String" />
            <asp:Parameter Name="Address" Type="String" />
            <asp:Parameter Name="UserName" Type="String" />
            <asp:Parameter Name="Tel" Type="String" />
            <asp:Parameter Name="EMail" Type="String" />
            <asp:Parameter Name="RegTime" Type="DateTime" />
            <asp:Parameter Name="Introduction" Type="String" />
            <asp:Parameter Name="Age" Type="Int32" />
            <asp:Parameter Name="original_UserID" Type="Int32" />
            <asp:Parameter Name="original_LoginName" Type="String" />
            <asp:Parameter Name="original_PassWord" Type="String" />
            <asp:Parameter Name="original_Address" Type="String" />
            <asp:Parameter Name="original_UserName" Type="String" />
            <asp:Parameter Name="original_Tel" Type="String" />
            <asp:Parameter Name="original_EMail" Type="String" />
            <asp:Parameter Name="original_RegTime" Type="DateTime" />
            <asp:Parameter Name="original_Introduction" Type="String" />
            <asp:Parameter Name="original_Age" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>
    <br />
    <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged">
        <asp:ListItem Selected="True">管理用户信息</asp:ListItem>
        <asp:ListItem>管理物品信息</asp:ListItem>
        <asp:ListItem>管理物品类型</asp:ListItem>
    </asp:DropDownList>
    <asp:Label ID="Label2" runat="server" Text="Label"></asp:Label>
    <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="UserID" DataSourceID="SqlDataSource11" Height="287px" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" Width="916px" BackColor="White" BorderColor="#3366CC" BorderStyle="None" BorderWidth="1px" OnRowCommand="GridView1_RowCommand">
        <Columns>
            <asp:TemplateField ShowHeader="False">
                <ItemTemplate>
                    <asp:Button ID="Button1" runat="server" CausesValidation="False" CommandName="Delete" Text="删除" OnClientClick="return confirm('您确认删除该记录吗?');" />
                </ItemTemplate>
            </asp:TemplateField>
            <asp:ButtonField CommandName="Insert" Text="新建" ButtonType="Button" />
            <asp:BoundField DataField="UserID" HeaderText="用户ID" InsertVisible="False" ReadOnly="True" SortExpression="UserID" />
            <asp:BoundField DataField="LoginName" HeaderText="登录名" SortExpression="LoginName" />
            <asp:BoundField DataField="Address" HeaderText="地址" SortExpression="Address" />
            <asp:BoundField DataField="UserName" HeaderText="用户名" SortExpression="UserName" />
            <asp:BoundField DataField="Tel" HeaderText="电话" SortExpression="Tel" />
            <asp:BoundField DataField="EMail" HeaderText="EMail" SortExpression="EMail" />
            <asp:BoundField DataField="RegTime" HeaderText="注册时间" SortExpression="RegTime" />
            <asp:BoundField DataField="Introduction" HeaderText="简介" SortExpression="Introduction" />
            <asp:BoundField DataField="Age" HeaderText="年龄" SortExpression="Age" />
        </Columns>
        <EmptyDataTemplate>
            <asp:DetailsView ID="DetailsView1" runat="server" AutoGenerateRows="False" DataKeyNames="UserID" DataSourceID="SqlDataSource1" DefaultMode="Insert" Height="50px" OnItemInserted="DetailsView1_ItemInserted" Width="125px">
                <Fields>
                    <asp:BoundField DataField="UserID" HeaderText="UserID" InsertVisible="False" ReadOnly="True" SortExpression="UserID" />
                    <asp:BoundField DataField="LoginName" HeaderText="LoginName" SortExpression="LoginName" />
                    <asp:BoundField DataField="PassWord" HeaderText="PassWord" SortExpression="PassWord" />
                    <asp:BoundField DataField="Address" HeaderText="Address" SortExpression="Address" />
                    <asp:BoundField DataField="UserName" HeaderText="UserName" SortExpression="UserName" />
                    <asp:BoundField DataField="Tel" HeaderText="Tel" SortExpression="Tel" />
                    <asp:BoundField DataField="EMail" HeaderText="EMail" SortExpression="EMail" />
                    <asp:BoundField DataField="RegTime" HeaderText="RegTime" SortExpression="RegTime" />
                    <asp:BoundField DataField="Introduction" HeaderText="Introduction" SortExpression="Introduction" />
                    <asp:BoundField DataField="Age" HeaderText="Age" SortExpression="Age" />
                    <asp:CommandField ShowEditButton="True" ShowInsertButton="True" />
                </Fields>
            </asp:DetailsView>
        </EmptyDataTemplate>
        <FooterStyle BackColor="#99CCCC" ForeColor="#003399" />
        <HeaderStyle BackColor="#003399" Font-Bold="True" ForeColor="#CCCCFF" />
        <PagerStyle BackColor="#99CCCC" ForeColor="#003399" HorizontalAlign="Left" />
        <RowStyle BackColor="White" ForeColor="#003399" />
        <SelectedRowStyle BackColor="#009999" Font-Bold="True" ForeColor="#CCFF99" />
        <SortedAscendingCellStyle BackColor="#EDF6F6" />
        <SortedAscendingHeaderStyle BackColor="#0D4AC4" />
        <SortedDescendingCellStyle BackColor="#D6DFDF" />
        <SortedDescendingHeaderStyle BackColor="#002876" />
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSource11" runat="server" ConflictDetection="CompareAllValues" ConnectionString="<%$ ConnectionStrings:conn %>" DeleteCommand="DELETE FROM [t_user] WHERE [UserID] = @original_UserID AND [LoginName] = @original_LoginName AND [PassWord] = @original_PassWord AND (([Address] = @original_Address) OR ([Address] IS NULL AND @original_Address IS NULL)) AND [UserName] = @original_UserName AND (([Tel] = @original_Tel) OR ([Tel] IS NULL AND @original_Tel IS NULL)) AND (([EMail] = @original_EMail) OR ([EMail] IS NULL AND @original_EMail IS NULL)) AND (([RegTime] = @original_RegTime) OR ([RegTime] IS NULL AND @original_RegTime IS NULL)) AND (([Introduction] = @original_Introduction) OR ([Introduction] IS NULL AND @original_Introduction IS NULL)) AND (([Age] = @original_Age) OR ([Age] IS NULL AND @original_Age IS NULL))" InsertCommand="INSERT INTO [t_user] ([LoginName], [PassWord], [Address], [UserName], [Tel], [EMail], [RegTime], [Introduction], [Age]) VALUES (@LoginName, @PassWord, @Address, @UserName, @Tel, @EMail, @RegTime, @Introduction, @Age)" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT * FROM [t_user] ORDER BY [UserID]" UpdateCommand="UPDATE [t_user] SET [LoginName] = @LoginName, [PassWord] = @PassWord, [Address] = @Address, [UserName] = @UserName, [Tel] = @Tel, [EMail] = @EMail, [RegTime] = @RegTime, [Introduction] = @Introduction, [Age] = @Age WHERE [UserID] = @original_UserID AND [LoginName] = @original_LoginName AND [PassWord] = @original_PassWord AND (([Address] = @original_Address) OR ([Address] IS NULL AND @original_Address IS NULL)) AND [UserName] = @original_UserName AND (([Tel] = @original_Tel) OR ([Tel] IS NULL AND @original_Tel IS NULL)) AND (([EMail] = @original_EMail) OR ([EMail] IS NULL AND @original_EMail IS NULL)) AND (([RegTime] = @original_RegTime) OR ([RegTime] IS NULL AND @original_RegTime IS NULL)) AND (([Introduction] = @original_Introduction) OR ([Introduction] IS NULL AND @original_Introduction IS NULL)) AND (([Age] = @original_Age) OR ([Age] IS NULL AND @original_Age IS NULL))">
        <DeleteParameters>
            <asp:Parameter Name="original_UserID" Type="Int32" />
            <asp:Parameter Name="original_LoginName" Type="String" />
            <asp:Parameter Name="original_PassWord" Type="String" />
            <asp:Parameter Name="original_Address" Type="String" />
            <asp:Parameter Name="original_UserName" Type="String" />
            <asp:Parameter Name="original_Tel" Type="String" />
            <asp:Parameter Name="original_EMail" Type="String" />
            <asp:Parameter Name="original_RegTime" Type="DateTime" />
            <asp:Parameter Name="original_Introduction" Type="String" />
            <asp:Parameter Name="original_Age" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="LoginName" Type="String" />
            <asp:Parameter Name="PassWord" Type="String" />
            <asp:Parameter Name="Address" Type="String" />
            <asp:Parameter Name="UserName" Type="String" />
            <asp:Parameter Name="Tel" Type="String" />
            <asp:Parameter Name="EMail" Type="String" />
            <asp:Parameter Name="RegTime" Type="DateTime" />
            <asp:Parameter Name="Introduction" Type="String" />
            <asp:Parameter Name="Age" Type="Int32" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="LoginName" Type="String" />
            <asp:Parameter Name="PassWord" Type="String" />
            <asp:Parameter Name="Address" Type="String" />
            <asp:Parameter Name="UserName" Type="String" />
            <asp:Parameter Name="Tel" Type="String" />
            <asp:Parameter Name="EMail" Type="String" />
            <asp:Parameter Name="RegTime" Type="DateTime" />
            <asp:Parameter Name="Introduction" Type="String" />
            <asp:Parameter Name="Age" Type="Int32" />
            <asp:Parameter Name="original_UserID" Type="Int32" />
            <asp:Parameter Name="original_LoginName" Type="String" />
            <asp:Parameter Name="original_PassWord" Type="String" />
            <asp:Parameter Name="original_Address" Type="String" />
            <asp:Parameter Name="original_UserName" Type="String" />
            <asp:Parameter Name="original_Tel" Type="String" />
            <asp:Parameter Name="original_EMail" Type="String" />
            <asp:Parameter Name="original_RegTime" Type="DateTime" />
            <asp:Parameter Name="original_Introduction" Type="String" />
            <asp:Parameter Name="original_Age" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>
    <asp:GridView ID="GridView2" runat="server" AllowPaging="True" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="Item_ID" DataSourceID="SqlDataSource2" ForeColor="#333333" GridLines="None">
        <AlternatingRowStyle BackColor="White" />
        <Columns>
            <asp:TemplateField ShowHeader="False">
                <ItemTemplate>
                    <asp:Button ID="Button1" runat="server" CausesValidation="False" CommandName="Delete" Text="删除" OnClientClick="return confirm('您确认删除该记录吗?');"/>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:CommandField ButtonType="Button" ShowEditButton="True" />
            <asp:BoundField DataField="Item_ID" HeaderText="物品ID" InsertVisible="False" ReadOnly="True" SortExpression="Item_ID" />
            <asp:BoundField DataField="Item_User" HeaderText="物品所有者" SortExpression="Item_User" />
            <asp:BoundField DataField="Item_Type" HeaderText="物品分类" SortExpression="Item_Type" />
            <asp:BoundField DataField="Item_Name" HeaderText="物品名称" SortExpression="Item_Name" />
            <asp:ImageField DataImageUrlField="Item_Pic" DataImageUrlFormatString="userpic/{0}" HeaderText="图片">
                <ControlStyle Height="120px" Width="150px" />
            </asp:ImageField>
            <asp:BoundField DataField="Item_Condition" HeaderText="新旧程度" SortExpression="Item_Condition" />
            <asp:BoundField DataField="Item_Describe" HeaderText="描述" SortExpression="Item_Describe" />
            <asp:BoundField DataField="Hope_ItemName" HeaderText="期望获得的物品" SortExpression="Hope_ItemName" />
            <asp:BoundField DataField="Hope_Dest" HeaderText="期望地区" SortExpression="Hope_Dest" />
            <asp:BoundField DataField="Item_State" HeaderText="物品状态" SortExpression="Item_State" />
            <asp:BoundField DataField="ClickNum" HeaderText="点击次数" SortExpression="ClickNum" />
            <asp:BoundField DataField="AddTime" HeaderText="添加时间" SortExpression="AddTime" />
        </Columns>
        <EditRowStyle BackColor="#7C6F57" />
        <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
        <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
        <RowStyle BackColor="#E3EAEB" />
        <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
        <SortedAscendingCellStyle BackColor="#F8FAFA" />
        <SortedAscendingHeaderStyle BackColor="#246B61" />
        <SortedDescendingCellStyle BackColor="#D4DFE1" />
        <SortedDescendingHeaderStyle BackColor="#15524A" />
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConflictDetection="CompareAllValues" ConnectionString="<%$ ConnectionStrings:conn %>" DeleteCommand="DELETE FROM [t_item] WHERE [Item_ID] = @original_Item_ID AND [Item_User] = @original_Item_User AND [Item_Type] = @original_Item_Type AND [Item_Name] = @original_Item_Name AND (([Item_Pic] = @original_Item_Pic) OR ([Item_Pic] IS NULL AND @original_Item_Pic IS NULL)) AND [Item_Condition] = @original_Item_Condition AND (([Item_Describe] = @original_Item_Describe) OR ([Item_Describe] IS NULL AND @original_Item_Describe IS NULL)) AND (([Hope_ItemName] = @original_Hope_ItemName) OR ([Hope_ItemName] IS NULL AND @original_Hope_ItemName IS NULL)) AND (([Hope_Dest] = @original_Hope_Dest) OR ([Hope_Dest] IS NULL AND @original_Hope_Dest IS NULL)) AND [Item_State] = @original_Item_State AND (([ClickNum] = @original_ClickNum) OR ([ClickNum] IS NULL AND @original_ClickNum IS NULL)) AND [AddTime] = @original_AddTime" InsertCommand="INSERT INTO [t_item] ([Item_User], [Item_Type], [Item_Name], [Item_Pic], [Item_Condition], [Item_Describe], [Hope_ItemName], [Hope_Dest], [Item_State], [ClickNum], [AddTime]) VALUES (@Item_User, @Item_Type, @Item_Name, @Item_Pic, @Item_Condition, @Item_Describe, @Hope_ItemName, @Hope_Dest, @Item_State, @ClickNum, @AddTime)" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT * FROM [t_item]" UpdateCommand="UPDATE [t_item] SET [Item_User] = @Item_User, [Item_Type] = @Item_Type, [Item_Name] = @Item_Name, [Item_Pic] = @Item_Pic, [Item_Condition] = @Item_Condition, [Item_Describe] = @Item_Describe, [Hope_ItemName] = @Hope_ItemName, [Hope_Dest] = @Hope_Dest, [Item_State] = @Item_State, [ClickNum] = @ClickNum, [AddTime] = @AddTime WHERE [Item_ID] = @original_Item_ID AND [Item_User] = @original_Item_User AND [Item_Type] = @original_Item_Type AND [Item_Name] = @original_Item_Name AND (([Item_Pic] = @original_Item_Pic) OR ([Item_Pic] IS NULL AND @original_Item_Pic IS NULL)) AND [Item_Condition] = @original_Item_Condition AND (([Item_Describe] = @original_Item_Describe) OR ([Item_Describe] IS NULL AND @original_Item_Describe IS NULL)) AND (([Hope_ItemName] = @original_Hope_ItemName) OR ([Hope_ItemName] IS NULL AND @original_Hope_ItemName IS NULL)) AND (([Hope_Dest] = @original_Hope_Dest) OR ([Hope_Dest] IS NULL AND @original_Hope_Dest IS NULL)) AND [Item_State] = @original_Item_State AND (([ClickNum] = @original_ClickNum) OR ([ClickNum] IS NULL AND @original_ClickNum IS NULL)) AND [AddTime] = @original_AddTime">
        <DeleteParameters>
            <asp:Parameter Name="original_Item_ID" Type="Int32" />
            <asp:Parameter Name="original_Item_User" Type="Int32" />
            <asp:Parameter Name="original_Item_Type" Type="String" />
            <asp:Parameter Name="original_Item_Name" Type="String" />
            <asp:Parameter Name="original_Item_Pic" Type="String" />
            <asp:Parameter Name="original_Item_Condition" Type="String" />
            <asp:Parameter Name="original_Item_Describe" Type="String" />
            <asp:Parameter Name="original_Hope_ItemName" Type="String" />
            <asp:Parameter Name="original_Hope_Dest" Type="String" />
            <asp:Parameter Name="original_Item_State" Type="String" />
            <asp:Parameter Name="original_ClickNum" Type="Int32" />
            <asp:Parameter Name="original_AddTime" Type="DateTime" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="Item_User" Type="Int32" />
            <asp:Parameter Name="Item_Type" Type="String" />
            <asp:Parameter Name="Item_Name" Type="String" />
            <asp:Parameter Name="Item_Pic" Type="String" />
            <asp:Parameter Name="Item_Condition" Type="String" />
            <asp:Parameter Name="Item_Describe" Type="String" />
            <asp:Parameter Name="Hope_ItemName" Type="String" />
            <asp:Parameter Name="Hope_Dest" Type="String" />
            <asp:Parameter Name="Item_State" Type="String" />
            <asp:Parameter Name="ClickNum" Type="Int32" />
            <asp:Parameter Name="AddTime" Type="DateTime" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="Item_User" Type="Int32" />
            <asp:Parameter Name="Item_Type" Type="String" />
            <asp:Parameter Name="Item_Name" Type="String" />
            <asp:Parameter Name="Item_Pic" Type="String" />
            <asp:Parameter Name="Item_Condition" Type="String" />
            <asp:Parameter Name="Item_Describe" Type="String" />
            <asp:Parameter Name="Hope_ItemName" Type="String" />
            <asp:Parameter Name="Hope_Dest" Type="String" />
            <asp:Parameter Name="Item_State" Type="String" />
            <asp:Parameter Name="ClickNum" Type="Int32" />
            <asp:Parameter Name="AddTime" Type="DateTime" />
            <asp:Parameter Name="original_Item_ID" Type="Int32" />
            <asp:Parameter Name="original_Item_User" Type="Int32" />
            <asp:Parameter Name="original_Item_Type" Type="String" />
            <asp:Parameter Name="original_Item_Name" Type="String" />
            <asp:Parameter Name="original_Item_Pic" Type="String" />
            <asp:Parameter Name="original_Item_Condition" Type="String" />
            <asp:Parameter Name="original_Item_Describe" Type="String" />
            <asp:Parameter Name="original_Hope_ItemName" Type="String" />
            <asp:Parameter Name="original_Hope_Dest" Type="String" />
            <asp:Parameter Name="original_Item_State" Type="String" />
            <asp:Parameter Name="original_ClickNum" Type="Int32" />
            <asp:Parameter Name="original_AddTime" Type="DateTime" />
        </UpdateParameters>
    </asp:SqlDataSource>
    <br />
    <asp:GridView ID="GridView3" runat="server" AllowPaging="True" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="Type_ID" DataSourceID="SqlDataSource3" ForeColor="#333333" GridLines="None" PageSize="20" OnRowCommand="GridView3_RowCommand">
        <AlternatingRowStyle BackColor="White" />
        <Columns>
            <asp:TemplateField ShowHeader="False">
                <ItemTemplate>
                    <asp:Button ID="Button1" runat="server" CausesValidation="False" CommandName="Delete" Text="删除" OnClientClick="return confirm('您确认删除该记录吗?');"/>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:ButtonField ButtonType="Button" Text="新建" CommandName="Insert1" />
            <asp:CommandField ButtonType="Button" ShowEditButton="True" />
            <asp:BoundField DataField="Type_ID" HeaderText="分类ID" ReadOnly="True" SortExpression="Type_ID" />
            <asp:BoundField DataField="Type_Name" HeaderText="分类名" SortExpression="Type_Name" />
        </Columns>
        <EditRowStyle BackColor="#2461BF" />
        <EmptyDataTemplate>
            <asp:DetailsView ID="DetailsView2" runat="server" AutoGenerateRows="False" DataKeyNames="Type_ID" DataSourceID="SqlDataSource33" DefaultMode="Insert" Height="50px" OnItemInserted="DetailsView2_ItemInserted" Width="125px">
                <Fields>
                    <asp:BoundField DataField="Type_ID" HeaderText="Type_ID" ReadOnly="True" SortExpression="Type_ID" />
                    <asp:BoundField DataField="Type_Name" HeaderText="Type_Name" SortExpression="Type_Name" />
                    <asp:CommandField ShowInsertButton="True" />
                </Fields>
            </asp:DetailsView>
        </EmptyDataTemplate>
        <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
        <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
        <RowStyle BackColor="#EFF3FB" />
        <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
        <SortedAscendingCellStyle BackColor="#F5F7FB" />
        <SortedAscendingHeaderStyle BackColor="#6D95E1" />
        <SortedDescendingCellStyle BackColor="#E9EBEF" />
        <SortedDescendingHeaderStyle BackColor="#4870BE" />
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConflictDetection="CompareAllValues" ConnectionString="<%$ ConnectionStrings:conn %>" DeleteCommand="DELETE FROM [t_itemtype] WHERE [Type_ID] = @original_Type_ID AND [Type_Name] = @original_Type_Name" InsertCommand="INSERT INTO [t_itemtype] ([Type_ID], [Type_Name]) VALUES (@Type_ID, @Type_Name)" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT * FROM [t_itemtype]" UpdateCommand="UPDATE [t_itemtype] SET [Type_Name] = @Type_Name WHERE [Type_ID] = @original_Type_ID AND [Type_Name] = @original_Type_Name">
        <DeleteParameters>
            <asp:Parameter Name="original_Type_ID" Type="String" />
            <asp:Parameter Name="original_Type_Name" Type="String" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="Type_ID" Type="String" />
            <asp:Parameter Name="Type_Name" Type="String" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="Type_Name" Type="String" />
            <asp:Parameter Name="original_Type_ID" Type="String" />
            <asp:Parameter Name="original_Type_Name" Type="String" />
        </UpdateParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSource33" runat="server" ConflictDetection="CompareAllValues" ConnectionString="<%$ ConnectionStrings:conn %>" DeleteCommand="DELETE FROM [t_itemtype] WHERE [Type_ID] = @original_Type_ID AND [Type_Name] = @original_Type_Name" InsertCommand="INSERT INTO [t_itemtype] ([Type_ID], [Type_Name]) VALUES (@Type_ID, @Type_Name)" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT * FROM [t_itemtype]" UpdateCommand="UPDATE [t_itemtype] SET [Type_Name] = @Type_Name WHERE [Type_ID] = @original_Type_ID AND [Type_Name] = @original_Type_Name">
        <DeleteParameters>
            <asp:Parameter Name="original_Type_ID" Type="String" />
            <asp:Parameter Name="original_Type_Name" Type="String" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="Type_ID" Type="String" />
            <asp:Parameter Name="Type_Name" Type="String" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="Type_Name" Type="String" />
            <asp:Parameter Name="original_Type_ID" Type="String" />
            <asp:Parameter Name="original_Type_Name" Type="String" />
        </UpdateParameters>
    </asp:SqlDataSource>
</asp:Content>

