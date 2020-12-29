package com.web.pet.type;

import lombok.AllArgsConstructor;
import lombok.Getter;

@AllArgsConstructor
public enum OrderPayType {

    CREDIT_CARD("1", "信用卡", "Credit"),

    SHOP_CODE("2", "超商代碼繳費", "CVS"),

    TRANSFER("3", "轉帳", ""),

    PAY_NOW("4", "現付", ""),
	
	WEB_ATM("5", "網路 ATM", "WebATM"),
	
	BARCODE("6", "超商條碼", "BARCODE");

    @Getter private final String code;

    @Getter private final String msg;

    @Getter private final String ecpCode;

    public static OrderPayType toOrderPayType(String code) {
        for (OrderPayType tmp : OrderPayType.values()) {
            if (tmp.getCode().equals(code)) {
                return tmp;
            }
        }
        return null;
    }
}
