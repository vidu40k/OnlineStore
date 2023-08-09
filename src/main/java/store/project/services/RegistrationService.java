package store.project.services;

import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import store.project.models.User;
import store.project.repositories.UserRepository;

@Service
@RequiredArgsConstructor
public class RegistrationService {

    private final UserRepository userRepository;


    @Transactional
    public void register(User user) {

        userRepository.save(user);
    }
}
