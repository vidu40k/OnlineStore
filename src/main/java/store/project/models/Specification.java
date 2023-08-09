package store.project.models;



import lombok.AllArgsConstructor;
import lombok.NoArgsConstructor;
import org.hibernate.annotations.Cascade;
import javax.persistence.*;


@Entity
@Table(name = "specifications")
@AllArgsConstructor
@NoArgsConstructor
public class Specification {


    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    private int id;

    @Column(name = "weight")
    private double weight;

    @Column(name = "length")
    private double length;

    @Column(name = "width")
    private double width;

    @Column(name = "power")
    private double power;

    @Column(name = "max_speed")
    private double maxSpeed;

    @ManyToOne
    @JoinColumn(name = "type_id", referencedColumnName = "id")
    @Cascade(org.hibernate.annotations.CascadeType.SAVE_UPDATE)
    private Type type;

    @OneToOne(mappedBy = "specification")
    @Cascade(org.hibernate.annotations.CascadeType.ALL)
    private Car_info carInfo;

    public Specification(double weight, double length, double width, double power, double maxSpeed, Type type, Car_info carInfo) {
        this.weight = weight;
        this.length = length;
        this.width = width;
        this.power = power;
        this.maxSpeed = maxSpeed;
        this.type = type;
        this.carInfo = carInfo;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public double getWeight() {
        return weight;
    }

    public void setWeight(double weight) {
        this.weight = weight;
    }

    public double getLength() {
        return length;
    }

    public void setLength(double length) {
        this.length = length;
    }

    public double getWidth() {
        return width;
    }

    public void setWidth(double width) {
        this.width = width;
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

    public Type getType() {
        return type;
    }

    public void setType(Type type) {
        this.type = type;
    }

    public Car_info getCarInfo() {
        return carInfo;
    }

    public void setCarInfo(Car_info carInfo) {
        this.carInfo = carInfo;
    }
}
