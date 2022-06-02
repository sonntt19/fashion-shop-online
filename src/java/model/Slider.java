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
 * @author Admin
 */
@Builder
@Getter
@Setter
@ToString

public class Slider {
    private int id;
    private String slider_title;
    private String slider_image;
    private String backlink;
    private String note;
    private boolean status;
    private int updated_by;    
    
}
