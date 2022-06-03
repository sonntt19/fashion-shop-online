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
 * @author son22
 */
@Builder
@Getter
@Setter
@ToString
public class Product {

    private int id;
    private String name;
    private int original_price;
    private int sale_price;
    private String brief_infor;
    private String desciption;
    private boolean status;
    private int quantity;
    private String image;
    private Date update_date;
    private int category_id;
    private double rated_star;
}
