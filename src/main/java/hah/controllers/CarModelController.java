package hah.controllers;

import hah.models.*;
import hah.services.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.IOException;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.List;

@Controller
public class CarModelController {

    @Autowired
    private BrandService brandService; //create brand service to get data from service class

    @Autowired
    private CarModelService carModelService; //create car model service to get data from service class

    @Autowired
    private DriverService driverService; //create driver service to get data from service class

    @Autowired
    private RentService rentService; //create rent service to get data from service class

    @Autowired
    private UserService userService; //create user service to get data from service class

    //show all car model
    @RequestMapping("/admin/car_model/all")
    public String showAllCarModel(Model model) {
        List<CarModel> carModels = carModelService.getAllCarModel();
        model.addAttribute("carModels", carModels);
        return "admin.car_model.all";
    }

    //edit car model by id => pass data to car model edit form
    @RequestMapping("/admin/car_model/edit/{model_id}")
    public String showPostEditCarModel(@PathVariable("model_id") String id, Model model) {
        CarModel carModel = carModelService.getCarModelById(Integer.parseInt(id));
        List<Brand> brands = brandService.getAllBrand();
        model.addAttribute("carModel", carModel);
        model.addAttribute("brands", brands);
        return "admin.car_model.edit";
    }

    //edit car model by id => pass data from car model edit form to all model form by POST method
    @RequestMapping(value = "/admin/car_model/edit", method = RequestMethod.POST)
    public String EditCarModel(@ModelAttribute("carModel") CarModel carModel, Model model, HttpServletRequest request) {
        MultipartFile file = carModel.getFile();
        if (file != null && !file.isEmpty()) {
            String imageName = saveImage(file, request);
            carModel.setImage(imageName);
        } else {
            System.out.println("File Not Exist");
        }
        carModelService.updateCarModel(carModel);
        return "redirect:/admin/car_model/all";
    }

    //delete car model by id
    @RequestMapping("/admin/car_model/delete/{model_id}")
    public String showPostDeleteCarModel(@PathVariable("model_id") String id, Model model) {
        carModelService.deleteCarModel(Integer.parseInt(id));
        return "redirect:/admin/car_model/all";
    }

    //insert new car model
    @RequestMapping("/admin/car_model/create")
    public String createShowModel(Model model) {
        List<Brand> brands = brandService.getAllBrand();
        model.addAttribute("brands", brands);
        model.addAttribute("car_model", new CarModel());
        return "admin.car_model.create";
    }

    //insert new car model => pass data from create form to all car form by POST method
    @RequestMapping(value = "/admin/car_model/create", method = RequestMethod.POST)
    public String createModel(@ModelAttribute("car_model") CarModel carModel, Model model, HttpServletRequest request) {
            MultipartFile file = carModel.getFile();
            if (file != null && !file.isEmpty()) {
                String imageName = saveImage(file, request);
                carModel.setImage(imageName);
            }
            carModelService.addCarModel(carModel);
            return "redirect:/admin/car_model/all";
    }

    //generate method for save image
    public String saveImage(MultipartFile file, HttpServletRequest request) {
        String imageName = System.currentTimeMillis() + ".png";
        String rootDirectory = request.getSession().getServletContext().getRealPath("/");
        Path path = Paths.get(rootDirectory + "/WEB-INF/assets/imgs/" + imageName);

        if (file != null && !file.isEmpty()) {
            try {
                file.transferTo(new File(path.toString()));
            } catch (IOException e) {
                e.printStackTrace();
                throw new RuntimeException("Image Can't be upoad!!");
            }
        }
        return imageName;
    }

    //show data by model_id in rent page
    @RequestMapping("/detail/{model_id}")
    public String rentPage(@PathVariable("model_id") String id, Model model) {
        CarModel carModel = carModelService.getCarModelById(Integer.parseInt(id));
        model.addAttribute("carModel", carModel);
        List<Driver> drivers = driverService.getAllDriverByAvailable();
        model.addAttribute("rent", new Rent());
        User user = readLoginUserName();
        model.addAttribute("drivers", drivers);
        RentDTO rentDTO = new RentDTO();
        rentDTO.setCarModel(carModel);
        rentDTO.setUser(user);
        model.addAttribute("rentDTO", rentDTO);
        List<Brand> brands = brandService.getAllBrand();
        model.addAttribute("brands", brands);
        Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        String email = ((UserDetails) principal).getUsername();
        User userObj = userService.getUserByEmail(email);
        model.addAttribute("login_name",userObj.getUsername());
        return "detail";
    }

    //customer's rent page,after rent go to home page
    @RequestMapping(value = "/detail", method = RequestMethod.POST)
    public String rentPage(@ModelAttribute("rent") Rent rent, Model model) {
        rentService.addRent(rent);

        User userObj = readLoginUserName();
        userObj.setRenting(true);
        userService.updateUser(userObj);

        int driverId = rent.getDriver_id();
        Driver driver = driverService.getDriverById(driverId);
        if (driverId != 1) {
            driver.setAvailable(false);
            driverService.updateDriver(driver);
        }

        int carModelId = rent.getModel_id();
        CarModel carModel = carModelService.getCarModelById(carModelId);
        carModel.setAvailable(false);
        carModelService.updateCarModel(carModel);
        model.addAttribute("rent","Rent Successfully!");
        return "redirect:/";
    }

    //get username
    public User readLoginUserName() {
        Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        String username = ((UserDetails) principal).getUsername();
        return userService.getUserByEmail(username);
    }
}
