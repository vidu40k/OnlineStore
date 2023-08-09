package store.project.models;

import org.hibernate.annotations.Cascade;

import javax.persistence.*;

@Entity
@Table(name = "basket_car")
public class BasketCar {


    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "id")
    private Long id;

    @ManyToOne
    @JoinColumn(name = "basket_id", referencedColumnName = "id")
    @Cascade(org.hibernate.annotations.CascadeType.REFRESH)
    private Basket basket;

    @ManyToOne
    @JoinColumn(name = "car_id", referencedColumnName = "id")
    @Cascade(org.hibernate.annotations.CascadeType.REFRESH)
    private Car car;

    @Column(name = "quantity")
    private int quantity;


    public BasketCar() {
    }

    public BasketCar(Basket basket, Car car, int quantity) {
        this.basket = basket;
        this.car = car;
        this.quantity = quantity;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Basket getBasket() {
        return basket;
    }

    public void setBasket(Basket basket) {
        this.basket = basket;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public Car getCar() {
        return car;
    }

    public void setCar(Car car) {
        this.car = car;
    }


}
