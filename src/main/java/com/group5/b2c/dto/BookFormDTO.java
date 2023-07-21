package com.group5.b2c.dto;

import javax.validation.constraints.NotEmpty;

import org.springframework.web.multipart.MultipartFile;

import lombok.Getter;
import lombok.Setter;
@Getter @Setter
public class BookFormDTO {
	@NotEmpty(message = "책 제목을 적어주세요")
	private String title;
	@NotEmpty(message = "책 저자을 적어주세요")
	private String author;
	@NotEmpty(message = "내용을 적어주세요")
	private String content;
	private String category;
	private MultipartFile upload;
}
