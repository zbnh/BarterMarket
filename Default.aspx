<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <script src="js/jquery-1.8.3.min.js"></script>
		<script src="js/slide.js"></script>
		<script>
		    $(function () {
		        $('.ck-slide').ckSlide({
		            autoPlay: true
		        });
		    });
		</script>
    <link rel="stylesheet" href="css/slide.css"/>
</asp:Content>


<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <%--<div id="inav">
				<ul>
					<li><a href="Default.aspx"><span>首页</span></a></li>
					<li><a href="#"><span>我要换</span></a></li>
					<li><a href="publish.aspx"><span>我要传</span></a></li>
				</ul>
			</div>--%>
			<div id="icontent">
                <div class="ixtitle"></div>
				<div id="ileft_nav">
				<%--<ul>
						
						<li><a href="SearchType.aspx?Item_Type=03%"><span>电脑数码</span></a></li>
						<li><a href="SearchType.aspx?Item_Type=05%"><span>服饰鞋包</span></a></li>
						<li><a href="SearchType.aspx?Item_Type=0105"><span>图书音像</span></a></li>
						<li><a href="SearchType.aspx?Item_Type=02%"><span>家常用品</span></a></li>
						<li><a href="Search.aspx?Item_Name=%%"><span>查看全部</span></a></li>
					</ul>--%>
