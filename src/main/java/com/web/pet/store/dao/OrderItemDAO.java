package com.web.pet.store.dao;

import com.web.pet.store.dto.table.OrderItemDTO;
import com.web.pet.util.DbUtils;

import java.sql.SQLException;

public class OrderItemDAO {

    public static int insert(DbUtils dbu, OrderItemDTO data) throws SQLException {
        String sql =
                "INSERT INTO order_item (order_id, product_id, quantity) \n"
                        + "OUTPUT inserted.orderitem_id\n"
                        + "VALUES (?,?,?)";

        return dbu.selectIntList(sql, data.getOrderId(), data.getProductId(), data.getQuantity());
    }

    public static void deleteProduct(DbUtils dbu, int productId) throws SQLException {
        String sql = "DELETE FROM order_item WHERE product_id=?";

        dbu.executeList(sql, productId);
    }
}
