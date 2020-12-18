package com.web.pet.store.controller;

import com.web.pet.store.dao.OrderDAO;
import com.web.pet.store.dao.OrderItemDAO;
import com.web.pet.store.dao.ShoppingCartDAO;
import com.web.pet.store.dto.api.OrderAddReqDTO;
import com.web.pet.store.dto.api.OrderAddResDTO;
import com.web.pet.store.dto.table.OrderDTO;
import com.web.pet.store.dto.table.OrderItemDTO;
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
import java.util.List;


/** 後端傳輸範例，可以是使用需求複製貼上後修改 */
@EnableWebMvc
@Controller
@Slf4j
public class OrderAction {

    /**
     * GET(取得要顯示的jsp) GetMapping括號中的字串為自己要設定的網址路徑
     *
     * @param model jsp環境
     * @return jsp的檔案名稱
     */
    @GetMapping("/order")
    public String init(Model model, @RequestParam("memberId") String memberId) {
        try (DbUtils dbu = new DbUtils()) {
            // 取得購物車已勾選項目sql語法
            String sql =
                    "SELECT a.shopping_cart_id, a.product_id, a.quantity,\n"
                            + "b.product_name, b.price,\n"
                            + "(SELECT TOP 1 img FROM product_image WHERE product_id = a.product_id), a.is_check\n"
                            + " FROM shopping_cart a ,product b \n"
                            + "WHERE a.customer_id = ?\n"
                            + "AND a.product_id = b.product_id\n"
                            + "AND a.is_check = 'T'";
            // 取得資料庫查詢結果
            ResultSet resultSet = dbu.queryList(sql, memberId);
            // 初始化要裝購買項目的HTML
            StringBuilder stringBuilder = new StringBuilder();
            // 初始化總金額為0
            int orderTotalPrice = 0;
            // 拆解查詢結果
            while (resultSet.next()) {
                String name = resultSet.getString(4);
                int price = resultSet.getInt(5);
                int quantity = resultSet.getInt(3);
                int total = price * quantity;
                // 累加至總金額
                orderTotalPrice += total;
                String img = resultSet.getString(6);
                //沒圖片換預設圖
                img = img.isEmpty() ? "Store/images/no_picture.gif" : img;
                // 組出購買項目HTML
                stringBuilder
                        .append("<tr>\n")
                        .append("<td><img src=\"")
                        .append(img)
                        .append("\" width=\"150px\" height=\"150px\"></td>\n")
                        .append("<td style=\"vertical-align:middle\">")
                        .append(name)
                        .append("</td>\n")
                        .append("<td style=\"vertical-align:middle\">$")
                        .append(price)
                        .append("</td>\n")
                        .append("<td style=\"vertical-align:middle\">")
                        .append(quantity)
                        .append("</td>\n")
                        .append("<td style=\"vertical-align:middle\">$")
                        .append(total)
                        .append("</td>\n")
                        .append("</tr>");
            }
            // 關閉查詢結果
            resultSet.close();
            // 把值傳回jsp
            model.addAttribute("orderItem", stringBuilder.toString());
            model.addAttribute("orderTotalPrice", orderTotalPrice);
            model.addAttribute("memberId", memberId);
        } catch (SQLException e) {
            log.error(ExceptionUtils.getErrorDetail(e));
        }

        return "Store/Order";
    }

    /**
     * 新增訂單
     * @param req 新增訂單要的資訊
     * @return 成功與否
     */
    @PostMapping("/order/add")
    public @ResponseBody
    OrderAddResDTO add(@RequestBody OrderAddReqDTO req) {
        OrderAddResDTO res = new OrderAddResDTO();

        try (DbUtils dbu = new DbUtils()) {
            OrderDTO orderDTO = new OrderDTO();
            // 初始化訂單總金額
            int totalCost = 0;
            // 取得購物車已勾選項目
            ResultSet resultSet =
                    dbu.queryList(
                            "SELECT a.product_id, b.price, a.quantity FROM shopping_cart a, product b\n"
                                    + "WHERE a.product_id=b.product_id\n"
                                    + "AND a.customer_id=?\n"
                                    + "AND a.is_check='T'",
                            req.getId());
            // 初始化購買明細陣列
            List<OrderItemDTO> orderItemList = new ArrayList<>();
            // 拆解資料庫資料
            while(resultSet.next()){
                //  初始化購買明細項目
                OrderItemDTO orderItem = new OrderItemDTO();
                orderItem.setProductId(resultSet.getInt(1));
                orderItem.setQuantity(resultSet.getInt(3));
                // 累加金額至總金額
                totalCost += resultSet.getInt(2) * resultSet.getInt(3);
                // 將項目加至購買明細陣列
                orderItemList.add(orderItem);
            }
            resultSet.close();

            // 設定訂單資料
            orderDTO.setCustomerId(req.getId());
            orderDTO.setCost(totalCost);
            orderDTO.setOrderStatus(1);
            orderDTO.setAddress(req.getAddress());
            orderDTO.setRemarks(req.getRemarks());

            // 執行儲存訂單並接收回傳訂單id
            int orderId = OrderDAO.insert(dbu, orderDTO);

            // 拆解訂單明細陣列
            for (OrderItemDTO orderItem: orderItemList) {
                // 將訂單id給明細
                orderItem.setOrderId(orderId);
                // 執行儲存訂單明細
                OrderItemDAO.insert(dbu, orderItem);
            }

            // 清除購物車已購買項目
            ShoppingCartDAO.deleteBought(dbu, req.getId());

            dbu.doCommit();
            res.setSuccess(true);
            res.setOrderId(String.valueOf(orderId));
        } catch (SQLException e) {
            log.error(ExceptionUtils.getErrorDetail(e));
        }

        return res;
    }
}
