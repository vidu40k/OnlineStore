package store.project.repositories;

import org.springframework.data.jpa.repository.JpaRepository;
import store.project.models.Car_info;

public interface CarInfoRepository extends JpaRepository<Car_info,Long> {

}
