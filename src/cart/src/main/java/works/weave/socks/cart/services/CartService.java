package works.weave.socks.cart.services;

import works.weave.socks.cart.repositories.CartEntity;
import works.weave.socks.cart.repositories.ItemEntity;

import java.util.List;
import java.util.Optional;

public interface CartService {
    CartEntity get(String customerId);

    void delete(String customerId);

    CartEntity merge(String sessionId, String customerId);

    ItemEntity add(String customerId, String itemId, int quantity, float unitPrice);

    List<? extends ItemEntity> items(String customerId);

    Optional<? extends ItemEntity> item(String customerId, String itemId);

    void deleteItem(String customerId, String itemId);

    Optional<? extends ItemEntity> update(String customerId, String itemId, int quantity, float unitPrice);
}