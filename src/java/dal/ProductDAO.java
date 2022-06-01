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
import model.Product;

/**
 *
 * @author son22
 */
public class ProductDAO extends DBContext {

    public int getTotalProduct() {
        String sql = "Select count(product_id) from Product";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                return rs.getInt(1);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return 0;
    }

    public double getRatedProduct(int id) {
        String sql = "select AVG(rated_star) from Feedback where product_id = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                return rs.getDouble(1);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return 0;
    }

    public String getImgProduct(int id) {
        String sql = "select images from Products_Images where product_id = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                return rs.getString(1);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    public List<Product> getProductWithPaging(int page, int PAGE_SIZE, String searchKey, String categoryId, String type, String value) {
        List<Product> list = new ArrayList<>();
        String sql = "select * from Product\n"
                + "where category_id "+categoryId+" and product_name like '%"+searchKey+"%'\n"
                + "order by "+value+" "+type+" offset (?-1)*? row fetch next ? row only";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, page);
            st.setInt(2, PAGE_SIZE);
            st.setInt(3, PAGE_SIZE);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Product p = Product.builder()
                        .id(rs.getInt(1))
                        .name(rs.getString(2))
                        .original_price(rs.getInt(3))
                        .sale_price(rs.getInt(4))
                        .desciption(rs.getString(5))
                        .brief_infor(rs.getString(6))
                        .status(rs.getBoolean(7))
                        .quantity(rs.getInt(8))
                        .category_id(rs.getInt(9))
                        .update_date(rs.getDate(10))
                        .image(getImgProduct(rs.getInt(1)))
                        .rated_star(getRatedProduct(rs.getInt(1)))
                        .build();

                list.add(p);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public Product getProductNew() {
        List<Product> list = new ArrayList<>();
        String sql = "select top 1 * from Product order by update_date desc";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Product p = Product.builder()
                        .id(rs.getInt(1))
                        .name(rs.getString(2))
                        .original_price(rs.getInt(3))
                        .sale_price(rs.getInt(4))
                        .desciption(rs.getString(5))
                        .brief_infor(rs.getString(6))
                        .status(rs.getBoolean(7))
                        .quantity(rs.getInt(8))
                        .category_id(rs.getInt(9))
                        .update_date(rs.getDate(10))
                        .image(getImgProduct(rs.getInt(1)))
                        .rated_star(getRatedProduct(rs.getInt(1)))
                        .build();

                return p;
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

}
