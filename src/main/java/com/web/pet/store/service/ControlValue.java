package com.web.pet.store.service;

public class ControlValue {

    // FIXME: server路徑
    public static final String SERVER_URL = "http://localhost:8087/PetProject_Final/";
    // "http://localhost:8080/PetProject_Final_war/"

    // FIXME: 上傳圖片的輸出路徑
    public static final String IMG_OUTPUT_PATH = "C:\\apache-tomcat-9.0.39-windows-x64\\apache-tomcat-9.0.39\\webapps\\PetProject_Final\\Store\\images\\upload\\";
    // "C:\\apache-tomcat-9.0.39\\webapps\\PetProject_Final_war\\Store\\images\\upload\\"
    //src/main/webapp/Store/images/upload/
    
    // 寄件人信箱
    public static final String SEND_EMAIL = "eeit125team1@gmail.com";

    // 寄件者金鑰(兩步驟驗證應用程式金鑰)
    public static final String EMAIL_TOKEN = "uyvdilxkpuqnczaf";

    // ecpay流水號
    public static final int ECPAY_INIT_NO = 99;

}
