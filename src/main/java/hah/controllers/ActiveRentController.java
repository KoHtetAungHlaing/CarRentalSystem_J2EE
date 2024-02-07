package hah.controllers;

import hah.models.*;
import hah.services.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

@Controller
public class ActiveRentController {

    @Autowired
    private RentService rentService; //create rent service to get data from service class

    @Autowired
    private ReceivedCarService receivedCarService; //create received service to get data from service class

    @Autowired
    private CarModelService carModelService; //create car model service to get data from service class

    @Autowired
    private DriverService driverService; //create driver service to get data from service class

    @Autowired
    private UserService userService; //create user service for to data from service class

    //show data for active car rent list
    @RequestMapping("/admin/rent_car/rent_list")
    public String allRentList(Model model) {
        List<Rent> rents = rentService.getAllRentByReceivedCar();
        model.addAttribute("rents", rents);
        return "admin.rent_car.rent_list";
    }

    // add received car from rent list and update some data
    @RequestMapping("/admin/rent_car/rent_list/{rent_id}")
    public String RentByReceived(@PathVariable("rent_id") String id, Model model) {
        Rent rent = rentService.getRentById(Integer.parseInt(id));

        //update received_car to true
        if (!rent.isReceived_car()) {
            rent.setReceived_car(true);
        }
        rentService.updateRent(rent);

        int user_id = rent.getUser_id();
        int driver_id = rent.getDriver_id();
        int model_id = rent.getModel_id();

        User user = userService.getUserById(user_id);
        user.setRenting(false);
        userService.updateUser(user);

        if (driver_id != 1) {
            Driver driver = driverService.getDriverById(driver_id);
            driver.setAvailable(true);
            driverService.updateDriver(driver);
        }

        CarModel carModel = carModelService.getCarModelById(model_id);
        carModel.setAvailable(true);
        carModelService.updateCarModel(carModel);

        ReceivedCar receivedCar = new ReceivedCar();
        receivedCar.setRent_id(rent.getRent_id());
        receivedCarService.addReceivedCar(receivedCar);

        return "redirect:/admin/rent_car/rent_list";
    }
}
