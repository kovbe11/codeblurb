package hu.codeblurb.backend.service;

import hu.codeblurb.backend.domain.shop.Payment;
import hu.codeblurb.backend.domain.shop.ShoppingItem;
import hu.codeblurb.backend.repository.PaymentRepository;
import hu.codeblurb.backend.service.dto.PaymentResult;
import hu.codeblurb.backend.service.mapper.Mapper;
import lombok.AllArgsConstructor;
import org.springframework.data.domain.Example;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.stream.Collectors;

@Service
@AllArgsConstructor
public class PaymentService {

    private final PaymentRepository paymentRepository;
    private final Mapper mapper;
    private final CustomerService customerService;
    private final ShoppingCartService shoppingCartService;

    public void checkout() {
        final var shoppingCart = shoppingCartService.getCurrentShoppingCart();
        final var contentBundlesBought = shoppingCart.getItems().stream()
                .map(ShoppingItem::getContentBundle)
                .collect(Collectors.toSet());
        final var payment = new Payment(null, shoppingCart.getCustomer(), contentBundlesBought, 0.0);
        //if payment goes through
        paymentRepository.save(payment);
        shoppingCartService.removeShoppingCart();
    }

    public List<PaymentResult> getPreviousPayments() {
        final var customer = customerService.getCurrentCustomer();
        final var payments = paymentRepository.findAll(Example.of(new Payment(null, customer, null, null)));
        return mapper.mapPayments(payments);
    }
}
