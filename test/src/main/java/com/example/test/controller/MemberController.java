package com.example.test.controller;

import com.example.test.service.MemberService;
import com.example.test.vo.Member;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

@Controller
@RequestMapping("/member/*")
public class MemberController {

    private static final Logger logger = LoggerFactory.getLogger(MemberController.class);

    @Autowired
    MemberService memberservice;

    // 회원가입 get
    @RequestMapping(value = "/register", method = RequestMethod.GET)
    public void getRegister() throws Exception {
        logger.info("get register");
    }

    // 회원가입 post
    @ResponseBody
    @RequestMapping(value = "/register", method = RequestMethod.POST)
    public String postRegister(Member member) throws Exception {
        String msg = "";

        logger.info("post register");
        memberservice.register(member);
        msg = "<script>alert('회원가입이 완료되었습니다.');location.href='/'</script>";
        return msg;
    }

    @RequestMapping(value = "/login", method = RequestMethod.POST)
    public String login(Member member, HttpServletRequest req, RedirectAttributes rttr) throws Exception{
        logger.info("post login");

        HttpSession session = req.getSession();
        Member login = memberservice.login(member);

        if(login == null) {
            session.setAttribute("member", null);
            rttr.addFlashAttribute("msg", false);
            return "redirect:/";
        }else {
            session.setAttribute("member", login);
            return "redirect:/board/list";
        }
    }

    @ResponseBody
    @RequestMapping(value = "/logout", method = RequestMethod.GET)
    public String logout(HttpSession session) throws Exception{
        String msg = "";

        session.invalidate();
        msg = "<script>alert('로그아웃 되었습니다.');location.href='/'</script>";
        return msg;
    }

    @RequestMapping(value="/memberUpdateView", method = RequestMethod.GET)
    public String registerUpdateView() throws Exception{

        ++BoardController.static_count;
        return "member/memberUpdateView";
    }

    @ResponseBody
    @RequestMapping(value="/memberUpdate", method = RequestMethod.POST)
    public String registerUpdate(Member member, HttpSession session) throws Exception{
        String msg = "";

        memberservice.update(member);
        msg = "<script>alert('회원정보가 수정되었습니다.');location.href='/board/list'</script>";
        return msg;
    }

}
