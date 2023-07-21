package com.group5.b2c.model;


import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToOne;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.persistence.Transient;

import org.hibernate.annotations.CreationTimestamp;
import org.springframework.web.multipart.MultipartFile;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.group5.b2c.dto.BookFormDTO;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Entity
@Table(name = "book")
@Getter @Setter @ToString
public class Book {//대여 책 관련 정보
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long bookid;
	private String title;
	private String author;
	private String content;
	private String category;
	private String img;
	@CreationTimestamp
	@Temporal(TemporalType.TIMESTAMP)
	private Date uploaddate;
	@Transient
	private MultipartFile upload;
	@OneToOne(fetch = FetchType.LAZY, mappedBy = "bookid")
	@JsonIgnore
	private Rental rentalid;
	@ManyToOne(fetch = FetchType.LAZY) //대여 글 등록한 사람
	@JoinColumn(name = "memberid")
	private Member memberid; 
	
	public static Book createBook(BookFormDTO bookFormDTO,Member member) {
		Book book = new Book();
		book.setAuthor(bookFormDTO.getAuthor());
		book.setCategory(bookFormDTO.getCategory());
		book.setContent(bookFormDTO.getContent());
		book.setTitle(bookFormDTO.getTitle());
		book.setUpload(bookFormDTO.getUpload());
		book.setMemberid(member);
		return book;
	}

}
