package com.example.test.service;

import com.example.test.mapper.MemberMapper;
import com.example.test.vo.Member;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class MemberService {

    @Autowired
    MemberMapper memberMapper;

    public void register(Member member) {
        memberMapper.register(member);
    }
    public Member login(Member member) { return memberMapper.login(member); }
    public void update(Member member) { memberMapper.update(member); }

}
