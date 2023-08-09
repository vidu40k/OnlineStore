package store.project.services;


import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import store.project.models.Basket;
import store.project.models.Orders;
import store.project.models.Role;
import store.project.models.User;
import store.project.repositories.UserRepository;
import store.project.security.PersonDetails;

import java.security.Principal;
import java.util.*;


@Service
@Slf4j
@RequiredArgsConstructor
public class UserService {

    private final UserRepository userRepository;
    private final PasswordEncoder passwordEncoder;
    private final PersonDetailsService personDetailsService;

    public User createUser(User user) {

        User person = new User();
        person.setMoney(0);
        person.setEmail(user.getEmail());
        person.setId(user.getId());
        person.setOrders(new ArrayList<>());
        person.setName(user.getName());
        person.setAddress(user.getAddress());
        person.setPhone(user.getPhone());
        Set<Role> roles = new HashSet<>();
        roles.add(Role.ROLE_USER);
        person.setRoles(roles);
        person.setBasket(new Basket());
        person.setPassword(passwordEncoder.encode(user.getPassword()));

        return person;
    }

    public User getCurrentUser() {
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        if (!authentication.isAuthenticated()) {
            return null;
        }

        PersonDetails personDetails = (PersonDetails) authentication.getPrincipal();

        return personDetails.getUser();
    }

    public void editUser(String user_id, List<String> roles, String name, String email, String address, String phoneNumber) {

        User user = userRepository.getById(Long.valueOf(user_id));

        Set<Role> roles1 = new HashSet<>();
        for (String role : roles) {
            role = role.toUpperCase();
            Role role1 = Role.valueOf("ROLE_" + role);
            roles1.add(role1);
        }

        user.setName(name);
        user.setEmail(email);
        user.setRoles(roles1);
        user.setPhone(phoneNumber);
        user.setAddress(address);

        userRepository.save(user);
    }

    public void deleteUser(Long userId) {

        if (getCurrentUser().getId() == userId) {
            return;
        }
        userRepository.deleteById(userId);
    }

    public User getUserByPrincipal(Principal principal) {
        if (principal == null) return null;
        return userRepository.findByEmail(principal.getName()).get();
    }

    public void addMoney(User currentUser, double money) {

        currentUser.setMoney(currentUser.getMoney() + money);
        userRepository.save(currentUser);
    }

    public void saveUser(User user) {
        userRepository.save(user);
    }
}
