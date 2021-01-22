$().ready(function () {
    $.ajax({
        url: "../mom/showReservation",
        type: "post",
        dataType: "json",
        data: {
            "momId": $("#getMomId").val()
        },
        success: function (data) {
            $("#userTalk").append("<h4>家長的話</h4>")

            // stars[j].classList.add("fa-star-o")
            data.commentDataList.forEach(function (commentDataList) {
                let commentString = "<div>" +
                    "<div>"+commentDataList.star+"</div>" +
                    "<div>"+commentDataList.comment+"</div>" +
                    "<span>"+commentDataList.sname+"</span>" +
                    "<span>"+commentDataList.commentNowTime+"</span>" +
                    "</div><br>"
                $("#userTalk").append(commentString)
            });


            $("#title").html("<b style='font-size: 150%'>" + data.momDetailData.title + "</b>")
            $("#momPic").html(" <img src='data:image/png;base64," + data.momDetailData.pic + "' style='width:720px; height:500px;'/>")
            $("#pic").html(" <img src='data:image/png;base64," + data.momDetailData.img + "' style='width:350px; height:300px;'/>")
            $("#reservation").html("<a href='reservation.jsp?momId=" + data.momDetailData.momId + "' style='text-decoration:none;color:white;'><button class='btn btn-secondary' type='button'  onclick='toReservation()'>預約保母</button></a>")
            $("#favoriteMom").html("<button class='btn btn-secondary' type='button'  onclick='toCollection()'>關注保母</button>")
            $("#address").html("<h5 style='font-size:20px;margin-bottom:2px;'>" + data.momDetailData.sname + "</h5>" +
                "<h5 style='font-size: 15px'>聯絡地址:" + data.momDetailData.country + "  " + data.momDetailData.district + "</h5>" +
                "<h5 style='font-size: 15px'>聯絡電話:  " + data.momDetailData.phone + "</h5>")
            $("#experience").html("<h4>資歷</h4><h5>" + data.momDetailData.experience + " 年</h5>")
            $("#petContent").html("<h4>服務內容</h4>" +
                "<p>" + data.momDetailData.petContent + "</p>")
            $("#notices").html("<h4>注意事項</h4><h5>" + data.momDetailData.notices + "</h5>")
            let type = "<h5>可接受的體型</h5>";
            let typeMoney = "<h5>各種服務的價格</h5>";
            if (data.momDetailData.bodyType1 != null) {
                type += "<h6>迷你犬(0~4kg)</h6>"
            }
            if (data.momDetailData.bodyType2 != null) {
                type += "<h6>中型犬(10~24kg)</h6>"
            }
            if (data.momDetailData.bodyType3 != null) {
                type += "<h6>大型犬(24kg以上)</h6>"
            }
            if (data.momDetailData.bodyType4 != null) {
                type += "<h6>貓</h6>"
            }
            if (data.momDetailData.proPrice1 != null) {
                typeMoney += "<small>到府遛狗 :" + data.momDetailData.proPrice1 + " 元</small><br>"

            }
            if (data.momDetailData.proPrice2 != null) {
                typeMoney += "<small>安親照顧 :" + data.momDetailData.proPrice2 + " 元</small><br>"
            }
            if (data.momDetailData.proPrice3 != null) {
                typeMoney += "<small>寄宿照顧 :" + data.momDetailData.proPrice3 + " 元</small><br>"
            }
            $("#petType").append(type)
            $("#petMoney").append(typeMoney)

            console.log(data)
        }

    });
});

function toReservation() {
    return true
}

function toCollection() {
    $.ajax({
        url: "../mom/favorite",
        type: "post",
        dataType: "json",
        data: {
            "momId": $("#getMomId").val()
        },
        success: function (data) {
            console.log(data)
            console.log("isFavorite=" + data);

            if (data) {
                $("#favoriteMom").html("<button class='btn btn-success' type='button'  onclick='toCollection()'>取關保母</button>")
            } else {
                $("#favoriteMom").html("<button class='btn btn-secondary' type='button''>關注保母</button>")
            }
        }, error: function () {
            Swal.fire({
                icon: 'error', title: '關注 失敗自己無法關注自己',
                showConfirmButton: false,
                timer: 1500,
            })
        }
    });
}