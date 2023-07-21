package com.group5.b2c.config.auth;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import com.group5.b2c.model.Member;
import com.group5.b2c.repository.MemberRepository;

@Service
public class PrincipalDetail implements UserDetailsService {
	@Autowired
	private MemberRepository memberRepository;
	
	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		System.out.println("loadByUsername");
		Member member = memberRepository.findByUsername(username);
		if(member==null) return null;
		PrincipalMember principalMember = new PrincipalMember(member);		
		return principalMember;
	}

}
