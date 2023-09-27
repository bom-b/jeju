package com.jeju.controller.member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.jeju.controller.SuperClass;
import com.jeju.model.bean.Member;
import com.jeju.model.dao.MemberDao;

public class MemberUpdateController extends SuperClass {
    
    @Override
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws Exception {
        super.doGet(request, response);
        
        // 세션에서 현재 로그인된 사용자의 정보를 가져옵니다.
        Member loginfo = (Member) session.getAttribute("loginfo");

        if (loginfo != null) {
            // 기존 회원 정보를 가져옵니다.
            String id = loginfo.getId();
            String password = loginfo.getPassword();
            MemberDao dao = new MemberDao();
            Member bean = dao.getDataByPk(id, password);

            // 회원 정보를 JSP 페이지로 전달합니다.
            request.setAttribute("bean", bean);
            super.gotoPage("/member/meUpdateForm.jsp");
        } else {
            // 로그인 정보가 없을 경우 처리
            // 예를 들어 로그인 페이지로 이동하거나 에러 메시지를 출력하는 등의 처리를 여기에 추가할 수 있습니다.
        }
    }

    @Override
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws Exception {
        super.doPost(request, response);
        	
        // 사용자로부터 입력받은 수정된 회원 정보를 가져옵니다.
        String id = request.getParameter("id");
        String password = request.getParameter("password");
        String name = request.getParameter("name");
        String gender = request.getParameter("gender");
        String mquestion = request.getParameter("mquestion");
        String manswer = request.getParameter("manswer");
        int mphoneno = Integer.parseInt(request.getParameter("mphoneno"));
        String birth = request.getParameter("birth");

        // 수정된 회원 정보를 Member 객체에 설정합니다.
        Member updatedMember = new Member();
        updatedMember.setId(id);
        updatedMember.setPassword(password);
        updatedMember.setName(name);
        updatedMember.setGender(gender);
        updatedMember.setMquestion(mquestion);
        updatedMember.setManswer(manswer);
        updatedMember.setMphoneno(mphoneno);
        updatedMember.setBirth(birth);

        MemberDao dao = new MemberDao();
        // WHERE 절에 현재 로그인한 사용자의 아이디를 추가하여 업데이트
        int updatedRows = dao.UpdateData(updatedMember);

     // 회원 정보가 업데이트되었을 때 Redirect를 사용하여 다른 페이지로 이동
        if (updatedRows > 0) {
            super.setAlertMessage("회원 정보가 업데이트되었습니다.");
            // 수정된 데이터 확인 페이지로 Redirect
            new MemberDetailController().doGet(request, response);
        } else {
            super.setAlertMessage("회원 정보 업데이트에 실패했습니다.");
            new MemberUpdateController().doGet(request, response);
        }

    }
}
