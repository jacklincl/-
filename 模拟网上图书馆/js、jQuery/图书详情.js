$(document).ready(function () {

    $("#TextBox1").bind('input propertychange', function () {
        var t = $(this).val() + "px";
        $("#detail").css("font-size", t);
    });

    var _id = $("#text_id").val();
    var url1 = "../读者/订阅.aspx?bookid=" + _id;
    var url2 = "../读者/收藏.aspx?bookid=" + _id;
    $("#text_id").hide();
    //监听收藏、借阅按钮
    $("#btn_souc").click(function () {
        open(url2);
    });

    $("#btn_jiey").click(function () {
        open(url1);
    });
});