package store.project.util;

import lombok.AllArgsConstructor;
import lombok.NoArgsConstructor;
import lombok.RequiredArgsConstructor;
import org.springframework.data.domain.PageRequest;
import store.project.services.CarService;

import java.util.ArrayList;
import java.util.List;


@NoArgsConstructor
@AllArgsConstructor
public class FilterContainer {


    private List<String> brandName;

    private double minSpeed;

    private double maxSpeed;
    private double maxPrice;

    private double minPrice;
    private double maxPower;

    private double minPower;

//    {
//        maxPrice = Double.MAX_VALUE;
//        maxPower= Double.MAX_VALUE;
//        maxSpeed= Double.MAX_VALUE;
//        minPower = 0;
//        minPrice = 0;
//        minSpeed = 0;
//        brandName = new ArrayList<>();
//    }


    public boolean hasSpeedFilter() {
        return maxSpeed > 0;
    }

    public boolean hasPowerFilter() {
        return maxPower > 0;
    }

    public boolean hasPriceFilter() {
        return maxPrice > 0;
    }


    public double getMinSpeed() {
        return minSpeed;
    }

    public void setMinSpeed(double minSpeed) {
        this.minSpeed = minSpeed;
    }

    public double getMaxSpeed() {
        return maxSpeed;
    }

    public void setMaxSpeed(double maxSpeed) {
        this.maxSpeed = maxSpeed;
    }

    public double getMaxPrice() {
        return maxPrice;
    }

    public void setMaxPrice(double maxPrice) {
        this.maxPrice = maxPrice;
    }

    public double getMinPrice() {
        return minPrice;
    }

    public void setMinPrice(double minPrice) {
        this.minPrice = minPrice;
    }

    public double getMaxPower() {
        return maxPower;
    }

    public void setMaxPower(double maxPower) {
        this.maxPower = maxPower;
    }

    public double getMinPower() {
        return minPower;
    }

    public void setMinPower(double minPower) {
        this.minPower = minPower;
    }

    public List<String> getBrandName() {
        return brandName;
    }

    public void setBrandName(List<String> brandName) {
        this.brandName = brandName;
    }

    public boolean hasBrandFilter() {
        return !brandName.isEmpty();
    }

    public boolean anyFilter() {
        if (hasSpeedFilter() || hasPowerFilter() || hasBrandFilter() || hasPriceFilter()) {
            if (maxPrice == 0) {
                maxPrice = 10000;
            }
            if (maxSpeed == 0) {
                maxSpeed = 10000;
            }
            if (maxPower == 0) {
                maxPower = 10000;
            }
            return true;
        } else return false;
    }
}
