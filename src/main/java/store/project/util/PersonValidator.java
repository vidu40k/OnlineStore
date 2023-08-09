package store.project.util;

import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.Validator;
import store.project.models.User;
import store.project.services.PeopleService;

@Component
@RequiredArgsConstructor
public class PersonValidator implements Validator {

    private final PeopleService peopleService;

    @Override
    public boolean supports(Class<?> aClass) {
        return User.class.equals(aClass);
    }

    @Override
    public void validate(Object o, Errors errors) {

        User user = (User) o;
        if (peopleService.loadUserByUsername(user.getEmail()).isEmpty())
            return;
        errors.rejectValue("email", "", "Человек с таким именем уже существует");
    }
}
