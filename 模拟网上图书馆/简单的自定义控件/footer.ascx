<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="footer.ascx.cs" Inherits="模拟网上图书馆.简单的自定义控件.footer" %>

<style type="text/css" >
    body{position:relative;}
    .foot {
    position: absolute;
    bottom: 10px;
    width: 97%;
    height: 40px;
    padding: 10px;
    background-color: aquamarine;
}
    .foot img {
    position: absolute;
    left: 25%;
    height: 40px;
}
    .foot p {
    position: absolute;
    left: 40%;
    top: 0%;
    text-align: center;
}
    .foot .a1 {
    position: absolute;
    left: 55%;
    text-decoration: none;
    color: black;
}
    .foot .a2 {
    position: absolute;
    left: 55%;
    top: 55%;
    text-decoration: none;
    color: black;
}
    .foot .a2:hover,.foot .a1:hover{text-decoration:underline;color:blue;}

</style>

<div class="foot">
    <img src="../图片/48c9b33dd4e527611da62.jpg" />
    <p>模拟交大图书馆<br/>2016年12月</p>
    <a class="a1" href="http://www.cqjtu.edu.cn/" target="_blank" >重庆交通大学</a>
    <a class="a2" href="http://library.cqjtu.edu.cn/">交大图书馆</a>
</div>