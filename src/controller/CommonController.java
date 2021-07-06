package controller;

import java.io.IOException;        
import java.io.PrintWriter;

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




@WebServlet("/Common")
public class CommonController extends HttpServlet{
   private static final long serialVersionUID = 1L;
   
   protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      System.out.println("1");
      request.setCharacterEncoding("UTF-8");
      //절대경로
      String uri = request.getRequestURI();
      //프로젝트 이름의 길이
      int len = request.getContextPath().length();
      //프로젝트 이름을 뺀 가상경로
      String str = uri.substring(len);
      
      
      
         //intro 페이지 가상경로
      if (str.equals("/Common/intro.do")) {
            
          RequestDispatcher rd = request.getRequestDispatcher("/jsp/intro.jsp");
         rd.forward(request, response);   
               
         
      }else if(str.equals("/Common/main.do")) {
         
    	//2.db에 저장된 데이터를 nbidx에 대한 데이터를 가져온다
//			
//			
//			
			HttpSession hs = request.getSession(); //				
			String mId = (String)hs.getAttribute("mId");
			
			MemberDao md = new MemberDao();
			int point = md.getPoint(mId);
			request.setAttribute("mpoint", point);
			
       
       RequestDispatcher rd = request.getRequestDispatcher("/jsp/main.jsp");
       rd.forward(request, response);     
         
      
         //main페이지에서 회원가입 버튼 누를 시 가상경로   
      }else if(str.equals("/Common/joinstart.do")) {
         
         RequestDispatcher rd = request.getRequestDispatcher("/jsp/joinstart.jsp");
         rd.forward(request, response);   
      
         //ID 중복확인 jsp연결
       }else if(str.equals("/Common/checkid.do")) {                         
          
             String id = (String)request.getParameter("id");
             
             System.out.println("화면에서 넘어온 id->"+id);
             
             MemberDao md = new MemberDao();
             
             //LicenseeDao ld = new LicenseeDao();
             
             boolean r = md.checkId(id);
             
             request.setAttribute("id", id);
             request.setAttribute("b", r);
             System.out.println("rrr" + id);
             System.out.println("ddd"+r);
             //dao를 통하여 화면에서 넘어온 id 를 이용한 id 체크
            RequestDispatcher rd = request.getRequestDispatcher("/jsp/check_id.jsp");
            rd.forward(request, response);
      
      }else if(str.equals("/Common/InputOk.do")) {
         
         RequestDispatcher rd = request.getRequestDispatcher("/jsp/InputOk.jsp");
         rd.forward(request, response);   
   
      }else if(str.equals("/Common/login.do")) {
         
         RequestDispatcher rd = request.getRequestDispatcher("/jsp/login.jsp");
         rd.forward(request, response);   
      
      
      }else if (str.equals("/Common/loginAction.do")) {
      
         
         
         String tabs = request.getParameter("tabs");
         HttpSession session = request.getSession();   
         
         if (tabs.equals("member")) {
            String mId =  request.getParameter("loginmid");
            String mPwd = request.getParameter("loginmpwd");
            
            MemberDao md = new MemberDao();
            int value = md.loginCheck(mId, mPwd);
            System.out.println("개인 로그인체크:"+ value);
            
         
            if(value != 0) {
               
			String mName  = md.getName(mId, mPwd);
               session.setAttribute("loginname",mName);
               session.setAttribute("mId", mId);
               session.setAttribute("userType", "M");
               session.setAttribute("mdelyn","N");
               	
               
               response.sendRedirect(request.getContextPath()+"/Common/main.do"); 
            }else {
               response.setContentType("text/html; charset=UTF-8");
               PrintWriter out = response.getWriter();
               out.println("<script>alert('아이디 및 패스워드를 다시 입력해주세요.')");
               out.println("history.back();");
               out.println("</script>");
               out.println("documenet.location.href="+request.getContextPath()+"/Common/login.do");;
            }
         
         }else {
            String lId =  request.getParameter("loginlid");
            String lPwd = request.getParameter("loginlpwd");
            
            LicenseeDao ld = new LicenseeDao();
            int value2 = ld.loginCheck(lId, lPwd);
          System.out.println("value2-"+value2);
            
            if(value2 != 0 ) {               
               LicenseeVo lvo = ld.getName(lId, lPwd);
               session.setAttribute("loginname", lvo.getLname());
               session.setAttribute("lgrade", lvo.getLgrade());
               session.setAttribute("lId" , lId);
               session.setAttribute("userType", "L");
        
              
    
               // 로그인 정보 가져올때 회원 이름 및 회원 관리자 여부 필드 까지 포함해서 vo로 담아옴
               // vo에 있는 각각 정보 session에 set해주는데 이때, 만약 vo 정보 중 로그인을 시도하는 회원이 관리자 일 경우
               // session에 admin 여부를 Y로 준다.
               response.sendRedirect(request.getContextPath()+"/Common/main.do"); // 로그인화면으로 리다이렉트         
          
            }else {
               response.setContentType("text/html; charset=UTF-8");
               PrintWriter out = response.getWriter();
               out.println("<script>alert('아이디 및 패스워드를 다시 입력해주세요.')");
               out.println("history.back();");
               out.println("</script>");
               out.println("documenet.location.href="+request.getContextPath()+"/Common/login.do");
            }
         
            
         }         
         
         
   
      }else if(str.equals("/Common/find.do")){
         
         RequestDispatcher rd = request.getRequestDispatcher("/jsp/find.jsp");
         rd.forward(request, response);   
      
      //아이디찾기
      }else if(str.equals("/Common/findIdAction.do")){
      
         String tabs = request.getParameter("tabs");
         
         if (tabs.equals("id")) {
            String mName =  request.getParameter("idname");
            String mTel = request.getParameter("idtel");
            
            MemberDao md = new MemberDao();
            String findmid = md.findId(mName, mTel);
            
            System.out.println("개인 아이디찾기체크:"+ findmid);
            
            String mId = null;
            if(findmid != null) {
                mId = md.findId(mName, mTel);
               request.setAttribute("mlid", mId );
               
               RequestDispatcher rd = request.getRequestDispatcher("/Common/searchid.do");
               rd.forward(request, response); 
               
               System.out.println("넘어가는 개인아이디->>"+mId);
            }else {
               response.setContentType("text/html; charset=UTF-8");
               PrintWriter out = response.getWriter();
               out.println("<script>alert('등록된 정보로 가입된 아이디가 없습니다.')");
               out.println("history.back();");
               out.println("</script>");
               out.println("documenet.location.href="+request.getContextPath()+"/Common/find.do");;
            }
         
         }else {
            String lName =  request.getParameter("idname");
            String lTel = request.getParameter("idtel");
         
            LicenseeDao ld = new LicenseeDao();
            String findlid = ld.findId(lName, lTel);
            System.out.println("사업자 아이디찾기체크:"+ findlid);
         
            if(findlid != null) {
               String lId = ld.findId(lName, lTel);
               request.setAttribute("mlid", lId );
               
               RequestDispatcher rd = request.getRequestDispatcher("/Common/searchid.do");
               rd.forward(request, response); 
              
            }else {
               response.setContentType("text/html; charset=UTF-8");
               PrintWriter out = response.getWriter();
               out.println("<script>alert('등록된 정보로 가입된 아이디가 없습니다.')");
               out.println("history.back();");
               out.println("</script>");
               out.println("documenet.location.href="+request.getContextPath()+"/Common/find.do");;
               }
            }
         
      }else if(str.equals("/Common/findPwdAction.do")){
            
            String tabs = request.getParameter("tabs");
            System.out.println("tabs="+tabs);
            if (tabs.equals("pwd")) {
               String mId =  request.getParameter("pwdid");
               String mName = request.getParameter("pwdname");
               String mJumin1 = request.getParameter("pwdjumin1");
               String mJumin2 = request.getParameter("pwdjumin2");
               String mJumin = mJumin1 + mJumin2; 
               MemberDao md = new MemberDao();
               String findmpwd = md.findPwd(mId, mName, mJumin);
               
               System.out.println("개인 비밀번호찾기체크:"+ findmpwd);
               
               if(findmpwd != null) {
                  String mPwd = md.findPwd(mId ,mName, mJumin);
                  request.setAttribute("mlpwd", mPwd );
                  
                  RequestDispatcher rd = request.getRequestDispatcher("/Common/searchid.do");
                  rd.forward(request, response); 
                  System.out.println("넘어가는 개인비밀번호->>"+mPwd);
               }else {
                  response.setContentType("text/html; charset=UTF-8");
                  PrintWriter out = response.getWriter();
                  out.println("<script>alert('가입된 아이디가 없어 비밀번호를 찾을 수 없습니다.')");
                  out.println("history.back();");
                  out.println("</script>");
                  out.println("documenet.location.href="+request.getContextPath()+"/Common/find.do");;
               }
            
            }else {
               String lId =  request.getParameter("pwdid");
               String lName = request.getParameter("pwdname");
               String lJumin1 = request.getParameter("pwdjumin1");
               String lJumin2 = request.getParameter("pwdjumin2");
               String lJumin = lJumin1 + lJumin2;
            
               LicenseeDao ld = new LicenseeDao();
               String findlpwd = ld.findPwd(lId, lName, lJumin);
               System.out.println("사업자 비밀번호찾기체크:"+ findlpwd);
            
               if(findlpwd != null) {
                  String lPwd = ld.findPwd(lId ,lName, lJumin);
                  request.setAttribute("mlpwd", lId );
                  
                  RequestDispatcher rd = request.getRequestDispatcher("/Common/searchid.do");
                  rd.forward(request, response); 
                  System.out.println("넘어가는 개인비밀번호->>"+lPwd);
               }else {
                  response.setContentType("text/html; charset=UTF-8");
                  PrintWriter out = response.getWriter();
                  out.println("<script>alert('가입된 아이디가 없어 비밀번호를 찾을 수 없습니다.')");
                  out.println("history.back();");
                  out.println("</script>");
                  out.println("documenet.location.href="+request.getContextPath()+"/Common/find.do");
               }   
            }
      
      }else if (str.equals("/Common/logout.do")) {
      
      HttpSession session = request.getSession();
      session.invalidate();
      response.sendRedirect(request.getContextPath()+"/Common/main.do");                     
   
      }else if(str.equals("/Common/searchid.do")){
         
         RequestDispatcher rd = request.getRequestDispatcher("/jsp/searchid.jsp");
         rd.forward(request, response);   
   
      }else if(str.equals("/Common/searchpwd.do")){
         
         RequestDispatcher rd = request.getRequestDispatcher("/jsp/searchpwd.jsp");
         rd.forward(request, response);   
      
      
      }
      else if(str.equals("/Common/Modify.do")){
         
         
         HttpSession session = request.getSession();
         
         String userType = (String)session.getAttribute("userType");
         if(userType.equals("M")) {
            
            String midx =(String)session.getAttribute("midx");
        	String mId = (String)session.getAttribute("mId");
            MemberDao md = new MemberDao();
            MemberVo mv = md.getInForm(mId);
            request.setAttribute("vo", mv);
            System.out.println("mv->>>"+mv);
         }else {
            String lidx = (String)session.getAttribute("lidx");
        	String lId = (String)session.getAttribute("lId");
            LicenseeDao ld = new LicenseeDao();
            LicenseeVo lv = ld.getInForm(lId);
            request.setAttribute("vo", lv);
            System.out.println("lv--->>"+lv);
         }
         
         RequestDispatcher rd = request.getRequestDispatcher("/jsp/modify.jsp");
         rd.forward(request, response);
      
      }
      
