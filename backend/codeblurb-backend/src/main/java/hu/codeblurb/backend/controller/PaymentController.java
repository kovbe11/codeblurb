package hu.codeblurb.backend.controller;

import hu.codeblurb.backend.controller.dto.payments.PreviousPaymentsResponse;
import hu.codeblurb.backend.controller.mapper.ContentMapper;
import hu.codeblurb.backend.service.PaymentService;
import lombok.AllArgsConstructor;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/payments")
@AllArgsConstructor
public class PaymentController {

    private final PaymentService paymentService;
    private final ContentMapper mapper;

    @PostMapping("/checkout")
    public void pay() {
        paymentService.checkout();
        //TODO
    }

    @GetMapping
    public PreviousPaymentsResponse getPreviousPayments() {
        final var payments = paymentService.getPreviousPayments();
        return new PreviousPaymentsResponse(mapper.mapPayments(payments));
    }

}
