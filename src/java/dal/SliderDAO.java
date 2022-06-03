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
        String sql = "SELECT top 1 *\n"
                + "  FROM [dbo].[Slider]";
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

    public List<Slider> getALLSlider() {
        List<Slider> list = new ArrayList<>();
        String sql = "SELECT  *\n"
                + "  FROM [dbo].[Slider]";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Slider c = Slider.builder()
                        .id(rs.getInt(1))
                        .slider_image(rs.getString(3))
                        .build();

                list.add(c);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }

        return list;
    }

}
