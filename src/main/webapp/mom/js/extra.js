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
let pageValue = 1
search();

function pageGo(page){

  //  console.log("page"+page.value)
    pageValue = page.value
   // console.log(pageValue)
    search()

}


//ajax查詢
function search() {
    $('#showMom').html("")
    $('#tip').html("")
    $('#page').html("")
    $('#pageF').html("")
    $('#pageB').html("")

    $.ajax({
        url: "../mom/allMom",
        type: "post",
        dataType: "json",
        data: {
            country: $("#selectArea").val(),
            title: $("#selectTitle").val(),
            currPage : pageValue,
            pageSize : 5,
        },
        success: function (data) {

            $("#pageF").append("<li>«</li>")
            for(let i=1 ;i<(data.totalDataSize/5)+1;i++){
                //console.log(i);
                $("#page").append("<li value='"+i+"' onclick='pageGo(this)'>"+i+"</li>");
            }

            $("#pageB").append("<li>»</li>")
            console.log(data)
            console.log(data.momDataList)
            data.momDataList.forEach(function (momDataList) {
                let type = "<div class='col-md-4' >"
                    + "<img src='data:image/png;base64," + momDataList.img + "' style='width:230px; height:180px;'/>"
                    + "</div>"
                    + "<div class='col-md-1'></div>"
                    + "<div class='col-md-7'>"
                    + "<h5 >" + momDataList.title + "</h5>"
                    + " <h5 >" + momDataList.country +" "+ momDataList.district+"</h5>"
                if (momDataList.bodyType1 != null) {
                    type += "<small>迷你犬(0~4kg):O</small> <br>"
                } else {
                    type += "<small>迷你犬(0~4kg):X</small> <br>"
                }
                if (momDataList.bodyType2 != null) {
                    type += "<small>中型犬(10~24kg):O</small> <br>"
                } else {
                    type += "<small>中型犬(10~24kg):X</small> <br>"
                }
                if (momDataList.bodyType3 != null) {
                    type += "<small>大型犬(24kg以上):O</small> <br>"
                } else {
                    type += "<small>大型犬(24kg以上):X</small> <br>"
                }
                if (momDataList.bodyType4 != null) {
                    type += "<small>貓:O</small>"
                } else {
                    type += "<small>貓:X</small>"
                }
                type += "<a href='momDetail.jsp?momId="+momDataList.momId+"' style='text-decoration:none;color:white;'><button class='btn btn-secondary' type='button'"+
                    "style='position: absolute; bottom: 10px; right: 20px;' onclick='return goTo()'>保母詳細資料</button></a>" +
                    "<hr>"
                $("#showMom").append(type);

            });
        }, error: function () {
            $("#tip").html("沒有你要找的保母哦");
            pageValue = 1
        }

    });
};
