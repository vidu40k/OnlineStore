package store.project.controllers;


import lombok.RequiredArgsConstructor;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import store.project.models.Basket;
import store.project.models.BasketCar;
import store.project.models.Car;
import store.project.services.BasketService;
import store.project.services.CarService;
import store.project.services.OrderService;
import store.project.services.UserService;

import java.security.Principal;
import java.util.Optional;

@Controller
@RequestMapping("/cart")
@RequiredArgsConstructor
public class CartController {

    private final BasketService basketService;
    private final CarService carService;
    private final UserService userService;
    private final OrderService orderService;

    @GetMapping("/checkout")
    public String cart(Model model, Principal principal) {

        model.addAttribute("userDetails", userService.getUserByPrincipal(principal));
        model.addAttribute("cars", basketService.getBasketCars(userService.getCurrentUser().getBasket().getId()));
        return "checkout";
    }

    @PostMapping("/add/{car_id}")
    public String addCar(@PathVariable String car_id) {

        Basket basket = userService.getCurrentUser().getBasket();
        Car car = carService.getCarById(Long.parseLong(car_id));
        basketService.add(basket.getId(), car);

        return "redirect:/cart/checkout";
    }

    @PostMapping("/delete/{basket_car_id}")
    public String deleteCar(@PathVariable String basket_car_id) {

        Basket basket = userService.getCurrentUser().getBasket();
        BasketCar basketCar = basketService.getBasketCarById(Long.valueOf(basket_car_id));

        basketService.delete(basket, basketCar);

        return "redirect:/cart/checkout";
    }

    @PostMapping("/delete/all/{basket_car_id}")
    public String deleteAllCar(@PathVariable String basket_car_id) {

        Basket basket = userService.getCurrentUser().getBasket();
        BasketCar basketCar = basketService.getBasketCarById(Long.valueOf(basket_car_id));

        basketService.deleteAllCar(basket, basketCar);

        return "redirect:/cart/checkout";
    }

//    @GetMapping("/clear")
//    public String clear() {
//
//        Long userCartId = userService.getCurrentUser().getBasket().getId();
//
//        basketService.deleteAll(userCartId);
//        return "redirect:/products";
//    }

    @GetMapping("/order")
    public String order(Model model,Principal principal) {

        System.out.println(userService.getCurrentUser().getBasket().getTotalPrice());
        Optional<Long> orderId = orderService.addOrder();
        if (orderId.isEmpty()) {
            model.addAttribute("error", "Недостаточно денег на балансе");
            model.addAttribute("userDetails", userService.getUserByPrincipal(principal));
            model.addAttribute("cars", basketService.getBasketCars(userService.getCurrentUser().getBasket().getId()));
            return "checkout";
        }
        basketService.deleteAll();
        model.addAttribute("order", orderService.getOrderById(orderId.get()));
        model.addAttribute("userDetails", userService.getUserByPrincipal(principal));
        return "to_pdf";
    }
}
