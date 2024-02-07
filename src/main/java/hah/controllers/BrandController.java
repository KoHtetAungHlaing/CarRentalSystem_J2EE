package hah.controllers;

import hah.models.Brand;
import hah.models.CarModel;
import hah.models.User;
import hah.services.BrandService;
import hah.services.CarModelService;
import hah.services.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
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
public class BrandController {

    @Autowired
    private BrandService brandService; //create brand service to get data from service class

    @Autowired
    private CarModelService carModelService; //create car model service to get data from service class

    @Autowired
    private UserService userService; //create user model service to get data from service class

    //show data for car brand
    @RequestMapping("/admin/brand/all")
    public String allBrand(Model model) {
        List<Brand> brands = brandService.getAllBrand();
        model.addAttribute("brands", brands);
        return "admin.brand.all";
    }

    //pass data for update to update brand form
    @RequestMapping("/admin/brand/edit/{brand_id}")
    public String editBrandShowPage(@PathVariable("brand_id") String id, Model model) {
        Brand brand = brandService.getBrandById(Integer.parseInt(id));
        model.addAttribute("brand", brand);
        return "admin.brand.edit";
    }

    //pass data from car brand update form to all brand page by POST method
    @RequestMapping(value = "/admin/brand/edit", method = RequestMethod.POST)
    public String editBrand(@ModelAttribute("brand") Brand brand, Model model) {
        brand.setEnabled(true);
        brandService.updateBrand(brand);
        return "redirect:/admin/brand/all";
    }

    //delete car brand by id
    @RequestMapping("/admin/brand/delete/{brand_id}")
    public String deleteBrand(@PathVariable("brand_id") String id, Model model) {
        Brand brand = brandService.getBrandById(Integer.parseInt(id));
        brand.setEnabled(false);
        brandService.updateBrand(brand);
        return "redirect:/admin/brand/all";
    }

    //insert new car brand
    @RequestMapping("/admin/brand/create")
    public String createBrand(Model model) {
        model.addAttribute("brand", new Brand());
        return "admin.brand.create";
    }

    //insert new car brand => pass data from create from to all brand form by POST method
    @RequestMapping(value = "/admin/brand/create", method = RequestMethod.POST)
    public String createBrand(@Valid @ModelAttribute("brand") Brand brand, BindingResult result, Model model) {
        if (result.hasErrors()) {
            List<ObjectError> errors = result.getAllErrors();
            for (ObjectError error : errors) {
                System.out.println(error.getDefaultMessage());
            }
            return "admin.brand.create";
        }else{
            brandService.addBrand(brand);
            return "redirect:/admin/brand/all";
        }
    }

    //retrieve data by brand name
    @RequestMapping("/showByBrand/{brand_id}")
    public String BrandPage(@PathVariable("brand_id") String id, Model model) {
        List<CarModel> carModels = carModelService.getCarModelByBrandId(Integer.parseInt(id));
        model.addAttribute("carModels", carModels);
        List<Brand> brands = brandService.getAllBrand();
        model.addAttribute("brands", brands);
        Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        String email = ((UserDetails) principal).getUsername();
        User userObj = userService.getUserByEmail(email);
        model.addAttribute("login_name",userObj.getUsername());
        return "brand_page";
    }

    //retrieve data by user search
    @RequestMapping("/showByUserSearch/{search}")
    public String SearchPage(@PathVariable("search") String search, Model model) {
        List<CarModel> carModels = carModelService.getCarModelBySearch(search);
        model.addAttribute("carModels", carModels);
        List<Brand> brands = brandService.getAllBrand();
        model.addAttribute("brands", brands);
        Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        String email = ((UserDetails) principal).getUsername();
        User userObj = userService.getUserByEmail(email);
        model.addAttribute("login_name",userObj.getUsername());
        return "search_page";
    }
}
