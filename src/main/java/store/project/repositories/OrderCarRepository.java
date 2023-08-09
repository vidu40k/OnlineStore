package store.project.repositories;


import org.springframework.data.jpa.repository.JpaRepository;
import store.project.models.OrderCar;
import store.project.models.Orders;

import java.util.List;

public interface OrderCarRepository extends JpaRepository<OrderCar,Long> {

    public List<OrderCar> findOrderCarByOrder(Orders order);
}
