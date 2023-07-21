package com.group5.b2c.service;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;
import com.group5.b2c.model.Board;
import com.group5.b2c.model.Member;
import com.group5.b2c.repository.BoardRepository;

import lombok.RequiredArgsConstructor;

import java.util.List;
import javax.transaction.Transactional;

@Service
@RequiredArgsConstructor
public class BoardService {
    private final BoardRepository boardRepository;


    @Transactional
    public void insert(Board board, Member member) {
        board.setMember(member);
        boardRepository.save(board);
    }

    public List<Board> getAllBoards() {
        return boardRepository.findAll();
    }

    public Board getBoardById(Long id) {
        return boardRepository.findById(id).orElse(null);
    }

    public void createBoard(Board board) {
        boardRepository.save(board);
    }

    public void updateBoard(Long id, Board updatedBoard) {
        Board board = boardRepository.findById(id).orElse(null);
        if (board != null) {
            board.setTitle(updatedBoard.getTitle());
            board.setContent(updatedBoard.getContent());
            boardRepository.save(board);
        }
    }

    public void deleteBoard(Long id) {
        boardRepository.deleteById(id);
    }

    public List<Board> view(long num) {
        return boardRepository.findAll();
    }
    
    public Page<Board> getBoardListByPage(int page, int pageSize) {
        Pageable pageable = PageRequest.of(page - 1, pageSize, Sort.by("boardid").descending());
        return boardRepository.findAll(pageable);
    }
}
