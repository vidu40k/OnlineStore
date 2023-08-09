package store.project.services;


import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import store.project.models.*;
import store.project.repositories.*;
import store.project.util.FilterContainer;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.*;
import java.util.stream.Collectors;


@Service
@RequiredArgsConstructor
public class CarService {

    @Value("${upload.path}")
    private String upPath;


    private final CarRepository carRepository;
    private final BrandRepository brandRepository;
    private final TypeRepository typeRepository;
    private final SpecificationsRepository specificationsRepository;
    private final CarInfoRepository carInfoRepository;

    public List<Car> carList() {
        return carRepository.findAll();
    }

    public List<Car> carList(PageRequest pageRequest, FilterContainer filterContainer) {

//        boolean anyFilter = false;
//        Set<Car> uniqueCars = new HashSet<>();
//        if (filterContainer.hasPriceFilter()) {
//            List<Car> carsWithPriceFilter = carRepository.findAllByPriceBetween(filterContainer.getMinPrice(), filterContainer.getMaxPrice());
//            uniqueCars.addAll(carsWithPriceFilter);
//            anyFilter = true;
//        }
//        if (filterContainer.hasPowerFilter()) {
//            List<Specification> specWithPowerFilter = specificationsRepository.findAllByPowerBetween(filterContainer.getMinPower(), filterContainer.getMaxPower());
//            List<Car> carsWithPowerFilter = specWithPowerFilter.stream().map(Specification::getCarInfo).map(Car_info::getCar).toList();
//            uniqueCars.addAll(carsWithPowerFilter);
//            anyFilter = true;
//        }
//        if (filterContainer.hasSpeedFilter()) {
//            List<Specification> specWithSpeedFilter = specificationsRepository.findAllByMaxSpeedBetween(filterContainer.getMinSpeed(), filterContainer.getMaxSpeed());
//            List<Car> carsWithSpeedFilter = specWithSpeedFilter.stream().map(Specification::getCarInfo).map(Car_info::getCar).toList();
//            uniqueCars.addAll(carsWithSpeedFilter);
//            anyFilter = true;
//        }
//        if (filterContainer.hasBrandFilter()) {
//
//            List<Brand> brandList =new ArrayList<>();
//            for (String brand : filterContainer.getBrandName()) {
//                brandList.add(brandRepository.findBrandByName(brand).get());
//            }
//
//            List<Car> carsWithBrandFilter = brandList.stream().map(Brand::getCars)
//
//        }
//        return new ArrayList<>(uniqueCars);

        if (filterContainer.anyFilter()) {
            return carRepository.findAllByPriceBetweenAndMaxSpeedBetweenAndPowerBetweenAndAndBrandNameIn(filterContainer.getMinPrice(), filterContainer.getMaxPrice(),
                    filterContainer.getMinSpeed(), filterContainer.getMaxSpeed(), filterContainer.getMinPower(), filterContainer.getMaxPower(), filterContainer.getBrandName(), pageRequest).getContent();
        }
        return carRepository.findAll(pageRequest).getContent();
    }


    public Long totalElements(PageRequest pageRequest) {
        return carRepository.findAll(pageRequest).getTotalElements();
    }


    public Car getCarById(long id) {
        return carRepository.findById(id).orElse(null);
    }

    private void addImg(MultipartFile multipartFile, Car car) throws IOException {

//        File uploadFile = new File(upPath);
//        if (!uploadFile.exists()) {
//            uploadFile.mkdir();
//        }
//        String uuidFile = UUID.randomUUID().toString();
//        String resultFileName = uuidFile + "." + file.getOriginalFilename();
//        file.transferTo(new File(uploadFile + "/" + resultFileName));

        File convertFile = new File(upPath + "/" + multipartFile.getOriginalFilename());

        FileOutputStream fileOutputStream = new FileOutputStream(convertFile);

        fileOutputStream.write(multipartFile.getBytes());
        fileOutputStream.close();

        car.setImageUrl(multipartFile.getOriginalFilename());
    }

    public void createNewCar(MultipartFile file, Car car, String typeName, String brandName, Specification specification, Car_info carInfo) throws IOException {

        Type finalType;
        Optional<Type> type = typeRepository.findTypeByName(typeName);
        if (type.isEmpty()) {
            finalType = new Type(typeName);
            typeRepository.save(finalType);
        } else finalType = type.get();

        Brand finalBrand;
        Optional<Brand> brand = brandRepository.findBrandByName(brandName);
        if (brand.isEmpty()) {
            finalBrand = new Brand(brandName);
            brandRepository.save(finalBrand);
        } else finalBrand = brand.get();

        addImg(file, car);

        carInfo.setSpecification(specification);
        specification.setCarInfo(carInfo);

        car.setCarInfo(carInfo);
        carInfo.setCar(car);

        specification.setType(finalType);
        List<Specification> specifications = finalType.getSpecifications();
        specifications.add(specification);
        finalType.setSpecifications(specifications);

        car.setBrand(finalBrand);
        List<Car> cars = finalBrand.getCars();
        cars.add(car);
        finalBrand.setCars(cars);

        car.setType(finalType);
        List<Car> cars1 = finalType.getCars();
        cars.add(car);
        finalType.setCars(cars1);

        specificationsRepository.save(specification);
        carInfoRepository.save(carInfo);
        carRepository.save(car);


    }

    public void deleteCar(Long carId) {
        carRepository.deleteById(carId);
    }

    public void updateCar(String carId, Car newDataCar,
                          String typeName, String brandName,
                          Specification newDataSpecification, Car_info newDataCarInfo) throws IOException {

        Car realCar = carRepository.getById(Long.valueOf(carId));

        realCar.setName(newDataCar.getName());
        realCar.setPrice(newDataCar.getPrice());

        Optional<Type> type = typeRepository.findTypeByName(typeName);
        if (type.isEmpty()) {
            Type type1 = new Type(typeName);
            realCar.setType(type1);
            type1.setCars(Collections.singletonList(realCar));
            typeRepository.save(type1);
        } else realCar.setType(type.get());

        Optional<Brand> brand = brandRepository.findBrandByName(brandName);
        if (brand.isEmpty()) {
            Brand brand1 = new Brand(brandName);
            realCar.setBrand(brand1);
            brand1.setCars(Collections.singletonList(realCar));
            brandRepository.save(brand1);
        } else realCar.setBrand(brand.get());

        Car_info car_info = realCar.getCarInfo();
        car_info.setDescription(newDataCarInfo.getDescription());

        Specification specification = car_info.getSpecification();
        specification.setLength(newDataSpecification.getLength());
        specification.setWeight(newDataSpecification.getWeight());
        specification.setWidth(newDataSpecification.getWidth());
        specification.setMaxSpeed(newDataSpecification.getMaxSpeed());
        specification.setPower(newDataSpecification.getPower());

//        specificationsRepository.save(newDataSpecification);
//        carInfoRepository.save(newDataCarInfo);
        carRepository.save(realCar);
    }


    public List<Car> carListForTotal(FilterContainer filterContainer) {


        if (filterContainer.anyFilter()) {
            return carRepository.findAllByPriceBetweenAndMaxSpeedBetweenAndPowerBetweenAndAndBrandNameIn(filterContainer.getMinPrice(), filterContainer.getMaxPrice(),
                    filterContainer.getMinSpeed(), filterContainer.getMaxSpeed(), filterContainer.getMinPower(), filterContainer.getMaxPower(), filterContainer.getBrandName());
        }
        return carRepository.findAll();


    }
}
