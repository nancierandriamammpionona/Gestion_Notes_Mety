package com.example.restservice.controller.forrage;

import com.example.restservice.entity.forrage.ClientForrage;
import com.example.restservice.service.forrage.ClientForrageService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
public class ClientForrageController {

    @Autowired
    private ClientForrageService clientForrageService;

    @GetMapping("/clientForrage")
    public String listeClient(Model model) {
        List<ClientForrage> liste = clientForrageService.getAllClient();
        model.addAttribute("clientForrage", liste);
        return "clientForrage"; 
    }

    @GetMapping("/clientForrage/edit/{id}")
    public String editClient(@PathVariable Integer id, Model model){
        ClientForrage client = clientForrageService.getClientById(id);
        model.addAttribute("clientForrage", client);
        return "editClientForrage";
    }

    @PostMapping("/clientForrage/update")
    public String updateClient(@ModelAttribute ClientForrage client){
        clientForrageService.saveClient(client);
        return "redirect:/clientForrage";
    }

    @GetMapping("/clientForrage/delete/{id}")
    public String deleteClient(@PathVariable Integer id){
        clientForrageService.deleteClient(id);
        return "redirect:/clientForrage";
    }

    @GetMapping("/clientForrage/add")
    public String showAddForm(Model model){
        model.addAttribute("clientForrage", new ClientForrage());
        return "addClientForrage";
    }

    @PostMapping("/clientForrage/save")
    public String saveClient(@ModelAttribute ClientForrage client){
        clientForrageService.saveClient(client);
        return "redirect:/clientForrage";
    }
}
