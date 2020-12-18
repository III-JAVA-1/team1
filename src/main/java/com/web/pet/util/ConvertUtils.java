package com.web.pet.util;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.UUID;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**
 * 格式轉換處理共用
 *
 * @author Jimmy Kang
 */
public class ConvertUtils {

    /**
     * MD5加密
     *
     * @param password 密碼
     * @return 加密後的密碼
     */
    public static String encrypMD5(String password) throws NoSuchAlgorithmException {

        // 根據 MD5 演算法生成 MessageDigest 物件
        MessageDigest md5 = null;

        String encryptPassword = "error";
        MessageDigest md = MessageDigest.getInstance("MD5");
        // 將byte陣列加密
        byte[] barr = md.digest(password.getBytes());
        // 將byte陣列轉成16進制
        StringBuffer sb = new StringBuffer();
        for (int i = 0; i < barr.length; i++) {
            sb.append(byte2Hex(barr[i]));
        }
        String hex = sb.toString();
        // 一律轉成大寫
        encryptPassword = hex.toUpperCase();

        return encryptPassword;
    }

    /**
     * byte陣列轉成16進制
     *
     * @param b byte
     * @return 16進制格式byte陣列
     */
    public static String byte2Hex(byte b) {
        String[] h = {
            "0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "a", "b", "c", "d", "e", "f"
        };
        int i = b;
        if (i < 0) {
            i += 256;
        }
        return h[i / 16] + h[i % 16];
    }

    /**
     * Email格式檢查
     *
     * @param email email
     * @return 是否符合格式
     */
    public static boolean isValidEmail(String email) {
        boolean result = false;
        if (Pattern.compile("^\\w+\\.*\\w+@(\\w+\\.){1,5}[a-zA-Z]{2,3}$")
                .matcher(email)
                .matches()) {
            result = true;
        }
        return result;
    }

    /**
     * 手機門號檢查
     *
     * @param phoneNum 手機號碼
     * @return 是否符合格式
     */
    public static boolean isValidPhoneNum(String phoneNum) {
        boolean result = false;
        if (null == phoneNum || phoneNum.isEmpty()) return false;
        if (Pattern.compile("[+-]?\\d{10,12}").matcher(phoneNum).matches()) {
            result = true;
        }
        return result;
    }

    /**
     * 台灣身分證字號檢查
     *
     * @param twpid 身分證字號
     * @return 是否符合格式
     */
    public static boolean isValidTWPID(String twpid) {
        boolean result = false;
        String pattern = "ABCDEFGHJKLMNPQRSTUVXYWZIO";
        if (Pattern.compile("[ABCDEFGHJKLMNPQRSTUVXYWZIO][12]\\d{8}")
                .matcher(twpid.toUpperCase())
                .matches()) {
            int code = pattern.indexOf(twpid.toUpperCase().charAt(0)) + 10;
            int sum = 0;
            sum =
                    (int) (code / 10)
                            + 9 * (code % 10)
                            + 8 * (twpid.charAt(1) - '0')
                            + 7 * (twpid.charAt(2) - '0')
                            + 6 * (twpid.charAt(3) - '0')
                            + 5 * (twpid.charAt(4) - '0')
                            + 4 * (twpid.charAt(5) - '0')
                            + 3 * (twpid.charAt(6) - '0')
                            + 2 * (twpid.charAt(7) - '0')
                            + 1 * (twpid.charAt(8) - '0')
                            + (twpid.charAt(9) - '0');
            if ((sum % 10) == 0) {
                result = true;
            }
        }
        return result;
    }

    /**
     * 判斷字串使否為網址
     *
     * @param urls 網址
     * @return true:是URL、false:不是URL
     */
    public static boolean isHttpUrl(String urls) {
        boolean isurl = false;
        String regex =
                "(((https|http)?://)?([a-z0-9]+[.])|(www.))"
                        + "\\w+[.|\\/]([a-z0-9]{0,})?[[.]([a-z0-9]{0,})]+((/[\\S&&[^,;\u4E00-\u9FA5]]+)+)?([.][a-z0-9]{0,}+|/?)"; // 设置正则表达式

        Pattern pat = Pattern.compile(regex.trim()); // 比对
        Matcher mat = pat.matcher(urls.trim());
        isurl = mat.matches(); // 判断是否匹配
        if (isurl) {
            isurl = true;
        }
        return isurl;
    }

    /**
     * 判斷密碼是否符合邏輯
     *
     * @param str 密碼
     * @return 是否符合格式
     */
    public static boolean isValidPwdRule(String str) {
        boolean isMeetPwdRule = false;

        // 判斷字串總長度是否大於等於7碼
        if (str.length() > 6) {
            //            boolean isDigit = false;
            //            boolean isLetter = false;
            //
            //            // 判斷字串中是否符合至少各有一個英文字母及數字在其中
            //            for (int i = 0; i < str.length(); i++) {
            //                // 利用char包裝類 - Character 中的判斷數字的方法(isDigit)，來判定該字串中是否包含數字
            //                if (Character.isDigit(str.charAt(i))) {
            //                    isDigit = true;
            //                }
            //                // 利用char包裝類 - Character 中的判斷英文字母的方法(isLetter)，來判定該字串中是否包含英文字母
            //                if (Character.isLetter(str.charAt(i))) {
            //                    isLetter = true;
            //                }
            //                // 如符合至少各有一個英文字母及數字在其中者，則可跳出該迴圈
            //                if (isDigit && isLetter)
            //                    break;
            //            }

            // 判斷字串中是否包含大小寫英文字母 和 數字 (或 特殊符號)
            // ^[a-zA-Z0-9]+$  此正規表達式不包含特殊符號，即有特殊符號則為false
            String regex = "[a-zA-Z0-9|\\\\]*";
            isMeetPwdRule = str.matches(regex);
        }

        return isMeetPwdRule;
    }

    /**
     * 生成uuid
     *
     * @return uuid
     */
    public static String createUUID() {
        UUID uuid = UUID.randomUUID();
        String id = uuid.toString();
        id = id.replace("-", "");
        return id;
    }

    /**
     * 日期字串格式轉換器
     *
     * @param dateString 日期字串
     * @param dateFormat 輸入日期格式
     * @param convertFormat 輸出日期格式
     * @return 格式化後日期
     */
    public static String convertDateString(
            String dateString, String dateFormat, String convertFormat) throws ParseException {

        SimpleDateFormat format = new SimpleDateFormat(dateFormat);
        Date date = null;
        date = format.parse(dateString);

        return new SimpleDateFormat(convertFormat).format(date);
    }

    /**
     * 日期格式轉換器
     *
     * @param date 日期
     * @param convertFormat 轉換格式
     * @return 轉換後字串
     */
    public static String convertDate(Date date, String convertFormat) {
        return new SimpleDateFormat(convertFormat).format(date);
    }

    /**
     * 日期字串轉日期格式
     *
     * @param dateString 日期字串
     * @param dateFormat 日期格式
     * @return 日期
     */
    public static Date convertStringToDate(String dateString, String dateFormat)
            throws ParseException {
        SimpleDateFormat format = new SimpleDateFormat(dateFormat);
        Date date = null;
        date = format.parse(dateString);

        return date;
    }
}
