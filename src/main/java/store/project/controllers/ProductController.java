package store.project.controllers;

import lombok.RequiredArgsConstructor;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import store.project.models.Car;
import store.project.services.BrandService;
import store.project.services.CarService;
import store.project.services.UserService;
import store.project.util.FilterContainer;

import java.security.Principal;
import java.util.List;

@Controller
@RequiredArgsConstructor
public class ProductController {

    private final CarService carService;
    private final UserService userService;
    private final BrandService brandService;

    @GetMapping("/hello")
    public String hello() {

        return "hello";
    }

    @GetMapping("/products")
    public String products(@RequestParam(value = "page", required = false, defaultValue = "0") int page,
                           @RequestParam(value = "size", required = false, defaultValue = "8") int size,
                           Model model, Principal principal,
                           @RequestParam(name = "brand_name", required = false, defaultValue = "") List<String> brandName,
                           @RequestParam(name = "min_speed", required = false, defaultValue = "0") Double minSpeed,
                           @RequestParam(name = "max_speed", required = false, defaultValue = "0") Double maxSpeed,
                           @RequestParam(name = "min_price", required = false, defaultValue = "0") Double minPrice,
                           @RequestParam(name = "max_price", required = false, defaultValue = "0") Double maxPrice,
                           @RequestParam(name = "min_power", required = false, defaultValue = "0") Double minPower,
                           @RequestParam(name = "max_power", required = false, defaultValue = "0") Double maxPower) {

        FilterContainer filterContainer = new FilterContainer(brandName, minSpeed, maxSpeed, maxPrice, minPrice, maxPower, minPower);
        List<Car> cars = carService.carListForTotal(filterContainer);
        model.addAttribute("brands", brandService.brandList());
        model.addAttribute("filter", filterContainer);
        model.addAttribute("userDetails", userService.getUserByPrincipal(principal));
        model.addAttribute("cars", carService.carList(PageRequest.of(page,size),filterContainer));
        model.addAttribute("cur_page", page);
        model.addAttribute("total", cars.size());
        return "products";
    }


    @GetMapping("/product_page/{car_id}")
    public String productPage(@PathVariable String car_id, Model model, Principal principal) {

        model.addAttribute("userDetails", userService.getUserByPrincipal(principal));
        model.addAttribute("car", carService.getCarById(Long.parseLong(car_id)));
        return "product_page";
    }

//    @PostMapping("/products/filter")
//    public String filterProducts(Model model, Principal principal,
//                                 @RequestParam(value = "page", required = false, defaultValue = "0") int page,
//                                 @RequestParam(value = "size", required = false, defaultValue = "8") int size,
//                                 @RequestParam(name = "brand_name", required = false,defaultValue = "") String brandName,
//                                 @RequestParam(name = "min_speed", required = false,defaultValue = "0") Double minSpeed,
//                                 @RequestParam(name = "max_speed", required = false,defaultValue = "0") Double maxSpeed,
//                                 @RequestParam(name = "min_price", required = false,defaultValue = "0") Double minPrice,
//                                 @RequestParam(name = "max_price", required = false,defaultValue = "0") Double maxPrice,
//                                 @RequestParam(name = "min_power", required = false,defaultValue = "0") Double minPower,
//                                 @RequestParam(name = "max_power", required = false,defaultValue = "0") Double maxPower) {
//
//        FilterContainer filterContainer = new FilterContainer(brandName, minSpeed, maxSpeed, maxPrice, minPrice, maxPower, minPower);
//        model.addAttribute("filter", filterContainer);
//        model.addAttribute("userDetails", userService.getUserByPrincipal(principal));
//        model.addAttribute("cars", carService.carList(PageRequest.of(page, size)));
//        model.addAttribute("cur_page", page);
//        model.addAttribute("total", carService.totalElements(PageRequest.of(page, size)));
//        return "products";
//    }


}
