package hu.codeblurb.backend.service;

import hu.codeblurb.backend.domain.shop.Payment;
import hu.codeblurb.backend.exception.InconsistentDatabaseException;
import hu.codeblurb.backend.repository.PaymentRepository;
import hu.codeblurb.backend.security.service.AuthenticationFacade;
import hu.codeblurb.backend.service.dto.PaymentResult;
import hu.codeblurb.backend.service.mapper.Mapper;
import lombok.AllArgsConstructor;
import org.springframework.data.domain.Example;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@AllArgsConstructor
public class PaymentService {

    private final PaymentRepository paymentRepository;
    private final Mapper mapper;
    private final AuthenticationFacade authenticationFacade;
    private final CustomerService customerService;

    public void checkout() {

    }

    public List<PaymentResult> getPreviousPayments() {
        return authenticationFacade.getCurrentCustomerId()
                .map(customerService::getCustomerById)
                .map(it -> paymentRepository.findAll(Example.of(new Payment(null, it, null, null))))
                .map(mapper::mapPayments)
                .orElseThrow(() -> new InconsistentDatabaseException("Authenticated request does not have customer id!")); // should not happen
    }
}
