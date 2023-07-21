package com.group5.b2c.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.group5.b2c.service.RentalService;

import lombok.RequiredArgsConstructor;


@Controller
@RequiredArgsConstructor
public class HomeController {
	private final RentalService rentalService;
	@GetMapping("/")
	public String home() {
		return "home";
	}
	
	@GetMapping("/test")
	public String test() {
		rentalService.test();
		return "home";
	}
}
