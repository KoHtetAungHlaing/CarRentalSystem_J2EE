package hah.services;

import hah.daos.RentDao;
import hah.models.Rent;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class RentService {

    @Autowired
    private RentDao rentDao; //create rent DAO to get data from impl

    //add new rent
    public void addRent(Rent rent) {
        rentDao.addRent(rent);
    }

    //get rent by id
    public Rent getRentById(int id){
        return rentDao.getRentById(id);
    }

    //update rent
    public void updateRent(Rent rent) {
        rentDao.updateRent(rent);
    }

    //get all rent by received car
    public List<Rent> getAllRentByReceivedCar() {
        return rentDao.getAllRentByReceivedCar();
    }
}
