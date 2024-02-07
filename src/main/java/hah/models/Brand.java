package hah.models;

import javax.persistence.*;
import javax.validation.constraints.Size;
import java.util.List;

//create model for car brand

@Entity
@Table(name = "carbrand")
public class Brand {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int brand_id;
    @Size(min = 4,max = 20,message = "Brand Name must be fill!")
    private String brand_name;
    private boolean enabled = true;

    @OneToMany(fetch = FetchType.EAGER)
    @JoinColumn(name = "brand_id")
    private List<CarModel> carModels;

    public List<CarModel> getCarModels() {
        return carModels;
    }

    public void setCarModels(List<CarModel> carModels) {
        this.carModels = carModels;
    }

    public Brand(String brand_name) {
        this.brand_name = brand_name;
    }

    public Brand(){}

    public int getBrand_id() {
        return brand_id;
    }

    public void setBrand_id(int brand_id) {
        this.brand_id = brand_id;
    }

    public String getBrand_name() {
        return brand_name;
    }

    public void setBrand_name(String brand_name) {
        this.brand_name = brand_name;
    }

    public boolean isEnabled() {
        return enabled;
    }

    public void setEnabled(boolean enabled) {
        this.enabled = enabled;
    }

    @Override
    public String toString() {
        return "Brand{" +
                "brand_id=" + brand_id +
                ", brand_name='" + brand_name + '\'' +
                ", enabled=" + enabled +
                ", carModels=" + carModels +
                '}';
    }
}
