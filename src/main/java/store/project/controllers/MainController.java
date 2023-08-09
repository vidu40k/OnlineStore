package store.project.controllers;

import lombok.AllArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import store.project.services.CarService;
import store.project.services.OrderService;
import store.project.services.UserService;

import java.security.Principal;

@Controller
@AllArgsConstructor
public class MainController {

    private final UserService userService;
    private final OrderService orderService;

//    @GetMapping("/check/to_pdf/{order_id}")
//    public String getCheck(Model model, @PathVariable Long order_id) {
//
//        model.addAttribute("order",orderService.getOrderById(order_id));
//        return "to_pdf";
//    }

    @GetMapping("/page")
    public String main() {

        System.out.println("hello");
        return "role_choice_page";
    }

    @GetMapping("/history")
    public String history(Model model, Principal principal) {

        model.addAttribute("userDetails", userService.getUserByPrincipal(principal));
        return "history";
    }

}
