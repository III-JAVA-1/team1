<%@ page contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>

<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <script type="text/javascript" src="Store/js/jquery-1.12.4.js"></script>
    <script type="text/javascript" src="Store/js/test.js"></script>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css"
          integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">
    <link href="Store/css/noProduct.css" rel="stylesheet">

    <title>我的購物車</title>
</head>
<body>

<fieldset class="success">
    <div class="text-center">
        <img class="noproduct" width="180" height="180" src="Store/images/noproduct.png">
        <p class="mb-0">您的購物車還是空的。</p>
        <div class="btn1">
            <button type="button" onclick="goStore()" class="btn btn-warning justify-content-center">來去逛逛吧!</button>
        </div>
    </div>
</fieldset>



<script>

    let memberId = "${memberId}";

    function goStore() {
        window.location.href = "Store/?memberId=" + memberId;
    }
</script>
</body>
</html>
