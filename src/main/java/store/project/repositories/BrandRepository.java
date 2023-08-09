package store.project.repositories;

import org.springframework.data.jpa.repository.JpaRepository;
import store.project.models.Brand;

import java.util.List;
import java.util.Optional;

public interface BrandRepository extends JpaRepository<Brand,Long> {
     Optional<Brand> findBrandByName(String string);
}
