package com.web.pet.mom.model.req;

import lombok.Data;

import java.io.UnsupportedEncodingException;
import java.nio.charset.StandardCharsets;
import java.util.Base64;

/**
 * @author i19
 */

@Data
public class MomData {

    final static Base64.Decoder DECODER = Base64.getDecoder();
    final static Base64.Encoder ENCODER = Base64.getEncoder();

    private String country;
    private String title;
    private String sname;
    private String bodyType1;
    private String bodyType2;
    private String bodyType3;
    private String bodyType4;
    private String notices;
    private Integer proPrice1;
    private Integer proPrice2;
    private Integer proPrice3;
    private String pic;
    private Integer momId;
    private String address;
    private String district;
    private String img;
    private String phone;
    private Integer experience;
    private String petContent;

    public static MomData mappingMomData(Object[] objects){
        MomData momData = new MomData();
        momData.setCountry(((String) objects[0]));
        momData.setTitle(((String) objects[1]));
        momData.setSname(((String) objects[2]));
        momData.setBodyType1(((String) objects[3]));
        momData.setBodyType2(((String) objects[4]));
        momData.setBodyType3(((String) objects[5]));
        momData.setBodyType4(((String) objects[6]));
        momData.setNotices(((String) objects[7]));
        momData.setProPrice1(((Integer) objects[8]));
        momData.setProPrice2(((Integer) objects[9]));
        momData.setProPrice3(((Integer) objects[10]));
        momData.setMomId(((Integer) objects[11]));
        momData.setImg(ENCODER.encodeToString(((byte[]) objects[12])));

        return momData;
    }
    public static MomData mappingOrderData(Object[] objects){
        MomData orderData = new MomData();
        orderData.setCountry(((String) objects[0]));
        orderData.setTitle(((String) objects[1]));
        orderData.setSname(((String) objects[2]));
        orderData.setBodyType1(((String) objects[3]));
        orderData.setBodyType2(((String) objects[4]));
        orderData.setBodyType3(((String) objects[5]));
        orderData.setBodyType4(((String) objects[6]));
        orderData.setNotices(((String) objects[7]));
        orderData.setProPrice1(((Integer) objects[8]));
        orderData.setProPrice2(((Integer) objects[9]));
        orderData.setProPrice3(((Integer) objects[10]));
        orderData.setPic(ENCODER.encodeToString(((byte[]) objects[11])));
        orderData.setMomId(((Integer) objects[12]));
        orderData.setAddress((String) objects[13]);
        orderData.setDistrict((String) objects[14]);
        orderData.setImg(ENCODER.encodeToString(((byte[]) objects[15])));
        orderData.setPhone((String) objects[16]);
        orderData.setExperience((Integer) objects[17]);
        orderData.setPetContent((String) objects[18]);

        return orderData;
    }
}


