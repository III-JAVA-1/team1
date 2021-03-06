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

    <script src="js/registerMom.js"></script>
    <script src="js/registerGO.js"></script>
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

    <script src="https://www.w3schools.com/lib/w3.js"></script>
    <!--要include 的程式 最下面還有-->

</head>

<body>
<jsp:include page="Header.jsp"/>

<div class="container">
    <div class="row">
        <div class="col-md-2 bGround"></div>
        <article class="col-md-8">

            <div style="margin: auto">
                <b>
                    <div class="titlePosition">
                        <h4>
                            <b>申請成為寵物保姆</b>
                        </h4>
                    </div>
                </b> <br> <br> <b>
                <div class="underline">保姆服務內容</div>
            </b> <br> <br>
                <div class="row">
                    <div class="col-md-1"></div>
                    <div class="col-md-3">
                        <label for="title">服務標題</label> <span class="uppercase">*</span>
                    </div>
                    <div class="col-md-5">
                        <input type="text" class="form-control" id="title"
                               name="title" placeholder="請輸入服務標題">
                    </div>
                </div>

                <br>

                <div class="row">
                    <div class="col-md-1"></div>
                    <div class="col-md-3">
                        <label for="experience">年資</label> <span class="uppercase">*</span>
                    </div>
                    <div class="col-md-2">
                        <input type="number" class="form-control" id="experience"
                               name="experience" value="0" min="0" max="99">
                    </div>
                    <div class="yearPosition">年</div>
                </div>
                <!--
                <br>

                <div class="row">
                    <div class="col-md-1"></div>
                    <div class="col-md-3">
                        <label for="idMount">最大接待數量</label>
                        <span class="uppercase">*</span>
                    </div>
                    <div class="col-md-2">
                        <input type="number" class="form-control" id="idMount" name="maxReceive" value="0" min="0"
                            max="99" required=" ">
                    </div>
                    <div style="line-height:2.5rem;height:2.5rem;padding-left:0;">
                        隻
                    </div>
                </div> -->

                <br>

                <div class="row">
                    <div class="col-md-1"></div>
                    <div class="col-md-3">
                        <label for="notices">接待注意事項</label> <span class="uppercase">*</span>
                    </div>
                    <div class="col-md-7">
                        <textarea class="form-control" name="notices" id="notices" rows="5"></textarea>
                    </div>
                </div>

                <br>

                <div class="row">
                    <div class="col-md-1"></div>
                    <div class="col-md-3">
                        <label for="petContent">服務介紹</label> <span class="uppercase">*</span>
                    </div>
                    <div class="col-md-7">
							<textarea class="form-control" name="petContent"
                                      id="petContent" rows="5"></textarea>
                    </div>
                </div>

                <br>

                <div class="row">
                    <div class="col-md-1"></div>
                    <div class="col-md-3">
                        <label for="myPic">環境照片</label> <span class="uppercase">*</span>
                    </div>

                    <div class="col-md-7 picFrame">
                        <div>
                            <div class="picPosition">
                                <input type="file" name="myPic" id="myPic"/>
                                <!-- 									<div class='row'> -->
                                <!-- 										<div id='previewMultiple'></div> -->
                                <!-- 									</div> -->
                            </div>
                        </div>
                    </div>
                </div>

                <br> <br> <b>
                <div class="underline">服務項目</div>
            </b> <br> <br>

                <div class="col-md-3">
                    <label>項目與價格</label> <span class="uppercase">*</span>
                </div>


                <div class="input-group mb-3">
                    <div class="col-md-4"></div>
                    <div>
                        <label for="checkPeace">安親托育</label> <span class="uppercase">*</span>
                        <input class="form-control inp" type="text" name="proPrice1"
                               id="checkPeace" placeholder="到府照顧的價錢">
                    </div>
                </div>

                <div class="input-group mb-3">
                    <div class="col-md-4"></div>
                    <div>
                        <label for="checkBoarding">寄宿照顧</label> <span class="uppercase">*</span>
                        <input class="form-control inp" type="text" name="proPrice2"
                               id="checkBoarding" placeholder="保姆家過夜的價格">
                    </div>
                </div>


                <div class="input-group mb-3">
                    <div class="col-md-4"></div>
                    <div>
                        <label for="checkWalkDog">到府遛狗</label> <span class="uppercase">*</span>
                        <input class="form-control inp" type="text" name="proPrice3"
                               id="checkWalkDog" placeholder="到府帶狗狗散步的價格">
                    </div>
                </div>
                <div>

                    <div class="col-md-3">
                        <div class="col-md-1"></div>
                        <label>寵物體型</label> <span class="uppercase">*</span>
                    </div>

                    <div class="input-group mb-3">
                        <div class="col-md-4"></div>
                        <div>
                            <input class="chk" name="bodyType1" type="checkbox" id="littleDog"
                                   value="迷你犬(0~4kg)"> <label for="littleDog">
                            <small>小型犬(0~10kg)</small></label>
                        </div>
                    </div>

                    <div class="input-group mb-3">
                        <div class="col-md-4"></div>
                        <div>
                            <input class="chk" name="bodyType2" type="checkbox" id="mediumDog"
                                   value="中型犬(10~24kg)"> <label for="mediumDog">
                            <small>中型犬(10~24kg)</small></label>
                        </div>
                    </div>

                    <div class="input-group mb-3">
                        <div class="col-md-4"></div>
                        <div>
                            <input class="chk" name="bodyType3" type="checkbox" id="bigDog"
                                   value="大型犬(24kg以上)"> <label for="bigDog">
                            <small>大型犬(24kg以上)</small></label>
                        </div>
                    </div>

                    <div class="input-group mb-3">
                        <div class="col-md-4"></div>
                        <div>
                            <input class="chk" name="bodyType4" type="checkbox" id="cat"
                                   value="貓"> <label for="cat">
                            <small>貓</small></label>
                        </div>
                    </div>
                </div>

                <br>

                <div class="form-check" style="text-align: center;">
                    <!-- checked -->
                    <!-- <input type="checkbox" class="form-check-input" id="exampleCheck1">
                    <label class="form-check-label" for="exampleCheck1"><p style="color: red;">我同意AccompanyMe的服務條款</p></label> -->
                    <button type="button" name="go"
                            id="go" class="btn btn-secondary"
                            onclick="directInputRegister()">一鍵輸入
                    </button>
                    <button type="button" name="registerMom"
                            id="registerMom" class="btn btn-primary"
                            onclick="sendPetMom()">送出
                    </button>
                </div>
            </div>
        </article>
        <div class="col-md-2 bGround"></div>
    </div>
</div>

<jsp:include page="Footer.jsp"/>


</body>

</html>