package com.web.pet.store.dao;

import com.web.pet.store.dto.table.RateDTO;
import com.web.pet.util.DbUtils;

import java.sql.SQLException;

public class RateDAO {

    public static int insert(DbUtils dbu, RateDTO data) throws SQLException {
        String sql =
                "INSERT INTO rate (customer_id, order_item_id, product_id, rate, message, date) \n"
                        + "VALUES (?,?,?,?,?,?)";

        return dbu.executeList(
                sql,
                data.getCustomerId(),
                data.getOrderItemId(),
                data.getProductId(),
                data.getRate(),
                data.getMessage(),
                data.getDate());
    }

    public static int update(DbUtils dbu, RateDTO data) throws SQLException {
        String sql =
                "UPDATE rate SET rate=?,message=?,date=?\n"
                        + "WHERE customer_id=? AND order_item_id=?";

        return dbu.executeList(
                sql,
                data.getRate(),
                data.getMessage(),
                data.getDate(),
                data.getCustomerId(),
                data.getOrderItemId());
    }

    public static void deleteProduct(DbUtils dbu, int productId) throws SQLException {
        String sql = "DELETE FROM rate WHERE product_id=?";

        dbu.executeList(sql, productId);
    }
}
