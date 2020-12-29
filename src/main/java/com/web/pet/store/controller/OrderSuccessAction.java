package com.web.pet.store.controller;

import com.web.pet.util.DbUtils;
import com.web.pet.util.ExceptionUtils;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;

import java.sql.ResultSet;
import java.sql.SQLException;

@EnableWebMvc
@Controller
@Slf4j
public class OrderSuccessAction {

    @GetMapping("/orderSuccess")
    public String init(
            Model model,
            @RequestParam("memberId") String id,
            @RequestParam("orderId") String orderId) {
        model.addAttribute("memberId", id);
        // 初始化查詢資料庫
        try (DbUtils dbu = new DbUtils()) {
            // 查備註跟地址
            String sql =
                    "SELECT address, remarks, pay_type, cost FROM [order]\n"
                            + "WHERE order_id = ? AND customer_id = ?\n";
            // 取得查詢結果
            ResultSet resultSet = dbu.queryList(sql, orderId, id);
            int orderTotalPrice = 0;
            if (resultSet.next()) {
                // 將取得結果傳回jsp的${}
                model.addAttribute("address", resultSet.getString(1));
                model.addAttribute("remarks", resultSet.getString(2));
                switch (resultSet.getInt(3)) {
                    case 0:
                        // 信用卡
                        model.addAttribute("shipping", "60");
                        model.addAttribute("payType", "信用卡");
                        break;
                    case 1:
                        // 貨到付款
                        model.addAttribute("shipping", "65");
                        model.addAttribute("payType", "貨到付款");
                        break;
                }
                orderTotalPrice = resultSet.getInt(4);
            }
            resultSet.close();

            // 接下來換查訂單明細
            sql =
                    "SELECT b.product_name, b.price, a.quantity,\n"
                            + "(SELECT TOP (1) img FROM product_image WHERE product_id = a.product_id)\n"
                            + "FROM order_item a,product b\n"
                            + "WHERE order_id = ? AND a.product_id = b.product_id";
            // 取得資料庫查詢結果
            resultSet = dbu.queryList(sql, orderId);
            // 初始化要裝購買項目的HTML
            StringBuilder stringBuilder = new StringBuilder();
            // 初始化總金額為0
            int orderPrice = 0;

            // 拆解查詢結果
            while (resultSet.next()) {
                String productName = resultSet.getString(1);
                int price = resultSet.getInt(2);
                int quantity = resultSet.getInt(3);
                String img = resultSet.getString(4);
                img = img.isEmpty() ? "Store/images/no_picture.gif" : img;
                // 計算單一商品金額
                int total = price * quantity;
                // 計算所有商品總金額
                orderPrice += total;
                // 組出購買項目HTML
                stringBuilder
                        .append("<tr>\n")
                        .append("<td><img src=\"")
                        .append(img)
                        .append("\" width=\"150px\" height=\"150px\"></td>\n")
                        .append("<td style=\"vertical-align:middle\">")
                        .append(productName)
                        .append("</td>\n")
                        .append("<td style=\"vertical-align:middle\" class=\"item-count\">$")
                        .append(price)
                        .append("</td>\n")
                        .append("<td style=\"vertical-align:middle\" class=\"item-count\">")
                        .append(quantity)
                        .append("</td>\n")
                        .append("<td style=\"vertical-align:middle\" class=\"item-count\">$")
                        .append(total)
                        .append("</td>\n")
                        .append("</tr>");
            }
            // 關閉查詢結果
            resultSet.close();

            // 把值傳回jsp , stringBuilder是字串組合器, 把裡面的東西轉成字串給jsp顯示
            model.addAttribute("orderItem", stringBuilder.toString());
            model.addAttribute("orderPrice", orderPrice);
            model.addAttribute("orderTotalPrice", orderTotalPrice);

        } catch (SQLException e) {
            log.error(ExceptionUtils.getErrorDetail(e));
        }
        return "Store/OrderSuccess";
    }
}
