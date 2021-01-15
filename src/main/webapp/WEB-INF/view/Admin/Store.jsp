<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="zh-Hant-TW">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <!--bootstrap初始規模-->
    <link rel="stylesheet"
          href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css"
          integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2"
          crossorigin="anonymous">
    <link href="../Admin/css/store.css" rel="stylesheet">

    <%
        String basePath = request.getScheme() + "://" +
                request.getServerName() + ":" + request.getServerPort() +
                request.getContextPath() + "/";
        //這會顯示localhost+port號
    %>

    <title>AccompanyMe</title>
</head>
<body>

<nav class="navbar navbar-light bg-light display-4">
    <div class="container-fluid" style="background-color:#81C0C0;">
        <p class="nav-link mt-2">商城後台</p>
        <div class="d-flex">
            <a class="nav-link" href="<c:url value='/Gusty/goadmin'/>">回後台首頁</a>
        </div>
    </div>
</nav>
<br>

<%-- 	<c:url value='../Store/?memberId=admin'/> --%>

<div class="container">


    <div class="all-chart-div d-flex flex-wrap align-items-start">
        <div class="d-flex justify-content-start">
            <div class="row justify-content-center chart-div">
                <div class='h3'>本月銷售商品種類排行</div>
                <canvas id="storesales" width="100" height="50"></canvas>
            </div>
        </div>

        <div class="d-flex justify-content-end">
            <div class="row justify-content-center chart-div">
                <div class='h3'>本月銷售業績</div>
                <canvas id="sales" width="100" height="50"></canvas>
            </div>
        </div>
    </div>
    <br>
    <hr>

    <!-- 搜尋框 -->
    <div class="input-group mb-3 align-self-center my-searchbar">
        <input type="text" class="form-control" placeholder="請輸入商品名稱" aria-label="Recipient's username"
               aria-describedby="button-addon2" id="searchInput">
        <div class="input-group-append">
            <button class="btn btn-outline-light" type="button" id="searchButton" onclick="doSearch()">
                <img src="../Store/images/search.svg" width="20" height="20"></button>
        </div>
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

</div>


<img width="50" height="50" class="goTop-btn" id="goTop"
     src="../Store/images/upward.svg" alt="">
<img width="50" height="50" class="add-btn" id="add" onclick="goAdd()"
     src="../Store/images/plus.svg" alt="">
<img width="50" height="50" class="order-btn" id="order" onclick="goMySales()"
     src="../Store/images/order.svg" alt="">

<br>

<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"
        integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
        crossorigin="anonymous"></script>
<script
        src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-ho+j7jyWK8fNQe+A12Hb8AhRq26LrZ/JpcUGGOn+Y7RsweNrtN/tE3MoK7ZeZDyx"
        crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.5.1.js"
        integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc="
        crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.9.4/Chart.bundle.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

<script>

    $(function () {//會到最上層的jquery
        $('#goTop').click(function () {
            $('html,body').animate({scrollTop: 0}, 1000);
        });
        $(window).scroll(function () {
            if ($(this).scrollTop() > 500) {
                $('#goTop').fadeIn("fast");
            } else {
                $('#goTop').stop().fadeOut("fast");
            }
        }).scroll();
    });

    var storename = [];//top10商品名稱
    var storeamount = [];//top10商品銷量
    var storeday = [];//總金額日期
    var storeallmoney = [];//總金額金額

    $.ajax({
        url: "../Gusty/storetop10",
        type: "post",
        dataType: "json",
        async: false,
        data: {
            "month": new Date().getMonth() + 1,
        },
        success: function (data) {
            $.each(data, function (i, n) {
                storename[i] = n[0]
                storeamount[i] = n[1]
            });
        }
    });

    $.ajax({
        url: "../Gusty/allsaless",
        type: "post",
        dataType: "json",
        async: false,
        data: {
            "month": new Date().getMonth() + 1,
        },
        success: function (data) {
            $.each(data, function (i, n) {
                storeday[i] = n[0]
                storeallmoney[i] = n[1]
            });
        }
    });


    Chart.defaults.global.defaultFontSize = 16;
    Chart.defaults.global.defaultFontColor = '#000000';

    var storesales = document.getElementById('storesales').getContext('2d');
    var chart = new Chart(storesales, {
        type: 'bar',
        data: {
            labels: storename,
            datasets: [{
                label: '銷售量',
                data: storeamount,
                backgroundColor: [
                    '#FF0080',
                    '#FF0000',
                    '#9F35FF',
                    '#00DB00',
                    '#00FFFF',
                    '#0080FF',
                    '#F9F900',
                    '#5CADAD',
                    '#9AFF02',
                ],
                borderWidth: 2,
            }]
        },
//         options: {
//             scales: {
//                 xAxes: [{
//                     ticks: {
//                         display: false //this will remove only the label
//                     }
//                 }]
//             }
//         }
    });

    var ctx = document.getElementById("sales").getContext('2d');

    var myChart = new Chart(ctx, {
        type: 'line',
        data: {
            labels: storeday,
            datasets: [{
                label: '當日銷售總金額(NT)',
                data: storeallmoney,
                fill: false,
                backgroundColor: '#00FFFF',
                borderColor: '#CE0000',
                borderWidth: 2
            }],
        },

    });

    let memberId = "${memberId}";
    let pages = 1;

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
                        "<img src=\"../Store/images/trash1.svg\" class=\"trash-img float-right my-margin\" " +
                        "width=\"30\" height=\"30\" data-toggle=\"modal\" data-target=\"#modalCenter" + cardData.id + "\">\n" +
                        "<img id=\"like" + cardData.id + "\" " +
                        "src=\"../Store/images/pencil.svg\" class=\"float-right my-margin\" width=\"30\" height=\"30\" " +
                        "onclick=\"goUpdate(" + cardData.id + ")\">\n";


                    cardHtml += "</div>\n" + "</div>\n";

                    //判斷有登入才顯示
                    if (memberId !== "" && memberId === "1") {
                        cardHtml +=
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

    // 下一頁
    function setPage(nextPage) {
        pages = nextPage;
        let storeDiv = document.getElementById("store");
        storeDiv.scrollIntoView();
        getCards();
    }

    // 刪除商品
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

    // 修改商品
    function goUpdate(id) {
        event.stopPropagation();
        window.location.href = "../Store/UpdateProduct?memberId=" + memberId
            + "&productId=" + id;
    }



    // 新增商品
    function goAdd() {

        location.href = "../Store/AddProduct";
    }

    // 我的銷售
    function goMySales(id) {
        window.location.href = "../mySales?memberId=" + memberId;
    }


</script>

</body>
</html>