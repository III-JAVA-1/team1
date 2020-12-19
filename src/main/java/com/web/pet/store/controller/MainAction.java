package com.web.pet.store.controller;

import com.web.pet.util.ContextUtils;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.FileSystemXmlApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.context.support.WebApplicationContextUtils;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;

import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@EnableWebMvc
@Controller
public class MainAction {

    @GetMapping("/main")
    public String init(Model model) {

        return "Store/Main";
    }

    @GetMapping("/db")
    public @ResponseBody List<String> init() {
        List<String> data = new ArrayList<>();


        return data;
    }

    /**
     * 標準post格式
     *
     * @param req post body 可以加入@Valid檢驗格式
     * @return 需要回傳格式
     */
    @PostMapping("/test01")
    public @ResponseBody Map<String, String> test(@RequestBody Map<String, String> req) {
        Map<String, String> res = new HashMap<>();
//        try {
//            AioCheckOutDTO aioDTO = new AioCheckOutDTO();
//            aioDTO.setMerchantTradeNo("testOrder001" + "001");
//            aioDTO.setMerchantTradeDate(EcpayUtils.ecpayDateFormat(new Date()));
//            aioDTO.setTotalAmount("1000");
//            aioDTO.setTradeDesc("毛孩商城");
//            aioDTO.setItemName("寵物用品");
//            aioDTO.setReturnURL("http://localhost:8090/test/");
//            aioDTO.setChoosePayment(OrderPayType.CREDIT_CARD.getEcpCode());
//            aioDTO.setClientBackURL("");
//            aioDTO.setNeedExtraPaidInfo("N");
//            aioDTO.setClientBackURL("http://localhost:8090/test/");
//
//            EcpayService ecpayService = new EcpayService(true);
//            res.put("ecpayHtml", ecpayService.genAioCheckOut(aioDTO, null));
//        } catch (Exception e) {
//            e.printStackTrace();
//        }
        return res;
    }
}
