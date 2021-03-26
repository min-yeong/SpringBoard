package com.example.test.service;

import com.example.test.mapper.BoardMapper;
import com.example.test.vo.Board;
import com.example.test.vo.Criteria;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
public class BoardService {

    @Autowired
    BoardMapper boardMapper;

    public void write(Board board) {
        boardMapper.write(board);
    }
//    public List list() { return boardMapper.list(); }
    public List<Board> list(Criteria cri) { return boardMapper.list(cri); }
    public int listCount() {
        return boardMapper.listCount();
    }
    public Board read(int bno) { return boardMapper.read(bno); }
    public void update(Board board) {
        boardMapper.update(board);
    }
    public void delete(int bno) {
        boardMapper.delete(bno);
    }
    public int boardHit(int bno) { return boardMapper.boardHit(bno); }
}
