package com.group5.b2c.model;

import java.util.Date;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.PrePersist;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import org.hibernate.annotations.CreationTimestamp;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.group5.b2c.dto.BoardFormDTO;

import lombok.Getter;
import lombok.Setter;

@Getter @Setter
@Table
@Entity(name = "board")
public class Board {
		@Id
		@GeneratedValue(strategy = GenerationType.IDENTITY)
		private Long boardid;
		private String title;
		private String content;
		@CreationTimestamp
		@Temporal(TemporalType.TIMESTAMP)
		@Column(name="regdate")
		private Date regdate;
		private Long hitcount;
		private Long replycnt;
		
		@OneToMany(mappedBy = "board", cascade = CascadeType.REMOVE)
		@JsonIgnoreProperties("board")
		private List<Comment> comments;
		@ManyToOne(fetch = FetchType.LAZY)
		@JoinColumn(name = "memberid")
		@JsonIgnore
		private Member member;
		
		
		@PrePersist
		public void prePersist() {
			this.hitcount=this.hitcount==null?0:this.hitcount;
			this.replycnt=this.replycnt==null?0:this.replycnt;
		}
		
		public static Board createBoard(BoardFormDTO boardFormDTO) {
			Board board = new Board();
			board.setTitle(boardFormDTO.getTitle());
			board.setContent(boardFormDTO.getContent());
			return board;
		
		}
}
