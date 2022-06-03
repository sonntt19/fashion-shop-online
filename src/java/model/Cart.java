
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
public class Cart {
        private Product product;
        private int quantity_cart;
}
