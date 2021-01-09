<%@ page contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <script type="text/javascript" src="../Store/js/jquery-1.12.4.js"></script>
    <script type="text/javascript" src="../Store/js/change-page.js"></script>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css"
          integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">
    <link href="../Store/css/store.css" rel="stylesheet">
    <title>毛孩商城</title>
</head>
<body>
<jsp:include page="Header.jsp"/>
<div class="d-flex justify-content-center container">
    <!-- 賣場logo -->
    <img class="logo-img" src="../Store/images/pet-logo.jpg">

    <div class="input-group mb-3 align-self-center my-searchbar">
        <input type="text" class="form-control" placeholder="請輸入關鍵字" aria-label="Recipient's username"
               aria-describedby="button-addon2" id="searchInput">
        <div class="input-group-append">
            <button class="btn btn-outline-secondary" type="button" id="searchButton" onclick="doSearch()">
                <img src="../Store/images/search.svg" width="20" height="20"></button>
        </div>
    </div>
</div>

<!-- 輪播圖 -->
<div class="d-flex justify-content-center div1">
    <fieldset class="fieldset1">
        <div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel">
            <ol class="carousel-indicators">
                <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
                <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
                <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
            </ol>
            <div class="carousel-inner">
                <div class="carousel-item active">
                    <img src="../Store/images/banner-2.jpg" class="d-block roll-img" alt="...">
                </div>
                <div class="carousel-item">
                    <img src="../Store/images/banner-1.jpg" class="d-block roll-img" alt="...">
                </div>
                <div class="carousel-item">
                    <img src="../Store/images/banner-3.jpg" class="d-block roll-img" alt="...">
                </div>
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


<div id="store" class="container">

    <!-- 類別選單 -->
    <div class="d-flex">
        <div class="product-category mr-auto p-2">
            ${product_category}
        </div>
        <!-- 篩選條件 -->
        <div class="btn-group p-2" role="group" aria-label="Button group with nested dropdown">
            <div class="btn-group button-sort" role="group">
                <button id="btnGroupDrop1" type="button" class="btn btn-secondary dropdown-toggle"
                        data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                    寵物類別
                </button>
                <div class="dropdown-menu" aria-labelledby="btnGroupDrop1">
                    <a class="dropdown-item animal-btn active" onclick="animalClick(this,0)">全部</a>
                    <a class="dropdown-item animal-btn" onclick="animalClick(this,1)">貓</a>
                    <a class="dropdown-item animal-btn" onclick="animalClick(this,2)">狗</a>
                    <a class="dropdown-item animal-btn" onclick="animalClick(this,3)">通用</a>
                </div>
            </div>
            <div class="btn-group button-sort" role="group">
                <button id="btnGroupDrop2" type="button" class="btn btn-secondary dropdown-toggle"
                        data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                    排序
                </button>
                <div class="dropdown-menu" aria-labelledby="btnGroupDrop1">
                    <a class="dropdown-item sort-btn active" onclick="sortClick(this,0)">熱門商品</a>
                    <a id="newSortBtn" class="dropdown-item sort-btn" onclick="sortClick(this,1)">最新商品</a>
                </div>
            </div>
        </div>

    </div>


    <!-- 商品 -->
    <div class="card-group" id="productCards">
    </div>

</div>
<nav class="d-flex justify-content-center" aria-label="Page navigation example">
    <ul id="pages" class="pagination">
        <%--         取得商品列表裡面有組這邊分頁的Html--%>
    </ul>
</nav>


<!-- Footer -->
<jsp:include page="Footer.jsp"/>
<!-- 漂浮球球 -->
<!--
<button type="button" class="btn btn-outline-primary" id="add" style="background-image: url('images/plus.svg')"></button>
-->

<img width="50" height="50" class="shopcart-btn" id="shopcart" onclick="goShoppingCart()"
     src="../Store/images/shopcart.svg" alt="">
