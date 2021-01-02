package com.web.pet.store.controller;

import com.web.pet.store.dto.api.*;
import com.web.pet.util.DbUtils;
import com.web.pet.util.ExceptionUtils;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

@Controller
@Slf4j
public class MySaleAction {

    // 可以自己命名網址路徑位置
    @GetMapping("/mySales")
    public String init(Model model) {

        return  "Store/MySales";
    }

}
