package hah.controllers;

import hah.models.Authority;
import hah.models.Brand;
import hah.models.User;
import hah.services.BrandService;
import hah.services.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import javax.validation.Valid;
import java.util.List;

@Controller
public class UserController {

    @Autowired
    private UserService userService; //create user service to get data from service class

    @Autowired
    private BrandService brandService; //create brand service to get data from service class

    //show all users list
    @RequestMapping("/admin/user/all")
    public String allUser(Model model) {
        List<User> users = userService.getAllUser();
        model.addAttribute("users", users);
        return "admin.user.all";
    }

    //ban user by admin
    @RequestMapping("/admin/user/toggle/{user_id}")
    public String userById(@PathVariable("user_id") String id, Model model) {
        User user = userService.getUserById(Integer.parseInt(id));
        if (user.isEnabled()) {
            user.setEnabled(false);
        } else {
            user.setEnabled(true);
        }
        userService.updateUser(user);
        return "redirect:/admin/user/all";
    }

    //display error message in login form
    @RequestMapping("/login")
    public String login(@RequestParam(name = "error", required = false) String error,
                        @RequestParam(name = "logout", required = false) String logout,
                        @RequestParam(name = "ban_user", required = false) String ban_user,
                        @RequestParam(name = "register", required = false) String register,
                        Model model) {

        if (error != null) {
            model.addAttribute("error", "Login Error, Please Correctly Fill Email and Password!");
        }
        if (logout != null) {
            model.addAttribute("logout", "Logout Successfully!");
        }
        if (register != null) {
            model.addAttribute("register", "Register Successfully!");
        }
        if (ban_user != null){
            model.addAttribute("ban", "Banned User, Contact Admin!");
            Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
            String username = ((UserDetails) principal).getUsername();
            User user = userService.getUserByEmail(username);
            user.setEnabled(false);
            userService.updateUser(user);
        }
        return "login";
    }

    //user register
    @RequestMapping("/register")
    public String register(Model model) {
        model.addAttribute("user", new User());
//        List<User> userObj = userService.getAllUser();
//        for (User u : userObj){
//            System.out.println("Already Email is " + u.getEmail());
//        }
        return "register";
    }

    //user register => pass data from register form by POST method
    @RequestMapping(value = "/register", method = RequestMethod.POST)
    public String register(@Valid @ModelAttribute("user") User user, BindingResult result, Model model) {

        if (result.hasErrors()) {
            return "register";
        } else {
            if (!userService.userEmailExistOrNot(user.getEmail())){
                System.out.println("Email");
                    userService.addUser(user);
                    userService.addAuth(new Authority(user.getUsername(), "ROLE_USER",user.getEmail()));
                    model.addAttribute("register", "Register Success!");
                    return "redirect:/login";
                }else {
                System.out.println("Email Already Exist!");
                result.rejectValue("email", null, "Email Already Exist!");

            }
                return "register";
//            userService.addUser(user);
//            userService.addAuth(new Authority(user.getUsername(), "ROLE_USER",user.getEmail()));
//            model.addAttribute("register", "Register Success!");
//            return "redirect:/login";
        }
    }

    //change password
    @RequestMapping("/change_password")
    public String changePassword(Model model) {
        Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        String email = ((UserDetails) principal).getUsername();
        User user = userService.getUserByEmail(email);
        model.addAttribute("login_name",user.getUsername());
        model.addAttribute("user",user);
        setupBrand(model);
        return "change_password";
    }

    //change password => pass data from change password form by POST method
    @RequestMapping(value = "/change_password",method = RequestMethod.POST)
    public String changePassword(@ModelAttribute("user") User user, Model model) {
        userService.updateUser(user);
        model.addAttribute("change_password","Successfully Change Password!");
        model.addAttribute("pw",2);
        return "redirect:/";
    }

    //user profile update
    @RequestMapping("/profile")
    public String profilePage(Model model){
        Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        String email = ((UserDetails) principal).getUsername();
        User user = userService.getUserByEmail(email);
        model.addAttribute("login_name",user.getUsername());
        model.addAttribute("user",user);
        setupBrand(model);
        return "profile";
    }

    //user profile update => pass data from profile form by POST method
    @RequestMapping(value = "/profile",method = RequestMethod.POST)
    public String showProfile(@ModelAttribute("user") User user, Model model) {
        userService.updateUser(user);
        String email = user.getEmail();
        Authority authority = userService.getAuthByEmail(email);
        authority.setUsername(user.getUsername());
        userService.updateAuth(authority);
        model.addAttribute("update_profile","Update Success!");
        return "redirect:/";
    }

    //generate method for Brand
    public void setupBrand(Model model){
        List<Brand> brands = brandService.getAllBrand();
        model.addAttribute("brands",brands);
    }
}


