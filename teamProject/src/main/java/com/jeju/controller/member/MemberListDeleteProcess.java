package com.jeju.controller.member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.jeju.controller.SuperClass;
import com.jeju.model.dao.MemberDao;

public class MemberListDeleteProcess extends SuperClass {
    @Override
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws Exception {
        super.doPost(request, response);
        
        String memberId = request.getParameter("memberId"); // JSP에서 전달된 memberId를 가져옴
        MemberDao dao = new MemberDao();
        int cnt = -1;
        
        try {
            cnt = dao.DeleteData(memberId); // memberId를 사용하여 회원 삭제
            if (cnt > 0) {
                super.setAlertMessage("선택하신 회원의 탈퇴가 완료되었습니다.");
                super.gotoPage("/member/meMenuForm.jsp");
            } else {
                super.setAlertMessage("회원 탈퇴 중 오류가 발생했습니다.");
                super.gotoPage("/member/meMenuForm.jsp");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
