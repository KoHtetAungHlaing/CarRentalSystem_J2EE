package hah.daos;

import hah.models.Rent;
import org.springframework.stereotype.Component;

import java.util.List;

@Component
public interface RentDao {

    void addRent(Rent rent); //add new rent car
    List<Rent> getAllRentByReceivedCar(); //get all rent car by received_car
    Rent getRentById(int id); //get rent car by rent_id
    void updateRent(Rent rent); //update rent
    List<Rent> getRentByDriverId(int driver_id); //get rent by driver_id
}
