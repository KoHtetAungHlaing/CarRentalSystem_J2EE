package hah.models;

import javax.persistence.*;

//create model for received car

@Entity
@Table(name = "receivedcar")
public class ReceivedCar {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int received_id;
    private int rent_id;

    public int getReceived_id() {
        return received_id;
    }

    public void setReceived_id(int received_id) {
        this.received_id = received_id;
    }

    public int getRent_id() {
        return rent_id;
    }

    public void setRent_id(int rent_id) {
        this.rent_id = rent_id;
    }
}
