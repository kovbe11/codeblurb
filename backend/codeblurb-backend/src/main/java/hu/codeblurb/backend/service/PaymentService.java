package hu.codeblurb.backend.service;

import hu.codeblurb.backend.repository.PaymentRepository;
import lombok.AllArgsConstructor;
import org.springframework.stereotype.Service;

@Service
@AllArgsConstructor
public class PaymentService {

    private final PaymentRepository paymentRepository;

    public void checkout() {

    }

    public void getPreviousPayments() {

    }
}
