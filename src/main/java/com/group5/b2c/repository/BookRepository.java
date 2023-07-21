package com.group5.b2c.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.group5.b2c.model.Book;
import com.group5.b2c.model.Member;

public interface BookRepository extends JpaRepository<Book, Long> {
	List<Book> findByMemberid(Member member);
	List<Book> findByTitleContainingOrAuthorContainingOrCategoryContaining(String title, String author, String category);
}
