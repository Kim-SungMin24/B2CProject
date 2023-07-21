package com.group5.b2c.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.group5.b2c.model.Member;

public interface MemberRepository extends JpaRepository<Member, Long> {
	Member findByUsername(String username);

}
