package com.jeju.controller.member;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jeju.model.dao.MemberDao;

@WebServlet("/IdCheckServlet")
public class IdCheckServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        String id = request.getParameter("id");

        try {
            MemberDao dao = new MemberDao();
            boolean isDuplicate = dao.isIdDuplicate(id);

            if (isDuplicate) {
                out.print("duplicate"); // 중복된 경우 "duplicate"를 응답으로 전송
            } else {
                out.print("available"); // 사용 가능한 경우 "available"을 응답으로 전송
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            out.close();
        }
    }
}
