package hah.controllers;

import hah.models.Driver;
import hah.services.DriverService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.ObjectError;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.validation.Valid;
import java.util.List;

@Controller
public class DriverController {

    @Autowired
    private DriverService driverService; //create driver service to get data from service class

    //show all driver list
    @RequestMapping("/admin/driver/all")
    public String allDriver(Model model){
        List<Driver> drivers = driverService.getAllDriver();
        model.addAttribute("drivers",drivers);
        return "admin.driver.all";
    }

    //delete driver by id
    @RequestMapping("/admin/driver/delete/{driver_id}")
    public String deleteDriver(@PathVariable("driver_id") String id, Model model){
        driverService.deleteDriver(Integer.parseInt(id));
        return "redirect:/admin/driver/all";
    }

    //insert new driver
    @RequestMapping("/admin/driver/create")
    public String createDriver(Model model){
        model.addAttribute("driver",new Driver());
        return "admin.driver.create";
    }

    //insert new driver => pass data from driver create page form to all driver form by POST method
    @RequestMapping(value = "/admin/driver/create",method = RequestMethod.POST)
    public String createDriver(@Valid  @ModelAttribute("driver") Driver driver, BindingResult result, Model model){
        if (result.hasErrors()) {
            List<ObjectError> errors = result.getAllErrors();
            for (ObjectError error : errors) {
                System.out.println(error.getDefaultMessage());
            }
            return "admin.driver.create";
        }else{
            driverService.addDriver(driver);
            return "redirect:/admin/driver/all";
        }
    }

    //edit driver by id
    @RequestMapping("/admin/driver/edit/{driver_id}")
    public String editDriverShowPage(@PathVariable("driver_id") String id, Model model){
        Driver driver = driverService.getDriverById(Integer.parseInt(id));
        model.addAttribute("driver",driver);
        return "admin.driver.edit";
    }

    //edit driver by id => pass data from edit form to all driver form by POST method
    @RequestMapping(value = "/admin/driver/edit",method = RequestMethod.POST)
    public String editDriver(@ModelAttribute("driver") Driver driver, Model model) {
        driverService.updateDriver(driver);
        return "redirect:/admin/driver/all";
    }
}
