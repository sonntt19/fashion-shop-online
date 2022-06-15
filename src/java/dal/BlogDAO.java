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
import model.CategoryBlog;

/**
 *
 * @author Admin
 */
public class BlogDAO extends DBContext {

    public List<Blog> getAllBlog() {
        List<Blog> list = new ArrayList<>();
        String sql = "Select * from Blog";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Blog c = Blog.builder()
                        .blog_id(rs.getInt(1))
                        .title(rs.getString(2))
                        .author_id(rs.getInt(3))
                        .updated_date(rs.getDate(4))
                        .content(rs.getString(5))
                        .thumbnail(rs.getString(6))
                        .brief_infor(rs.getString(7))
                        .categoryBlog_id(rs.getInt(8))
                        .build();

                list.add(c);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }

        return list;
    }

    public List<Blog> getBlogByCategoryBlogId(int categoryBlog_id) {
        List<Blog> list = new ArrayList<>();
        String sql = "Select * from Blog\n"
                + "where categoryBlog_id = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, categoryBlog_id);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Blog c = Blog.builder()
                        .blog_id(rs.getInt(1))
                        .title(rs.getString(2))
                        .author_id(rs.getInt(3))
                        .updated_date(rs.getDate(4))
                        .content(rs.getString(5))
                        .thumbnail(rs.getString(6))
                        .brief_infor(rs.getString(7))
                        .categoryBlog_id(rs.getInt(8))
                        .build();

                list.add(c);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }

        return list;
    }

    public Blog getBlogByBlogId(int blog_id) {
        String sql = "Select * from Blog\n"
                + "where blog_id = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, blog_id);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Blog c = Blog.builder()
                        .blog_id(rs.getInt(1))
                        .title(rs.getString(2))
                        .author_id(rs.getInt(3))
                        .updated_date(rs.getDate(4))
                        .content(rs.getString(5))
                        .thumbnail(rs.getString(6))
                        .brief_infor(rs.getString(7))
                        .categoryBlog_id(rs.getInt(8))
                        .build();
                
                
                return c;
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }
}
