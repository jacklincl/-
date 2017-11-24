    $(document).ready(function () {

        $("#myctr").hide();
        var _text = $("#btn_open a").html();

        $("#btn_open").click(function () {
            $("#btn_open").hide();
            $("#myctr").show(100);
        });

        $("#btn_close").click(function () {
            $("#myctr").hide();
            $("#btn_open").show(300);
        });
    });
