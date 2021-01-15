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
                    + " <h5 >" + data.country +" "+ data.district+"</h5>"
                if (data.bodyType1 != null) {
                    type += "<small>迷你犬(0~4kg):O</small> <br>"
                } else {
                    type += "<small>迷你犬(0~4kg):X</small> <br>"
                }
                if (data.bodyType2 != null) {
                    type += "<small>中型犬(10~24kg):O</small> <br>"
                } else {
                    type += "<small>中型犬(10~24kg):X</small> <br>"
                }
                if (data.bodyType3 != null) {
                    type += "<small>大型犬(24kg以上):O</small> <br>"
                } else {
                    type += "<small>大型犬(24kg以上):X</small> <br>"
                }
                if (data.bodyType4 != null) {
                    type += "<small>貓:O</small>"
                } else {
                    type += "<small>貓:X</small>"
                }
                type += "<a href='momDetail.jsp?momId="+data.momId+"' style='text-decoration:none;color:white;'><button class='btn btn-secondary' type='button'"+
                    "style='position: absolute; bottom: 10px; right: 20px;' onclick='return goTo()'>保母詳細資料</button></a>" +
                    "<hr>"


                $("#showMom").append(type);

            });
        }, error: function () {
            $("#tip").html("沒有你要找的保母哦");
        }

    });
};
