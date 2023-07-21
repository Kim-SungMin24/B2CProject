package com.group5.b2c.service;

import java.util.Date;
import java.util.List;

import javax.transaction.Transactional;

import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Service;

import com.group5.b2c.model.Book;
import com.group5.b2c.model.Member;
import com.group5.b2c.model.Rental;
import com.group5.b2c.repository.BookRepository;
import com.group5.b2c.repository.RentalRepository;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class RentalService {
	private final BookRepository bookRepository;
	private final RentalRepository rentalRepository;
	
	public int requestBook(long bookid, Member loginMember) {
		Book book = bookRepository.findById(bookid).get();
		if(book.getRentalid()!=null) {
			return 0;
		}else if(loginMember.getUsername().equals(book.getMemberid().getUsername())) {
			return 0;
		}
		Rental rental = new Rental();
		rental.setBookid(book);
		rental.setReturnid(loginMember);
		rental.setRentid(book.getMemberid());
		rental.setRentstatus("request");
		rentalRepository.save(rental);
		return 1;
	}
	public List<Book> rentlist(Member member){
		return bookRepository.findByMemberid(member);
	}
	@Transactional
	public Rental rentdetail(long id) {
		rentalRepository.update(id);
		return rentalRepository.findById(id).get();
		
	}
	@Transactional
	public void acceptrent(long id) {
		Rental rental = new Rental();
		rental = rentalRepository.findById(id).get();
		rental.setRentstatus("rent");
		
	}
	
	public List<Rental> returnlist(Member member) {
		return rentalRepository.findByReturnid(member);
	}
	@Transactional
	public void returnbook(long num) {
		Rental rental = rentalRepository.findById(num).get();
		rental.setRentstatus("return");
	}
	//자정에 대여미납
	@Transactional
	@Scheduled(cron = "0 0 0 * * ?")
	public void test() {
		List<Rental> list = rentalRepository.findAllByReturndateBeforeAndRentstatus(new Date(),"rent");
		for(Rental rental : list) {
			rental.setRentstatus("overdue");
		}
	}
}
