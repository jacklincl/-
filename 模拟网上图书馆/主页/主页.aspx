<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="主页.aspx.cs" Inherits="模拟网上图书馆.主页.主页" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>模拟网上图书馆主页</title>
    <link href="../样式表/主页.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
        <div class="img">
<img src="../图片/u=3287406094,810850107&fm=21&gp=0.jpg" />
            </div>
        <div class="nav0">
        <div class="nav">     
        <ul>         
            <li><a href="主页.aspx">主页</a></li> 

            <li><a href="#">资源</a>
                <ul>
            <li><a href="浏览.aspx">馆藏目录</a></li>                   
            <li><a href="搜索.aspx" target="_blank" >搜索</a></li>                  
            <li><a href="#">特色资源</a></li>
            <li><a href="#">电子图书</a></li>
        </ul>
            </li>


            <li><a href="#">服务</a>
                <ul>
            <li><a href="../读者/订阅.aspx">我的订阅</a></li>                  
            <li> <a href="../读者/个人信息.aspx">个人页</a></li>                  
            <li><a href="#">文献提供</a></li>
            <li><a href="#">咨询服务</a></li>
        </ul>
            </li>
            <li><a href="#">指南</a>
                <ul>
            <li><a href="#">开放时间</a></li>
            <li><a href="#">图书馆规则</a></li>
            <li><a href="#">馆藏分布</a></li>
            <li><a href="#">学科指南</a></li>
        </ul>
            </li>
            <li><a href="#">互动</a>
                <ul>
            <li><a href="#">读者调查</a></li>
            <li><a href="#">资源荐购</a></li>
            <li><a href="#">新书介绍</a></li>
            <li><a href="#">图书捐赠</a></li>
        </ul>
            </li>
            <li><a href="#">关于</a>
                <ul>
            <li><a href="#">概况</a></li>
            <li><a href="#">组织机构</a></li>
            <li><a href="#">介绍</a></li>
            <li><a href="关于.html">制作人员</a></li>                   
        </ul>
            </li>
        </ul>
    </div>
            </div>

<div class="mimg">
<img class="img2" src="../图片/71q58PICZzp_1024.jpg" />
    </div>

        <div class="mid">
        <asp:ImageButton ID="search1" runat="server" ImageUrl="~/图片/Find.png" ToolTip="本站搜索" PostBackUrl="~/主页/搜索.aspx" Target="_new" />
        <asp:ImageButton ID="search2" runat="server" ImageUrl="~/图片/ooopic_1478059935.ico" ToolTip="全网搜索" PostBackUrl="https://www.baidu.com/" target="_blank"/>
        <asp:ImageButton ID="Login" runat="server" ImageUrl="~/图片/u=398048266,3761464342&fm=23&gp=0.jpg" PostBackUrl="~/主页/登录.aspx" ToolTip="登录"/>
</div>

        <div class="mid22">
        <div class ="mid2">
            <ul>
                <li><a>资源</a>
                    <ul>
                        <li><a href="#" target="_blank">馆藏目录</a></li>
                        <li><a href="#" target="_blank">数据库</a></li>
                        <li><a href="#" target="_blank">特色资源</a></li>
                    </ul>
                </li>
                <li><a>服务</a>
                    <ul>
                        <li><a href="#" target="_blank">图书借还</a></li>
                        <li><a href="#" target="_blank">培训讲座</a></li>
                        <li><a href="#" target="_blank">文献查询</a></li>
                    </ul>
                </li>
                <li><a>指南</a>
                    <ul>
                        <li><a href="#" target="_blank">电子图书</a></li>
                        <li><a href="#" target="_blank">读者调查</a></li>
                        <li><a href="#" target="_blank">资源荐购</a></li>
                    </ul>
                </li>
                <li><a>关于</a>
                    <ul>
                        <li><a href="#" target="_blank">概况</a></li>
                        <li><a href="#" target="_blank">组织机构</a></li>
                        <li><a href="#" target="_blank">介绍</a></li>
                    </ul>
                </li>
            </ul>
    </div>
         </div>

        <div class="foot">
            <div class="mess"><p>模拟重庆交通大学图书馆<br/>Copyright©2012 CQJTU重庆交通大学图书馆 版权所有</p></div>
<div class="up-link">
<a href="http://www.cqjtu.edu.cn" target="_blank">重庆交通大学</a><br />
<a href="http://library.cqjtu.edu.cn/" target="_blank">交大图书馆</a>
</div>

        </div>
    </form>
</body>

</html>
