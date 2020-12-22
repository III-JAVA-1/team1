package com.web.pet.store.dto.ecpay;

import lombok.Data;

@Data
public class AioCheckOutDTO {
    
    /**
	 * MerchantID
	 * 合作特店編號(由綠界提供)
	 * limit 10
	 */
	private String MerchantID = "";
	
	/**
	 * MerchantTradeNo
	 * 合作特店交易編號(由合作特店提供)，該交易編號不可重複
	 * limit 20(訂單編號+流水號)
	 */
	private String MerchantTradeNo = "";
	
	/**
	 * StoreID
	 * 合作特店商店代碼，提供合作特店填入店家代碼使用
	 * limit 20
	 */
	private String StoreID = "";
	
	/**
	 * MerchantTradeDate
	 * 合作特店交易時間
	 * limit 20 (yyyy/MM/dd HH:mm:ss) 
	 */
	private String MerchantTradeDate = "";
	
	/**
	 * PaymentType
	 * 交易類型
	 * limit 20 固定帶入aio
	 */
	private String PaymentType = "aio";
	
	/**
	 * TotalAmount
	 * 交易金額
	 */
	private String TotalAmount = "";
	
	/**
	 * TradeDesc
	 * 交易描述
	 */
	private String TradeDesc = "";
	
	/**
	 * ItemName
	 * 商品名稱
	 * limit 400 #=return (換行)
	 */
	private String ItemName = "";
	
	/**
	 * ReturnURL
	 * 當消費者付款完成後，綠界會將付款結 果參數以幕後(Server POST)回傳到該網址。
	 */
	private String ReturnURL = "";
	
	/**
	 * ChoosePayment
	 * 選擇預設付款方式
	 * 
	 * Credit:信用卡及銀聯卡(需申請開通) 
	 * WebATM:網路 ATM
	 * ATM:自動櫃員機
	 * CVS:超商代碼
	 * BARCODE:超商條碼
	 * ALL:不指定付款方式，由綠界顯示付款 方式選擇頁面。
	 */
	private String ChoosePayment = "ALL";
	
	/**
	 * ClientBackURL
	 * Client端返回合作特店系統的按鈕連結
	 */
	private String ClientBackURL = "";
    
    /**
	 * ItemURL
	 * 商品銷售網址
	 */
	private String ItemURL = "";
	
	/**
	 * Remark
	 * 備註欄位
	 */
	private String Remark = "";
	
	/**
	 * ChooseSubPayment
	 * 選擇預設付款子項目
	 */
	private String ChooseSubPayment = "";
	
	/**
	 * OrderResultURL
	 * 當消費者付款完成後，綠界會將付款結 果參數以幕前(Client POST)回傳到該網 址。
	 */
	private String OrderResultURL = "";
	
	/**
	 * NeedExtraPaidInfo
	 * 是否需要額外的付款資訊
	 * 
	 * 若不回傳額外的付款資訊時，參數值請 傳:N; 
	 * 若要回傳額外的付款資訊時，參數值請 傳:Y，付款完成後綠界會以 Server POST 方式回傳額外付款資訊。
	 */
	private String NeedExtraPaidInfo = "";
	
	/**
	 * DeviceSource
	 * 裝置來源
	 */
	private String DeviceSource = "";
	
	/**
	 * IgnorePayment
	 * 隱藏付款方式
	 * 當付款方式 [ChoosePayment] 為 ALL 時，可隱藏不需要的付款方式，多筆請以井號分隔(#)。
	 */
	private String IgnorePayment = "";
	
	/**
	 * PlatformID
	 * 特約合作平台商代號(由綠界提供)
	 */
	private String PlatformID = "";
	
	/**
	 * InvoiceMark
	 * 電子發票開立註記
	 */
	private String InvoiceMark = "";
	
	/**
	 * CustomField1
	 * 自訂名稱欄位1，提供合作廠商使用記錄用客製化使用欄位
	 */
	private String CustomField1 = "";
	
	/**
	 * CustomField2
	 * 自訂名稱欄位2，提供合作廠商使用記錄用客製化使用欄位
	 */
	private String CustomField2 = "";
	
	/**
	 * CustomField3
	 * 自訂名稱欄位3，提供合作廠商使用記錄用客製化使用欄位
	 */
	private String CustomField3 = "";
	
	/**
	 * CustomField4
	 * 自訂名稱欄位4，提供合作廠商使用記錄用客製化使用欄位
	 */
	private String CustomField4 = "";
	
	/**
	 * EncryptType
	 * CheckMacValue加密類型
	 * 固定填入 1，使用 SHA256 加密。
	 */
	private String EncryptType = "1";
	
	// 當 ChoosePayment 參數為使用 ALL 或 ATM 付款方式時，為以下狀況
	/**
	 * ExpireDate
	 * 允許繳費有效天數，若需設定最長 60 天，最短1天。未設定此參數則預設為3天
	 */
	private String ExpireDate = "";
	
	/**
	 * PaymentInfoURL
	 * Server端回傳付款相關資訊
	 * 若有設定此參數，訂單建立完成後(非 付款完成)，綠界會 Server 端背景回傳 消費者付款方式相關資訊(例:銀行代 碼、繳費虛擬帳號繳費期限...等)。
	 * ATM、WEBATM、CVS、BARCODE 皆適用。
	 */
	private String PaymentInfoURL = "";
	
	/**
	 * ClientRedirectURL
	 * Client端回傳付款相關資訊
	 * 若有設定此參數，訂單建立完成後(非 付款完成)，綠界會 Client 端回傳消費者付款方式相關資訊
	 * (例:銀行代碼、 繳費虛擬帳號繳費期限...等)且將頁面 轉到特店指定的頁面。
	 * ATM、WEBATM、CVS、BARCODE 皆適用。
	 */
	private String ClientRedirectURL = "";
	
