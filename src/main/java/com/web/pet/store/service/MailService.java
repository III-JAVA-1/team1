package com.web.pet.store.service;

import org.apache.commons.mail.EmailException;
import org.apache.commons.mail.HtmlEmail;
import org.apache.commons.mail.SimpleEmail;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

/**
 * email發送共用
 *
 * @author Jimmy Kang
 */
public class MailService {

    public enum MailType {
        TEXT,
        HTML
    }

    /**
     * 初始化
     *
     * @param sendMail 寄件人信箱
     * @param mailPwd  寄件人信箱密碼(或金鑰)
     */
    public static MailBuilder initMail(String sendMail, String mailPwd) {
        return new MailBuilder(sendMail, mailPwd);
    }

    public static class MailBuilder {

        // 標題
        private String title = "";
        // 寄件人
        private String sendName = "";
        // 寄件人mail
        private String mail;
        // 寄件人信箱密碼(或金鑰)
        private String mailPwd;
        // 內文
        private StringBuffer content = new StringBuffer();
        // 收信人列表
        private List<String> sendList = new ArrayList<>();
        // mailServer的host
        private String mailHost = "smtp.gmail.com";
        // mailServer的port
        private int mailPort = 587;

        private boolean isTLSEnabled = true;
        private boolean isSSLOnConnect = false;

        /**
         * 初始化
         *
         * @param sendMail 寄件人信箱
         * @param mailPwd  寄件人信箱密碼(或金鑰)
         */
        public MailBuilder(String sendMail, String mailPwd) {
            mail = sendMail;
            this.mailPwd = mailPwd;
        }

        /**
         * 設定標題
         *
         * @param title 標題
         */
        public MailBuilder setTitle(String title) {
            this.title = title;
            return this;
        }

        /**
         * 設定內文
         *
         * @param content 內容文字
         */
        public MailBuilder addContent(String content) {
            this.content.append(content);
            return this;
        }

        /**
         * 新增多個收件人
         *
         * @param sendList 收件人Mail
         */
        public MailBuilder addSends(List<String> sendList) {
            this.sendList.addAll(sendList);
            return this;
        }

        /**
         * 新增收件人
         *
         * @param sends 收件人Mail
         */
        public MailBuilder addSends(String... sends) {
            this.sendList.addAll(Arrays.asList(sends));
            return this;
        }

        /**
         * 設定寄件人名稱
         *
         * @param sendName 寄件人名稱
         */
        public MailBuilder setSendName(String sendName) {
            this.sendName = sendName;
            return this;
        }

        /**
         * 重新設定寄件人Mail
         *
         * @param mail 寄件人Mail
         */
        public MailBuilder setMail(String mail) {
            this.mail = mail;
            return this;
        }

        /**
         * 重新設定寄件人MailPwd(或金鑰)
         *
         * @param mailPwd 寄件人MailPwd
         */
        public MailBuilder setMailPwd(String mailPwd) {
            this.mailPwd = mailPwd;
            return this;
        }

        /**
         * 重新設定mailServer的host
         *
         * @param mailHost mailServer的host
         */
        public MailBuilder setMailHost(String mailHost) {
            this.mailHost = mailHost;
            return this;
        }

        /**
         * 重新設定mailServer的port
         *
         * @param mailPort mailServer的port
         */
        public MailBuilder setMailPort(int mailPort) {
            this.mailPort = mailPort;
            return this;
        }

        public MailBuilder setTLSEnabled(boolean TLSEnabled) {
            isTLSEnabled = TLSEnabled;
            return this;
        }

        public MailBuilder setSSLOnConnect(boolean SSLOnConnect) {
            isSSLOnConnect = SSLOnConnect;
            return this;
        }

        /**
         * 寄出通知信
         *
         * @param mailType 信件格式
         * @throws EmailException 寄信錯誤
         */
        public void sendMail(MailType mailType) throws EmailException {
            if (MailType.TEXT.equals(mailType)) simpleEmail();
            if (MailType.HTML.equals(mailType)) htmlEmail();
        }

        /**
         * 寄出通知信(另開執行緒)
         *
         * @param mailType 信件格式
         */
        public void sendMailOnThread(MailType mailType) {
            new Thread(
                    () -> {
                        try {
                            sendMail(mailType);
                        } catch (EmailException e) {
                            e.printStackTrace();
                        }
                    })
                    .start();
        }

        public void simpleEmail() throws EmailException {
            if (sendList.size() == 0) {
                throw new EmailException("無設定寄送人");
            }
            for (String mail : sendList) {
                SimpleEmail email = new SimpleEmail();
                // TLS安全檢驗
                email.setStartTLSEnabled(isTLSEnabled);
                // SSL安全連線
                email.setSSLOnConnect(isSSLOnConnect);
                // HOSTNAME
                email.setHostName(mailHost);
                // PORT
                email.setSmtpPort(mailPort);
                // 編碼格式
                email.setCharset("UTF-8");
                // 設定寄件人
                email.setFrom(this.mail, sendName);
                // 設定寄件人登入資訊
                email.setAuthentication(this.mail, mailPwd);
                // 寫入標題
                email.setSubject(title);
                // 寫入內文
                email.setMsg(content.toString());
                // 設定收件人
                email.addTo(mail);
                // 寄出
                email.send();
            }
        }

        private void htmlEmail() throws EmailException {
            if (sendList.size() == 0) {
                throw new EmailException("無設定寄送人");
            }
            for (String mail : sendList) {
                HtmlEmail email = new HtmlEmail();
                // TLS安全檢驗
                email.setStartTLSEnabled(isTLSEnabled);
                // SSL安全連線
                email.setSSLOnConnect(isSSLOnConnect);
                // HOSTNAME
                email.setHostName(mailHost);
                // PORT
                email.setSmtpPort(mailPort);
                // 編碼格式
                email.setCharset("UTF-8");
                // 設定寄件人
                email.setFrom(this.mail, sendName);
                // 設定寄件人登入資訊
                email.setAuthentication(this.mail, mailPwd);
                // 寫入標題
                email.setSubject(title);
                // 寫入內文
                email.setHtmlMsg(content.toString());
                // 設定收件人
                email.addTo(mail);
                // 寄出
                email.send();
            }
        }
    }
}
