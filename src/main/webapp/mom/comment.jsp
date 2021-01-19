<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>

<!doctype html>
<html lang="zh-Hant-TW">

<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport"
          content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <!--bootstrap初始規模-->
    <title>AccompanyMe</title>

    <link rel="stylesheet" href="css/registerMom.css">

    <script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
    <!-- Bootstrap core CSS -->
    <link rel="stylesheet"
          href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
          integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
          crossorigin="anonymous">

    <!--sweetAlert-->
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
    <script src="sweetalert2.all.min.js"></script>
    <!-- Optional: include a polyfill for ES6 Promises for IE11 -->
    <script src="https://cdn.jsdelivr.net/npm/promise-polyfill"></script>

    <!--    Font Awesome-->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

    <script src="https://www.w3schools.com/lib/w3.js"></script>
    <!--要include 的程式 最下面還有-->

</head>

<body>
<jsp:include page="Header.jsp"/>

<div class="container">
    <div class="row">
        <div class="col-md-2 bGround"></div>
        <article class="col-md-8">

            <b>
                <h4>
                    <b><p id="rating">家長評分</p>
                    </b>

                </h4>
            </b>
            <div class="rating">
                <span class="fa fa-star-o fa-2x" style="color:#F9F900"></span>
                <span class="fa fa-star-o fa-2x" style="color:#F9F900"></span>
                <span class="fa fa-star-o fa-2x" style="color:#F9F900"></span>
                <span class="fa fa-star-o fa-2x" style="color:#F9F900"></span>
                <span class="fa fa-star-o fa-2x" style="color:#F9F900"></span>
            </div>
            <input type="hidden" id="star"/>
            <br>
            <div  class="underline"></div>
            <br>
            <b>

                <h4>
                    <b><p>家長評價</p>
                    </b>

                </h4>
            </b>
            <br>
            <button type="button"  class="btn btn-light"
                    onclick="button1()">真是優秀的好保母
            </button>
            <button type="button"  class="btn btn-light"
                    onclick="button2()">超專業的保母
            </button>
            <button type="button"  class="btn btn-light"
                    onclick="button3()">只要交給他就對了
            </button>

            <br><br>

            <textarea class="form-control" name="comment"
                      id="comment" rows="5"></textarea>

            <br><br>

            <div class="form-check" style="text-align: center;">

                <button type="button" class="btn btn-primary"
                        onclick="toComment()">送出
                </button>
            </div>
        </article>
        <div class="col-md-2 bGround"></div>
    </div>
</div>


<jsp:include page="Footer.jsp"/>

<script>
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

    function button1(){
        $("#comment").val("真是優秀的好保母")
    }

    function button2(){
        $("#comment").val("超專業的保母")
    }

    function button3(){
        $("#comment").val("只要交給他就對了")
    }


    function toComment(){
        console.log("toComment()")
        const data = new FormData();
        let comment = $("#comment").val()
        console.log(comment)
        let star = $("#star").val()
        console.log(star)

        data.append("star" , star)
        data.append("comment" , comment)

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
            console.log(result)
            window.location.href = '../mom/extar.jsp';
        })
    }
</script>
</body>
</html>
