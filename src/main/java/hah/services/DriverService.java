package hah.services;

import hah.daos.DriverDao;
import hah.daos.RentDao;
import hah.models.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service
public class DriverService {

    @Autowired
    private DriverDao driverDao; //create driver DAO to get data from impl

    @Autowired
    private RentDao rentDao; //create rent DAO to get data from impl

    //get all drivers
    public List<Driver> getAllDriver() {
        return driverDao.getAllDriver();
    }

    //get all drivers by available
    public List<Driver> getAllDriverByAvailable() {
        return driverDao.getAllDriverByAvailable();
    }

    //get driver by id
    public Driver getDriverById(int id) {
        return driverDao.getDriverById(id);
    }

    //delete driver
    public void deleteDriver(int id) {
        driverDao.deleteDriver(id);
    }

    //add new driver
    public void addDriver(Driver driver) {
        driverDao.addDriver(driver);
    }

    //update driver
    public void updateDriver(Driver driver) {
        driverDao.updateDriver(driver);
    }

    //to show history
    public List<DriverHistoryDTO> getAllDriverHistory() {
        List<DriverHistoryDTO> driverHistoryDto = new ArrayList<>();
        List<Driver> driverList = driverDao.getAllDriver();
        for (Driver driver : driverList) {
            DriverHistoryDTO driverHistory = new DriverHistoryDTO();
            driverHistory.setName(driver.getName());
            List<Rent> rentList = rentDao.getRentByDriverId(driver.getDriver_id());
            driverHistory.setCount(rentList.size());
            if (rentList.size() > 0) {
                int total_price = 0;
                driverHistory.setFrom_date(rentList.get(0).getFrom_date());
                driverHistory.setTo_date(rentList.get(rentList.size() - 1).getTo_date());

                for (Rent rent : rentList) {
                    total_price += rent.getTotal_price();
                }
                driverHistory.setTotal_price(total_price);
                driverHistoryDto.add(driverHistory);
            }
        }
        return driverHistoryDto;
    }
}
