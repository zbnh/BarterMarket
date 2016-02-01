<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage2.master" AutoEventWireup="true" CodeFile="managementIndex.aspx.cs" Inherits="managementIndex" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .auto-style1 {
            width: 100%;
           
        }
      .mm_c_h{resize:none;}
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

					<div id="iuser_photo">
						<p><span>用户头像&nbsp;&nbsp;</span>
                            <asp:FileUpload ID="btnFileUpload1" runat="server" Visible="False" />
                            <asp:Button ID="Button1" runat="server" Text="上传" OnClick="Button1_Click" Visible="False" />
                            <asp:Button ID="Button2" runat="server" Text="修改" OnClick="Button2_Click" />
						</p>
						<div id="iphoto">
                            <asp:Image ID="Image1" runat="server" Height="200px" Width="200px" />
                        </div>
					</div>
					<div id="iuser_data" style="margin-top: -350px;">
						<%--<table>
							<tbody><tr>
								<td>&nbsp;用&nbsp; 户 名:</td>
								<td>
                                    <asp:TextBox ID="TextBox1" runat="server" ReadOnly="True"></asp:TextBox>
                                </td>
							</tr>
							<tr>
								<td>用户性别:</td>
								<td>
                                    <asp:TextBox ID="TextBox2" runat="server" ReadOnly="True"></asp:TextBox>
                                </td>
							</tr>
							<tr>
								<td>所在城市:</td>
								<td>
                                    <asp:TextBox ID="TextBox3" runat="server" ReadOnly="True"></asp:TextBox>
                                </td>
							</tr>
							<tr>
								<td>联系方式:</td>
								<td>
                                    <asp:TextBox ID="TextBox4" runat="server" ReadOnly="True"></asp:TextBox>
                                </td>
							</tr>
							<tr>
								<td>年&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 龄:</td>
								<td>
                                    <asp:TextBox ID="TextBox5" runat="server" ReadOnly="True"></asp:TextBox>
                                </td>
							</tr>
							<tr>
								<td>注册日期:</td>
								<td>
                                    <asp:TextBox ID="TextBox7" runat="server" ReadOnly="True"></asp:TextBox>
                                </td>
							</tr>
							<tr>
								<td>个人简介:
                                    <asp:FormView ID="FormView1" runat="server">
                                    <ItemTemplate>
                                        这这这
                                    </ItemTemplate>
                                    </asp:FormView>
                                </td>
								<td>
                                    <asp:TextBox ID="TextBox8" runat="server" Height="59px" TextMode="MultiLine" Width="225px"></asp:TextBox>
                                </td>
							</tr>
						</tbody></table>--%>
                       
					    <asp:FormView ID="FormView1" runat="server" DataKeyNames="UserID" DataSourceID="SqlDataSource1" Font-Size="Larger" Height="213px" Width="464px" style="margin-top: 0px">
                            <EditItemTemplate>
                                <table class="auto-style1">
                                    <tr>
                                        <td>用户ID: </td>
                                        <td>
                                            <asp:Label ID="UserIDLabel1" runat="server" Text='<%# Eval("UserID") %>' />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>昵称: </td>
                                        <td>
                                            <asp:TextBox ID="UserNameTextBox" runat="server" Text='<%# Bind("UserName") %>' />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>年龄: </td>
                                        <td>
                                            <asp:TextBox ID="AgeTextBox" runat="server" Text='<%# Bind("Age") %>' />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>地址: </td>
                                        <td>
                                            <asp:TextBox ID="AddressTextBox" runat="server" Text='<%# Bind("Address") %>' />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>手机号: </td>
                                        <td>
                                            <asp:TextBox ID="TelTextBox" runat="server" Text='<%# Bind("Tel") %>' />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>EMail: </td>
                                        <td>
                                            <asp:TextBox ID="EMailTextBox" runat="server" Text='<%# Bind("EMail") %>' />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>自我简介: </td>
                                        <td>
                                            <asp:TextBox ID="IntroductionTextBox" runat="server" Text='<%# Bind("Introduction") %>' TextMode="MultiLine" CssClass="mm_c_h" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update" Text="确定" />
                                        </td>
                                        <td>
                                            <asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="取消" />
                                        </td>
                                    </tr>
                                </table>
                            </EditItemTemplate>
                            <InsertItemTemplate>
                                LoginName:
                                <asp:TextBox ID="LoginNameTextBox" runat="server" Text='<%# Bind("LoginName") %>' />
                                <br />
                                UserName:
                                <asp:TextBox ID="UserNameTextBox" runat="server" Text='<%# Bind("UserName") %>' />
                                <br />
                                Age:
                                <asp:TextBox ID="AgeTextBox" runat="server" Text='<%# Bind("Age") %>' />
                                <br />
                                Address:
                                <asp:TextBox ID="AddressTextBox" runat="server" Text='<%# Bind("Address") %>' />
                                <br />
                                Tel:
                                <asp:TextBox ID="TelTextBox" runat="server" Text='<%# Bind("Tel") %>' />
                                <br />
                                EMail:
                                <asp:TextBox ID="EMailTextBox" runat="server" Text='<%# Bind("EMail") %>' />
                                <br />
                                RegTime:
                                <asp:TextBox ID="RegTimeTextBox" runat="server" Text='<%# Bind("RegTime") %>' />
                                <br />
                                
                                Introduction:
                                <asp:TextBox ID="IntroductionTextBox" runat="server" Text='<%# Bind("Introduction") %>' />
                                <br />
                                
                                <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="Insert" />
                                &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
                            </InsertItemTemplate>
                            <ItemTemplate>
                                <table class="auto-style1">
                                    <tr>
                                        <td>用户ID: </td>
                                        <td>
                                            <asp:Label ID="UserIDLabel" runat="server" Text='<%# Eval("UserID") %>' />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>登陆账号: </td>
                                        <td>
                                            <asp:Label ID="LoginNameLabel" runat="server" Text='<%# Bind("LoginName") %>' />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>昵称: </td>
                                        <td>
                                            <asp:Label ID="UserNameLabel" runat="server" Text='<%# Bind("UserName") %>' />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>年龄:</td>
                                        <td>
                                            <asp:Label ID="AgeLabel" runat="server" Text='<%# Bind("Age") %>' />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>地址: </td>
                                        <td>
                                            <asp:Label ID="AddressLabel" runat="server" Text='<%# Bind("Address") %>' />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>手机号: </td>
                                        <td>
                                            <asp:Label ID="TelLabel" runat="server" Text='<%# Bind("Tel") %>' />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>EMail: </td>
                                        <td>
                                            <asp:Label ID="EMailLabel" runat="server" Text='<%# Bind("EMail") %>' />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>注册时间:</td>
                                        <td>
                                            <asp:Label ID="RegTimeLabel" runat="server" Text='<%# Bind("RegTime") %>' />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>自我简介:</td>
                                        <td>
                                            
                                            <asp:TextBox ID="IntroductionLabel" runat="server" Text='<%# Bind("Introduction") %>' TextMode="MultiLine" Columns="50" Rows="10"  CssClass="mm_c_h" ></asp:TextBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <asp:LinkButton ID="EditButton" runat="server" CausesValidation="False" CommandName="Edit" Text="修改资料" />
                                        </td>
                                        <td>&nbsp;</td>
                                    </tr>
                                </table>
                                <br />
                                
                            </ItemTemplate>
                        </asp:FormView>
                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:conn %>" SelectCommand="SELECT 
UserID, LoginName, UserName, Age, Address, Tel , EMail, RegTime,Introduction 
FROM t_user 
WHERE (UserID = @UserID)" UpdateCommand="UPDATE t_user 
SET UserName = @UserName, Age = @Age, Address = @Address, Tel = @Tel, EMail = @EMail ,Introduction = @Introduction
WHERE (UserID = @UserID)">
                            <SelectParameters>
                                <asp:SessionParameter Name="UserID" SessionField="UserID" />
                            </SelectParameters>
                            <UpdateParameters>
                                <asp:Parameter Name="UserName" />
                                <asp:Parameter Name="Age" />
                                <asp:Parameter Name="Address" />
                                <asp:Parameter Name="Tel" />
                                <asp:Parameter Name="EMail" />
                                <asp:Parameter Name="Introduction" />
                                <asp:Parameter Name="UserID" />
                            </UpdateParameters>
                        </asp:SqlDataSource>
                       
					</div>
				 </asp:Content>

