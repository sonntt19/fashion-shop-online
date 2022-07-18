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
 * @author son22
 */
@Builder
@Getter
@Setter
@ToString
public class Setting {
    private int setting_id;
    private int type;
    private int order;
    private String value;
    private String description;
    private boolean status;
    private String type_String;
}
