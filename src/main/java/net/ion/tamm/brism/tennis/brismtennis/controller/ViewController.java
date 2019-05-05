package net.ion.tamm.brism.tennis.brismtennis.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

@Controller
public class ViewController
{
    @GetMapping("/")
    public String home()
    {
        return "index";
    }

    @GetMapping("/admin/{clientId}")
    public String operation(@PathVariable("clientId") String clientId, Model model)
    {
        model.addAttribute("clientId", clientId);
        return "admin";
    }

    @GetMapping("/brism/{clientId}")
    public String brism(@PathVariable("clientId") String clientId, Model model)
    {
        model.addAttribute("clientId", clientId);
        return "brism";
    }
}
