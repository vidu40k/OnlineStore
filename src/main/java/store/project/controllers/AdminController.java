package store.project.controllers;


import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import store.project.services.PeopleService;
import store.project.services.UserService;

import java.security.Principal;
import java.util.List;

@Controller
@RequestMapping("/admin")
@RequiredArgsConstructor
public class AdminController {

    private final PeopleService peopleService;
    private final UserService userService;

    @GetMapping("/users")
    public String showUsers(Model model, Principal principal) {

        model.addAttribute("userDetails", userService.getUserByPrincipal(principal));
        model.addAttribute("users", peopleService.getUsersList());
        return "admin_view";
    }

    @PostMapping("/user/edit")
    public String editUser(@RequestParam("roles") List<String> roles,
                           @RequestParam("name") String name,
                           @RequestParam("address") String address,
                           @RequestParam("phone")String phoneNumber,
                           @RequestParam("email") String email,
                           @RequestParam("user_id") String userId) {

        userService.editUser(userId,roles,name,email,address,phoneNumber);
        return "redirect:/admin/users";
    }


    @PostMapping("/user/delete/{user_id}")
    public String deleteUser(@PathVariable String user_id){

        userService.deleteUser(Long.valueOf(user_id));
        return "redirect:/admin/users";
    }

}