<asp:Menu ID="Menu1" runat="server">
                        <Items>
                            <asp:MenuItem NavigateUrl="~/SearchType.aspx?Item_Type=03%" Text="电脑/硬件" ToolTip="电脑/硬件" Value="电脑/硬件">
                                <asp:MenuItem NavigateUrl="~/SearchType.aspx?Item_Type=0300" Text="电脑/软件/网络" ToolTip="电脑/软件/网络" Value="电脑/软件/网络"></asp:MenuItem>
                                <asp:MenuItem NavigateUrl="~/SearchType.aspx?Item_Type=0301" Text="电脑硬件" ToolTip="电脑硬件" Value="电脑硬件"></asp:MenuItem>
                                <asp:MenuItem NavigateUrl="~/SearchType.aspx?Item_Type=0302" Text="笔记本电脑" ToolTip="笔记本电脑" Value="笔记本电脑"></asp:MenuItem>
                                <asp:MenuItem NavigateUrl="~/SearchType.aspx?Item_Type=0303" Text="电脑周边" ToolTip="电脑周边" Value="电脑周边"></asp:MenuItem>
                            </asp:MenuItem>
                            <asp:MenuItem Text="手机/配件" ToolTip="手机/配件" Value="手机/配件" NavigateUrl="~/SearchType.aspx?Item_Type=06%" >
                                <asp:MenuItem NavigateUrl="~/SearchType.aspx?Item_Type=0601" Text="手机" ToolTip="手机" Value="手机"></asp:MenuItem>
                                <asp:MenuItem NavigateUrl="~/SearchType.aspx?Item_Type=0602" Text="手机配件" ToolTip="手机配件" Value="手机配件"></asp:MenuItem>
                                <asp:MenuItem NavigateUrl="~/SearchType.aspx?Item_Type=0603" Text="手机饰品" ToolTip="手机饰品" Value="手机饰品"></asp:MenuItem>
                            </asp:MenuItem> 
                             <asp:MenuItem Text="日常服装" ToolTip="日常服装" Value="日常服装" NavigateUrl="~/SearchType.aspx?Item_Type=05%">
                                 <asp:MenuItem NavigateUrl="~/SearchType.aspx?Item_Type=0501" Text="衬衫/针织衫" ToolTip="衬衫/针织衫" Value="衬衫/针织衫"></asp:MenuItem>
                                 <asp:MenuItem NavigateUrl="~/SearchType.aspx?Item_Type=0502" Text="牛仔系列" ToolTip="牛仔系列" Value="New Item"></asp:MenuItem>
                                 <asp:MenuItem NavigateUrl="~/SearchType.aspx?Item_Type=0503" Text="蕾丝衫/雪纺衫" ToolTip="蕾丝衫/雪纺衫" Value="蕾丝衫/雪纺衫"></asp:MenuItem>
                            </asp:MenuItem>
                            <asp:MenuItem Text="运动用品" ToolTip="运动用品" Value="运动用品" NavigateUrl="~/SearchType.aspx?Item_Type=01%">
                                <asp:MenuItem NavigateUrl="~/SearchType.aspx?Item_Type=0101" Text="运动用品/鞋/服" ToolTip="运动用品/鞋/服" Value="运动用品/鞋/服"></asp:MenuItem>
                                <asp:MenuItem NavigateUrl="~/SearchType.aspx?Item_Type=0102" Text="健美/健身" ToolTip="健美/健身" Value="健美/健身"></asp:MenuItem>
                                <asp:MenuItem NavigateUrl="~/SearchType.aspx?Item_Type=0103" Text="旅游/票务" ToolTip="旅游/票务" Value="旅游/票务"></asp:MenuItem>
                            </asp:MenuItem>
                            <asp:MenuItem NavigateUrl="~/SearchType.aspx?Item_Type=0105" Text="图书音像" ToolTip="图书音像" Value="图书音像">
                                <asp:MenuItem Text=" 体育书籍" ToolTip=" 体育书籍" Value=" 体育书籍" NavigateUrl="~/SearchType.aspx?Item_Type=0107"></asp:MenuItem>
                            </asp:MenuItem>
                            <asp:MenuItem NavigateUrl="~/SearchType.aspx?Item_Type=02%" Text="居家/家具" ToolTip="居家/家具" Value="居家/家具">
                                <asp:MenuItem NavigateUrl="~/SearchType.aspx?Item_Type=0200" Text="居家日用/装饰/文具" ToolTip="居家日用/装饰/文具" Value="居家日用/装饰/文具"></asp:MenuItem>
                                <asp:MenuItem NavigateUrl="~/SearchType.aspx?Item_Type=0201" Text="布艺/床品/靠垫/窗帘" ToolTip="布艺/床品/靠垫/窗帘" Value="布艺/床品/靠垫/窗帘"></asp:MenuItem>
                            </asp:MenuItem>

                            
                        </Items>
                    </asp:Menu>
					<%--<ul>
						<li><a id="ia1" href="#" onmouseover="change('img/pic3.jpg')"><span>热门物品</span></a></li>
						<li><a id="ia2" href="#" onmouseover="change('img/pic4.jpg')"><span>电脑数码</span></a></li>
						<li><a id="ia3" href="#" onmouseover="change('img/pic5.jpg')"><span>服饰鞋包</span></a></li>
						<li><a id="ia4" href="#" onmouseover="change('img/pic3.jpg')"><span>图书音像</span></a></li>
						<li><a id="ia5" href="#" onmouseover="change('img/pic4.jpg')"><span>小零物件</span></a></li>
						<li><a id="ia6" href="#" onmouseover="change('img/pic5.jpg')"><span>查看全部</span></a></li>
					</ul>--%></div>
                <div class="icontdiv">
			<div class="ck-slide">
			<ul class="ck-slide-wrapper">
				<li>
					<a href="SearchType.aspx?Item_Type=03%"><img src="img/电脑.png" alt=""/></a>
				</li>
				<li style="display:none">
					<a href="SearchType.aspx?Item_Type=06%"><img src="img/手机.png" alt=""/></a>
				</li>
				<li style="display:none">
					<a href="SearchType.aspx?Item_Type=05%"><img src="img/服装.png" alt=""/></a>
				</li>
				<li style="display:none">
					<a href="SearchType.aspx?Item_Type=01%"><img src="img/运动.png" alt=""/></a>
				</li>
				<li style="display:none">
					<a href="SearchType.aspx?Item_Type=02%"><img src="img/家具.png" alt=""/></a>
				</li>
			</ul>
			<a href="javascript:;" class="ctrl-slide ck-prev" style="background-image: url('img/arrow-left.png')">上一张</a> <a href="javascript:;" class="ctrl-slide ck-next" style="background-image: url('img/arrow-right.png')">下一张</a>
			<div class="ck-slidebox">
				<div class="slideWrap">
					<ul class="dot-wrap">
						<li class="current"><em>1</em></li>
						<li><em>2</em></li>
						<li><em>3</em></li>
						<li><em>4</em></li>
						<li><em>5</em></li>
					</ul>
				</div>
			</div>
		</div>
</div>
				
				
			
                </div>

</asp:Content>

