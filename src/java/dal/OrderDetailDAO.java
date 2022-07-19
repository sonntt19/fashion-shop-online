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
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import model.Cart;
import model.OrderDetail;

/**
 *
 * @author dongh
 */
public class OrderDetailDAO extends DBContext {
    
    public void addCartToOrder(List<Cart> listCart, int order_id) {
        try {
            for (Cart cart : listCart) {
                String sql = "INSERT INTO [dbo].[Order_Detail]\n"
                        + "           ([product_price]\n"
                        + "           ,[quantity]\n"
                        + "           ,[order_id]\n"
                        + "           ,[product_id]\n"
                        + "           ,[product_name]\n"
                        + "           ,[total_cost])\n"
                        + "     VALUES\n"
                        + "           (?,?,?,?,?,?)";
                PreparedStatement st = connection.prepareStatement(sql);
                st.setInt(1, cart.getProduct_price());
                st.setInt(2, cart.getQuantity());
                st.setInt(3, order_id);
                st.setInt(4, cart.getProduct_id());
                st.setString(5, cart.getProduct_name());
                st.setInt(6, cart.getTotal_cost());
                st.executeUpdate();
            }
            
        } catch (SQLException ex) {
            System.out.println(ex);
        }
    }

    public List<OrderDetail> getAllByOderId(int orderID) {
        List<OrderDetail> list = new ArrayList<>();
        String sql = "SELECT * From Order_Detail where order_id = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, orderID);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                OrderDetail p = OrderDetail.builder()
                        .orderDetail_id(rs.getInt(1))
                        .product_price(rs.getInt(2))
                        .quantity(rs.getInt(3))
                        .order_id(rs.getInt(4))
                        .product_id(rs.getInt(5))
                        .product_name(rs.getString(6))
                        .total_cost(rs.getInt(7))
                        .build();

                list.add(p);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }
    
    public List<OrderDetail> getDetailAllOrder(int orderId) {
        List<OrderDetail> list = new ArrayList<>();
        String sql = "select * from Order_Detail join Product \n"
                + "                on Order_Detail.product_id = Product.product_id\n"
                + "				join Products_Images on Order_Detail.product_id = Products_Images.product_id\n"
                + "				join Category on Product.category_id = Category.category_id\n"
                + "				where order_id = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, orderId);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                OrderDetail c = OrderDetail.builder()
                        .product_price(rs.getInt(2))
                        .quantity(rs.getInt(3))
                        .order_id(rs.getInt(4))
                        .product_name(rs.getString(6))
                        .product_image(rs.getString(20))
                        .category_name(rs.getString(22))
                        .product_id(rs.getInt(5))
                        .category_id(rs.getInt(16))
                        .build();

                list.add(c);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }

        return list;

    }
    
}
