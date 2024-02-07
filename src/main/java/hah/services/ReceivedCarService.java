package hah.services;

import hah.daos.ReceivedCarDao;
import hah.models.ReceivedCar;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ReceivedCarService {

    @Autowired
    private ReceivedCarDao receivedCarDao; //create received car DAO to get data from impl

    //get all received cars
    public List<ReceivedCar> getAllReceivedCar() {
        return receivedCarDao.getAllReceivedCar();
    }

    //add to received car
    public void addReceivedCar(ReceivedCar receivedCar) {
        receivedCarDao.addReceivedCar(receivedCar);
    }
}
