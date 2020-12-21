package com.web.pet.util;

import lombok.extern.slf4j.Slf4j;

import java.io.UnsupportedEncodingException;
import java.lang.reflect.Field;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.net.URLEncoder;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.text.SimpleDateFormat;
import java.util.*;

@Slf4j
public class EcpayUtils {

    private static final char[] hexArray = "0123456789ABCDEF".toCharArray();
    private static final String CIPHER_ALGORITHM = "AES/CBC/NoPadding";

    /**
     * 產生檢查碼
     *
     * @param key
     * @param iv
     * @param params
     * @return
     */
    public static String genCheckMacValue(String key, String iv, Hashtable<String, String> params) {
        Set<String> keySet = params.keySet();
        TreeSet<String> treeSet = new TreeSet<>(String.CASE_INSENSITIVE_ORDER);
        treeSet.addAll(keySet);
        String[] name = treeSet.toArray(new String[0]);
        String paramStr = "";
        for (String s : name) {
            if (!s.equals("CheckMacValue")) {
                paramStr += "&" + s + "=" + params.get(s);
            }
        }
        String urlEncode = urlEncode("Hashkey=" + key + paramStr + "&HashIV=" + iv).toLowerCase();
        urlEncode = netUrlEncode(urlEncode);
        return hash(urlEncode.getBytes(), "SHA-256");
    }

    /**
     * 將物件轉為Hashtable
     *
     * @param obj
     * @return Hashtable
     * @throws StopException
     */
    public static Hashtable<String, String> objToHashtable(Object obj)
            throws NoSuchMethodException, InvocationTargetException, IllegalAccessException {
        Class<?> cls = obj.getClass();
        Hashtable<String, String> resultDict = new Hashtable<>();
        List<String> fieldNames = getSortedFieldNames(cls);
        for (String fieldName : fieldNames) {
            Method method;
            method = cls.getMethod("get" + fieldName);
            resultDict.put(fieldName, invokeMethod(method, obj));
        }
        return resultDict;
    }

    private static String invokeMethod(Method method, Object obj)
            throws InvocationTargetException, IllegalAccessException {
        return method.invoke(obj).toString();
    }

    /**
     * 針對物件內屬性的參數作排序
     *
     * @param cls
     * @return List
     */
    private static List<String> getSortedFieldNames(Class<?> cls) {
        Field[] fields = cls.getDeclaredFields();
        List<String> fieldNames = new ArrayList<String>();
        for (Field field : fields) {
            fieldNames.add(field.getName());
        }
        Collections.sort(fieldNames, String.CASE_INSENSITIVE_ORDER);
        return fieldNames;
    }

    /**
     * 將資料做 urlEncode編碼
     *
     * @param data
     * @return url encoded string
     */
    public static String urlEncode(String data) {
        String result = "";
        try {
            result = URLEncoder.encode(data, "UTF-8");
        } catch (UnsupportedEncodingException e) {

        }
        return result;
    }

    /**
     * 將做完的urlEncode字串做轉換符合 .NET語言的轉換規則
     *
     * @param url
     * @return .Net url encoded string
     */
    private static String netUrlEncode(String url) {
        String netUrlEncode =
                url.replaceAll("%21", "\\!").replaceAll("%28", "\\(").replaceAll("%29", "\\)");
        return netUrlEncode;
    }

    /**
     * 將 byte array 資料做 hash md5或 sha256 運算，並回傳 hex值的字串資料
     *
     * @param data
     * @param mode
     * @return string
     */
    private static String hash(byte data[], String mode) {
        MessageDigest md = null;
        try {
            if (mode == "MD5") {
                md = MessageDigest.getInstance("MD5");
            } else if (mode == "SHA-256") {
                md = MessageDigest.getInstance("SHA-256");
            }
        } catch (NoSuchAlgorithmException e) {
        }
        return bytesToHex(md.digest(data));
    }

    /**
     * 將 byte array 資料轉換成 hex字串值
     *
     * @param bytes
     * @return string
     */
    private static String bytesToHex(byte[] bytes) {
        char[] hexChars = new char[bytes.length * 2];
        for (int j = 0; j < bytes.length; j++) {
            int v = bytes[j] & 0xFF;
            hexChars[j * 2] = hexArray[v >>> 4];
            hexChars[j * 2 + 1] = hexArray[v & 0x0F];
        }
        return new String(hexChars);
    }

    /**
     * ecpay reponse 轉換成 map
     *
     * @param str
     * @return
     * @author charles
     */
    public static Map<String, String> ecpayResponseToDict(String str) {
        Map<String, String> ecpayResObj = new HashMap<>();
        for (String obj : str.split("&")) {
            String[] objArray = obj.split("=");
            if (objArray.length > 1) {
                ecpayResObj.put(objArray[0], objArray[1]);
            } else {
                ecpayResObj.put(objArray[0], "");
            }
        }
        return ecpayResObj;
    }

    /**
     * 將資料庫的時間格式 format 為 ecpay 需要的格式
     *
     * @return
     */
    public static String ecpayDateFormat(Date date) {
        String orderDate;
        SimpleDateFormat sdfNew = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
        // 進行轉換
        orderDate = sdfNew.format(date);
        return orderDate;
    }
}
