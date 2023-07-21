package com.group5.b2c.service;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import com.group5.b2c.model.Member;
import com.group5.b2c.repository.MemberRepository;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class MemberService {
	
	private final MemberRepository memberRepository;

	// 회원가입
	public void insert(Member member) {
		validateMember(member);
		memberRepository.save(member);
	}
	
	public void validateMember(Member member) {
		Member findMember = memberRepository.findByUsername(member.getUsername());
		if(findMember != null) {
			throw new IllegalStateException("이미 등록된 아이디입니다.");
		}
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
	public Member view(long userid) {
		System.out.println("memberService view");
		
		return memberRepository.findById(userid).get();
	}


}
