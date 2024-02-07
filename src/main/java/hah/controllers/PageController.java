package hah.controllers;

import hah.models.Brand;
import hah.models.CarModel;
import hah.models.User;
import hah.services.BrandService;
import hah.services.CarModelService;
import hah.services.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

@Controller
public class PageController {

    @Autowired
    private CarModelService carModelService; //create car model service to get data from service class

    @Autowired
    private BrandService brandService; //create brand service for get data from service class

    @Autowired
    private UserService userService; //create user service for get data from service class

    //show available car when user login
    @RequestMapping("/")
    public String home(@RequestParam(name = "update_profile", required = false) String update_profile,
                       @RequestParam(name = "change_password", required = false) String change_password,
                       @RequestParam(name = "rent", required = false) String rent,
                       Model model, HttpServletRequest request){
        Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        String email = ((UserDetails) principal).getUsername();
        User userObj = userService.getUserByEmail(email);
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        boolean bol = authentication.getAuthorities().stream().anyMatch(r ->
                r.getAuthority().equals("ROLE_USER"));
        boolean flag = false;

        //if login user is USER_ROLE
        if (bol) {
            List<CarModel> carModels = carModelService.getAllCarModelByAvailabe();
            List<Brand> brands = brandService.getAllBrand();
            model.addAttribute("brands",brands);
            model.addAttribute("carModels",carModels);
            model.addAttribute("login_name",userObj.getUsername());
            model.addAttribute("login","Login Success!");
            model.addAttribute("isLogin", true);;
            if (request.getSession().getAttribute("flag")==null){
                flag = true;
            }
            request.getSession().setAttribute("flag",true);
            model.addAttribute("flag",flag);

            if (update_profile != null) {
                model.addAttribute("isLogin", false);
                model.addAttribute("update_profile", "Update Profile Successfully!");
            }
            if (change_password != null) {
                model.addAttribute("isLogin", false);
                model.addAttribute("change_password", "Successfully Change Password!");
            }
            if (rent != null) {
                model.addAttribute("isLogin", false);
                model.addAttribute("rent", "Rent Successfully!");
            }
            return "home";
        } else {
            //if login user is ADMIN_ROLE
            model.addAttribute("login_name",userObj.getUsername());
            return "redirect:/admin/home";
        }
    }

    //contact us page
    @RequestMapping("/contact_us")
    public String aboutUs(Model model){
        Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        String email = ((UserDetails) principal).getUsername();
        User userObj = userService.getUserByEmail(email);
        model.addAttribute("login_name",userObj.getUsername());
        List<Brand> brands = brandService.getAllBrand();
        model.addAttribute("brands",brands);
        return "contact_us";
    }

    //admin home page
    @RequestMapping("/admin/home")
    public String admin(Model model){
        List<Brand> brands = brandService.getAllBrand();
        model.addAttribute("brands",brands);
        return "admin.home";
    }
}
