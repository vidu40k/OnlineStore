package store.project.repositories;

import org.springframework.data.jpa.repository.JpaRepository;
import store.project.models.Specification;

import java.util.List;

public interface SpecificationsRepository extends JpaRepository<Specification, Long> {

    List<Specification> findAllByMaxSpeedBetween(double mixSpeed, double maxSpeed);
    List<Specification> findAllByPowerBetween(double minPower, double maxPower);
}
