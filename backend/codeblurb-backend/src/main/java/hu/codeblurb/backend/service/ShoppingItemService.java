package hu.codeblurb.backend.service;

import hu.codeblurb.backend.repository.ShoppingItemRepository;
import lombok.AllArgsConstructor;
import org.springframework.stereotype.Service;

@Service
@AllArgsConstructor
public class ShoppingItemService {

    private final ShoppingItemRepository shoppingItemRepository;
}
