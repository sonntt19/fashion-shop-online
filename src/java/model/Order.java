/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import java.sql.Date;
import lombok.Builder;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

/**
 *
 * @author dongh
 */
@Builder
@Getter
@Setter
@ToString
public class Order {
    int orderID;
    Date date;
    int total_cost;
    String fullName;
    String mobile;
    String address;
    int status_order;
    int UserId;
    int saler_id;
    String note;
    int countProduct;
    String fullNameFirstProduct;
    String status_order_name;
    String fullNameSaler;
}
