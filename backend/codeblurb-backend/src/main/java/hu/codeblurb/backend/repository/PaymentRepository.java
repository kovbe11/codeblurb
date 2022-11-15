package hu.codeblurb.backend.repository;

import hu.codeblurb.backend.domain.shop.Payment;
import org.springframework.data.jpa.repository.JpaRepository;

public interface PaymentRepository extends JpaRepository<Payment, Integer> {
}
