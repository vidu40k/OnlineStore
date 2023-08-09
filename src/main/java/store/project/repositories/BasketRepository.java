package store.project.repositories;

import org.springframework.data.jpa.repository.JpaRepository;
import store.project.models.Basket;

public interface BasketRepository extends JpaRepository<Basket, Long> {
}
