package hu.codeblurb.backend.domain.shop;


import hu.codeblurb.backend.domain.content.Content;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.ManyToMany;
import java.util.Set;

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
    private String title;
    private Double price;
    @ManyToMany
    private Set<Content> includedContent;
}
