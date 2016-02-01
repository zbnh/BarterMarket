<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master"  AutoEventWireup="true" CodeFile="ItemDetailDemo.aspx.cs" Inherits="ItemDetailDemo" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style>
        .information_textarea{resize:none;}
        .username{width:100px;}
        .data{width:100px;}
        #imessage_show{background:rgba(253,254,255,0.7);}
         #ContentPlaceHolder1_GridView1{border: 1px #efefef solid;}
        #ContentPlaceHolder1_GridView1 tr td{width:292px;text-align:center;font-size:16px;font-weight:bold;color:rgb(40,40,40);}
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <asp:FormView ID="FormView1" runat="server" DataSourceID="SqlDataSource1" OnPageIndexChanging="FormView1_PageIndexChanging">
        <ItemTemplate>
                 <div class="ititle" style="background-color:rgba(62,170,236,0.7);">物品详情</div>
			<div id="ibasic_information">
				<div id="iimage">
					<p class="nr1">
                        <asp:Image ID="Item_PicLabel" ImageUrl='<%# Bind("Item_Pic","userpic/{0}")%>' width="300" height="300" runat="server" />
					</p>
				</div>
				<div id="itable">
					<table>
						<tbody><tr>
							<td>物品名称：</td>
						    <td>
                                <asp:Label ID="Item_NameLabel" runat="server" Text='<%# Bind("Item_Name") %>' />
                            </td>
						</tr>
						<tr>
							<td>想换什么：</td>
						    <td>
                                <asp:Label ID="Hope_ItemNameLabel" runat="server" Text='<%# Bind("Hope_ItemName") %>' />
                            </td>
						</tr>
						<tr>
							<td></td>
						    <td>&nbsp;</td>
						</tr>
						<tr>
							<td>新旧程度：</td>
						    <td>
                                <asp:Label ID="Item_ConditionLabel" runat="server" Text='<%# Bind("Item_Condition") %>' />
                            </td>
						</tr>
						<tr>
							<td>希望交易地：</td>
						    <td>
                                <asp:Label ID="Hope_DestLabel" runat="server" Text='<%# Bind("Hope_Dest") %>' />
                            </td>
						</tr>
						<tr>
							<td>发布日期：</td>
						    <td>
                                <asp:Label ID="AddTimeLabel" runat="server" Text='<%# Bind("AddTime") %>' />
                            </td>
						</tr>
						<tr>
							<td>物品状态：</td>
						    <td>
                                <asp:Label ID="Item_StateLabel" runat="server" Text='<%# Bind("Item_State") %>' />
                            </td>
						</tr>
						<tr>
							<td>物品类型：</td>
						    <td>
                                <asp:Label ID="Type_NameLabel" runat="server" Text='<%# Bind("Type_Name") %>' />
                            </td>
						</tr>
					</tbody></table>
                    <asp:ImageButton ID="ImageButton1" runat="server" CausesValidation="False" ImageUrl="~/img/jh.png" OnClick="ImageButton1_Click" Visible='<%# ((Eval("Item_State").ToString()=="0")?true:false) %>'/>
				    <asp:ImageButton ID="Button2" runat="server" OnClick="Button2_Click" ImageUrl="~/img/sc.png"  />
				</div>
                
				<div id="iiuser">
					<table>
						<tbody><tr><th>
							<asp:Label ID="Label2" runat="server" Text='<%# Eval("UserID") %>' Visible="False"></asp:Label>
							</th>
						
						</tr>
                            <tr>
                                <th colspan="2">
                                    <asp:HyperLink ID="HyperLink2" runat="server" NavigateUrl='#'>
                                    <asp:Image ID="Image2" ImageUrl='<%# Eval("user_pic","usernamepic/{0}")%>' width="100" runat="server" />
                                        </asp:HyperLink> 
                                </th>
                            </tr>
                            <tr>
							<td>
								用户名：</td>
							<td>
                                <asp:Label ID="UserNameLabel" runat="server" Text='<%# Bind("UserName") %>' />
                                </td>
						</tr>
						<tr>

							<td>所在地：</td>

							<td>
                                <asp:Label ID="AddressLabel" runat="server" Text='<%# Bind("Address") %>' />
                            </td>
						</tr>
						<tr>
							<td>手机号：</td>
							<td>
                                <asp:Label ID="TelLabel" runat="server" Text='<%# Bind("Tel") %>' />
                            </td>
						</tr>
						<tr>
							<td>注册时间：</td>
                            <td>
                                <asp:Label ID="Label1" runat="server" Text='<%# Bind("RegTime") %>'></asp:Label>
                            </td>
						</tr>

					</tbody></table>
				</div>
			</div>
			<%--<div class="ititle">物品瑕疵</div>
			<div id="iflaw"></div>--%>
			<div class="ititle"style="background-color:rgba(131,230,199,0.7);" >物品介绍</div>
			<div id="iintroduce">
                <%--<asp:Label ID="Item_DescribeLabel" runat="server" Text='<%# Bind("Item_Describe") %>' />--%>
                <asp:TextBox ID="Item_DescribeLabel" runat="server"  Text='<%# Bind("Item_Describe") %>' BorderColor="White" Height="188px" TextMode="MultiLine" Width="978px"  ReadOnly="True" CssClass="information_textarea"></asp:TextBox>
            </div>
			
			
		
        </ItemTemplate>
    </asp:FormView>
    <div class="ititle"style="background-color:rgba(140,140,202,0.7);margin-top:-2px;">留言板</div>
    <div id="imessage_show">
        <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AutoGenerateColumns="False" DataSourceID="SqlDataSource2" PageSize="5">
            <Columns>
                
                <asp:ImageField DataImageUrlField="user_pic" DataImageUrlFormatString="~/usernamepic/{0}">
                    <ItemStyle Height="100px" Width="100px" />
                </asp:ImageField>
                <asp:BoundField DataField="UserName" SortExpression="UserName" />
                <asp:BoundField DataField="Date" SortExpression="Date"/>
                <asp:BoundField DataField="Message_Content" SortExpression="Message_Content" />
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:conn %>" SelectCommand="SELECT t_message.Message_Content, t_message.Date, t_user.UserName, t_user.user_pic FROM t_message INNER JOIN t_user ON t_message.User_ID = t_user.UserID WHERE (t_message.Item_ID = @Item_ID) ORDER BY t_message.Date DESC">
            <SelectParameters>
                <asp:QueryStringParameter Name="Item_ID" QueryStringField="Item_ID" />
            </SelectParameters>
        </asp:SqlDataSource>
    </div>
    <div class="ititle"style="background-color:rgba(140,140,202,0.7);margin-top:-2px;">留言</div>
    <div id="imessage">
				<div id="imessage_leave">
					<p id="iarea">
						<%--<textarea cols="110" rows="10"></textarea>--%>
                        <asp:TextBox ID="sms" runat="server" Height="188px" TextMode="MultiLine" Width="800px"  CssClass="information_textarea"></asp:TextBox>
					</p>
					<p id="ibutton">
						<asp:Button ID="Button1" runat="server" Text="提交"  CssClass="submit" OnClick="Button1_Click" UseSubmitBehavior="False"   />
					</p>
				</div>
			</div>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:conn %>" SelectCommand="SELECT t_item.Item_Name, t_item.Item_Pic, t_item.Item_Condition, t_item.Item_Describe, t_item.Hope_ItemName, t_item.Hope_Dest, t_item.Item_State, t_item.AddTime, t_user.UserID,t_user.UserName, t_user.Address, t_user.Tel,t_user.RegTime, t_user.user_pic,t_user.userid,t_itemtype.Type_Name FROM t_item INNER JOIN t_user ON t_item.Item_User = t_user.UserID INNER JOIN t_itemtype ON t_item.Item_Type = t_itemtype.Type_ID WHERE (t_item.Item_ID = @Item_ID)">
                    <SelectParameters>
                        <asp:QueryStringParameter Name="Item_ID" QueryStringField="Item_ID" />
                    </SelectParameters>
    </asp:SqlDataSource>
           
</asp:Content>

