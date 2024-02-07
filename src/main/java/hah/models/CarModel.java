package hah.models;

import org.springframework.web.multipart.MultipartFile;

import javax.persistence.*;

//create model for car model

@Entity
@Table(name = "carmodel")
public class CarModel {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int model_id;
    private int brand_id;
    private String reg_no;
    private String model;

    private String image;
    private int seat;
    private int price;
    private boolean available=true;

    @Transient
    MultipartFile file;

    @OneToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "brand_id",referencedColumnName = "brand_id",insertable = false,updatable = false)
    private Brand brand;

    public Brand getBrand() {
        return brand;
    }

    public void setBrand(Brand brand) {
        this.brand = brand;
    }

    public MultipartFile getFile() {
        return file;
    }

    public CarModel(){

    }

    public CarModel(String reg_no, String model, int seat, int price, MultipartFile file) {
        this.reg_no = reg_no;
        this.model = model;
        this.seat = seat;
        this.price = price;
        this.file = file;
    }

    public void setFile(MultipartFile file) {
        this.file = file;
    }

    public int getModel_id() {
        return model_id;
    }

    public void setModel_id(int model_id) {
        this.model_id = model_id;
    }

    public int getBrand_id() {
        return brand_id;
    }

    public void setBrand_id(int brand_id) {
        this.brand_id = brand_id;
    }

    public String getReg_no() {
        return reg_no;
    }

    public void setReg_no(String reg_no) {
        this.reg_no = reg_no;
    }

    public String getModel() {
        return model;
    }

    public void setModel(String model) {
        this.model = model;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public int getSeat() {
        return seat;
    }

    public void setSeat(int seat) {
        this.seat = seat;
    }

    public int getPrice() {
        return price;
    }

    public void setPrice(int price) {
        this.price = price;
    }

    public boolean isAvailable() {
        return available;
    }

    public void setAvailable(boolean available) {
        this.available = available;
    }

    @Override
    public String toString() {
        return "CarModel{" +
                "model_id=" + model_id +
                ", brand_id=" + brand_id +
                ", reg_no='" + reg_no + '\'' +
                ", model='" + model + '\'' +
                ", image='" + image + '\'' +
                ", seat=" + seat +
                ", price=" + price +
                ", available=" + available +
                '}';
    }
}
