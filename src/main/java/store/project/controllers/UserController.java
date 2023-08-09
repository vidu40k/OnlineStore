package store.project.controllers;

import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import store.project.services.UserService;

import javax.persistence.ManyToOne;
import java.security.Principal;

@Controller
@RequestMapping("/user")
@RequiredArgsConstructor
public class UserController {

    private final UserService userService;

    @GetMapping("/add/balance")
    public String showAddBalanceView(Principal principal, Model model) {

        model.addAttribute("userDetails", userService.getUserByPrincipal(principal));
        return "bank_card";
    }


    @PostMapping("/add/balance")
    public String AddBalance(@RequestParam("money") double money) {

        userService.addMoney(userService.getCurrentUser(),money);
        return "redirect:/products";
    }


}
