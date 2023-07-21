package com.group5.b2c.repository;


import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.group5.b2c.model.Board;


public interface BoardRepository extends JpaRepository<Board, Long> {
	List<Board> findAllByOrderByBoardidDesc();
	
}

