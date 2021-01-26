const stars = document.querySelector(".rating").children;
let star //最終值
let index //目前選到的星星

for (let i = 0; i < stars.length; i++) {
    stars[i].addEventListener("mouseover", function () {
        //console.log(i)

        for (let j = 0; j < stars.length; j++) {
            stars[j].classList.remove("fa-star")//reset 所有星星
            stars[j].classList.add("fa-star-o")
        }
        for (let j = 0; j <= i; j++) {
            stars[j].classList.remove("fa-star-o") //先移除空心的星星
            stars[j].classList.add("fa-star") //添加新的星星 如果i=j表示選中的
        }
    })
    stars[i].addEventListener("click", function () {
        star = i + 1
        index = i
        console.log(star)
        $("#star").val(star)
    })
    stars[i].addEventListener("mouseout", function () {
        for (let j = 0; j < stars.length; j++) {
            stars[j].classList.remove("fa-star")//reset 所有星星
            stars[j].classList.add("fa-star-o")
        }
        for (let j = 0; j <= index; j++) {
            stars[j].classList.remove("fa-star-o")
            stars[j].classList.add("fa-star")
        }
    })
}

function button1() {
    $("#comment").val("真是優秀的好保母")
}

function button2() {
    $("#comment").val("超專業的保母")
}

function button3() {
    $("#comment").val("只要交給他就對了")
}

function toComment() {
    console.log("toComment()")
    const data = new FormData();
    let star = $("#star").val()
    let comment = $("#comment").val()
    let orderId = $("#orderId").val()
    console.log(comment)
    console.log(star)

    data.append("star", star)
    data.append("comment", comment)
    data.append("orderId", orderId)

    $.ajax({
        url: "../mom/comment",
        type: "POST",
        contentType: false,
        cache: false,
        processData: false,

        data: data,
        success: function (data) {
            showSuccessPage()
            console.log(data)
            console.log('success')
        }
    });
}

function showSuccessPage() {
    console.log('showSuccessPage()')
    Swal.fire({
        icon: 'success', title: '評價成功',
        showConfirmButton: false,
        timer: 1500,
    }).then((result) => {
        console.log("result")
        console.log(result)

        window.location.href = '../Member/Member.jsp';
    })
}