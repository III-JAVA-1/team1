package com.web.pet.store.controller;

import com.web.pet.store.dao.OrderDAO;
import com.web.pet.store.dto.api.*;
import com.web.pet.store.service.ControlValue;
import com.web.pet.store.service.MailService;
import com.web.pet.util.ConvertUtils;
import com.web.pet.util.DbUtils;
import com.web.pet.util.ExceptionUtils;
import com.web.pet.util.FileUtils;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.core.io.Resource;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

@Controller
@Slf4j
public class MySalesAction {

    @Value(value = "classpath:email_order_shipped.html")
    private Resource htmlResource;

    // 可以自己命名網址路徑位置
    @GetMapping("/mySales")
    public String init(Model model, @RequestParam("memberId") String memberId) {
        model.addAttribute("memberId", memberId);
        return "Store/MySales";
    }

    @PostMapping("/mySales/getOrderList")
    public @ResponseBody GetOrderListResDTO getOrderList(@RequestBody GetOrderListReqDTO req) {
        GetOrderListResDTO res = new GetOrderListResDTO();

        try (DbUtils dbu = new DbUtils()) {

            String sql =
                    "SELECT a.order_id, b.Email, a.cost, a.date, a.order_status,\n"
                            + "(SELECT TOP (1) d.product_name FROM order_item c,product d\n"
                            + "WHERE c.product_id = d.product_id\n"
                            + "AND a.order_id = c.order_id),\n"
                            + "(SELECT TOP (1) e.img FROM order_item c, product_image e\n"
                            + "WHERE a.order_id = c.order_id\n"
                            + "AND c.product_id = e.product_id)\n"
                            + "FROM [order] a, Member b\n"
                            + "WHERE a.customer_id = b.U_Id\n";

            // 查詢條件的值存放陣列
            List<Object> args = new ArrayList<>();

            if (StringUtils.isNotEmpty(req.getOrderId())) {
                sql += "AND a.order_id = ?\n";
                args.add(req.getOrderId());
            }

            if (null != req.getOrderStatus()) {
                sql += "AND a.order_status = ?\n";
                args.add(req.getOrderStatus());
            }

            if (null != req.getStartDate()) {
                sql += "AND a.date >= ?\n";
                args.add(ConvertUtils.convertStringToDate(req.getStartDate(), "yyyyMMdd"));
            }

            if (null != req.getEndDate()) {
                sql += "AND a.date <= ?\n";
                args.add(ConvertUtils.convertStringToDate(req.getEndDate(), "yyyyMMdd"));
            }

            sql += "ORDER BY a.date DESC\n";

            ResultSet resultSet =
                    dbu.queryList(
                            sql,
                            // 將查詢條件的值轉為array
                            args.toArray(new Object[0]));
            // 初始化要裝資料的陣列
            List<OrderResDTO> dataList = new ArrayList<>();
            while (resultSet.next()) {
                OrderResDTO data = new OrderResDTO();
                data.setOrderId(resultSet.getInt(1));
                data.setName(resultSet.getString(2));
                data.setCost(resultSet.getInt(3));
                data.setDate(ConvertUtils.convertDate(resultSet.getTimestamp(4), "yyyy-MM-dd"));
                data.setOrderStatus(resultSet.getInt(5));
                data.setProductName(resultSet.getString(6));
                data.setImg(resultSet.getString(7));
                dataList.add(data);
            }
            res.setOrderList(dataList);
        } catch (Exception e) {
            log.error(ExceptionUtils.getErrorDetail(e));
        }
        return res;
    }

    @PostMapping("/mySales/editOrderStatus")
    public @ResponseBody EditOrderStatusResDTO editOrderStatus(
            @RequestBody EditOrderStatusReqDTO req) {
        EditOrderStatusResDTO res = new EditOrderStatusResDTO();
        try (DbUtils dbu = new DbUtils(); ) {
            OrderDAO.updateStatus(dbu, req.getOrderId(), req.getStatus());
            dbu.doCommit();
            if(req.getStatus()==2){
                String sendEmail =
                        dbu.selectStringList("SELECT a.Email FROM Member a, [order] b WHERE a.U_Id = b.customer_id\n" +
                                "AND b.order_id=?", req.getOrderId());
                // 寄送訂單出貨通知信
                String content = FileUtils.readTextFile(htmlResource.getFile());
                content =
                        content.replace(
                                "$content_url", ControlValue.SERVER_URL + "Member/Shoporder.jsp");
                MailService.initMail(ControlValue.SEND_EMAIL, ControlValue.EMAIL_TOKEN)
                        .setTitle("AccompanyMe訂單出貨通知")
                        .addContent(content)
                        .setSendName("毛孩商城")
                        .addSends(ControlValue.SEND_EMAIL, "eva.011601@gmail.com", sendEmail)
                        .sendMailOnThread(MailService.MailType.HTML);
            }
            res.setSuccess(true);

        } catch (Exception e) {
            log.error(ExceptionUtils.getErrorDetail(e));
        }
        return res;
    }
}
