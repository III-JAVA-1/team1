package com.web.pet.store.dao;

import com.web.pet.store.dto.table.ShoppingCartDTO;
import com.web.pet.util.DbUtils;

import java.sql.SQLException;

public class ShoppingCartDAO {
    /**
     * 新增商品至購物車
     *
     * @param dbu 與DB連線
     * @param data 要存進去的資料
     */
    public static void insert(DbUtils dbu, ShoppingCartDTO data) throws SQLException {
        String sql =
                "SELECT shopping_cart_id FROM shopping_cart\n"
                        + "WHERE product_id = ?\n"
                        + "AND customer_id = ?";

        int shoppingCartId = dbu.selectIntList(sql, data.getProductId(), data.getCustomerId());

        if (shoppingCartId == 0) {
            // 如果shoppingCartId為0時要新增
            sql = "INSERT INTO shopping_cart (product_id, customer_id, quantity) VALUES (?,?,?)";
            dbu.executeList(sql, data.getProductId(), data.getCustomerId(), data.getQuantity());
        } else {
            // 否則更新數量
            sql = "UPDATE shopping_cart SET quantity=(quantity + ?) WHERE shopping_cart_id=?";
            dbu.executeList(sql, data.getQuantity(), shoppingCartId);
        }
    }

    /**
     * 更新購物車數量
     *
     * @param dbu 與DB連線
     * @param id 購物車id
     * @param quantity 數量
     */
    public static void updateQuantity(DbUtils dbu, Integer id, Integer quantity)
            throws SQLException {
        String sql = "UPDATE shopping_cart SET quantity=? WHERE shopping_cart_id=?";
        dbu.executeList(sql, quantity, id);
    }

    /**
     * 更新購物車單筆選取
     *
     * @param dbu 與DB連線
     * @param id 購物車id
     * @param isCheck 選取狀態
     */
    public static void updateCheck(DbUtils dbu, Integer id, Boolean isCheck) throws SQLException {
        String sql = "UPDATE shopping_cart SET is_check=? WHERE shopping_cart_id=?";
        dbu.executeList(sql, isCheck ? "T" : "F", id);
    }

    /**
     * 更新購物車全部選取
     *
     * @param dbu 與DB連線
     * @param customerId 會員id
     * @param isCheck 選取狀態
     */
    public static void updateCheckAll(DbUtils dbu, String customerId, Boolean isCheck)
            throws SQLException {
        String sql = "UPDATE shopping_cart SET is_check=? WHERE customer_id=?";
        dbu.executeList(sql, isCheck ? "T" : "F", customerId);
    }

    /**
     * 刪除購物車一筆資料
     *
     * @param dbu 與DB連線
     * @param id 購物車id
     */
    public static void delete(DbUtils dbu, Integer id) throws SQLException {
        String sql = "DELETE FROM shopping_cart WHERE shopping_cart_id=?";
        dbu.executeList(sql, id);
    }

    /**
     * 刪除已購買項目
     *
     * @param dbu 與DB連線
     * @param id 會員id
     */
    public static void deleteBought(DbUtils dbu, String id) throws SQLException {
        String sql = "DELETE FROM shopping_cart WHERE customer_id=? AND is_check='T'";
        dbu.executeList(sql, id);
    }

    public static void deleteProduct(DbUtils dbu, int productId) throws SQLException {
        String sql = "DELETE FROM shopping_cart WHERE product_id=?";

        dbu.executeList(sql, productId);
    }

}