      else if(str.equals("/Common/deleteAction.do")) {
    	  HttpSession session = request.getSession();
    	  String userType = (String)session.getAttribute("userType");
    	 
    	  
    	  if(userType.equals("M")) { 
    		 
    		  
    		  String midx = request.getParameter("midx");
    		  System.out.println("midx->"+midx);
    		  int midx2 = Integer.parseInt(midx);
    		  String mPwd = request.getParameter("dpwd");
    		  System.out.println("mpwd->"+mPwd);
    		  MemberDao md = new MemberDao();
    		  int result = md.memberDelete(midx2, mPwd);
    		  
    		   if(result > 0){
    			  
    			  response.setContentType("text/html; charset=UTF-8");
    			  PrintWriter out = response.getWriter();
                  out.println("<script>alert('회원탈퇴가 완료되었습니다.')");
                  out.println("location.href='"+request.getContextPath()+"/Common/logout.do'");
                  out.println("</script>");
                  
                  
    			  
    		  }else {
    			  
    			  response.setContentType("text/html; charset=UTF-8");
    			  PrintWriter out = response.getWriter();
                  out.println("<script>alert('회원정보가 맞지 않습니다.')");
                  out.println("history.back();");
                  out.println("</script>");
                  
    		  }
    		  
    		  
    	  }else {
    		  
    		  String lidx = request.getParameter("lidx");
    		  int lidx2 = Integer.parseInt(lidx);
    		  String lPwd = request.getParameter("dpwd");
    		  LicenseeDao ld = new LicenseeDao();
    		  int ldelete = ld.licenseeDelete(lidx2,lPwd);
    		  

    		  if(ldelete > 0) {
    			  
    			  response.setContentType("text/html; charset=UTF-8");
    			  PrintWriter out = response.getWriter();
                  out.println("<script>alert('회원탈퇴가 완료되었습니다.')");
                  out.println("location.href='"+request.getContextPath()+"/Common/logout.do'");
                  out.println("</script>");
                
                  
    			  
    		  }else {
    			  
    			  response.setContentType("text/html; charset=UTF-8");
    			  PrintWriter out = response.getWriter();
                  out.println("<script>alert('회원정보가 맞지 않습니다.')");
                  out.println("history.back();");
                  out.println("</script>");
                  
    		  }    		  
    	  }
    	  
      }
      
   }
	
    	  



   protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      doGet(request, response);
   }
   
}