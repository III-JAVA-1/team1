<%@ page contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>

<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <script type="text/javascript" src="Store/js/jquery-1.12.4.js"></script>
    <script type="text/javascript" src="Store/js/change-page.js"></script>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css"
          integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">
    <!-- Custom styles for this template -->
    <link href="Store/css/productDetail.css" rel="stylesheet">
    <title>${productName}</title>
</head>
<body>
<jsp:include page="Header.jsp"/>
<div class="d-flex flex-row flex-wrap div1">
    <div class="justify-content-start">
        <fieldset class="fieldset1">
            <div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel">
                <ol class="carousel-indicators">
                    ${indicators}
                </ol>
                <div class="carousel-inner">
                    ${carousel}
                </div>
                <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
                    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                    <span class="sr-only">Previous</span>
                </a>
                <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
                    <span class="carousel-control-next-icon" aria-hidden="true"></span>
                    <span class="sr-only">Next</span>
                </a>
            </div>
        </fieldset>
    </div>
    <div class="d-flex justify-content-start flex-column bd-highlight mb-3 div2 ">
        <h3>${productName}</h3>

        <P class="price">$${price}</P>

        <h5 class="h5 mb-auto p-2 bd-highlight">新增日期: ${date}</h5>
        <div class="bd-highlight btn1">
            <button type="button" class="btn btn-outline-warning" onclick="addShoppingCart(${id}, false)">加入購物車</button>
            <button type="button" class="btn btn-outline-warning" onclick="addShoppingCart(${id}, true)">直接購買</button>
            <img id="like" src="${likeImage}" onclick="setFavorite()" width="30px" height="30px">
        </div>
    </div>

</div>

<div class="div3">
    <legend>商品規格</legend>
    <div class="st1">
        <P>類別: ${category}</P>
        <P>寵物種類: ${animal}</P>
        <br>
    </div>
    <legend>商品敘述</legend>
    <div class="st1">
        <P>${introduction}</P>
    </div>
</div>

<div class="div3">
    <div class="st2">商品評價</div>
    <legend>
        <div class="d-flex bd-highlight">
            <div class="align-self-start" id="avgRate">
            </div>
            <div class="d-flex align-items-center my-div-list-margin">
                <button type="button" class="btn btn-outline-danger my-btn-margin" onclick="getRate()">全部</button>
                <button type="button" class="btn btn-outline-danger my-btn-margin" onclick="getRate(5)">五星</button>
                <button type="button" class="btn btn-outline-danger my-btn-margin" onclick="getRate(4)">四星</button>
                <button type="button" class="btn btn-outline-danger my-btn-margin" onclick="getRate(3)">三星</button>
                <button type="button" class="btn btn-outline-danger my-btn-margin" onclick="getRate(2)">二星</button>
                <button type="button" class="btn btn-outline-danger my-btn-margin" onclick="getRate(1)">一星</button>
                <%--                <button type="button" class="btn btn-outline-danger my-btn-margin">附加評論</button>--%>
            </div>
        </div>
    </legend>
    <div id="rateList">
        <div class="custom-message-area">
        </div>
    </div>
</div>
Ï


${modProduct}
<img id="shopcart" width="50" height="50" onclick="goShoppingCart()" src="Store/images/shopcart.svg" alt="">

<!-- Footer -->
<jsp:include page="Footer.jsp"/>

<!-- Option 1: jQuery and Bootstrap Bundle (includes Popper) -->
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"
        integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
        crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-ho+j7jyWK8fNQe+A12Hb8AhRq26LrZ/JpcUGGOn+Y7RsweNrtN/tE3MoK7ZeZDyx"
        crossorigin="anonymous"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

