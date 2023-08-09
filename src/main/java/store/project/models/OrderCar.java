package store.project.models;

import org.hibernate.annotations.Cascade;

import javax.persistence.*;

@Entity
@Table(name = "order_items")
public class OrderCar {


    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "id")
    private Long id;

    @ManyToOne
    @JoinColumn(name = "order_id", referencedColumnName = "id")
    @Cascade(org.hibernate.annotations.CascadeType.ALL)
    private Orders order;

    @ManyToOne
    @JoinColumn(name = "car_id", referencedColumnName = "id")
    @Cascade(org.hibernate.annotations.CascadeType.REFRESH)
    private Car car;

    @Column(name = "quantity")
    private int quantity;

    public OrderCar() {
    }

    public OrderCar(Orders order,Car car,int quantity){
        this.car = car;
        this.order = order;
        this.quantity = quantity;
    }


    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Orders getOrder() {
        return order;
    }

    public void setOrder(Orders order) {
        this.order = order;
    }

    public Car getCar() {
        return car;
    }

    public void setCar(Car car) {
        this.car = car;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }
}

