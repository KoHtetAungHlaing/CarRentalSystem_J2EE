package hah.models;

import org.springframework.format.annotation.DateTimeFormat;

import javax.persistence.*;
import java.util.Date;

//create model for Rent

@Entity
@Table(name = "rentingcar")
public class Rent {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int rent_id;
    private int driver_id;
    private int user_id;
    private int model_id;
    private int no_of_day;
    private int total_price;
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date from_date;
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date to_date;
    private boolean received_car;

    @OneToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "user_id",referencedColumnName = "user_id",insertable = false,updatable = false)
    private User user;

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public int getRent_id() {
        return rent_id;
    }

    public void setRent_id(int rent_id) {
        this.rent_id = rent_id;
    }

    public int getDriver_id() {
        return driver_id;
    }

    public void setDriver_id(int driver_id) {
        this.driver_id = driver_id;
    }

    public int getUser_id() {
        return user_id;
    }

    public void setUser_id(int user_id) {
        this.user_id = user_id;
    }

    public int getModel_id() {
        return model_id;
    }

    public void setModel_id(int model_id) {
        this.model_id = model_id;
    }

    public int getNo_of_day() {
        return no_of_day;
    }

    public void setNo_of_day(int no_of_day) {
        this.no_of_day = no_of_day;
    }

    public int getTotal_price() {
        return total_price;
    }

    public void setTotal_price(int total_price) {
        this.total_price = total_price;
    }

    public Date getFrom_date() {
        return from_date;
    }

    public void setFrom_date(Date from_date) {
        this.from_date = from_date;
    }

    public Date getTo_date() {
        return to_date;
    }

    public void setTo_date(Date to_date) {
        this.to_date = to_date;
    }

    public boolean isReceived_car() {
        return received_car;
    }

    public void setReceived_car(boolean received_car) {
        this.received_car = received_car;
    }

    @Override
    public String toString() {
        return "Rent{" +
                "rent_id=" + rent_id +
                ", driver_id=" + driver_id +
                ", user_id=" + user_id +
                ", model_id=" + model_id +
                ", no_of_day=" + no_of_day +
                ", total_price=" + total_price +
                ", from_date=" + from_date +
                ", to_date=" + to_date +
                ", received_car=" + received_car +
                '}';
    }
}
