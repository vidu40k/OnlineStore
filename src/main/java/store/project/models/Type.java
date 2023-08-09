package store.project.models;


import org.hibernate.annotations.Cascade;


import java.util.ArrayList;
import java.util.List;
import javax.persistence.*;
@Entity
@Table(name = "type")
public class Type {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;
    private String name;

    @OneToMany(mappedBy = "type")
    @Cascade(org.hibernate.annotations.CascadeType.ALL)
    private List<Car> cars;

    @OneToMany(mappedBy = "type")
    @Cascade(org.hibernate.annotations.CascadeType.ALL)
    private List<Specification> specifications;


    {
        cars = new ArrayList<>();
        specifications = new ArrayList<>();
    }

    public Type(String name) {
        this.name = name;
    }

    public int getId() {
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

    public List<Car> getCars() {
        return cars;
    }

    public void setCars(List<Car> cars) {
        this.cars = cars;
    }

    public List<Specification> getSpecifications() {
        return specifications;
    }

    public void setSpecifications(List<Specification> specifications) {
        this.specifications = specifications;
    }

    public Type() {
    }
}