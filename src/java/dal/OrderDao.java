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
import model.Chart;
import model.Order;

/**
 *
 * @author dongh
 */
public class OrderDao extends DBContext {

    public int createNewOrder(int sum, String fullname, String phone, String address, int user_id, String note) {
        String sql = "INSERT INTO [dbo].[Order]\n"
                + "           ([total_cost]\n"
                + "           ,[fullName]\n"
                + "           ,[mobile]\n"
                + "           ,[address]\n"
                + "           ,[userId]\n"
                + "           ,[note])\n"
                + "     VALUES\n"
                + "           (?,?,?,?,?,?) ";
        try {
            PreparedStatement st = connection.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
            st.setInt(1, sum);
            st.setString(2, fullname);
            st.setString(3, phone);
            st.setString(4, address);
            st.setInt(5, user_id);
            st.setString(6, note);

            st.executeUpdate();
            ResultSet rs = st.getGeneratedKeys();
            if (rs.next()) {
                return rs.getInt(1);
            }

        } catch (SQLException e) {
            System.out.println(e);
        }
        return 0;
    }

    public Order getOrderNew(int user_id) {
        String sql = "SELECT * FROM [dbo].[Order] where userId = ? and status_order is null";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, user_id);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Order p = Order.builder()
                        .orderID(rs.getInt(1))
                        .date(rs.getDate(2))
                        .total_cost(rs.getInt(3))
                        .fullName(rs.getString(4))
                        .mobile(rs.getString(5))
                        .address(rs.getString(6))
                        .status_order(rs.getInt(7))
                        .UserId(rs.getInt(8))
                        .saler_id(rs.getInt(9))
                        .note(rs.getString(10))
                        .build();

