package com.group5.b2c.model;

import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

import com.group5.b2c.dto.MemberDTO;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter @Setter @ToString 
@Table(name = "member")
@Entity
public class Member {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long userid;
	@Column(unique = true)
	private String username;
	@Column(nullable = false)
	private String password;
	private String name;
	private String address;
	private String email;
	private String phone;
	private String role;
	
	
	public static Member createMember(MemberDTO memberDTO,BCryptPasswordEncoder bCryptPasswordEncoder) {
		Member member = new Member();
		member.setUsername(memberDTO.getUsername());
		String password=bCryptPasswordEncoder.encode(memberDTO.getPassword());
		member.setPassword(password);
		member.setName(memberDTO.getName());
		member.setAddress(memberDTO.getAddress());
		member.setEmail(memberDTO.getEmail());
		member.setPhone(memberDTO.getPhone());
		member.setRole("ROLE_ADMIN");
		return member;
	}
}
