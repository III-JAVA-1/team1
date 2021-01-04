<%@ page contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>

<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <script type="text/javascript" src="Store/js/jquery-1.12.4.js"></script>
    <script type="text/javascript" src="Store/js/test.js"></script>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css"
          integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">
    <link href="Store/css/orderSuccess.css" rel="stylesheet">
    <title>恭喜完成訂單</title>
</head>
<body>
<%--<jsp:include page="Header.jsp"/>--%>
<fieldset class="success">
    <blockquote class="blockquote text-center">
        <p class="mb-0">感謝您的訂購。</p>
        <footer class="st1 blockquote-footer">歡迎您再度光臨</footer>
        <div class="btn1">
            <button type="button" class="btn btn-warning justify-content-center" onclick="goStore()">返回逛逛</button>
        </div>
    </blockquote>

</fieldset>
<div class="tb1">
    <div class="title1">購物明細</div>
    <table class="table">
        <thead>
        <tr class="tr1">
            <th colspan="2">訂單商品</th>
            <th scope="col" class="item-count">單價</th>
            <th scope="col" class="item-count">數量</th>
            <th scope="col" class="item-count">總價</th>
        </tr>
        </thead>
        <tbody>
        ${orderItem}
        </tbody>
    </table>
    <form class="btnborder">
        <hr>
        <div class="row">
            <div class="col my-col">
                <p class="message">備註: ${remarks}

                </p>
            </div>
            <div class="col my-col">
                <p class="address">寄送資訊: ${address}

                </p>
            </div>
        </div>
        <hr>
        <p class="p3">小計: $${orderPrice}</p>
        <p class="p3">付款方式: ${payType}</p>
        <p class="p3">運費: $${shipping}</p>
        <hr>
        <p class="p1">訂單金額: $${orderTotalPrice}</p>
    </form>
</div>


<!-- Footer -->
<jsp:include page="Footer.jsp"/>

<script>
    let memberId = "${memberId}";
    function goStore() {
        window.location.href = "Store?memberId=" + memberId;
    }

</script>

</body>
</html>