                return p;
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    public void updateStatusOrder(int orderID, int i) {
        String sql = "UPDATE [dbo].[Order]\n"
                + "   SET [status_order] = ?\n"
                + " WHERE order_id = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, i);
            st.setInt(2, orderID);
            st.executeUpdate();
        } catch (Exception e) {
        }
    }

    public List<Order> getAllOrder(int userId) {
        List<Order> list = new ArrayList<>();
        String sql = "select * from [Order] join Status_Order\n"
                + "on [Order].status_order= Status_Order.status_order_id\n"
                + "where userId = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, userId);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Order c = Order.builder()
                        .orderID(rs.getInt(1))
                        .date(rs.getDate(2))
                        .total_cost(rs.getInt(3))
                        .countProduct(getCountProduct(rs.getInt(1)))
                        .fullNameFirstProduct(getFullNameFirstProduct(rs.getInt(1)))
                        .fullName(rs.getString(4))
                        .mobile(rs.getString(5))
                        .address(rs.getString(6))
                        .status_order(rs.getInt(7))
                        .status_order_name(rs.getString(12))
                        .build();

                list.add(c);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }

        return list;
    }

    public List<Order> getAllOrder() {
        List<Order> list = new ArrayList<>();
        String sql = "select * from [Order] \n"
                + "join Status_Order on [Order].status_order= Status_Order.status_order_id\n"
                + "join [User] on [User].userId = [Order].saler_id";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Order c = Order.builder()
                        .orderID(rs.getInt(1))
                        .date(rs.getDate(2))
                        .total_cost(rs.getInt(3))
                        .countProduct(getCountProduct(rs.getInt(1)))
                        .fullNameFirstProduct(getFullNameFirstProduct(rs.getInt(1)))
                        .fullName(rs.getString(4))
                        .mobile(rs.getString(5))
                        .address(rs.getString(6))
                        .status_order(rs.getInt(7))
                        .UserId(rs.getInt(8))
                        .saler_id(rs.getInt(9))
                        .status_order_name(rs.getString(12))
                        .fullNameSaler(rs.getString(15))
                        .build();

                list.add(c);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }

        return list;
    }

    private int getCountProduct(int id) {
        String sql = "select count(*) from Order_Detail join Product \n"
                + "on Order_Detail.product_id = Product.product_id\n"
                + "where order_id = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                return rs.getInt(1) - 1;
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return 0;
    }

    private String getFullNameFirstProduct(int id) {
        String sql = "select top 1 Product.product_name from Order_Detail join Product \n"
                + "                on Order_Detail.product_id = Product.product_id\n"
                + "                where order_id = ?";
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

    public List<Order> getAllOrderInDetail(int orderId) {
        List<Order> list = new ArrayList<>();
        String sql = "select * from [Order] join Status_Order\n"
                + "                on [Order].status_order= Status_Order.status_order_id\n"
                + "                where order_id = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, orderId);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Order c = Order.builder()
                        .orderID(rs.getInt(1))
                        .date(rs.getDate(2))
                        .total_cost(rs.getInt(3))
                        .countProduct(getCountProduct(rs.getInt(1)))
                        .fullNameFirstProduct(getFullNameFirstProduct(rs.getInt(1)))
                        .fullName(rs.getString(4))
                        .mobile(rs.getString(5))
                        .address(rs.getString(6))
                        .status_order(rs.getInt(7))
                        .saler_id(rs.getInt(9))
                        .status_order_name(rs.getString(12))
                        .build();

                list.add(c);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }

        return list;
    }

    public Order getOrderById(int order_id) {
        String sql = "select * from where order_id = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, order_id);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Order c = Order.builder()
                        .orderID(rs.getInt(1))
                        .date(rs.getDate(2))
                        .total_cost(rs.getInt(3))
                        .countProduct(getCountProduct(rs.getInt(1)))
                        .fullNameFirstProduct(getFullNameFirstProduct(rs.getInt(1)))
                        .fullName(rs.getString(4))
                        .mobile(rs.getString(5))
                        .address(rs.getString(6))
                        .status_order(rs.getInt(7))
                        .status_order_name(rs.getString(12))
                        .build();

                return c;
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    public int getAssignOrder() {
        String sql = "SELECT TOP 1 * FROM [User] where role_id = 3\n"
                + "ORDER BY NEWID()";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                return rs.getInt(1);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return -1;
    }

    public void updateSalerOrder(int orderID, int saler_id) {
        String sql = "UPDATE [dbo].[Order]\n"
                + "   SET [saler_id] = ?\n"
                + " WHERE order_id = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, saler_id);
            st.setInt(2, orderID);
            st.executeUpdate();
        } catch (Exception e) {
        }
    }

    public Order checkProductOrderByUser(int user_Id, int productId) {
        String sql = "select * from [Order] o join Order_Detail od on o.order_id = od.order_id\n"
                + "where o.userId = ? and od.product_id = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, user_Id);
            st.setInt(2, productId);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Order c = Order.builder()
                        .orderID(rs.getInt(1))
                        .build();
                return c;
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    public int getTotalOrder(String salerId, String start, String end) {
        String sql = "select count(*) from [Order] where saler_id " + salerId + "  and orderDate <= ?  and orderDate >= ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, end);
            st.setString(2, start);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                return rs.getInt(1);
            }

        } catch (SQLException e) {
            System.out.println(e);
        }
        return 0;
    }

    public int getTotalOrderSubmited(String salerId, String start, String end) {
        String sql = "select count(*) from [Order] where saler_id " + salerId + "  and orderDate <= ?  and orderDate >= ? and status_order = 1 ";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, end);
            st.setString(2, start);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                return rs.getInt(1);
            }

        } catch (SQLException e) {
            System.out.println(e);
        }
        return 0;
    }

    public int getTotalOrderSuccesful(String salerId, String start, String end) {
        String sql = "select count(*) from [Order] where saler_id " + salerId + "  and orderDate <= ?  and orderDate >= ? and status_order = 2";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, end);
            st.setString(2, start);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                return rs.getInt(1);
            }

        } catch (SQLException e) {
            System.out.println(e);
        }
        return 0;
    }

    public int getTotalOrderCanceled(String salerId, String start, String end) {
        String sql = "select count(*) from [Order] where saler_id " + salerId + "  and orderDate <= ?  and orderDate >= ? and status_order = 3";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, end);
            st.setString(2, start);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                return rs.getInt(1);
            }

        } catch (SQLException e) {
            System.out.println(e);
        }
        return 0;
    }

    public List<Chart> getChartOrderBar(String salerId, String start, int day) {
        List<Chart> list = new ArrayList<>();
        for (int i = 0; i < day; i++) {
            int value = 0;
            String sql = "select count(*) from [Order] where saler_id " + salerId + " and orderDate  = DATEADD(DAY, ?, ?)";
            try {
                PreparedStatement st = connection.prepareStatement(sql);
                st.setInt(1, i);
                st.setString(2, start);
                ResultSet rs = st.executeQuery();
                while (rs.next()) {
                    value = rs.getInt(1);
                }
                sql = "select  DATEADD(DAY, ?, ?)";
                st = connection.prepareStatement(sql);
                st.setInt(1, i);
                st.setString(2, start);
                rs = st.executeQuery();
                while (rs.next()) {
                    Chart c = Chart.builder()
                            .date(rs.getDate(1))
                            .value(value)
                            .build();
                    list.add(c);
                }

            } catch (SQLException e) {
                System.out.println(e);
            }
        }
        return list;
    }

    public List<Chart> getChartRevenueBar(String salerId, String start, int day) {
        List<Chart> list = new ArrayList<>();
        for (int i = 0; i < day; i++) {
            int value = 0;
            String sql = "select sum(total_cost) from [Order] where  saler_id " + salerId + " and orderDate = DATEADD(DAY, ?, ?)";
            try {
                PreparedStatement st = connection.prepareStatement(sql);
                st.setInt(1, i);
                st.setString(2, start);
                ResultSet rs = st.executeQuery();
                while (rs.next()) {
                    value = rs.getInt(1);
                }
                sql = "select  DATEADD(DAY, ?, ?)";
                st = connection.prepareStatement(sql);
                st.setInt(1, i);
                st.setString(2, start);
                rs = st.executeQuery();
                while (rs.next()) {
                    Chart c = Chart.builder()
                            .date(rs.getDate(1))
                            .value(value)
                            .build();
                    list.add(c);
                }

            } catch (SQLException e) {
                System.out.println(e);
            }
        }
        return list;
    }

    public List<Chart> getChartRevenueArea(String salerId, String start, int day) {
        List<Chart> list = new ArrayList<>();
        for (int i = 0; i < day; i++) {
            int value = 0;
            String sql = "select sum(total_cost) from [Order] where  saler_id " + salerId + " and orderDate <= DATEADD(DAY, ?, ?) and orderDate >= ?";
            try {
                PreparedStatement st = connection.prepareStatement(sql);
                st.setInt(1, i);
                st.setString(2, start);
                st.setString(3, start);
                ResultSet rs = st.executeQuery();
                while (rs.next()) {
                    value = rs.getInt(1);
                }
                sql = "select  DATEADD(DAY, ?, ?)";
                st = connection.prepareStatement(sql);
                st.setInt(1, i);
                st.setString(2, start);
                rs = st.executeQuery();
                while (rs.next()) {
                    Chart c = Chart.builder()
                            .date(rs.getDate(1))
                            .value(value)
                            .build();
                    list.add(c);
                }

            } catch (SQLException e) {
                System.out.println(e);
            }
        }
        return list;
    }

    public void updateOrder(int orderId, int status, int salerId) {
        String sql = "UPDATE [dbo].[Order]\n"
                + "   SET [status_order] = ? \n"
                + "	   ,[saler_id] = ? \n"
                + " WHERE order_id = ? ";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, status);
            st.setInt(2, salerId);
            st.setInt(3, orderId);
            st.executeUpdate();
        } catch (Exception e) {
        }
    }

}
