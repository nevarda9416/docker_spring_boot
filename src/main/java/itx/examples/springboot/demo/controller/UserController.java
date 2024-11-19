package itx.examples.springboot.demo.controller;

import itx.examples.springboot.demo.model.User;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class UserController {
    @GetMapping("/user")
    public String getUser(Model model) {
        User user = new User("john_doe", "john@example.com");
        model.addAttribute("user", user);
        return "user/view";
    }
}
