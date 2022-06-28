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
import model.Product;

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
                        .status(rs.getBoolean(9))
                        .build();

                return c;
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    public Blog getBlogNew() {
        List<Blog> list = new ArrayList<>();
        String sql = "select top 1 * from Blog\n"
                + "order by updated_date desc";
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

                return c;
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    public int getTotalBlog(String searchKey, String categoryId) {
        String sql = "Select count(*) from Blog "
                + "where categoryBlog_id " + categoryId + " and title like N'%" + searchKey + "%'\n";
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

    public List<Blog> getBlogWithPaging(int page, int PAGE_SIZE, String searchKey, String categoryId, String type, String value) {
        List<Blog> list = new ArrayList<>();
        String sql = "select * from Blog\n"
                + "where categoryBlog_id " + categoryId + " and title like N'%" + searchKey + "%'\n"
                + " order by " + value + " " + type + " offset (?-1)*? row fetch next ? row only";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, page);
            st.setInt(2, PAGE_SIZE);
            st.setInt(3, PAGE_SIZE);
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
                        .status(rs.getBoolean(9))
                        .build();

                list.add(c);
            }
            return list;
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    public List<Blog> getBlogWithPaging(int page, int PAGE_SIZE, String searchKey, String categoryId, String type, String value, String status, String authorId) {
        List<Blog> list = new ArrayList<>();
        String sql = "select * from Blog\n"
                + "where categoryBlog_id " + categoryId + " and [status] " + status + " and author_id " + authorId + " and [title] like N'%" + searchKey + "%'\n"
                + " order by " + value + " " + type + " offset (?-1)*? row fetch next ? row only";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, page);
            st.setInt(2, PAGE_SIZE);
            st.setInt(3, PAGE_SIZE);
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
                        .status(rs.getBoolean(9))
                        .build();

                list.add(c);
            }
            return list;
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    public int getTotalBlog(String searchKey, String categoryId, String status, String author) {
        String sql = "Select count(*) from Blog "
                + "where categoryBlog_id " + categoryId + " and [status] " + status + " and author_id " + author + " and title like N'%" + searchKey + "%'\n";
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

    public void addNewBlog(String title, int user_id, String content, String brief_infor, int category_id, boolean status, String url_thumbnail) {
        try {
            String sql = "INSERT INTO [dbo].[Blog]\n"
                    + "           ([title]\n"
                    + "           ,[author_id]\n"
                    + "           ,[content]\n"
                    + "           ,[thumbnail]\n"
                    + "           ,[brief_infor]\n"
                    + "           ,[categoryBlog_id]\n"
                    + "           ,[status])\n"
                    + "     VALUES\n"
                    + "           (?,?,?,?,?,?,?)";
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, title);
            st.setInt(2, user_id);
            st.setString(3, content);
            st.setString(4, brief_infor);
            st.setInt(5, category_id);
            st.setBoolean(6, status);
            st.setString(7, url_thumbnail);

            st.executeUpdate();
        } catch (SQLException ex) {
            System.out.println(ex);
        }
    }
}
