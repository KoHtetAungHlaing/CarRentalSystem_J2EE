package hah.daos;

import hah.models.ReceivedCar;
import org.springframework.stereotype.Component;

import java.util.List;

@Component
public interface ReceivedCarDao {

    void addReceivedCar(ReceivedCar receivedCar); //add received car
    List<ReceivedCar> getAllReceivedCar(); //get all received car
}
