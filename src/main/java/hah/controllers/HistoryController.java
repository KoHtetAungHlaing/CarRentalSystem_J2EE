package hah.controllers;

import hah.models.DriverHistoryDTO;
import hah.services.DriverService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

@Controller
public class HistoryController {

    @Autowired
    private DriverService driverService; //create driver service to get data from service class

    //create history list
    @RequestMapping("/admin/history/history_list")
    public String allHistory(Model model){
     List<DriverHistoryDTO> driverHistoryDto = driverService.getAllDriverHistory();
     model.addAttribute("driverHistoryDto",driverHistoryDto);
     return "admin.history.history_list";
    }
}