	// 當 ChoosePayment 參數為使用 ALL 或 CVS 或 BARCODE 付款方式時:
	/**
	 * StoreExpireDate
	 * 超商繳費截止時間
	 * CVS:以分鐘為單位
	 * BARCODE:以天為單位 
	 * 若未設定此參數 CVS 預設為 10080 分 鐘(7 天) BARCODE 預設為 7 天。 
	 * 若需設定此參數，請於建立訂單時將此 參數送給綠界。
	 * 提醒您，CVS 帶入數值 不可超過 86400 分鐘，超過時一律以 86400 分鐘計(60 天)
	 * 例:08/01 的 20:15 分購買商品，繳費 期限為 7 天，表示 8/08 的 20:15 分前 您必須前往超商繳費。
	 */
	private String StoreExpireDate = "";
	
	/**
	 * Desc_1
	 * 交易描述1
	 */
	private String Desc_1 = "";
	
	/**
	 * Desc_2
	 * 交易描述2
	 */
	private String Desc_2 = "";
	
	/**
	 * Desc_3
	 * 交易描述3
	 */
	private String Desc_3 = "";
	
	/**
	 * Desc_4
	 * 交易描述4
	 */
	private String Desc_4 = "";
	
	/**
	 * Language
	 * 語系設定
	 */
	private String Language = "";
	
	/**
	 * BidingCard
	 * 記憶卡號，使用記憶信用卡 1:使用  0:不使用
	 */
	private String BidingCard = "";
	
	/**
	 * MerchantMemberID
	 * 記憶卡號識別碼，為合作特店使的會員識別碼，若記憶卡號為1時，記憶卡號識別碼為必填
	 */
	private String MerchantMemberID = "";
	
	/**
	 * Redeem
	 * 信用卡是否使用紅利折抵
	 * 設為 Y 時，當綠界特店選擇信用卡付款 時，會進入紅利折抵的交易流程。
	 */
	private String Redeem = "";
	
	/**
	 * UnionPay
	 * 是否為銀聯卡交易
	 * 0: 消費者於交易頁面可選擇是否使用銀聯交易。
	 * 1: 只使用銀聯卡交易，且綠界會將交易頁面直接導到銀聯網站。
	 * 2: 不可使用銀聯卡，綠界會將交易頁面隱藏銀聯選項。
	 */
	private String UnionPay = "";
	
	// 信用卡分期付款
	/**
	 * CreditInstallment
	 * 刷卡分期期數
	 * 信用卡分期可用參數為:3,6,12,18,24
	 */
	private String CreditInstallment = "";
	
	// 信用卡定期定額
	/**
	 * PeriodAmount
	 * 每次授權金額
	 */
	private String PeriodAmount = "";
	
	/**
	 * PeriodType
	 * 週期種類
	 */
	private String PeriodType = "";
	
	/**
	 * Frequency
	 * 執行頻率
	 */
	private String Frequency = "";
	
	/**
	 * ExecTimes
	 * 執行次數
	 */
	private String ExecTimes = "";
	
	/**
	 * PeriodReturnURL
	 * 定期定額的執行結果回應URL
	 */
	private String PeriodReturnURL = "";
	
	
	@Override
	public String toString() {
		return "AioCheckOutALL [MerchantID=" + MerchantID + ", MerchantTradeNo=" + MerchantTradeNo + ", StoreID="
				+ StoreID + ", MerchantTradeDate=" + MerchantTradeDate + ", PaymentType=" + PaymentType
				+ ", TotalAmount=" + TotalAmount + ", TradeDesc=" + TradeDesc + ", ItemName=" + ItemName
				+ ", ReturnURL=" + ReturnURL + ", ChoosePayment=" + ChoosePayment + ", ClientBackURL=" + ClientBackURL
				+ ", ItemURL=" + ItemURL + ", Remark=" + Remark + ", ChooseSubPayment=" + ChooseSubPayment
				+ ", OrderResultURL=" + OrderResultURL + ", NeedExtraPaidInfo=" + NeedExtraPaidInfo + ", DeviceSource="
				+ DeviceSource + ", IgnorePayment=" + IgnorePayment + ", PlatformID=" + PlatformID + ", InvoiceMark="
				+ InvoiceMark + ", CustomField1=" + CustomField1 + ", CustomField2=" + CustomField2 + ", CustomField3=" 
				+ CustomField3 + ", CustomField4=" + CustomField4 + ", EncryptType=" + EncryptType 
				+ ", ExpireDate=" + ExpireDate + ", PaymentInfoURL=" + PaymentInfoURL + ", ClientRedirectURL=" + ClientRedirectURL 
				+ ", StoreExpireDate=" + StoreExpireDate + ", Desc_1=" + Desc_1 + ", Desc_2=" + Desc_2 + ", Desc_3=" + Desc_3 
				+ ", Desc_4=" + Desc_4 + ", Language=" + Language + ", BidingCard=" + BidingCard 
				+ ", MerchantMemberID=" + MerchantMemberID + ", Redeem=" + Redeem + ", UnionPay=" + UnionPay 
				+ ", CreditInstallment=" + CreditInstallment + ", PeriodAmount=" + PeriodAmount + ", PeriodType=" + PeriodType 
				+ ", Frequency=" + Frequency + ", ExecTimes=" + ExecTimes + ", PeriodReturnURL=" + PeriodReturnURL + "]";
	}
}
