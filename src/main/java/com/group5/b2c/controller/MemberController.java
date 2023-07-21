package com.group5.b2c.controller;


import javax.validation.Valid;

import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;

import com.group5.b2c.dto.MemberDTO;
import com.group5.b2c.model.Member;
import com.group5.b2c.service.MemberService;

import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
public class MemberController {
	private final MemberService memberService;
	private final BCryptPasswordEncoder encoder;

	
	@GetMapping("/join")
	public String join() {
		return "/member/join";
	}	

	@PostMapping("/join")
	public String join(@Valid MemberDTO memberdto, BindingResult bindingResult, Model model) {
		
		if(bindingResult.hasErrors()) {
			model.addAttribute("member", memberdto);
			return "/member/join";
		}
		try {
			Member member = Member.createMember(memberdto, encoder);
			memberService.insert(member);
		}catch (IllegalStateException e){
            model.addAttribute("errorMessage", e.getMessage());
            model.addAttribute("member", memberdto);
            return "/member/join";
        }
		return "redirect:/login"; 
	}
	
	@GetMapping("/login")
	public String login() {
		return "/member/login";
	}
	@GetMapping("/login/error")
	public String loginError(Model model) {
		model.addAttribute("loginErrorMsg", "아이디나 비밀번호를 확인해주세요");
		return "/member/login";
	}
	
	@GetMapping("/memberlist")
	public String list(Model model) {
		model.addAttribute("count",memberService.getCount());
		model.addAttribute("member",memberService.list());
		return "/member/memberlist"; 
	}
	
	@GetMapping("/memberview/{userid}")
	public String view(@PathVariable long userid, Model model) {		
		System.out.println("get memberview");
		model.addAttribute("member",memberService.view(userid));
		return "/member/memberview"; 
	}
	
	@PutMapping("/memberupdate")
	@ResponseBody
	public String update(@RequestBody @Valid MemberDTO memberdto, 
			BindingResult bindingResult, Model model) {
		System.out.println("put update");
		System.out.println(memberdto.getEmail());
		if(bindingResult.hasErrors()) {
			System.out.println("put update error");
			return "fail";
		}
		
		System.out.println("put update 1");
		Member member = Member.createMember(memberdto, encoder);
		//memberService.update(member);
		
		return "success";
	}
	

}
