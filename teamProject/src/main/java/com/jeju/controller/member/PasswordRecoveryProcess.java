package com.jeju.controller.member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.jeju.controller.SuperClass;
import com.jeju.model.bean.Member;
import com.jeju.model.dao.MemberDao;

public class PasswordRecoveryProcess extends SuperClass {
    @Override
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws Exception {
        super.doPost(request, response);
        
        String id = request.getParameter("id");
        MemberDao dao = new MemberDao();
        Member member = dao.getDataByPrimaryKey(id);
        
        if (member != null) {
            // 아이디가 존재하면 비밀번호 찾는 페이지로 이동
            // 이동할 페이지의 경로를 설정해주세요.
            super.gotoPage("/member/passwordRecovery.jsp");
        } else {
            // 아이디가 존재하지 않으면 메시지를 설정하고 다시 아이디 확인 페이지로 이동
            super.setAlertMessage("입력한 아이디가 존재하지 않습니다. 다시 확인해주세요.");
            super.gotoPage("/member/meFindPassword.jsp");
        }
    }
}
