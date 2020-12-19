package com.web.pet.store.dao;

import com.web.pet.util.DbUtils;

import java.sql.SQLException;

public class ProductImageDAO {
    public static void deleteProduct(DbUtils dbu, int productId) throws SQLException {
        String sql = "DELETE FROM product_image WHERE product_id=?";

        dbu.executeList(sql, productId);
    }
}
