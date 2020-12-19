package com.web.pet.util;
import lombok.extern.slf4j.Slf4j;

import javax.naming.Context;
import javax.naming.InitialContext;

@Slf4j
public class ContextUtils {

    // 取圖片初始網址路徑用
    public static final String IMG_URL = "url/images";

    /**
     * 取得context字串
     * @param key context中的key
     * @return 取得的字串
     */
    public static String getContextString(String key) {
        String contextString = "";
        try {
            Context initCtx = new InitialContext();
            contextString = (String) initCtx.lookup("java:/comp/env/" + key);
        } catch (Exception e) {
            log.error("context找不到對應值");
        }
        return contextString;
    }

}
