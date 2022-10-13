package hu.codeblurb.backend.service;

import hu.codeblurb.backend.domain.Customer;
import hu.codeblurb.backend.domain.content.Content;
import hu.codeblurb.backend.repository.CustomerRepository;
import hu.codeblurb.backend.service.exception.EntityNotFoundException;
import lombok.AllArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.Optional;

@Service
@AllArgsConstructor
public class CustomerService {
    private final CustomerRepository customerRepository;

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
}
