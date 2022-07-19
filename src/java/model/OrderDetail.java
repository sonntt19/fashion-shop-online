/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

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
public class OrderDetail {
    int orderDetail_id;
    int product_price;
    int quantity;
    int order_id;
    int product_id;
    String product_name;
    int total_cost;
    String product_image;
    String category_name;
    int category_id;
}
