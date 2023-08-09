package store.project.models;


import org.hibernate.annotations.Cascade;

import javax.persistence.*;

import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

@Entity
@Table(name = "basket")
public class Basket {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private long id;

    @Column(name = "total_price")
    private Double totalPrice;

    @OneToOne
    @JoinColumn(name = "user_id", referencedColumnName = "id")
    private User user;

    @OneToMany(mappedBy = "basket")
    @Cascade(org.hibernate.annotations.CascadeType.REFRESH)
    private List<BasketCar> basketCars;



    public Basket() {
        this.basketCars = new ArrayList<>();
    }

    public Basket(double totalPrice, User user, List<BasketCar> cars) {
        this.totalPrice = totalPrice;
        this.user = user;
        this.basketCars = cars;
    }

    public List<BasketCar> getBasketCars() {
        return basketCars;
    }

    public void setBasketCars(List<BasketCar> basketCars) {
        this.basketCars = basketCars;

    }

    public long getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public Double getTotalPrice() {
        return totalPrice;
    }

    public void setTotalPrice(Double totalPrice) {
        this.totalPrice = totalPrice;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }


}
