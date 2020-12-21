package com.web.pet.store.service;

import com.web.pet.store.dto.ecpay.AioCheckOutDTO;
import com.web.pet.store.dto.ecpay.InvoiceDTO;
import com.web.pet.util.EcpayUtils;
import lombok.extern.slf4j.Slf4j;

import java.lang.reflect.InvocationTargetException;
import java.util.Hashtable;
import java.util.Set;

@Slf4j
public class EcpayService {

    private boolean isTest;

    private final String ECPAY_BASE_URL;

    // ECPAY 結帳 URI
    private final String CHECKOUT_URI = "/AioCheckOut/V5";
    // ECPAY MerchantID
    private String MERCHANT_ID;
    // ECPAY Hash key
    private String ECPAY_HASH_KEY;
    // ECPAY Hash IV
    private String ECPAY_HASH_IV;

    public EcpayService(boolean isTest) {
        this.isTest = isTest;
        ECPAY_BASE_URL =
                isTest
                        ? "https://payment-stage.ecpay.com.tw/Cashier"
                        : "https://payment.ecpay.com.tw/Cashier";
        this.MERCHANT_ID = "2000132";
        this.ECPAY_HASH_KEY = "5294y06JbISpM5x9";
        this.ECPAY_HASH_IV = "v77hoKGq4kWxNNIS";
    }

    public void setMerchantId(String MERCHANT_ID) {
        this.MERCHANT_ID = isTest ? "2000132" : MERCHANT_ID;
    }

    public void setEcpayHashKey(String ECPAY_HASH_KEY) {
        this.ECPAY_HASH_KEY = isTest ? "5294y06JbISpM5x9" : ECPAY_HASH_KEY;
    }

    public void setEcpayHashIv(String ECPAY_HASH_IV) {
        this.ECPAY_HASH_IV = isTest ? "v77hoKGq4kWxNNIS" : ECPAY_HASH_IV;
    }

    /**
     * 將訂單資料組成 html 丟到 ECPAY 付款
     *
     * @param aioDTO
     * @param invoice 不開發票直接帶 null 即可
     */
    public String genAioCheckOut(AioCheckOutDTO aioDTO, InvoiceDTO invoice)
            throws NoSuchMethodException, IllegalAccessException, InvocationTargetException {
        StringBuilder out = new StringBuilder();
        //        String ignoreParam = "";
        aioDTO.setPlatformID("");
        if (!aioDTO.getPlatformID().isEmpty() && aioDTO.getMerchantID().isEmpty()) {
            aioDTO.setMerchantID(MERCHANT_ID);
        } else if (!aioDTO.getPlatformID().isEmpty() && !aioDTO.getMerchantID().isEmpty()) {
        } else {
            aioDTO.setMerchantID(MERCHANT_ID);
        }
        aioDTO.setInvoiceMark(invoice == null ? "N" : "Y");
        out.append(genCheckOutHtmlCode(aioDTO, invoice));

        return out.toString();
    }

    /**
     * 產生HTML code
     *
     * @param aio object
     * @param invoice obj
     * @return string
     */
    private String genCheckOutHtmlCode(Object aio, InvoiceDTO invoice)
            throws NoSuchMethodException, IllegalAccessException, InvocationTargetException {
        StringBuilder builder = new StringBuilder();
        Hashtable<String, String> fieldValue = EcpayUtils.objToHashtable(aio);
        Hashtable<String, String> invoiceField;
        if (invoice != null) {
            invoiceField = EcpayUtils.objToHashtable(invoice);
            fieldValue.putAll(invoiceField);
        }
        String CheckMacValue =
                EcpayUtils.genCheckMacValue(ECPAY_HASH_KEY, ECPAY_HASH_IV, fieldValue);
        fieldValue.put("CheckMacValue", CheckMacValue);
        Set<String> key = fieldValue.keySet();
        String[] name = key.toArray(new String[0]);
        builder.append("<form id=\"allPayAPIForm\" action=\"")
                .append(ECPAY_BASE_URL)
                .append(CHECKOUT_URI)
                .append("\" method=\"post\">");
        for (String s : name) {
            builder.append("<input type=\"hidden\" name=\"")
                    .append(s)
                    .append("\" value=\"")
                    .append(fieldValue.get(s))
                    .append("\">");
        }
        builder.append("<script language=\"JavaScript\">");
        builder.append("allPayAPIForm.submit()");
        builder.append("</script>");
        builder.append("</form>");
        return builder.toString();
    }
}
