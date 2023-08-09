package store.project.repositories;

import org.springframework.data.jpa.repository.JpaRepository;
import store.project.models.Basket;
import store.project.models.BasketCar;

public interface BasketCarRepository extends JpaRepository<BasketCar, Long> {
    void deleteAllByBasket_Id(Long id);
}
