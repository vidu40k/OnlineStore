package store.project.controllers;


import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import store.project.models.User;
import store.project.services.RegistrationService;
import store.project.services.UserService;
import store.project.util.PersonValidator;

import javax.validation.Valid;


@Controller
@RequestMapping("/auth")
@RequiredArgsConstructor
public class AuthController {

    private final PersonValidator personValidator;
    private final RegistrationService registrationService;
    private final UserService userService;

    @GetMapping("/login")
    public String loginPage(Model model, @RequestParam(name = "error", required = false) String errorMsg) {

        if (errorMsg != null) {
            model.addAttribute("errorMsg", "Неверный логин или пароль");
        }

        return "/authorization";
    }

    @GetMapping("/registration")
    public String registrationPage(@ModelAttribute("user") User user) {

        return "register";
    }

    @PostMapping("/registration")
    public String performRegistration(@ModelAttribute("user") @Valid User user, BindingResult bindingResult) {

        personValidator.validate(user, bindingResult);
        if (bindingResult.hasErrors())
            return "register";

        registrationService.register(userService.createUser(user));
        return "redirect:/auth/login";
    }
}
