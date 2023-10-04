package com.jeju.controller.free;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jeju.controller.SuperClass;

import com.jeju.model.dao.freeBoardDao;

public class freeDeleteController extends SuperClass{
   @Override
   public void doGet(HttpServletRequest request, HttpServletResponse response) throws Exception {
      super.doGet(request, response);
      
      String ono = String.valueOf(request.getParameter("ono"));
      
      freeBoardDao dao = new freeBoardDao();
      int cnt = -1;
      
      try { //삭제 성공
         cnt = dao.DeleteDate(ono);
         new freeBoardMainController().doGet(request, response); 
     
       
      } catch (Exception e) {
         e.printStackTrace();
         
      }
   }


}