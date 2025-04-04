package com.example.back.domain.home.controller

import org.springframework.beans.factory.annotation.Value
import org.springframework.web.bind.annotation.GetMapping
import org.springframework.web.bind.annotation.RestController

@RestController
class HomeController {

    @Value("\${custom.secretValue}")
    private lateinit var secretValue: String

    @GetMapping("")
    fun home(): String{
      return "Hello World! _ V7: " + secretValue
    }

}