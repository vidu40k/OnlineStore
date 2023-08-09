package store.project.services;

import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import store.project.models.*;

import store.project.repositories.OrderRepository;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Optional;
import java.util.concurrent.atomic.AtomicReference;


@Service
@RequiredArgsConstructor
public class OrderService {

    private final OrderRepository orderRepository;
    private final BasketService basketService;
    private final UserService userService;
    private final OrderCarService orderCarService;


    public void changeOrderStatus(Long orderId) {

        Orders order = orderRepository.getById(orderId);
        if (order.getOrderStatus().equals("Не обработан"))
            order.setOrderStatus("Обработан");
        else order.setOrderStatus("Не обработан");

        orderRepository.save(order);
    }

    public void doneStatus(Long orderId) {
        Orders order = orderRepository.getById(orderId);
        order.setOrderStatus("Одобрен");
        orderRepository.save(order);
    }

    public void undoneStatus(Long orderId) {
        Orders order = orderRepository.getById(orderId);
        order.setOrderStatus("Не одобрен");
        orderRepository.save(order);
    }

    private double getTotalPrice(Long cartId) {
        Basket basket = basketService.getBasket(cartId);
        AtomicReference<Double> total = new AtomicReference<>((double) 0);
        basket.getBasketCars().stream().map(basketCar -> (basketCar.getQuantity() * basketCar.getCar().getPrice())).forEach(aDouble -> total.updateAndGet(v -> (double) (v + aDouble)));

        return total.get();
    }

    public Optional<Long> addOrder() {
        User user = userService.getCurrentUser();
        Basket cart = user.getBasket();
        Double userMoney = user.getMoney();
        Double cartTotalPrice = getTotalPrice(cart.getId());
        if (userMoney > cartTotalPrice) {
            user.setMoney(userMoney - cartTotalPrice);
            Orders order = createOrder(cart.getId());
            orderRepository.save(order);
            userService.saveUser(user);
            return Optional.ofNullable(order.getId());
        }
        return Optional.empty();

    }

    private void updateTotalPrice(Long usersBasketId, Orders order) {
        order.setTotalPrice(basketService.getBasket(usersBasketId).getTotalPrice());
    }

    private Orders createOrder(Long userBasketId) {

        Orders order = new Orders();
        order.setOrderStatus("Не обработан");
        order.setOrderDate(new SimpleDateFormat("dd-MM-yyyy").format(new Date()));
        order.setCustomer(userService.getCurrentUser());
        updateTotalPrice(userBasketId, order);
        List<BasketCar> basketCars = new ArrayList<>(basketService.getBasketCars(userBasketId));
        List<OrderCar> orderCars = new ArrayList<>(orderCarService.createOrderCarList(basketCars, order));
        order.setCars(orderCars);
//        orderCarService.setOrderCar(orderCars);

        return order;
    }

    public List<Orders> getOrderList() {
        return orderRepository.findAll();
    }

    public void deleteOrder(Long orderId) {
        orderRepository.deleteById(orderId);
    }

    public Orders getOrderById(Long order_id) {
        return orderRepository.getById(order_id);
    }
}
