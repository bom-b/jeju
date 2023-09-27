package com.jeju.controller.member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.jeju.controller.SuperClass;
import com.jeju.model.bean.Member;
import com.jeju.model.dao.MemberDao;

public class MemberDeleteProcessServlet extends SuperClass {
    @Override
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws Exception {
        super.doPost(request, response);

        // 세션에서 현재 로그인된 사용자의 정보를 가져옵니다.
        Member loginfo = (Member) session.getAttribute("loginfo");

        if (loginfo != null) {
            // 현재 로그인된 사용자의 아이디를 가져옵니다.
            String id = loginfo.getId();

            MemberDao dao = new MemberDao();

            // 회원 탈퇴 작업 수행
            int cnt = dao.DeleteData(id);

            if (cnt > 0) {
                // 탈퇴 작업이 성공적으로 수행되었을 경우 세션 정보를 삭제하고 로그인 페이지로 이동
                session.removeAttribute("loginfo");
                super.setAlertMessage("회원 탈퇴가 완료되었습니다.");
                super.gotoPage("/member/meLoginForm.jsp");
            } else {
                // 탈퇴 작업이 실패한 경우 메시지를 설정하고 이전 페이지로 이동
                super.setAlertMessage("회원 탈퇴 중 오류가 발생했습니다.");
                super.gotoPage("/member/meDelete.jsp");
            }
        } else {
            // 로그인 정보가 없는 경우 처리 (예: 이미 로그아웃 상태)
            super.setAlertMessage("로그인 정보가 없습니다.");
            super.gotoPage("/member/meLoginForm.jsp");
        }
    }
}
