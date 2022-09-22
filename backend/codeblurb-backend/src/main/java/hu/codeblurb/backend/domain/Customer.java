package hu.codeblurb.backend.domain;

import hu.codeblurb.backend.domain.shop.Payment;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import java.util.Set;

@Entity
@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
@ToString
public class Customer {

    @Id
    @GeneratedValue
    private Integer id;
    @OneToMany
    private Set<Payment> payments;

    @Column(nullable = false, unique = true)
    private String username;

    @Column(nullable = false)
    private String password;

}
