package hah.models;

import javax.persistence.*;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

//create model for driver

@Entity
@Table(name = "driver")
public class Driver {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int driver_id;
    @NotNull
    @Size(min = 4,max = 20,message = "Driver Name must be fill!")
    private String name;
    @NotNull
    @Size(min = 7,max = 20,message = "NRC must be fill!")
    private String nrc;
    @NotNull
    @Size(min = 9,max = 9,message = "Phone number must be 9 digits!!")
    private String phone;
    @NotNull
    @Size(min = 2,max = 20,message = "Address must be fill!")
    private String address;
    private boolean available = true;

    public int getDriver_id() {
        return driver_id;
    }

    public void setDriver_id(int driver_id) {
        this.driver_id = driver_id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getNrc() {
        return nrc;
    }

    public void setNrc(String nrc) {
        this.nrc = nrc;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public boolean isAvailable() {
        return available;
    }

    public void setAvailable(boolean available) {
        this.available = available;
    }

    @Override
    public String toString() {
        return "Driver{" +
                "driver_id=" + driver_id +
                ", name='" + name + '\'' +
                ", nrc='" + nrc + '\'' +
                ", phone='" + phone + '\'' +
                ", address='" + address + '\'' +
                ", available=" + available +
                '}';
    }
}
