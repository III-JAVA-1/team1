// fetch('../mom/allMom' , {
//     method : 'POST',
//
// })

// fetch('https://httpbin.org/post', {
//     method: 'POST',
//     body: JSON.stringify(
//         {
//             name: 'GQSM',
//             age: 25
//         }
//     )
// }).then((response) => {
//     return response.json()
// }).then((myJson)=>{
//     console.log(myJson)
// })


search();

//ajax查詢
function search() {
    $('#showMom').html("")
    $('#tip').html("")


    $.ajax({
        url: "../mom/allMom",
        type: "post",
        dataType: "json",
        data: {
            country: $("#selectArea").val(),
            title: $("#selectTitle").val(),
        },
        success: function (data) {
            $.each(data, function (n, m) {
                let type = "<div class='col-md-4' >"
                    + "<img src='../mom/getPic?momId="+m[12]+"' style='width:230px; height:180px;'/>"
                    + "</div>"
                    + "<div class='col-md-1'></div>"
                    + "<div class='col-md-7'>"
                    + "<h5 >" + m[1] + "</h5>"
                    + " <h5 >" + m[2] + "</h5>"
                if (m[3] != null) {
                    type += "<small>迷你犬(0~4kg):接受</small> <br>"
                }else{
                    type += "<small>迷你犬(0~4kg):不接受</small> <br>"
                }
                if (m[4] != null) {
                    type += "<small>中型犬(10~24kg):接受</small> <br>"
                }else {
                    type += "<small>中型犬(10~24kg):不接受</small> <br>"
                }
                if (m[5] != null) {
                    type += "<small>大型犬(24kg以上):接受</small> <br>"
                }else {
                    type += "<small>大型犬(24kg以上):不接受</small> <br>"
                }
                if (m[6] != null) {
                    type += "<small>貓:接受</small>"
                }else {
                    type += "<small>貓:不接受</small>"
                }
                type += "<form name='goReser'  action='reservation.jsp' method='post' onsubmit='return goTo()'>" +
                    "<input type='hidden' name='momId' value='"+m[12]+"'/>" +
                    "<input type='hidden' name='sname' value='"+m[2]+"'/>" +
                    "<input class='btn btn-secondary' type='submit' value='預約' style='position: absolute; bottom: 10px; right: 20px;'/>" +
                    "<hr>"

                $("#showMom").append(type);

            });
        }, error: function () {
            $("#tip").html("沒有你要找的保母哦");
        }

    });
};

//地址
$("#twzipcode_My").twzipcode({
    css: ["city form-control", "town form-control"],
    countyName: "city", // 自訂城市 select 標籤的 name 值
    districtName: "town", // 自訂地區 select 標籤的 name 值
});