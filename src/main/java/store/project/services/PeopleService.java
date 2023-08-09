package store.project.services;


import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import store.project.models.User;
import store.project.repositories.UserRepository;

import java.util.List;
import java.util.Optional;

@Service
@RequiredArgsConstructor
public class PeopleService {

    private final UserRepository userRepository;

    public Optional<User> loadUserByUsername(String username) {
        return userRepository.findByEmail(username);
    }

    public List<User> getUsersList() {
        return userRepository.findAll();
    }

    public User getUserById(Long id) {
        return userRepository.getById(id);
    }

}
