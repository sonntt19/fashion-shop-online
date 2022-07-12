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
import model.Slider;

/**
 *
 * @author Admin
 */
public class SliderDAO extends DBContext {

    public Slider getFirstSlider() {
        String sql = "SELECT top 1 * FROM [dbo].[Slider] where [status] = 1";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Slider c = Slider.builder()
                        .id(rs.getInt(1))
                        .build();

                return c;
            }
        } catch (SQLException e) {
            System.out.println(e);
        }

        return null;
    }

    public int getcountSlider() {
        String sql = "SELECT count(*) FROM [dbo].[Slider] where [status] = 1";
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

    public List<Slider> getALLSlider() {
        List<Slider> list = new ArrayList<>();
        String sql = "SELECT * FROM [dbo].[Slider] where [status] = 1";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Slider c = Slider.builder()
                        .id(rs.getInt(1))
                        .slider_title(rs.getString(2))
                        .slider_image(rs.getString(3))
                        .backlink(rs.getString(4))
                        .status(rs.getBoolean(6))
                        .updated_by(rs.getInt(7))
                        .build();

                list.add(c);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }

        return list;
    }

    public List<Slider> getALLSlider_True_False() {
        List<Slider> list = new ArrayList<>();
        String sql = "SELECT * FROM [dbo].[Slider]";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Slider c = Slider.builder()
                        .id(rs.getInt(1))
                        .slider_title(rs.getString(2))
                        .slider_image(rs.getString(3))
                        .backlink(rs.getString(4))
                        .status(rs.getBoolean(6))
                        .updated_by(rs.getInt(7))
                        .build();

                list.add(c);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }

        return list;
    }

    public Slider GetSliderDetailbyID(int sliderId) {
        String sql = "SELECT * FROM [dbo].[Slider] where slider_id = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, sliderId);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Slider c = Slider.builder()
                        .id(rs.getInt(1))
                        .slider_title(rs.getString(2))
                        .slider_image(rs.getString(3))
                        .backlink(rs.getString(4))
                        .status(rs.getBoolean(6))
                        .updated_by(rs.getInt(7))
                        .build();

                return c;
            }
        } catch (SQLException e) {
            System.out.println(e);
        }

        return null;
    }

    public void updateStatusSlider(int id, int i) {
        String sql = "UPDATE [dbo].[Slider]\n"
                + "   SET status = ?\n"
                + " WHERE slider_id = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, i);
            st.setInt(2, id);
            st.executeUpdate();
        } catch (Exception e) {
        }
    }

    public void UpdateSliderById(int slider_id, String slider_title, String backlink, String url_thumbnail) {
        try {
            String sql = "UPDATE [dbo].[Slider]\n"
                    + "   SET [slider_title] = ?\n"
                    + "      ,[slider_image] = ?\n"
                    + "      ,[backlink] = ?\n"
                    + " WHERE slider_id = ?";
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, slider_title);
            st.setString(2, url_thumbnail);
            st.setString(3, backlink);
            st.setInt(4, slider_id);

            st.executeUpdate();
        } catch (SQLException ex) {
            System.out.println(ex);
        }
    }

    public void AddSliderById(String slider_title, String backlink, String url_thumbnail, int status) {
        try {
            String sql = "INSERT INTO [dbo].[Slider]\n"
                    + "           (slider_title\n"
                    + "           ,slider_image\n"
                    + "           ,backlink\n"
                    + "           ,[status])\n"
                    + "     VALUES\n"
                    + "           (?,?,?,?)";
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, slider_title);
            st.setString(2, url_thumbnail);
            st.setString(3, backlink);
            st.setInt(4, status);

            st.executeUpdate();
        } catch (SQLException ex) {
            System.out.println(ex);
        }
    }

    public String getUrlImageById(int id) {
        String sql = "select slider_image from Slider where slider_id = ?";
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

}
