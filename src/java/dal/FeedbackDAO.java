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
import model.Feedback;

/**
 *
 * @author GanKPoet
 */
public class FeedbackDAO extends DBContext {

    public List<Feedback> getAllFeedback() {
        List<Feedback> list = new ArrayList<>();
        String sql = "select * from Feedback\n";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Feedback f = Feedback.builder()
                        .id(rs.getInt(1))
                        .fullName(rs.getString(2))
                        .rated_star(rs.getInt(3))
                        .feedback(rs.getString(4))
                        .image(rs.getString(5))
                        .status(rs.getBoolean(6))
                        .product_id(rs.getInt(7))
                        .user_id(rs.getInt(8))
                        .build();

                list.add(f);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }

        return list;
    }

    public List<Feedback> getAllFeedbackByProductId(int productId) {
        List<Feedback> list = new ArrayList<>();
        String sql = "select * from Feedback where product_id = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, productId);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Feedback f = Feedback.builder()
                        .id(rs.getInt(1))
                        .fullName(rs.getString(2))
                        .rated_star(rs.getInt(3))
                        .feedback(rs.getString(4))
                        .image(rs.getString(5))
                        .status(rs.getBoolean(6))
                        .product_id(rs.getInt(7))
                        .user_id(rs.getInt(8))
                        .date(rs.getDate(9))
                        .build();

                list.add(f);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }

        return list;
    }

    public int getTotalFeedback(int product_id) {
        String sql = "select COUNT(feedBack_id) from Feedback where product_id = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, product_id);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                return rs.getInt(1);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return 0;
    }

    public int getAVGStar() {
        String sql = "  SELECT AVG([rated_star])\n"
                + "FROM Feedback;";
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

    public void deleteFeedbacktById(int id) {
        String sql = "DELETE FROM [dbo].[Feedback]\n"
                + "      WHERE feedBack_id = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
            st.executeUpdate();

        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public void addNewFeedback(String full_Name, int star, String subject, String image, int i, int product_id, int user_Id) {
        try {
            String sql = "INSERT INTO [dbo].[Feedback]\n"
                    + "           ([fullName]\n"
                    + "           ,[rated_star]\n"
                    + "           ,[feedback]\n"
                    + "           ,[image]\n"
                    + "           ,[status]\n"
                    + "           ,[product_id]\n"
                    + "           ,[userId])\n"
                    + "     VALUES\n"
                    + "           (?,?,?,?,?,?,?)";
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, full_Name);
            st.setInt(2, star);
            st.setString(3, subject);
            st.setString(4, image);
            st.setInt(5, i);
            st.setInt(6, product_id);
            st.setInt(7, user_Id);
            st.executeUpdate();

        } catch (SQLException e) {
            System.out.println(e);
        }
    }

}
