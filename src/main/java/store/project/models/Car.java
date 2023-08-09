package store.project.models;


import lombok.AllArgsConstructor;
import lombok.NoArgsConstructor;
import org.hibernate.annotations.Cascade;


import javax.persistence.*;
import javax.validation.Valid;
import javax.validation.constraints.Min;
import javax.validation.constraints.NotEmpty;
import java.util.ArrayList;
import java.util.List;

@Entity
@Table(name = "car")
@NoArgsConstructor
@AllArgsConstructor
public class Car {

    @Id
    @Column(name = "id")
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private long id;

    @NotEmpty
    @Column(name = "name")
    private String name;

    @Min(value = 0,message = "Цена должна быть больше 0")
    @Column(name = "price")
    private double price;

    @Column(name = "image_url")
    private String imageUrl;

    @ManyToOne
    @JoinColumn(name = "brand_id", referencedColumnName = "id")
    @Cascade(org.hibernate.annotations.CascadeType.SAVE_UPDATE)
    private Brand brand;

    @ManyToOne
    @JoinColumn(name = "type_id", referencedColumnName = "id")
    @Cascade(org.hibernate.annotations.CascadeType.SAVE_UPDATE)
    private Type type;

    @OneToOne(mappedBy = "car")
    @Cascade(org.hibernate.annotations.CascadeType.ALL)
    private Car_info carInfo;

    @OneToMany(mappedBy = "car")
    @Cascade(org.hibernate.annotations.CascadeType.ALL)
    private List<BasketCar> baskets;

    @OneToMany(mappedBy = "car")
    @Cascade(org.hibernate.annotations.CascadeType.ALL)
    private List<OrderCar> orderCars;

    @Column(name = "power")
    private double power;

    @Column(name = "max_speed")
    private double maxSpeed;

    @Column(name = "brand_name")
    private String brandName;


    public Car(String name, double price, Brand brand, Type type) {
        this.name = name;
        this.price = price;
        this.brand = brand;
        this.type = type;
    }

    {
        baskets = new ArrayList<>();
        orderCars = new ArrayList<>();
    }

    public long getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public Brand getBrand() {
        return brand;
    }

    public void setBrand(Brand brand) {
        this.brand = brand;
    }

    public Type getType() {
        return type;
    }

    public void setType(Type type) {
        this.type = type;
    }

    public String getImageUrl() {
        return imageUrl;
    }

    public void setImageUrl(String imageUrl) {
        this.imageUrl = imageUrl;
    }

    public Car_info getCarInfo() {
        return carInfo;
    }

    public void setCarInfo(Car_info carInfo) {
        this.carInfo = carInfo;
    }

    public List<BasketCar> getBaskets() {
        return baskets;
    }

    public void setBaskets(List<BasketCar> baskets) {
        this.baskets = baskets;
    }

    public List<OrderCar> getOrders() {
        return orderCars;
    }

    public void setOrders(List<OrderCar> orders) {
        this.orderCars = orders;
    }



    public double getPower() {
        return power;
    }

    public void setPower(double power) {
        this.power = power;
    }

    public double getMaxSpeed() {
        return maxSpeed;
    }

    public void setMaxSpeed(double maxSpeed) {
        this.maxSpeed = maxSpeed;
    }

    public String getBrandName() {
        return brandName;
    }

    public void setBrandName(String brandName) {
        this.brandName = brandName;
    }
}
