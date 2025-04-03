package com.example.back.domain.home.controller

import org.springframework.web.bind.annotation.GetMapping
import org.springframework.web.bind.annotation.RestController

@RestController
class HomeController {

    @GetMapping("")
    fun home(): String{
      return "Hello World! _ V7"
    }

}