package hah.daos;

import hah.models.CarModel;
import org.springframework.stereotype.Component;

import java.util.List;

@Component
public interface CarModelDao {

    void addCarModel(CarModel carModel); //add new car model
    List<CarModel> getAllCarModel(); //get all car model
    List<CarModel> getAllCarModelByAvailabe(); //get all car model by available
    CarModel getCarModelById(int id); //get car model by model_id
    void updateCarModel(CarModel carModel); //update car model
    void deleteCarModel(int id); //delete car model
    List<CarModel> getCarModelByBrandId(int id);//get all car model by brand_id
    List<CarModel> getCarModelBySearch(String search); //get car model by user searching
}
