package com.example.test.controller;

import com.example.test.HomeController;
import com.example.test.service.BoardService;
import com.example.test.vo.Board;
import com.example.test.vo.Criteria;
import com.example.test.vo.PageMaker;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("/board/*")
public class BoardController {

    public static int static_count;
    int instance_count;

    private static final Logger logger = LoggerFactory.getLogger(BoardController.class);

    @Autowired
    BoardService boardService;

    // 게시판 글 작성폼
    @RequestMapping(value = "/board/writeView" , method= RequestMethod.GET)
    public String writeView() {
        // jsp 페이지 호출
        return "board/writeView";
    }

    // 게시판 글 작성
    @ResponseBody
    @RequestMapping(value = "/board/write", method = RequestMethod.POST)
    public String write(Board boardVO) throws Exception{
        String msg = "";

        logger.info("write");
        boardService.write(boardVO);
        msg = "<script>alert('게시글이 등록되었습니다.');location.href='/board/list';</script>";
        return msg;
    }

    // 게시판 리스트
//    @RequestMapping(value = "/main" , method=RequestMethod.GET)
//    public String list(Model model) throws Exception {
//        logger.info("list");
//        model.addAttribute("list",boardService.list());
//        return "board/main";
//    }
    @RequestMapping(value = "/list", method = RequestMethod.GET)
    public String list(Model model, Criteria cri) throws Exception{
        logger.info("list");

        model.addAttribute("list", boardService.list(cri));

        PageMaker pageMaker = new PageMaker();
        pageMaker.setCri(cri);
        pageMaker.setTotalCount(boardService.listCount());

        model.addAttribute("pageMaker", pageMaker);

        ++instance_count;
        ++static_count;
        logger.info("static_count : {}", static_count);
        logger.info("instance_count : {}", instance_count);
        return "board/list";
    }

    // 게시판 조회
    @RequestMapping(value = "/board/readView", method = RequestMethod.GET)
    public String read(Board board, Model model) throws Exception{
        logger.info("read");
        model.addAttribute("read", boardService.read(board.getBno()));
        boardService.boardHit(board.getBno());
        return "board/readView";
    }

    // 게시판 수정뷰
    @RequestMapping(value = "/board/updateView", method = RequestMethod.GET)
    public String updateView(Board board, Model model) throws Exception{
        logger.info("updateView");
        model.addAttribute("update", boardService.read(board.getBno()));
        return "board/updateView";
    }

    // 게시판 수정
    @ResponseBody
    @RequestMapping(value = "/update", method = RequestMethod.POST)
    public String update(Board board) throws Exception{
        String msg = "";

        logger.info("update");
        boardService.update(board);

        msg = "<script>alert('게시글이 수정되었습니다.');location.href='/board/list';</script>";
        return msg;
    }

    // 게시판 삭제
    @ResponseBody
    @RequestMapping(value = "/delete", method = RequestMethod.POST)
    public String delete(Board board) throws Exception{
        String msg = "";

        logger.info("delete");
        boardService.delete(board.getBno());
        msg = "<script>alert('게시글이 삭제되었습니다.');location.href='/board/list';</script>";
        return msg;
    }
}