<script>
    let productId = "${productId}";
    let memberId = "${memberId}";

    function goShoppingCart() {
        if (memberId == "" || memberId == "null") {
            alert("請先登入")
            goLogin();
        } else {
            window.location.href = "shoppingCart?memberId=" + memberId;
        }
    }

    function addShoppingCart(productId, isGoNextPage) {
        //取消下層點擊事件
        event.stopPropagation();

        if (memberId == "" || memberId == "null") {
            alert("請先登入")
            goLogin();
            return
        }

        let req = {
            "productId": parseInt(productId),
            "quantity": 1,
            "customerId": memberId
        };

        // 跟server post傳輸
        $.ajax({
            // 傳輸格式
            type: "POST",
            // 要傳輸的位置
            url: "shoppingCart/add",
            // 要傳輸的資料(只有Post才有) body
            data: JSON.stringify(req),
            // 傳輸的格式
            dataType: "json",
            // 傳輸的格式
            contentType: "application/json",

            // 成功時要做的事(res後端回傳訊息)
            success: function (res) {
                if (isGoNextPage) {
                    goShoppingCart();
                } else {
                    alert('成功加入購物車');
                }
            },
            // 失敗時要做的事
            error: function () {
                alert('加入購物車失敗');
            }
        });
    }

    function getRate(rate) {
        let req = JSON.stringify({
            "productId": productId,
            "rateCount": rate
        });
        // 跟server post傳輸
        $.ajax({
            type: "POST",
            url: "getRateList",
            data: req,
            dataType: "json",
            contentType: "application/json",
            success: function (res) {
                let avgRate = document.getElementById("avgRate");
                let rateListDiv = document.getElementById("rateList");
                let rateHtml = "";
                res.rateList.forEach(function (rateData) {
                    rateHtml += "<div class=\"custom-message-area\">\n" +
                        "<P class=\"member-account\">"
                        + rateData.name
                        + "</P>\n" +
                        "<P class=\"build-date\">" + rateData.date + "</P>\n" +
                        "<div class=\"\">\n";

                    for (let i = 1; i <= 5; i++) {
                        if (i <= rateData.rateCount) {
                            rateHtml += "<img src=\"Store/images/star.svg\" width=\"12px\" height=\"12px\">\n";
                        } else {
                            rateHtml += "<img src=\"Store/images/noStar.svg\" width=\"12px\" height=\"12px\">\n";
                        }
                    }
                    rateHtml += "</div>\n" +
                        "<P class=\"message\">\n" +
                        rateData.message +
                        "<hr>\n" +
                        "</div>";
                })
                rateListDiv.innerHTML = rateHtml;

                let avgRateHtml = "<P class=\"star-rate\">" + res.avgRate + "/5.0" + "</P>\n"
                for (let i = 1; i <= 5; i++) {
                    if (i <= res.avgRate) {
                        avgRateHtml += "<img src=\"Store/images/star.svg\" width=\"20px\" height=\"20px\">\n";
                    } else {
                        avgRateHtml += "<img src=\"Store/images/noStar.svg\" width=\"20px\" height=\"20px\">\n";
                    }
                }
                avgRate.innerHTML = avgRateHtml
            },
            error: function () {
                alert('error');
            }
        });
    }

    getRate();

    function setFavorite() {

        if (memberId == "") {
            alert("請先登入");
            return;
        }

        let req = JSON.stringify({
            "customerId": memberId,
            "productId": parseInt(productId)
        });

        // 跟server post傳輸
        $.ajax({
            type: "POST",
            url: "addFavorite",   //action裡的路經
            data: req,
            dataType: "json",
            contentType: "application/json",
            success: function (res) {
                let like = document.getElementById("like");
                if (res.isFavorite) {
                    like.src = "Store/images/like.svg"
                    // alert("收藏成功")
                } else {
                    like.src = "Store/images/noLike.svg"
                    // alert("取消收藏")
                }
            },
            error: function () {
                alert('error');
            }
        });

    }

    function doDelete(){
        let req = JSON.stringify({
            "id": parseInt(productId)
        });

        // 跟server post傳輸
        $.ajax({
            type: "POST",
            url: "deleteProduct",
            data: req,
            dataType: "json",
            contentType: "application/json",
            success: function (res) {
                if(res.success){
                    window.location.href = "/Store?memberId=" + memberId;
                }else{
                    alert('刪除失敗');
                }
            },
            error: function () {
                alert('刪除失敗');
            }
        });
    }

    function goUpdate(){
        window.location.href = "UpdateProduct?memberId=" + memberId
            + "&productId=" + productId;
    }

</script>

</body>
</html>
