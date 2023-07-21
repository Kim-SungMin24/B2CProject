package com.group5.b2c.service;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.UUID;

import javax.transaction.Transactional;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.group5.b2c.model.Book;
import com.group5.b2c.repository.BookRepository;
import com.group5.b2c.repository.RentalRepository;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class BookService {
	private final BookRepository bookRepository;
	private final RentalRepository rentalRepository;
	
	/*public void insert(Book book,Member member) {
		Rental rental = new Rental();
		rental.setRentid(member);
		rental.setBookid(book);
		bookRepository.save(book);
		rentalRepository.save(rental);
	}
	*/
	public void insert(Book book, String uploadFolder) {
		UUID uuid = UUID.randomUUID();
		MultipartFile f = book.getUpload();
		String uploadFileName = "";
		
		if(!f.isEmpty()) {
			uploadFileName = uuid.toString() + "_" + f.getOriginalFilename();
			File saveFile = new File(uploadFolder, uploadFileName);
			try {
				f.transferTo(saveFile);
				book.setImg(uploadFileName);
			} catch (IllegalStateException | IOException e) {
				e.printStackTrace();
			}
		}
		bookRepository.save(book);
	}
	
	
	public List<Book> list(String keyword){
		List<Book> list = null;
		if(keyword.equals("")) {
			list = bookRepository.findAll();
		}else {
			list=bookRepository.findByTitleContainingOrAuthorContainingOrCategoryContaining(keyword, keyword, keyword);
		}
		return list;
	}
	
	public void Insert(Book book) {
		UUID uuid = UUID.randomUUID();
		MultipartFile f = book.getUpload();
		String uploadFileName = "";
		
		if(!f.isEmpty()) {
			uploadFileName = uuid.toString() + "_" + f.getOriginalFilename();
			File saveFile = new File(uploadFileName);
			try {
				f.transferTo(saveFile);
				book.setImg(uploadFileName);
			} catch (IllegalStateException | IOException e) {
				e.printStackTrace();
			}
		}
		bookRepository.save(book);
	}
	
	@Transactional
	public Book bookdetail(long num) {
		Book b = bookRepository.findById(num).get();
		
		return b;
	
	
		
	}
	
}
	
	
	

