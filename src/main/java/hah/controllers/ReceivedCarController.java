package hah.controllers;

import hah.models.ReceivedCar;
import hah.services.ReceivedCarService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

@Controller
public class ReceivedCarController {

    @Autowired
    private ReceivedCarService receivedCarService; //create received car service to get data from service class

    //show all received car list
    @RequestMapping("/admin/received_car/received_list")
    public String allBrand(Model model) {
        List<ReceivedCar> receivedCars = receivedCarService.getAllReceivedCar();
        model.addAttribute("receivedCars", receivedCars);
        return "admin.received_car.received_list";
    }
}
