package store.project.services;


import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import store.project.models.User;
import store.project.repositories.UserRepository;

@Service
@RequiredArgsConstructor
public class RegisterService {

    private final UserRepository userRepository;

    public void register(User user){
        userRepository.save(user);
    }
}
