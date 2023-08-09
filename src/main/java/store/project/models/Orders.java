package store.project.models;

import javax.persistence.*;

import org.hibernate.annotations.Cascade;

import java.util.List;

@Entity
@Table(name = "orders")
public class Orders {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(name = "order_status")
    private String orderStatus;

    @Column(name = "order_date")
    private String orderDate;


    @Column(name = "total_price")
    private double totalPrice;

    @ManyToOne
    @JoinColumn(name = "customer_id", referencedColumnName = "id")
    @Cascade(org.hibernate.annotations.CascadeType.REFRESH)
    private User customer;

    @OneToMany(mappedBy = "order")
    @Cascade(org.hibernate.annotations.CascadeType.ALL)
    private List<OrderCar> orderCars;


    public Orders(String orderStatus, String orderDate, User customer, List<OrderCar> cars) {
        this.orderStatus = orderStatus;
        this.orderDate = orderDate;
        this.customer = customer;
        this.orderCars = cars;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getOrderStatus() {
        return orderStatus;
    }

    public void setOrderStatus(String orderStatus) {
        this.orderStatus = orderStatus;
    }

    public String getOrderDate() {
        return orderDate;
    }

    public void setOrderDate(String orderDate) {
        this.orderDate = orderDate;
    }

    public User getCustomer() {
        return customer;
    }

    public void setCustomer(User customer) {
        this.customer = customer;
    }

    public List<OrderCar> getCars() {
        return orderCars;
    }

    public void setCars(List<OrderCar> cars) {
        this.orderCars = cars;
    }

    public Orders() {
    }

    public double getTotalPrice() {
        return totalPrice;
    }

    public void setTotalPrice(double totalPrice) {
        this.totalPrice = totalPrice;
    }
}
