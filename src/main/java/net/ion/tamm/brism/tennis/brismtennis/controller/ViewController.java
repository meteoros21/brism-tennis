package net.ion.tamm.brism.tennis.brismtennis.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import javax.websocket.server.PathParam;

@Controller
public class ViewController
{
    @GetMapping("/admin")
    public String operation()
    {
        return "admin";
    }

    @GetMapping("/brism")
    public String brism()
    {
        return "brism";
    }
}
