package hu.codeblurb.backend.domain.shop;


import hu.codeblurb.backend.domain.content.ContentBundle;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.OneToOne;

@Entity
@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
@ToString
public class ShoppingItem {
    @Id
    @GeneratedValue
    private Integer id;
    private Double price;
    @OneToOne
    private ContentBundle contentBundle;

    public String getTitle() {
        return contentBundle.getTitle();
    }
}
