package com.jeju.controller.member;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.jeju.controller.SuperClass;
import com.jeju.model.bean.Member;
import com.jeju.model.dao.MemberDao;
import com.jeju.utility.Paging;

public class MemberListDeleteProcess extends SuperClass {
    @Override
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws Exception {
        super.doPost(request, response);
        String pageNumber = request.getParameter("pageNumber") ;
		String pageSize = request.getParameter("pageSize") ;
		String mode = request.getParameter("mode") ;
		String keyword = request.getParameter("keyword") ;
        
        String memberId = request.getParameter("memberId"); // JSP에서 전달된 memberId를 가져옴
        MemberDao dao = new MemberDao();
        int cnt = -1;
        
        try {
            cnt = dao.DeleteData(memberId); // memberId를 사용하여 회원 삭제
            if (cnt > 0) {
                super.setAlertMessage("선택하신 회원의 탈퇴가 완료되었습니다.");
                int totalCount = dao.GetTotalRecordCount(); 
    			String url = super.getUrlInfomation("meList") ;
    			boolean isGrid = false ;
    			Paging pageInfo = new Paging(pageNumber, pageSize, totalCount, url, mode, keyword, isGrid);
    			
    			List<Member> lists = dao.selectAll(pageInfo);
    			
    			request.setAttribute("pageInfo", pageInfo);
    			request.setAttribute("datalist", lists);
                super.gotoPage("/member/meList.jsp");
            } else {
                super.setAlertMessage("회원 탈퇴 중 오류가 발생했습니다.");
                super.gotoPage("/member/meMenuForm.jsp");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
