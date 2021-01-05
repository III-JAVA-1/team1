<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <script type="text/javascript" src="Store/js/jquery-1.12.4.js"></script>
    <script type="text/javascript" src="Store/js/test.js"></script>
    <script type="text/javascript" src="https://cdn.jsdelivr.net/jquery/latest/jquery.min.js"></script>
    <script type="text/javascript" src="https://cdn.jsdelivr.net/momentjs/latest/moment.min.js"></script>
    <script type="text/javascript" src="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.min.js"></script>
    <link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.css" />
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css"
          integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">
    <!-- Custom styles for this template -->
    <link href="Store/css/mySales.css" rel="stylesheet">
    <title>我的銷售</title>
</head>
<body>
<div class="all-card-div">


    <div class="status-btn d-flex bd-highlight">
        <div class="p-2 bd-highlight all">全部</div>
        <div class="p-2 bd-highlight to-be-shipped">待出貨</div>
        <div class="p-2 bd-highlight shipped">已出貨</div>
        <div class="p-2 bd-highlight cancel">取消</div>
    </div>
    <hr>
    <div class="d-flex bd-highlight mb-3">
    <nav class="navbar navbar-light mr-auto p-2 bd-highlight">
        <form>
            <input class="form-control mr-sm-2 search-bar " type="search" placeholder="Search" aria-label="Search">
        </form>
    </nav>
    <div class="date-div">訂單成立日期(單)

        <input class="p-2 bd-highlight date-bar" type="text" name="daterange" value=" 01/01/2021 - 01/31/2021"/>
    </div>
</div>

    <div class="card-div">
        <div class="top-div d-flex bd-highlight">
            <div class="flex-grow-1 bd-highlight products">商品</div>
            <div class="bd-highlight product-price-t">買家應付金額</div>
            <div class="bd-highlight product-status-t">狀態</div>
            <div class="bd-highlight delivery-time-t">出貨時間</div>
            <div class="bd-highlight detail-btn-t">操作</div>
        </div>
    </div>

    <div class="card card-div">
        <div class="d-flex bd-highlight mb-3">
            <div class="card-header flex-grow-1 bd-highlight customer-name">買家姓名</div>
            <div class="card-header bd-highlight order-id">訂單編號: 123456</div>
        </div>
        <div class="card-body d-flex bd-highlight mb-3">
               <div class="product-img p-2 bd-highlight">
                   <img src="Store/images/noStar.svg" width="15px" height="15px"/>我是小星星
               </div>
                <div class="product-price p-2 bd-highlight">NT$150</div>

            <select class="form-control form-control product-status p-2 bd-highlight">
                <option>待出貨</option>
                <option>已出貨</option>
                <option>已取消</option>
            </select>

<%--                <div class="product-status p-2 bd-highlight">已出貨</div>--%>
                <div class="delivery-time p-2 bd-highlight">2020-12-30</div>
                <div class="operate p-2 bd-highlight detail-btn">
                    <img src="Store/images/paper.svg" width="15px" height="15px"/>
                    查看詳情</div>
        </div>
    </div>
</div>
<script>
    $(function() {
        $('input[name="daterange"]').daterangepicker({
            opens: 'left'
        }, function(start, end, label) {
            console.log("A new date selection was made: " + start.format('YYYY-MM-DD') + ' to ' + end.format('YYYY-MM-DD'));
        });
    });
</script>
</body>
</html>
