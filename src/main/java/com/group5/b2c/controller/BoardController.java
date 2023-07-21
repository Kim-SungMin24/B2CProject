package com.group5.b2c.controller;


import java.util.List;

import javax.validation.Valid;

import org.springframework.data.domain.Page;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;

import com.group5.b2c.config.auth.PrincipalMember;
import com.group5.b2c.dto.BoardFormDTO;
import com.group5.b2c.model.Board;
import com.group5.b2c.service.BoardService;
import lombok.RequiredArgsConstructor;

@Controller
@RequestMapping("/board/*")
@RequiredArgsConstructor
public class BoardController {
    private final BoardService boardService;
    
    @GetMapping("insert")
    public String insert() {
        return "/board/insert";
    }
    
    @PostMapping("insert")
    public String insert(@Valid BoardFormDTO boardFormDTO,BindingResult bindingResult, Model model, @AuthenticationPrincipal PrincipalMember principalMember) {
    	if(bindingResult.hasErrors()) {
    		return "/board/insert";
    	}
    	Board board = Board.createBoard(boardFormDTO);
    	boardService.insert(board, principalMember.getMember());
      return "redirect:/board/list";
    }
    
    
    @GetMapping("view/{num}")
    public String view(@PathVariable long num, Model model) {
        Board board = boardService.getBoardById(num);
        model.addAttribute("board", board);
        return "/board/view";
    }

    @GetMapping("delete/{num}")
    @ResponseBody
    public String delete(@PathVariable long num) {
        boardService.deleteBoard(num);
        return "success";
    }

    @GetMapping("update/{num}")
    public String showUpdateForm(@PathVariable long num, Model model) {
        Board board = boardService.getBoardById(num);
        model.addAttribute("board", board);
        return "/board/update";
    }

    @PutMapping("update/{num}")
    @ResponseBody
    public String update(@PathVariable long num, @RequestBody @Valid BoardFormDTO boardFormDTO, BindingResult bindingResult,Model model) {
    	Board board = boardService.getBoardById(num);
    	if(bindingResult.hasErrors()) {
            model.addAttribute("board", board);
    		return "fail";
    	}
    	board = Board.createBoard(boardFormDTO);
        boardService.updateBoard(num, board);
        return "success";
    }
    
    @GetMapping("list")
    public String list(@RequestParam(name = "page", defaultValue = "1") int page, Model model) {
        int pageSize = 5; // 한 페이지에 표시할 게시글 개수
        Page<Board> boardPage = boardService.getBoardListByPage(page, pageSize);
        List<Board> boardList = boardPage.getContent();
        int totalPages = boardPage.getTotalPages();
        int prevPage = Math.max(1, page - 1);
        int nextPage = Math.min(totalPages, page + 1);

        model.addAttribute("boards", boardList);
        model.addAttribute("totalPages", totalPages);
        model.addAttribute("currentPage", page);
        model.addAttribute("prevPage", prevPage);
        model.addAttribute("nextPage", nextPage);

        // 현재 페이지 번호인 'page'를 모델에 추가
        model.addAttribute("number", page);

        return "/board/list";
    }


}
