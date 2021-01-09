package com.web.pet.mom.model;

import lombok.Data;

import java.nio.charset.StandardCharsets;

/**
 * @author i19
 */

@Data
public class MomData {

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
        momData.setPic(new String(((byte[]) objects[11]), StandardCharsets.UTF_8));
        momData.setMomId(((Integer) objects[12]));

        return momData;
    }
}


