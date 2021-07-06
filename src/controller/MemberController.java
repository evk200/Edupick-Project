package controller;

import java.io.IOException; 

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import service.LicenseeDao;
import service.LicenseeVo;
import service.MemberDao;
import service.MemberVo;
import service.PointquizDao;
import service.PointquizVo;

@WebServlet("/Member")
public class MemberController extends HttpServlet {
   
   private static final long serialVersionUID = 1L;
   
   protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      
      request.setCharacterEncoding("UTF-8");
      //절대경로
      String uri = request.getRequestURI();
      //프로젝트 이름의 길이
      int len = request.getContextPath().length();
      //프로젝트 이름을 뺀 가상경로
      String str = uri.substring(len);
      
      
       if(str.equals("/Member/memberAgree.do")) {
         
         RequestDispatcher rd = request.getRequestDispatcher("/jsp/memberAgree.jsp");
         rd.forward(request, response);
         
         
      //일반회원 회원가입입력창
      }else if(str.equals("/Member/memberInput.do")) {
         
         RequestDispatcher rd = request.getRequestDispatcher("/jsp/memberInput.jsp");
         rd.forward(request, response);
   
         
      }
      else if(str.equals("/Member/memberInputAction.do")) {
      
         
         
         String mId = request.getParameter("mId");
         String mName = request.getParameter("mName");
         String mPwd = request.getParameter("mPwd");
         String mEmail1 = request.getParameter("mEmail1");
         String mEmail2 = request.getParameter("mEmail2");
         String mEmail = mEmail1 +"@"+ mEmail2;
         String mPostCode = request.getParameter("sample4_postcode");
         String mRoadAddr = request.getParameter("sample4_roadAddress");
         String mJibunAddr = request.getParameter("sample4_jibunAddress");
         String mDetailAddr = request.getParameter("sample4_detailAddress");
         String mExtraAddr = request.getParameter("sample4_extraAddress");
         String mTel0 = request.getParameter("mTel0");
         String mTel1 = request.getParameter("mTel1");
         String mTel2 = request.getParameter("mTel2");
         String mTel = mTel0+"-"+mTel1+"-"+mTel2;
         String mJumin0 = request.getParameter("mJumin0");
         String mJumin1 = request.getParameter("mJumin1");
         String mJumin = mJumin0+"-"+mJumin1;
         int mPoint = 0;
         
         System.out.println("mId->"+mId);
         System.out.println("mName->"+mName);
         System.out.println("mPwd->"+mPwd);
         System.out.println("mJumin->"+mJumin);
         System.out.println("mDetailAddr->"+mDetailAddr);
         System.out.println("mEmail->"+mEmail);
         System.out.println("mTel->"+mTel);
         
      
         MemberDao md = new MemberDao();
         md.memberInsert(mId, mName, mPwd, mJumin, mPostCode, mRoadAddr, mJibunAddr, mDetailAddr, mExtraAddr, mEmail, mTel, mPoint);
         
         response.sendRedirect(request.getContextPath()+"/Common/InputOk.do");
      
      }
      else if(str.equals("/Member/memberModifyAction.do")) {
         
         
         String midx = request.getParameter("midx");
         int midx2 = Integer.parseInt(midx);
         String mPwd = request.getParameter("modipwd");
         String mPostCode = request.getParameter("sample4_postcode");
         String mRoadAddr = request.getParameter("sample4_roadAddress");
         String mJibunAddr = request.getParameter("sample4_jibunAddress");
         String mDetailAddr = request.getParameter("sample4_detailAddress");
         String mExtraAddr = request.getParameter("sample4_extraAddress");
         String mEmail1 = request.getParameter("modiemail");
         String mEmail2 = request.getParameter("modiemail");
         String mEmail = mEmail1 + "@" + mEmail2;
         String mTel1 = request.getParameter("phone1");
         String mTel2 = request.getParameter("phone2");
         String mTel3 = request.getParameter("phone3");
         String mTel = mTel1 + "-" + mTel2 + "-" + mTel3; 
   
         
         MemberDao md = new MemberDao();
         int value = md.memberModify(midx2, mPwd, mPostCode, mRoadAddr, mJibunAddr,  mDetailAddr, mExtraAddr, mEmail,  mTel);
         response.sendRedirect(request.getContextPath()+"/Common/main.do");   
      
      }
     
      else if(str.equals("/Member/Quiz.do")) {
          System.out.println("/Member/Quiz.do");
    	  
    	  
    	  //pidx 넘기기x
			//2.db에 저장된 데이터를 nbidx에 대한 데이터를 가져온다
			PointquizDao pd = new PointquizDao();
			PointquizVo pv = pd.PointquizRandom();
			//3.리턴 받은 bv를 담는다
			request.setAttribute("pv", pv);

    	  
          RequestDispatcher rd = request.getRequestDispatcher("/jsp/quiz.jsp");
          rd.forward(request, response);
    
          
       }
      
      else if(str.equals("/Member/AddPoint.do")) {
         System.out.println("/Member/AddPoint.do");  
    	  
    	  
     	  //1.ajax를 이용해서 이쪽 으로 넘어오게됨
    	  //2.memberDao 에 로그인 회원 포인트 업데이트 구문 추가
    	  //2_1. 로그인 회원 정보는 세션의 mid 겟해서 사용
    	  //3.memberdao를 이용하여 포인트 업데이트 호출해서 update
    	  //4.끝
    	  

    	  HttpSession hs = request.getSession(); 
		  String mId = (String)hs.getAttribute("mId");
	
			
			
	//		request.setAttribute("mv", mv);
	//		request.setAttribute("md", md);
		  	MemberDao md = new MemberDao();
			int value = md.AddPoint(mId);
			
	//		request.setAttribute("mpoint", point);
			
		//	if (value != 0) {
				
	//		}
			
	          
        }
         
         
   
   }
   protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      doGet(request, response);
   
      
   
   }

}
