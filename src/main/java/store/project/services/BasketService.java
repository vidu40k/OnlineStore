package store.project.services;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;


import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import store.project.models.Basket;
import store.project.models.BasketCar;
import store.project.models.Car;
import store.project.repositories.BasketCarRepository;
import store.project.repositories.BasketRepository;


import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.concurrent.atomic.AtomicReference;
import java.util.stream.Collectors;


@Service
@Slf4j
@RequiredArgsConstructor
public class BasketService {

    private final BasketRepository basketRepository;
    private final BasketCarRepository basketCarRepository;
    private final UserService userService;

    public void add(Long usersBasketId, Car car) {

        Basket basket = getBasket(usersBasketId);
        List<BasketCar> cars = basket.getBasketCars();

        if (!hasCar(cars, car)) {
            cars.add(createBasketCar(usersBasketId, car));
            basket.setBasketCars(cars);

        } else {
            for (BasketCar basketCar : cars) {

                if (basketCar.getCar().getId() == car.getId()) {
                    basketCar.setQuantity(basketCar.getQuantity() + 1);
                }

            }
        }
        basketRepository.save(basket);
        updateTotalPrice(basket.getId());

    }


    private BasketCar createBasketCar(Long usersBasketId, Car car) {

        Basket basket = getBasket(usersBasketId);
        BasketCar basketCar = new BasketCar(basket, car, 1);
        List<BasketCar> basketCars = car.getBaskets();
        basketCars.add(basketCar);
        car.setBaskets(basketCars);
        basketCarRepository.save(basketCar);
        return basketCar;
    }


    public List<Car> getCars(Long usersBasketId) {
        return getBasket(usersBasketId).getBasketCars().stream().map(BasketCar::getCar).collect(Collectors.toList());
    }

    public List<BasketCar> getBasketCars(Long usersBasketId) {
        return getBasket(usersBasketId).getBasketCars();
    }

    public BasketCar getBasketCarById(Long basketCarId) {
        return basketCarRepository.getById(basketCarId);
    }

    public void setCars(Long userBasketId, List<Car> cars) {
        Basket basket = getBasket(userBasketId);
        List<BasketCar> basketCars = new ArrayList<>(cars.size());
        for (Car car : cars) {
            boolean hasCarFlag = false;
            for (BasketCar basketCar : basketCars) {
                if (basketCar.getCar().getId() == car.getId()) {
                    basketCar.setQuantity(basketCar.getQuantity() + 1);
                    hasCarFlag = true;
                    break;
                }
            }
            if (!hasCarFlag) {
                basketCars.add(createBasketCar(userBasketId, car));
            }
        }
        basket.setBasketCars(basketCars);
        basketRepository.save(basket);
    }

    private boolean hasCar(List<BasketCar> basketCars, Car car) {

        for (BasketCar basketCar : basketCars) {
            if (basketCar.getCar().getId() == car.getId()) {
                return true;
            }
        }
        return false;
    }

    private void updateTotalPrice(Long cartId) {
        Basket basket = basketRepository.getById(cartId);
        AtomicReference<Double> newTotalPrice = new AtomicReference<>((double) 0);
        basket.getBasketCars().stream().map(basketCar -> (basketCar.getCar().getPrice() * basketCar.getQuantity())).forEach(aDouble -> newTotalPrice.updateAndGet(v -> (v + aDouble)));
        basket.setTotalPrice(newTotalPrice.get());
        basketRepository.save(basket);
    }

    public void delete(Basket basket, BasketCar basketCar) {

        if (basketCar.getQuantity() == 1)
            basketCarRepository.delete(basketCar);
        else {
            basketCar.setQuantity(basketCar.getQuantity() - 1);
            basketCarRepository.save(basketCar);
        }
        updateTotalPrice(basket.getId());
    }


    @Transactional
    public void deleteAll() {
        Basket basket = userService.getCurrentUser().getBasket();
        basket.setBasketCars(Collections.emptyList());
        basketRepository.save(basket);
        basketCarRepository.deleteAllByBasket_Id(basket.getId());
        updateTotalPrice(basket.getId());
    }

    public Basket getBasket(Long id) {
        return basketRepository.getById(id);
    }

    public void deleteAllCar(Basket basket, BasketCar basketCar) {
        basketCarRepository.delete(basketCar);
        updateTotalPrice(basket.getId());
    }
}
