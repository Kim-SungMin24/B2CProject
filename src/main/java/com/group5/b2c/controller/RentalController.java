package com.group5.b2c.controller;

import java.util.List;

import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.group5.b2c.config.auth.PrincipalMember;
import com.group5.b2c.model.Book;
import com.group5.b2c.model.Member;
import com.group5.b2c.model.Rental;
import com.group5.b2c.service.RentalService;

import lombok.RequiredArgsConstructor;

@Controller
@RequestMapping("/rent/*")
@RequiredArgsConstructor
public class RentalController {
	private final RentalService rentalService;
	
	//대여요청
	@GetMapping("request/{num}")
	@ResponseBody
	public String requestBook(@PathVariable long num,@AuthenticationPrincipal PrincipalMember principalMember) {
		int flag = rentalService.requestBook(num, principalMember.getMember());//0: 실패 1 : 성공
		if(flag==0) {
			return "fail";
		}
		return "success";
	}
	
	//유저 : 대여한 리스트
	@GetMapping("list")
	public String rentlist(@AuthenticationPrincipal PrincipalMember principalMember, Model model) {
		List<Book> booklist = rentalService.rentlist(principalMember.getMember());
		model.addAttribute("lists", booklist);
		return "/rent/rentlist";
	}
	@GetMapping("rentdetail/{num}")
	public String rentdetail(@PathVariable long num, Model model) {
		model.addAttribute("rental", rentalService.rentdetail(num));
		return "/rent/rentdetail";
	}
	//대여 승낙
	@GetMapping("acceptrent/{num}")
	@ResponseBody
	public String acceptrent(@PathVariable long num) {
		rentalService.acceptrent(num);
		return "success";
	}
	//빌린책 리스트
	@GetMapping("returnlist")
	public String returnlist(@AuthenticationPrincipal PrincipalMember principalMember, Model model) {
		List<Rental> list =rentalService.returnlist(principalMember.getMember());
		model.addAttribute("returnlist", list);
		return "/rent/returnlist";
	}
	//반납
	@GetMapping("returnbook/{num}")
	@ResponseBody
	public String returnbook(@PathVariable long num) {
		rentalService.returnbook(num);
		return "success";
	}
	
	
}