<div id="cartCount" class="cart-count">0</div>
<img width="50" height="50" class="goTop-btn" id="goTop"
     src="../Store/images/upward.svg" alt="">
<img width="50" height="50" class="add-btn" id="add" onclick="goAdd()"
     src="../Store/images/plus.svg" alt="">
<img width="50" height="50" class="order-btn" id="order" onclick="goMySales()"
     src="../Store/images/order.svg" alt="">


<%--<button type="button" class="btn btn-outline-primary" id="goindex" onclick="goIndex()"--%>
<%--        style="background-image: url('Store/images/home.svg')"></button>--%>


<!-- Optional JavaScript; choose one of the two! -->

<!-- Option 1: jQuery and Bootstrap Bundle (includes Popper) -->
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"
        integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
        crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-ho+j7jyWK8fNQe+A12Hb8AhRq26LrZ/JpcUGGOn+Y7RsweNrtN/tE3MoK7ZeZDyx"
        crossorigin="anonymous"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

<script>

    let memberId = "${memberId}";
    let pages = 1;

    $(function () {//會到最上層的jquery
        $('#goTop').click(function () {
            $('html,body').animate({scrollTop: 0}, 333);
        });
        $(window).scroll(function () {
            if ($(this).scrollTop() > 300) {
                $('#goTop').fadeIn(222);
            } else {
                $('#goTop').stop().fadeOut(222);
            }
        }).scroll();
    });

    function setAddDisplay() {
        if (memberId !== "1") {
            let goTopBtn = document.getElementById("goTop");
            let orderBtn = document.getElementById("order");
            let addBtn = document.getElementById("add");
            orderBtn.remove();
            addBtn.remove();
            goTopBtn.classList.remove("goTop-btn");
            goTopBtn.classList.add("order-btn");
        }
    }

    setAddDisplay();

    // 查詢條件
    let animal = null;
    let sort = ${sort};
    let name = null;
    let category = null;

    //取得卡片列表資料方法
    function getCards() {

        let req = {
            "animal": animal,
            "sort": sort,
            "name": name,
            "category": category,
            "memberId": memberId,
            "pages": pages
        };

        // 跟server post傳輸
        $.ajax({
            // 傳輸格式
            type: "POST",
            // 要傳輸的位置
            url: "../store/getCard",
            // 要傳輸的資料(只有Post才有) body
            data: JSON.stringify(req),
            // 傳輸的格式
            dataType: "json",
            // 傳輸的格式
            contentType: "application/json",

            // 失敗時要做的事
            error: function () {
                alert('查詢卡片列表失敗');
            },
            // 成功時要做的事(res後端回傳訊息)
            success: function (res) {
                // 初始化卡片Html字串
                let cardHtml = "";
                // 拆解後端回傳的卡片列表資料
                res.cardList.forEach(function (cardData) {
                    // 如果沒有圖片自動換成預設圖,有圖片就放原本圖片
                    let img = cardData.img == null ? "../Store/images/no_picture.gif" : cardData.img;
                    // 組卡片資訊Html
                    cardHtml +=
                        "<div id=\"cardDiv" + cardData.id + "\" class=\"col-lg-3 col-sm-6 portfolio-item\">\n" +
                        "<div class=\"card wei-grid\">\n" +
                        "<div class=\"card-click\" onclick=\"goDetail(" + cardData.id + ")\">\n" +
                        "<div class=\"wei-grid my-card-img-div\">\n" +
                        "<img src=\"" + img + "\" class=\"card-img-top zoom-up-img my-card-img\" alt=\"...\">\n";

                    if (!cardData.isDisplay) {
                        cardHtml += "<img src=\"../Store/images/noDisplay.png\" class=\"card-img-top my-card-img-no-display\" alt=\"...\">\n";
                    }

                    cardHtml += "</div>\n" +
                        "<div class=\"card-body my-card\">\n" +
                        "<div class=\"title-div\">" +
                        "<h6 class=\"card-title titleName\">" + cardData.name + "</h6>\n" +
                        "</div>" +
                        "<p class=\"card-text price-string float-left my-margin\">$" + cardData.price + "</p>\n" +
                        "<img src=\"../Store/images/shopping-cart1.svg\" class=\"shopcartimg float-right my-margin\" " +
                        "width=\"30\" height=\"30\" onclick=\"addShoppingCart(" + cardData.id + "," + cardData.isDisplay + "); return true\">\n";

                    if (cardData.isFavorite) {
                        cardHtml += "<img id=\"like" + cardData.id + "\" " +
                            "src=\"../Store/images/like.svg\" class=\"float-right my-margin\" width=\"30\" height=\"30\" " +
                            "onclick=\"setFavorite(" + cardData.id + "," + cardData.isDisplay + "); return true\">\n";
                    } else {
                        cardHtml += "<img id=\"like" + cardData.id + "\" " +
                            "src=\"../Store/images/noLike.svg\" class=\"float-right my-margin\" width=\"30\" height=\"30\" " +
                            "onclick=\"setFavorite(" + cardData.id + "," + cardData.isDisplay + "); return true\">\n";
                    }

                    cardHtml += "</div>\n" + "</div>\n";

                    //判斷有登入才顯示
                    if (memberId !== "" && memberId === "1") {
                        cardHtml +=
                            "<div>\n" +
                            "<div class=\"delete-btn d-flex justify-content-center\">\n" +
                            "<button type=\"button\" class=\"btn btn-warning modify-btn\" onclick=\"goUpdate(" + cardData.id + ")\">修改</button>\n" +
                            "<button id='deleteBtn' type=\"button\" class=\"btn btn-danger modify-btn\" " +
                            "data-toggle=\"modal\" data-target=\"#modalCenter" + cardData.id + "\">刪除</button>\n" +
                            "</div>\n" +
                            "</div>\n" +

                            "<div class=\"modal fade\" id=\"modalCenter" + cardData.id + "\" tabindex=\"-1\" role=\"dialog\" aria-labelledby=\"exampleModalCenterTitle\"\n" +
                            "aria-hidden=\"true\">\n" +
                            "<div class=\"modal-dialog modal-dialog-centered\" role=\"document\">\n" +
                            "<div class=\"modal-content\">\n" +

                            "<div class=\"modal-header\">\n" +
                            "<img src=\"../Store/images/warning.svg\" width=\"25\" height=\"25\">\n" +
                            "<h5 class=\"modal-title\" id=\"exampleModalCenterTitle\">注意</h5>\n" +
                            "<button type=\"button\" class=\"close\" data-dismiss=\"modal\" aria-label=\"Close\">\n" +
                            "<span aria-hidden=\"true\">&times;</span>\n" +
                            "</button>\n" +
                            "</div>\n" +

                            "<div class=\"modal-body\">\n" +
                            "確認是否要刪除商品\n" +
                            "</div>\n" +
                            "<div class=\"modal-footer\">\n" +
                            "<button type=\"button\" class=\"btn btn-secondary\" data-dismiss=\"modal\">取消</button>\n" +
                            "<button type=\"button\" class=\"btn btn-danger\" data-dismiss=\"modal\" onclick=\"doDelete(" + cardData.id + " )\">刪除</button>\n" +
                            "</div>\n" +

                            "</div>\n" +
                            "</div>\n" +
                            "</div>";
                    }

                    cardHtml +=
                        "</div>\n" +
                        "</div>";

                });


                // 頁碼元件
                let pageUl = document.getElementById("pages");

                if (cardHtml === "") {
                    // 沒有商品時
                    document.querySelector("#productCards").innerHTML = "<div class='noListDiv '>查無此列表商品</div>"
                    pageUl.innerHTML = "";
                } else {
                    // 有商品時

                    // 把組好的卡片Html放入productCards中
                    document.querySelector("#productCards").innerHTML = cardHtml;

                    // 要組頁碼的Html
                    let previousPage = pages === 1 ? 1 : pages - 1;
                    let nextPage = pages === res.totalPages ? res.totalPages : pages + 1;
                    let pageHtml =
                        "<li class=\"page-item\">\n" +
                        "<a class=\"page-link\" onclick='setPage(" + previousPage + ")' aria-label=\"Previous\">\n" +
                        "<span aria-hidden=\"true\">&laquo;</span>\n" +
                        "<span class=\"sr-only\">Previous</span>\n" +
                        "</a>\n" +
                        "</li>\n";

                    for (let i = 1; i <= res.totalPages; i++) {
                        if (i === pages) {
                            pageHtml += "<li class=\"page-item active\" aria-current=\"page\"><a class=\"page-link\" " +
                                "onclick='setPage(" + i + ")'>" + i + "<span class=\"sr-only\">(current)</span>" +
                                "</a></li>\n";
                        } else {
                            pageHtml += "<li class=\"page-item\"><a class=\"page-link\" " +
                                "onclick='setPage(" + i + ")'>" + i + "</a></li>\n";
                        }
                    }

                    pageHtml += "<li class=\"page-item\">\n" +
                        "<a class=\"page-link\" onclick='setPage(" + nextPage + ")' aria-label=\"Next\">\n" +
                        "<span aria-hidden=\"true\">&raquo;</span>\n" +
                        "<span class=\"sr-only\">Next</span>\n" +
                        "</a>\n" +
                        "</li>";

                    pageUl.innerHTML = pageHtml;
                }

                if (sort === 1) {
                    let storeDiv = document.getElementById("store");
                    storeDiv.scrollIntoView();
                    // 將排序選單換點亮
                    let btnList = document.querySelectorAll(".sort-btn");
                    btnList.forEach(function (btn) {
                        btn.classList.remove("active");
                    })
                    document.getElementById("newSortBtn").classList.add("active");
                }

            }
        });
    }

    //使用取得卡片資料方法
    getCards();

    //選擇動物種類方法
    function animalClick(btn, type) {
        let btnList = document.querySelectorAll(".animal-btn");
        btnList.forEach(function (btn) {
            btn.classList.remove("active");
        })
        btn.classList.add("active");
        if (type === 0) {
            // 全部
            animal = null;
        } else if (type === 1) {
            // 貓
            animal = 1;
        } else if (type === 2) {
            // 狗
            animal = 0;
        } else {
            // 通用
            animal = 2;
        }
        pages = 1;
        //重新取得卡片資料並刷新
        getCards();
    }

    //選擇排序方法
    function sortClick(btn, type) {
        let btnList = document.querySelectorAll(".sort-btn");
        btnList.forEach(function (btn) {
            btn.classList.remove("active");
        })
        btn.classList.add("active");
        sort = type;
        //重新取得卡片資料並刷新
        getCards();
    }

    //取得搜尋欄元件
    let searchInput = document.getElementById("searchInput");

    //給搜尋欄事件監聽
    searchInput.addEventListener("keyup", function (event) {
        //判斷是按下Enter
        if (event.key === 'Enter') {
            //清空原事件處理
            event.preventDefault();
            //取得搜尋按鈕並點擊
            document.getElementById("searchButton").click();
        }
    });

    //執行搜尋
    function doSearch() {
        name = searchInput.value;
        getCards();
    }

    //類別點擊方法
    function categoryClick(button) {
        let id = parseInt(button.value);
        let btnList = document.querySelectorAll(".category-btn");
        btnList.forEach(function (btn) {
            btn.classList.remove("active");
        })
        button.classList.add("active");
        if (id === 0) {
            //判斷id是0時找全部
            category = null;
        } else {
            //其他則找各自id
            category = id;
        }
        pages = 1;
        getCards();
    }

    function addShoppingCart(productId, isDisplay) {
        //取消下層點擊事件
        event.stopPropagation();

        if (memberId == "" || memberId == "null") {
            alert("請先登入")
            goLogin();
            return
        }

        if (!isDisplay) {
            alert("此商品未上架無法加入購物車")
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
            url: "../shoppingCart/add",
            // 要傳輸的資料(只有Post才有) body
            data: JSON.stringify(req),
            // 傳輸的格式
            dataType: "json",
            // 傳輸的格式
            contentType: "application/json",

            // 成功時要做的事(res後端回傳訊息)
            success: function (res) {
                alert('成功加入購物車');
                getCartCount();
            },
            // 失敗時要做的事
            error: function () {
                alert('加入購物車失敗');
            }
        });
    }

    function goShoppingCart() {
        if (memberId == "" || memberId == "null") {
            alert("請先登入")
            goLogin();
        } else {
            window.location.href = "../shoppingCart?memberId=" + memberId;
        }
    }

    function setFavorite(productId, isDisplay) {
        //取消下層點擊事件
        event.stopPropagation();
        if (memberId == "") {
            alert("請先登入");
            return;
        }

        if (!isDisplay) {
            alert("此商品未上架無法加入收藏")
            return;
        }

        let req = JSON.stringify({
            "customerId": memberId,
            "productId": parseInt(productId)
        });

        // 跟server post傳輸
        $.ajax({
            type: "POST",
            url: "../addFavorite",   //action裡的路經
            data: req,
            dataType: "json",
            contentType: "application/json",
            success: function (res) {
                let like = document.getElementById("like" + productId);
                if (res.isFavorite) {
                    like.src = "../Store/images/like.svg"
                    // alert("收藏成功")
                } else {
                    like.src = "../Store/images/noLike.svg"
                    // alert("取消收藏")
                }
            },
            error: function () {
                alert('error');
            }
        });


    }

    function setPage(nextPage) {
        pages = nextPage;
        let storeDiv = document.getElementById("store");
        storeDiv.scrollIntoView();
        getCards();
    }

    function getCartCount() {
        let cartCountDiv = document.getElementById("cartCount");
        if (memberId == "") {
            cartCountDiv.style.visibility = "hidden";
            return;
        }

        let req = JSON.stringify({
            "memberId": memberId
        });

        // 跟server post傳輸
        $.ajax({
            type: "POST",
            url: "../shoppingCartQuantity",
            data: req,
            dataType: "json",
            contentType: "application/json",
            success: function (res) {
                let count = res.quantity;
                if (count === 0) {
                    cartCountDiv.style.visibility = "hidden";
                } else {
                    cartCountDiv.style.visibility = "visible";
                    cartCountDiv.innerHTML = count;
                }
            },
            error: function () {
                alert('發生了一些錯誤');
            }
        });
    }

    getCartCount();

    function doDelete(id) {
        event.stopPropagation();
        let req = JSON.stringify({
            "id": id
        });

        // 跟server post傳輸
        $.ajax({
            type: "POST",
            url: "../deleteProduct",
            data: req,
            dataType: "json",
            contentType: "application/json",
            success: function (res) {
                if (res.success) {
                    // alert("刪除成功");
                    // 移除卡片
                    $('.modal-backdrop').remove();
                    $('body').removeClass("modal-open");
                    let cardDiv = document.getElementById("cardDiv" + id);
                    cardDiv.remove();
                } else {
                    alert('刪除失敗');
                }
            },
            error: function () {
                alert('刪除失敗');
            }
        });
    }

    function goUpdate(id) {
        event.stopPropagation();
        window.location.href = "UpdateProduct?memberId=" + memberId
            + "&productId=" + id;
    }

    function goDetail(id) {
        location.href = "productDetail?id=" + id + "&memberId=" + memberId;
        return false
    }

    function goAdd() {

        location.href = "AddProduct";
    }

    function goMySales(id) {
        window.location.href = "../mySales?memberId=" + memberId;
    }
</script>
</body>
</html>
