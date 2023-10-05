package com.jeju.controller.member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jeju.controller.SuperClass;
import com.jeju.model.bean.Member;
import com.jeju.model.dao.MemberDao;

public class PasswordRecoveryProcess2 extends SuperClass {
    @Override
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws Exception {
        super.doPost(request, response);

        String id = request.getParameter("id");
        String mquestion = request.getParameter("mquestion");
        String manswer = request.getParameter("manswer");

        MemberDao dao = new MemberDao();
        Member member = dao.getDataByPrimaryKey(id);

        if (member != null) {
            // 아이디가 존재하는 경우
            if (mquestion.equals(member.getMquestion()) && manswer.equals(member.getManswer())) {
                // 입력한 질문과 답이 일치하는 경우
                // 비밀번호를 사용자에게 보여주는 페이지로 이동
                // 이동할 페이지의 경로를 설정해주세요.
                request.setAttribute("password", member.getPassword());
                super.gotoPage("/member/meShowPassword.jsp");
            } else {
                // 입력한 질문 또는 답이 일치하지 않는 경우
                super.setAlertMessage("비밀번호 찾기 질문 또는 답변이 일치하지 않습니다. 다시 확인해주세요.");
                super.gotoPage("/member/passwordRecovery.jsp");
            }
        } else {
            // 아이디가 존재하지 않는 경우
            super.setAlertMessage("입력한 아이디가 존재하지 않습니다. 다시 확인해주세요.");
            super.gotoPage("/member/meFindPassword.jsp");
        }
    }
}
