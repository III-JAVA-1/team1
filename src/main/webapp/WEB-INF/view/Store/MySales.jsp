<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <script type="text/javascript" src="Store/js/jquery-1.12.4.js"></script>
    <script type="text/javascript" src="Store/js/test.js"></script>
    <script type="text/javascript" src="https://cdn.jsdelivr.net/jquery/latest/jquery.min.js"></script>
    <script type="text/javascript" src="https://cdn.jsdelivr.net/momentjs/latest/moment.min.js"></script>
    <script type="text/javascript" src="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.min.js"></script>
    <link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.css"/>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css"
          integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">
    <!-- Custom styles for this template -->
    <link href="Store/css/mySales.css" rel="stylesheet">
    <title>我的銷售</title>
</head>
<body>
<div class="all-card-div">
    <div class="status-btn d-flex bd-highlight">
        <div class="p-2 bd-highlight all" onclick="setOrderStatus()">全部</div>
        <div class="p-2 bd-highlight to-be-shipped" onclick="setOrderStatus(1)">待出貨</div>
        <div class="p-2 bd-highlight shipped" onclick="setOrderStatus(2)">已出貨</div>
        <div class="p-2 bd-highlight cancel" onclick="setOrderStatus(-1)">取消</div>
    </div>
    <hr>
    <div class="d-flex bd-highlight mb-3">
        <nav class="navbar navbar-light mr-auto p-2 bd-highlight">
            <form>
                <input class="form-control mr-sm-2 search-bar" id="searchInput" type="search" placeholder="Search"
                       aria-label="Search">
            </form>
        </nav>
        <div class="date-div">訂單成立日期(單)
            <input class="p-2 bd-highlight date-bar" type="text" name="daterange" value="01/01/2021 - 12/31/2021"/>
        </div>
    </div>

    <div class="card-div">
        <div class="top-div d-flex bd-highlight">
            <div class="flex-grow-1 bd-highlight products">商品</div>
            <div class="bd-highlight product-price-t">買家應付金額</div>
            <div class="bd-highlight product-status-t">狀態</div>
            <div class="bd-highlight delivery-time-t">訂單生成日期</div>
            <div class="bd-highlight detail-btn-t">操作</div>
        </div>
    </div>

    <div id="cardDiv">

    </div>
</div>

<script>

    let memberId = "${memberId}";
    let orderStatus;
    let orderId = "";
    let startDate = "20210101";
    let endDate = "20211231";

    // 時間選擇監聽
    $(function () {
        $('input[name="daterange"]').daterangepicker({
            opens: 'left'
        }, function (start, end, label) {
            console.log("A new date selection was made: " + start.format('YYYY-MM-DD') + ' to ' + end.format('YYYY-MM-DD'));
            startDate = start.format('YYYYMMDD')
            endDate = end.format('YYYYMMDD')
            getOrderList();
        });
    });

    let searchInput = document.getElementById("searchInput");

    // 監聽按下enter
    searchInput.addEventListener("keyup", function (event) {
        // Number 13 is the "Enter" key on the keyboard
        if (event.keyCode === 13) {
            event.preventDefault();
            orderId = searchInput.value;
            getOrderList();
        }
    });

    // 設定訂單狀態
    function setOrderStatus(status) {
        orderStatus = status;
        getOrderList();
    }

    function getOrderList() {

        let req = {
            "orderId": orderId,
            "orderStatus": orderStatus,
            "startDate": startDate,
            "endDate": endDate
        };

        // 跟server post傳輸
        $.ajax({
            // 傳輸格式
            type: "POST",
            // 要傳輸的位置
            url: "mySales/getOrderList",
            // 要傳輸的資料(只有Post才有) body
            data: JSON.stringify(req),
            // 傳輸的格式
            dataType: "json",
            // 傳輸的格式
            contentType: "application/json",

            // 成功時要做的事(res後端回傳訊息)
            success: function (res) {
                let cardHtml = "";
                let cardDiv = document.getElementById("cardDiv");
                res.orderList.forEach(function (data) {

                    let img = data.img == null ? "Store/images/no_picture.gif" : data.img;

                    cardHtml +=
                        "<div class=\"card card-div\">" +
                        "<div class=\"d-flex bd-highlight mb-3\">\n" +
                        "<div class=\"card-header flex-grow-1 bd-highlight customer-name\">買家信箱: " + data.name + "</div>\n" +
                        "<div class=\"card-header bd-highlight order-id\">訂單編號: " + data.orderId + "</div>\n" +
                        "</div>" +
                        "<div class=\"card-body d-flex bd-highlight mb-3\">\n" +
                        "<div class=\"product-div bd-highlight\">\n" +
                        "<img class=\"product-img\" src=\"" + img + "\"/>" + data.productName + "\n" +
                        "</div>\n" +
                        " <div class=\"product-price p-2 bd-highlight\">NT$" + data.cost + "</div>\n" +
                        "<div class=\"product-status\">" +
                        "<select class=\"form-control p-2 bd-highlight\" onchange='editStatus(" + data.orderId + ", this.value)'>\n";

                    if (data.orderStatus === -1) {
                        cardHtml +=
                            "<option value='1'>待出貨</option>\n" +
                            "<option value='2'>已出貨</option>\n" +
                            "<option value='-1' selected>已取消</option>\n";
                    } else if (data.orderStatus === 1) {
                        cardHtml +=
                            "<option value='1' selected>待出貨</option>\n" +
                            "<option value='2'>已出貨</option>\n" +
                            "<option value='-1'>已取消</option>\n";
                    } else {
                        cardHtml +=
                            "<option value='1'>待出貨</option>\n" +
                            "<option value='2' selected>已出貨</option>\n" +
                            "<option value='-1'>已取消</option>\n";
                    }

                    cardHtml +=
                        "</select>\n" +
                        "</div>" +
                        "<div class=\"delivery-time p-2 bd-highlight\">" + data.date + "</div>\n" +
                        "<div class=\"operate p-2 bd-highlight detail-btn\" onclick='goDetail(" + data.orderId + ")'>\n" +
                        "<img src=\"Store/images/paper.svg\" width=\"15px\" height=\"15px\"/>\n" +
                        "查看詳情\n" +
                        "</div>\n" +
                        "</div>" +
                        "</div>" +
                        "</div>"
                })
                cardDiv.innerHTML = cardHtml;
            },
            // 失敗時要做的事
            error: function () {
                alert("發生了一點錯誤")
            }
        });
    }

    getOrderList();

    function editStatus(orderId, status) {
        let req = {
            "orderId": parseInt(orderId),
            "status": parseInt(status)
        };

        // 跟server post傳輸
        $.ajax({
            // 傳輸格式
            type: "POST",
            // 要傳輸的位置
            url: "mySales/editOrderStatus",
            // 要傳輸的資料(只有Post才有) body
            data: JSON.stringify(req),
            // 傳輸的格式
            dataType: "json",
            // 傳輸的格式
            contentType: "application/json",
            // 成功時要做的事(res後端回傳訊息)
            success: function (res) {
                if (!res.success) {
                    alert("發生了一點錯誤")
                }
            },
            // 失敗時要做的事
            error: function () {
                alert("發生了一點錯誤")
            }
        });
    }

    /**
     * 跳轉至詳細頁面
     */
    function goDetail(orderId) {
        window.location.href = "orderDetailPage?memberId=" + memberId + "&orderId=" + orderId;
    }
</script>

</body>
</html>
