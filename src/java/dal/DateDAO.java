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
import model.Date;

/**
 *
 * @author son22
 */
public class DateDAO extends DBContext {

    public int CountDayByStartEnd(String start, String end) {
        String sql = "SELECT DATEDIFF(day, ?, ?)";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, start);
            st.setString(2, end);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                return rs.getInt(1)+1;
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return 0;
    }

    public Date get7day() {
        String sql = "select GETDATE(), GETDATE()-6";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Date date = Date.builder()
                        .start(rs.getDate(2))
                        .end(rs.getDate(1))
                        .build();
                return date;
            }

        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    
}
