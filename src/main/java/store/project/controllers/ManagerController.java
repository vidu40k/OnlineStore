package store.project.controllers;


import lombok.RequiredArgsConstructor;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.data.domain.PageRequest;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import store.project.models.Car;
import store.project.models.Car_info;
import store.project.models.Specification;
import store.project.services.CarService;
import store.project.services.OrderService;
import store.project.services.UserService;

import javax.swing.plaf.PanelUI;
import javax.validation.Valid;
import java.io.IOException;
import java.security.Principal;

@Controller
@RequestMapping("/manager")
@RequiredArgsConstructor
public class ManagerController {

    @Value("${upload.path}")
    private String path;

    private final UserService userService;
    private final OrderService orderService;
    private final CarService carService;

    @GetMapping("/view")
    public String mainManagerPage(Model model, Principal principal) {

        model.addAttribute("userDetails", userService.getUserByPrincipal(principal));
        model.addAttribute("orders", orderService.getOrderList());
        return "manager_view";
    }

    @GetMapping("/product/add")
    public String addProduct(Model model, Principal principal) {

        model.addAttribute("userDetails", userService.getUserByPrincipal(principal));
        return "add_product_page";
    }

    @PostMapping("/product/delete/{car_id}")
    public String deleteCar(@PathVariable String car_id) {

        carService.deleteCar(Long.valueOf(car_id));
        return "redirect:/manager/products";
    }

    @PostMapping("/product/edit/{car_id}")
    public String editCar(@PathVariable String car_id, Model model, Principal principal) {

        model.addAttribute("userDetails", userService.getUserByPrincipal(principal));
        model.addAttribute("car", carService.getCarById(Long.parseLong(car_id)));
        return "manager_edit_product";
    }

    @PostMapping("/product/update")
    public String updateProduct(
            @RequestParam("brand_name")
            String brandName,
            @RequestParam("type_name")
            String typeName,
            @RequestParam("car_id")
            String carId,
            Car car, BindingResult bindingResult,
            Specification specification,
            Car_info carInfo) throws IOException {

        if (bindingResult.hasErrors()) {
            return "manager_edit_product";
        }

        carService.updateCar(carId, car, typeName, brandName, specification, carInfo);
        return "redirect:/manager/view";
    }

    @PostMapping("/order/status/done/{order_id}")
    public String doneStatus(@PathVariable String order_id) {

        orderService.doneStatus(Long.valueOf(order_id));
        return "redirect:/manager/view";
    }

    @PostMapping("/order/status/undone/{order_id}")
    public String undoneStatus(@PathVariable String order_id) {

        orderService.undoneStatus(Long.valueOf(order_id));
        return "redirect:/manager/view";
    }

    @PostMapping("/order/delete/{order_id}")
    public String deleteOrder(@PathVariable String order_id) {

        orderService.deleteOrder(Long.valueOf(order_id));
        return "redirect:/manager/view";
    }

    @PostMapping("/order/change/{order_id}")
    public String changeOrderStatus(@PathVariable String order_id) {

        orderService.changeOrderStatus(Long.parseLong(order_id));
        return "redirect:/manager/view";
    }


    @PostMapping("/product/create")
    public String createProduct(@RequestParam("image") MultipartFile file,
                                @RequestParam("brand_name") String brandName,
                                @RequestParam("type_name") String typeName,
                                Car car, Specification specification,
                                Car_info carInfo) throws IOException {

        carService.createNewCar(file, car, typeName, brandName, specification, carInfo);
        return "redirect:/manager/view";
    }

    @GetMapping("/products")
    public String products(@RequestParam(value = "page", required = false, defaultValue = "0") int page,
                           @RequestParam(value = "size", required = false, defaultValue = "6") int size,
                           Model model, Principal principal) {

        model.addAttribute("userDetails", userService.getUserByPrincipal(principal));
        model.addAttribute("cars", carService.carList());
        return "manager_product_table";
    }

}
