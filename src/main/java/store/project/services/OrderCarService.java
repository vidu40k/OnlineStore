package store.project.services;


import lombok.RequiredArgsConstructor;

import org.springframework.stereotype.Service;
import store.project.models.BasketCar;
import store.project.models.Car;
import store.project.models.OrderCar;
import store.project.models.Orders;
import store.project.repositories.OrderCarRepository;

import java.util.ArrayList;
import java.util.List;

@Service
@RequiredArgsConstructor
public class OrderCarService {

    private final OrderCarRepository orderCarRepository;

    public List<OrderCar> createOrderCarList(List<BasketCar> cars, Orders order){
        List<OrderCar> orderCars = new ArrayList<>();

        for (BasketCar car : cars) {
            orderCars.add(new OrderCar(order, car.getCar(), car.getQuantity()));
        }
        return orderCars;
    }

    public void setOrderCar(List<OrderCar> orderCars) {
        orderCarRepository.saveAll(orderCars);
    }

    public List<OrderCar> getOrderCars(Orders order) {
        return orderCarRepository.findOrderCarByOrder(order);
    }

}
