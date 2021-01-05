package com.web.pet.store.controller;


import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@Controller
@Slf4j
public class MySalesAction {

    // 可以自己命名網址路徑位置
    @GetMapping("/mySales")
    public String init(Model model) {

        return  "Store/MySales";
    }

}
