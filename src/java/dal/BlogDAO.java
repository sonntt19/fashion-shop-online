/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dal;

import context.DBContext;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import model.Blog;

/**
 *
 * @author Admin
 */
public class BlogDAO extends DBContext{

    public List<Blog> getAllBlog() {
        List<Blog> list = new ArrayList<>();
        String sql = "Select * from Blog";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Blog c = Blog.builder()
                        .id(rs.getInt(1))
                        .title(rs.getString(2))
                        .thumbnail(rs.getString(6))
                        .brief_info(rs.getString(7))
                        .build();

                list.add(c);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }

        return list;
    }
    
}
