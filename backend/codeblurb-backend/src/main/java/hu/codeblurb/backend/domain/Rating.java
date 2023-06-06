package hu.codeblurb.backend.domain;

import hu.codeblurb.backend.domain.content.Content;
import lombok.*;
import org.hibernate.annotations.Check;

import javax.persistence.*;

@Entity
@NoArgsConstructor
@AllArgsConstructor
@Builder
@Getter
@Setter
@ToString
public class Rating {

    @Id
    @GeneratedValue
    private Integer id;

    @ManyToOne
    private Customer customer;

    @ManyToOne
    private Content content;

    @Column(name = "rating", nullable = false)
    private short rating;

}
