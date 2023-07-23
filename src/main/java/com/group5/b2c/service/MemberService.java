package com.group5.b2c.service;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.group5.b2c.model.Member;
import com.group5.b2c.repository.MemberRepository;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class MemberService {

	// 또는
	// @Autowired
	// private MemberRepository memberRepository;

	private final MemberRepository memberRepository;
	private final BCryptPasswordEncoder encoder;
	// 추가
	public void insert(Member member) {
		validateMember(member);
		memberRepository.save(member);
	}

	// 수정(더티채킹)
	@Transactional
	public void update(Member member) {
		System.out.println("memberservice update");
		Member m = memberRepository.findByUsername(member.getUsername());		
		m.setUsername(member.getUsername());
		m.setPassword(encoder.encode(member.getPassword()));
		m.setName(member.getName());
		m.setAddress(member.getAddress());
		m.setEmail(member.getEmail());
		m.setPhone(member.getPhone());
		m.setRole("ROLE_ADMIN");
		//memberRepository.save(member);
	}

	// 전체보기
	public List<Member> list() {
		return memberRepository.findAll();
	}

	// 전체보기 페이징
	public Page<Member> findAll(Pageable pageable) {
		return memberRepository.findAll(pageable);
	}

	public long getCount() {
		return memberRepository.count();
	}

	// 상세보기
	@Transactional
	public Member view(String username) {
		System.out.println("memberService view");
		return memberRepository.findByUsername(username);
	}

	//삭제하기
	public void delete(String username) {
		System.out.println("memberService delete");
		Member m = memberRepository.findByUsername(username);	
		System.out.println("id: "+m.getUserid());
		memberRepository.deleteById(m.getUserid());
	}
	
	public void validateMember(Member member) {
		Member findMember = memberRepository.findByUsername(member.getUsername());
		if (findMember != null) {
			throw new IllegalStateException("이미 가입된 회원입니다.");
		}
	}
}
