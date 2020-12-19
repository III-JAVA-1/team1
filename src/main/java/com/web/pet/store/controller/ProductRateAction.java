package com.web.pet.store.controller;

import com.web.pet.store.dao.RateDAO;
import com.web.pet.store.dto.api.*;
import com.web.pet.store.dto.table.RateDTO;
import com.web.pet.util.DbUtils;
import com.web.pet.util.ExceptionUtils;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;


@EnableWebMvc
@Controller
@Slf4j
public class ProductRateAction {

    @GetMapping("/productRate")
    public String init(Model model,
            @RequestParam("memberId") String id,
            @RequestParam("orderId") String orderId) {
        model.addAttribute("memberId", id);
        model.addAttribute("orderId", orderId);

        return "Store/ProductRate";
    }

    @PostMapping("/productRate/getOrderItem")
    public @ResponseBody
    GetOrderItemResDTO getOrderItem(
            @RequestBody GetOrderItemReqDTO req) {
        GetOrderItemResDTO res = new GetOrderItemResDTO();
        try (DbUtils dbu = new DbUtils(); ) {
            String sql =
                    "SELECT a.product_id,\n"
                            + "       c.product_name,\n"
                            + "       (SELECT TOP (1) img FROM product_image WHERE product_id = a.product_id),\n"
                            + "       b.rate,\n"
                            + "       b.message,\n"
                            + "       a.orderitem_id\n"
                            + "FROM order_item a\n"
                            + "         LEFT JOIN rate b\n"
                            + "                   ON (a.orderitem_id = b.order_item_id AND b.customer_id = ?)\n"
                            + "         LEFT JOIN product c\n"
                            + "                   ON a.product_id = c.product_id\n"
                            + "WHERE a.order_id = ?";
            ResultSet resultSet = dbu.queryList(sql, req.getMemberId(), req.getOrderId());
            // 初始化要裝評價的陣列
            List<RateDataResDTO> dataList = new ArrayList<>();

            // resultSet是上面SQL語法查出來的結果
            while (resultSet.next()) {
                RateDataResDTO data = new RateDataResDTO();
                data.setProductId(resultSet.getInt(1));
                data.setProductName(resultSet.getString(2));
                data.setImg(resultSet.getString(3));
                data.setRate(resultSet.getInt(4));
                data.setMessage(resultSet.getString(5));
                data.setOrderItemId(resultSet.getInt(6));
                dataList.add(data);
            }
            resultSet.close();
            res.setRateDataList(dataList);

        } catch (SQLException e) {
            log.error(ExceptionUtils.getErrorDetail(e));
        }
        return res;
    }

    @PostMapping("/productRate/sendRate")
    public @ResponseBody
    SendRateResDTO sendRate(@RequestBody SendRateReqDTO req) {

        SendRateResDTO res = new SendRateResDTO();
        try (DbUtils dbu = new DbUtils(); ) {
            String sql = "SELECT count(*) FROM rate WHERE customer_id=? AND order_item_id=?";

            for (RateDataResDTO data : req.getRateDataList()) {
                int count = dbu.selectIntList(sql, req.getMemberId(), data.getOrderItemId());
                RateDTO rateDTO = new RateDTO();
                rateDTO.setCustomerId(req.getMemberId());
                rateDTO.setOrderItemId(data.getOrderItemId());
                rateDTO.setProductId(data.getProductId());
                rateDTO.setRate(data.getRate());
                rateDTO.setMessage(data.getMessage());
                rateDTO.setDate(new Date());
                if (count == 0) {
                    //沒資料時新增
                    RateDAO.insert(dbu,rateDTO);
                }else{
                    //有資料時更新
                    RateDAO.update(dbu,rateDTO);
                }
            }
            dbu.doCommit();
            res.setSuccess(true);

        } catch (SQLException e) {
            log.error(ExceptionUtils.getErrorDetail(e));
        }
        return res;
    }
}
