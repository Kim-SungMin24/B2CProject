package com.group5.b2c.repository;

import java.util.Date;
import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;

import com.group5.b2c.model.Book;
import com.group5.b2c.model.Member;
import com.group5.b2c.model.Rental;

public interface RentalRepository extends JpaRepository<Rental, Long> {
	@Modifying
	@Query(value = "update rental set rentdate=now(), returndate=date_add(now(), interval 14 DAY) where rentalid=?1", nativeQuery = true)
	public void update(long num);
	
	public List<Rental> findByReturnid(Member member);
	
	public List<Rental> findAllByReturndateBeforeAndRentstatus(Date date, String rentstatus);
}
