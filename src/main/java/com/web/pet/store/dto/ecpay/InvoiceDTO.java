package com.web.pet.store.dto.ecpay;

import lombok.Data;

@Data
public class InvoiceDTO {
    
	/**
	 * RelateNumber
	 * 合作特店自訂編號
	 */
	private String RelateNumber = "";
	
	/**
	 * CustomerID
	 * 客戶代號
	 */
	private String CustomerID = "";
	
	/**
	 * CustomerIdentifier
	 * 統一編號
	 */
	private String CustomerIdentifier = "";
	
	/**
	 * CustomerName
	 * 客戶名稱
	 */
	private String CustomerName = "";
	
	/**
	 * CustomerAddr
	 * 客戶地址
	 */
	private String CustomerAddr = "";
	
	/**
	 * CustomerPhone
	 * 客戶手機號碼
	 */
	private String CustomerPhone = "";
	
	/**
	 * CustomerEmail
	 * 客戶電子信箱
	 */
	private String CustomerEmail = "";
	
	/**
	 * ClearanceMark
	 * 通關方式
	 */
	private String ClearanceMark = "";
	
	/**
	 * TaxType
	 * 課稅類別
	 */
	private String TaxType = "";
	
	/**
	 * CarruerType
	 * 載具類別
	 */
	private String CarruerType = "";
	
	/**
	 * CarruerNum
	 * 載具編號
	 */
	private String CarruerNum = "";
	
	/**
	 * Donation
	 * 捐贈註記
	 */
	private String Donation = "";
	
	/**
	 * LoveCode
	 * 愛心碼
	 */
	private String LoveCode = "";
	
	/**
	 * Print
	 * 列印註記
	 */
	private String Print = "";
	
	/**
	 * InvoiceItemName
	 * 商品名稱
	 */
	private String InvoiceItemName = "";
	
	/**
	 * InvoiceItemCount
	 * 商品數量
	 */
	private String InvoiceItemCount = "";
	
	/**
	 * InvoiceItemWord
	 * 商品單位
	 */
	private String InvoiceItemWord = "";
	
	/**
	 * InvoiceItemPrice
	 * 商品價格
	 */
	private String InvoiceItemPrice = "";
	
	/**
	 * InvoiceItemTaxType
	 * 商品課稅別
	 */
	private String InvoiceItemTaxType = "";
	
	/**
	 * InvoiceRemark
	 * 備註
	 */
	private String InvoiceRemark = "";
	
	/**
	 * DelayDay
	 * 延遲天數
	 */
	private String DelayDay = "";
	
	/**
	 * InvType
	 * 字軌類別
	 */
	private String InvType = "";
	
	@Override
	public String toString() {
		return "InvoiceObj [RelateNumber=" + RelateNumber + ", CustomerID=" + CustomerID + ", CustomerIdentifier="
				+ CustomerIdentifier + ", CustomerName=" + CustomerName + ", CustomerAddr=" + CustomerAddr
				+ ", CustomerPhone=" + CustomerPhone + ", CustomerEmail=" + CustomerEmail + ", ClearanceMark="
				+ ClearanceMark + ", TaxType=" + TaxType + ", CarruerType=" + CarruerType + ", CarruerNum=" + CarruerNum
				+ ", Donation=" + Donation + ", LoveCode=" + LoveCode + ", Print=" + Print + ", InvoiceItemName="
				+ InvoiceItemName + ", InvoiceItemCount=" + InvoiceItemCount + ", InvoiceItemWord=" + InvoiceItemWord
				+ ", InvoiceItemPrice=" + InvoiceItemPrice + ", InvoiceItemTaxType=" + InvoiceItemTaxType
				+ ", InvoiceRemark=" + InvoiceRemark + ", DelayDay=" + DelayDay + ", InvType=" + InvType + "]";
	}
}
