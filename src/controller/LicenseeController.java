package controller;

import java.io.IOException;    
import java.net.InetAddress;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import service.LicenseeDao;
import service.MemberDao;


   @WebServlet("/Licensee")
   public class LicenseeController extends HttpServlet {
      
      private static final long serialVersionUID = 1L;

      protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      System.out.println("doGet");
      request.setCharacterEncoding("UTF-8");
      //절대경로
      String uri = request.getRequestURI();
      //프로젝트 이름의 길이
      int len = request.getContextPath().length();
      //프로젝트 이름을 뺀 가상경로
      String str = uri.substring(len);
      
      
      
      if(str.equals("/Licensee/licenseeAgree.do")) {
         System.out.println("licenseeAgree");
         RequestDispatcher rd = request.getRequestDispatcher("/jsp/licenseeAgree.jsp");
         rd.forward(request, response);   
         
      }else if(str.equals("/Licensee/licenseeInput.do")) {
         System.out.println("licenseeInput");
               
         RequestDispatcher rd = request.getRequestDispatcher("/jsp/licenseeInput.jsp");
         rd.forward(request, response);   
      
      
      
      }else if(str.equals("/Licensee/licenseeInputAction.do")) {
         
      
         String lId = request.getParameter("lId");
         String lPwd = request.getParameter("lPwd");
         String lName = request.getParameter("lName");
         String lEmail1 = request.getParameter("lEmail1");
         String lEmail2 = request.getParameter("lEmail2");
         String lEmail = lEmail1 +"@"+ lEmail2;
         String lPostCode = request.getParameter("sample4_postcode");
         String lRoadAddr = request.getParameter("sample4_roadAddress");
         String lJibunAddr = request.getParameter("sample4_jibunAddress");
         String lDetailAddr =request.getParameter("sample4_detailAddress");
         String lExtraAddr =request.getParameter("sample4_extraAddress");
         String lTel1 = request.getParameter("lTel0");
         String lTel2 = request.getParameter("lTel1");
         String lTel3 = request.getParameter("lTel2");
         String lTel = lTel1 +"-" +lTel2 +"-"+lTel3;
         String lJumin0 = request.getParameter("lJumin0");
         String lJumin1 = request.getParameter("lJumin1");
         String lJumin = lJumin0 +"-" +lJumin1;
         String lComName = request.getParameter("lComName");
         String lNumber1 = request.getParameter("lNumber1");
         String lNumber2 = request.getParameter("lNumber2");
         String lNumber3 = request.getParameter("lNumber3");
         String lNumber = lNumber1 +"-" +lNumber2 +"-" +lNumber3;
   
         
         System.out.println("lId"+lId);
         System.out.println("lName"+lName);
         System.out.println("lPwd"+lPwd);
         System.out.println("lEmail"+lEmail);
         System.out.println("lEmail1"+lEmail1);
         System.out.println("lEmail2"+lEmail2);
         System.out.println("lTel"+lTel);
         System.out.println("lTel1"+lTel1);
         System.out.println("lTel2"+lTel2);
         System.out.println("lTel3"+lTel3);
         System.out.println("lJumin0"+lJumin0);
         System.out.println("lJumin1"+lJumin1);
         System.out.println("lJumin"+lJumin);
         System.out.println("lComName"+lComName);
         System.out.println("lNumber"+lNumber);
         
         
         
         
         LicenseeDao ld = new LicenseeDao();
         ld.licenseeInsert(lId, lName, lPwd, lJumin, lPostCode, lRoadAddr, lJibunAddr, lDetailAddr, lExtraAddr, lEmail, lTel, lComName, lNumber);
         
         response.sendRedirect(request.getContextPath()+"/Common/InputOk.do");
      
         }else if(str.equals("/Licensee/licenseeModifyAction.do")) {
            
            
            String lidx = request.getParameter("lidx");
            int lidx2 = Integer.parseInt(lidx);
            String lPwd = request.getParameter("modipwd");
            String lPostCode = request.getParameter("sample4_postcode");
            String lRoadAddr = request.getParameter("sample4_roadAddress");
            String lJibunAddr = request.getParameter("sample4_jibunAddress");
            String lDetailAddr = request.getParameter("sample4_detailAddress");
            String lExtraAddr = request.getParameter("sample4_extraAddress");
            String lEmail1 = request.getParameter("modiemail");
            String lEmail2 = request.getParameter("modiemail");
            String lEmail = lEmail1 + "@" + lEmail2;
            String lTel1 = request.getParameter("phone1");
            String lTel2 = request.getParameter("phone2");
            String lTel3 = request.getParameter("phone3");
            String lTel = lTel1 + "-" + lTel2 + "-" + lTel3; 
            String lComName = request.getParameter("modicomname");
            String lNumber1 = request.getParameter("lnumber1");
            String lNumber2 = request.getParameter("lnumber2");
            String lNumber3 = request.getParameter("lnumber3");
            String lNumber =  lNumber1 +"-" +lNumber2 +"-" +lNumber3;
            
         	LicenseeDao ld = new LicenseeDao();
            int value2 = ld.licenseeModify(lidx2, lPwd, lPostCode, lRoadAddr, lJibunAddr,  lDetailAddr, lExtraAddr, lEmail,  lTel, lComName, lNumber );
            response.sendRedirect(request.getContextPath()+"/Common/main.do");   
         }      
      	
      
      
      }
   protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
         doGet(request, response);
   
   }
}      
   

   
