/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dal;

import context.DBContext;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Cart;

/**
 *
 * @author son22
 */
public class CartDAO extends DBContext {

    public List<Cart> getAllCartByUserId(int user_id) {
        List<Cart> list = new ArrayList<>();
        String sql = "select * from Cart where [user_id] = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, user_id);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Cart c = Cart.builder()
                        .cart_id(rs.getInt(1))
                        .product_id(rs.getInt(2))
                        .product_name(rs.getString(3))
                        .product_price(rs.getInt(4))
                        .quantity(rs.getInt(5))
                        .total_cost(rs.getInt(6))
                        .user_id(rs.getInt(7))
                        .build();

                list.add(c);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public Cart checkCart(int user_id, int product_id) {
        String sql = "select * from Cart where [user_id] = ? and product_id = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, user_id);
            st.setInt(2, product_id);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Cart c = Cart.builder()
                        .cart_id(rs.getInt(1))
                        .product_id(rs.getInt(2))
                        .product_name(rs.getString(3))
                        .product_price(rs.getInt(4))
                        .quantity(rs.getInt(5))
                        .total_cost(rs.getInt(6))
                        .user_id(rs.getInt(7))
                        .build();

                return c;
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    public void addToCart(int product_id, String name, int price, int quantity, int total_cost, int user_id) {
        try {
            String sql = "INSERT INTO [dbo].[Cart]\n"
                    + "           ([product_id]\n"
                    + "           ,[product_name]\n"
                    + "           ,[product_price]\n"
                    + "           ,[quantity]\n"
                    + "           ,[total_cost]\n"
                    + "           ,[user_id])\n"
                    + "     VALUES\n"
                    + "           (?,?,?,?,?,?)";
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, product_id);
            st.setString(2, name);
            st.setInt(3, price);
            st.setInt(4, quantity);
            st.setInt(5, total_cost);
            st.setInt(6, user_id);
            st.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(ProductDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void addQuantityCartProduct(int product_id, int quantity, int total_cost, int user_id) {
        try {
            String sql = "UPDATE [dbo].[Cart]\n"
                    + "   SET [quantity] = ? \n"
                    + "      ,[total_cost] = ? \n"
                    + " WHERE [product_id] = ? and [user_id] = ?";
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, quantity);
            st.setInt(2, total_cost);
            st.setInt(3, product_id);
            st.setInt(4, user_id);
            st.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(ProductDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void deleteCart(int product_id, int user_id) {
        try {
            String sql = "DELETE FROM [dbo].[Cart]\n"
                    + "      WHERE [product_id] = ? and [user_id] = ? ";
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, product_id);
            st.setInt(2, user_id);
            st.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(ProductDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void deleteCartByUserId(int user_id) {
        try {
            String sql = "DELETE FROM [dbo].[Cart]\n"
                    + "      WHERE [user_id] = ?";
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, user_id);
            st.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(ProductDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void updateQuantityCart(int quantity, int cartId, int product_id) {
        try {
            String sql = "UPDATE [dbo].[Cart]\n"
                    + "   SET [quantity] = ?\n"
                    + " WHERE cart_id = ? and product_id = ?";
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, quantity);
            st.setInt(2, cartId);
            st.setInt(3, product_id);
            st.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(ProductDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

}
