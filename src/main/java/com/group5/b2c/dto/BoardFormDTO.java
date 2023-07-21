package com.group5.b2c.dto;

import javax.validation.constraints.NotEmpty;

import lombok.Getter;
import lombok.Setter;


@Getter @Setter
public class BoardFormDTO {
	@NotEmpty(message = "제목을 적어주세요")
	private String title;
	@NotEmpty(message = "내용을 적어주세요")
	private String content;
	
}
