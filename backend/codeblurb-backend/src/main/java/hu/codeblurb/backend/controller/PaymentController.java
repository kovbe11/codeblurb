package hu.codeblurb.backend.controller;

import hu.codeblurb.backend.controller.dto.PreviousPaymentsResponse;
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

    @PostMapping("/checkout")
    public void pay() {
        paymentService.checkout();
        //TODO
    }

    @GetMapping
    public PreviousPaymentsResponse getPreviousPayments() {
        paymentService.getPreviousPayments();
        return null;
        //TODO
    }

}
