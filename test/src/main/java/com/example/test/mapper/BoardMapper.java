package com.example.test.mapper;

import com.example.test.vo.Board;
import com.example.test.vo.Criteria;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface BoardMapper {

    void write(Board board);
//    List list();
    List<Board> list(Criteria cri);
    int listCount();
    Board read(int bno);
    void update(Board board);
    void delete(int bno);
    int boardHit(int bno);
}
