package store.project.repositories;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Slice;
import org.springframework.data.jpa.repository.JpaRepository;
import store.project.models.Car;

import java.util.List;

public interface CarRepository extends JpaRepository<Car, Long> {
    List<Car> findAllByBrandName(String brand);

    Slice<Car> findAllByPriceBetween(double minPrice, double maxPrice, Pageable pageRequest);

    Page<Car> findAllByPriceBetweenAndMaxSpeedBetweenAndPowerBetweenAndAndBrandNameIn(double minPrice, double maxPrice,
                                                                                      double mixSpeed, double maxSpeed,
                                                                                      double minPower, double maxPower,
                                                                                      List<String> brands, Pageable pageRequest);


   List <Car> findAllByPriceBetweenAndMaxSpeedBetweenAndPowerBetweenAndAndBrandNameIn(double minPrice, double maxPrice,
                                                                            double mixSpeed, double maxSpeed,
                                                                            double minPower, double maxPower,
                                                                            List<String> brands);

//    List<Car> findAllByPriceBetweenAndAndCarInfoSpecificationPowerBetweenAndCarInfoSpecification_MaxSpeedBetween()

//    List<Car> findAllByPowerBetween(double minPower,double maxPower);
}
