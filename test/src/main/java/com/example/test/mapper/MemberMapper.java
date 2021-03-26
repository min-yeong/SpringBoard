package com.example.test.mapper;

import com.example.test.vo.Member;
import org.springframework.stereotype.Repository;

@Repository
public interface MemberMapper {

    void register(Member member);
    Member login(Member member);
    void update(Member member);
}
