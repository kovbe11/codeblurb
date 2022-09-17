package hu.codeblurb.backend.domain.shop;

import hu.codeblurb.backend.domain.Customer;
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
import javax.persistence.ManyToOne;
import java.util.Set;

@Entity
@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
@ToString
public class Payment {
    @Id
    @GeneratedValue
    private Integer id;
    @ManyToOne
    private Customer customer;
    @ManyToMany
    private Set<Content> contentBought;
}
