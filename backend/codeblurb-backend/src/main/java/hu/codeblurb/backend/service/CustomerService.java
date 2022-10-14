package hu.codeblurb.backend.service;

import hu.codeblurb.backend.domain.Customer;
import hu.codeblurb.backend.domain.content.Content;
import hu.codeblurb.backend.exception.InconsistentDatabaseException;
import hu.codeblurb.backend.repository.CustomerRepository;
import hu.codeblurb.backend.security.service.AuthenticationFacade;
import hu.codeblurb.backend.service.exception.EntityNotFoundException;
import lombok.AllArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.Optional;

@Service
@AllArgsConstructor
public class CustomerService {
    private final CustomerRepository customerRepository;
    private final AuthenticationFacade authenticationFacade;

    //CACHE
    public Customer getCustomerById(Integer id) {
        return customerRepository.findById(id).orElseThrow(() -> new EntityNotFoundException(Customer.class, id));
    }

    public boolean hasCustomerPayedForContent(Integer customerId, Content content) {
        final var customer = getCustomerById(customerId);
        return customerRepository.hasCustomerPayedForContent(customer, content);
    }


    public void createCustomer(String username, String encodedPassword) {
        final var customer = Customer.builder()
                .username(username)
                .password(encodedPassword)
                .build();
        customerRepository.save(customer);
    }

    public Optional<Customer> findCustomerByUsername(String username) {
        return customerRepository.findByUsername(username);
    }

    public Customer getCurrentCustomer() {
        return authenticationFacade.getCurrentCustomerId()
                .map(this::getCustomerById)
                .orElseThrow(() -> new InconsistentDatabaseException("Authenticated request does not have customer id!")); // should not happen
    }
}
