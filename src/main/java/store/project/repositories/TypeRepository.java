package store.project.repositories;

import org.springframework.data.jpa.repository.JpaRepository;
import store.project.models.Type;

import java.util.Optional;

public interface TypeRepository extends JpaRepository<Type,Long> {
    Optional<Type> findTypeByName(String name);
}
