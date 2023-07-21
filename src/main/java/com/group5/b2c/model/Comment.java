package com.group5.b2c.model;

import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.fasterxml.jackson.annotation.JsonFormat.Shape;

import lombok.Getter;
import lombok.Setter;

@Getter @Setter
@Table
@Entity(name = "comment")
public class Comment {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int cnum;
	private String content;
	@JsonFormat(shape=Shape.STRING,
			pattern = "yyyy-MM-dd", timezone = "Asia/Seoul")
	private Date regdate;
	@ManyToOne
	@JoinColumn(name = "bnum")
	private Board board;
	@ManyToOne
	@JoinColumn(name = "memberid")
	private Member member;
}
