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

            console.log(data)
            data.forEach(function (data) {
                console.log(data.pic)
                let type = "<div class='col-md-4' >"
                    + "<img src='data:image/png;base64," + data.img + "' style='width:230px; height:180px;'/>"
                    + "</div>"
                    + "<div class='col-md-1'></div>"
                    + "<div class='col-md-7'>"
                    + "<h5 >" + data.title + "</h5>"
                    + " <h5 >" + data.notices + "</h5>"
                if (data.bodyType1 != null) {
                    type += "<small>迷你犬(0~4kg):接受</small> <br>"
                } else {
                    type += "<small>迷你犬(0~4kg):不接受</small> <br>"
                }
                if (data.bodyType2 != null) {
                    type += "<small>中型犬(10~24kg):接受</small> <br>"
                } else {
                    type += "<small>中型犬(10~24kg):不接受</small> <br>"
                }
                if (data.bodyType3 != null) {
                    type += "<small>大型犬(24kg以上):接受</small> <br>"
                } else {
                    type += "<small>大型犬(24kg以上):不接受</small> <br>"
                }
                if (data.bodyType4 != null) {
                    type += "<small>貓:接受</small>"
                } else {
                    type += "<small>貓:不接受</small>"
                }
                type += "<form name='goReser'  action='reservation.jsp' method='post' onsubmit='return goTo()'>" +
                    "<input type='hidden' name='momId' value='"+data.momId+"'/>" +
                    "<input type='hidden' name='sname' value='" + data.sname + "'/>" +
                    "<input class='btn btn-secondary' type='submit' value='預約' style='position: absolute; bottom: 10px; right: 20px;'/>" +
                    "<hr>"

                $("#showMom").append(type);

            });
        }, error: function () {
            $("#tip").html("沒有你要找的保母哦");
        }

    });
};
