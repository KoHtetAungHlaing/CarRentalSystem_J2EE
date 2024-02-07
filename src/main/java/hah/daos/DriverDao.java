package hah.daos;

import hah.models.Driver;
import org.springframework.stereotype.Component;

import java.util.List;

@Component
public interface DriverDao {

    List<Driver> getAllDriver(); //get all driver
    List<Driver> getAllDriverByAvailable(); //get all driver by available
    Driver getDriverById(int id); //get driver by driver_id
    void deleteDriver(int id); //delete driver
    void addDriver(Driver driver); //add new driver
    void updateDriver(Driver driver); //update driver
}
