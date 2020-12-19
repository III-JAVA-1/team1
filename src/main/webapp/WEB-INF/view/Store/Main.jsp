<%@ page contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>

<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <script type="text/javascript" src="js/jquery-1.12.4.js"></script>
    <script type="text/javascript" src="js/test.js"></script>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css"
          integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">
    <title>First Spring MVC</title>
</head>
<body>
<div id="my-div" style="background-color: blue; padding: 20px">

</div>

<script>
    let req = JSON.stringify({
        "test": "測試輸出文字的啦"
    });

    // 跟server post傳輸
    $.ajax({
        type: "POST",
        url: "test01",
        data: req,
        dataType: "json",
        contentType: "application/json",
        success: function (res) {
            $("#my-div").append(res.ecpayHtml);
        },
        error: function () {
            alert('error');
        }
    });

    // 放在上面
    document.body.append(divMaker("不爽啦"))
    document.querySelector("#my-div").append(divMaker("爽啦"));
</script>
</body>
</html>
