package hah.services;

import hah.daos.CarModelDao;
import hah.models.CarModel;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class CarModelService {

    @Autowired
    private CarModelDao carModelDao; //create car model DAO to get data from impl

    //add new car model
    public void addCarModel(CarModel carModel){
        carModelDao.addCarModel(carModel);
    }

    //get all car model
    public List<CarModel> getAllCarModel(){
        return carModelDao.getAllCarModel();
    }

    //get all car model by available
    public List<CarModel> getAllCarModelByAvailabe(){
        return carModelDao.getAllCarModelByAvailabe();
    }

    //get car model by id
    public CarModel getCarModelById(int id){
        return carModelDao.getCarModelById(id);
    }

    //update car model
    public void updateCarModel(CarModel carModel){
        carModelDao.updateCarModel(carModel);
    }

    //delete car model
    public void deleteCarModel(int id){
        carModelDao.deleteCarModel(id);
    }

    //get car model by brand_id
    public List<CarModel> getCarModelByBrandId(int id){
        return carModelDao.getCarModelByBrandId(id);
    }

    //get car model by user searching
    public List<CarModel> getCarModelBySearch(String search){
        return carModelDao.getCarModelBySearch(search);
    }
}
