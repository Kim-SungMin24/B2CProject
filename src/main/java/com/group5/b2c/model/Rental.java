package com.group5.b2c.model;

import java.util.Date;

import javax.persistence.Column;
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

import org.hibernate.annotations.CreationTimestamp;

import com.fasterxml.jackson.annotation.JsonIgnore;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Entity
@Table(name = "rental")
@Getter @Setter @ToString
public class Rental {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long rentalid;
	@CreationTimestamp
	@Temporal(TemporalType.TIMESTAMP)
	@Column(name = "rentdate")
	private Date rentdate;//빌려준날짜
	@Temporal(TemporalType.TIMESTAMP)
	@CreationTimestamp
	@Column(name = "returndate")
	private Date returndate;//반납할날짜
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "rentid")
	private Member rentid;//빌려준사람
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "returnid")
	private Member returnid;//빌린사람
	@OneToOne(fetch = FetchType.LAZY)
	@JoinColumn(name="bookid")
	private Book bookid;//대여 책정보
	private String rentstatus;
}
