package controller;

import java.io.IOException; 
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Enumeration;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import Domain.PageMaker;
import Domain.SearchCriteria;
import service.CourseDao;
import service.CourseVo;
import service.InstituteDao;
import service.InstituteVo;
import service.MemberDao;
import service.MemberVo;
import service.NoticeDao;
import service.NoticeVo;
import service.PaymentDao;
import service.PaymentVo;
import service.PaymentinfoDao;
import service.PaymentinfoVo;
import service.PointquizDao;


	@WebServlet("/Myservice")
	public class MyserviceController extends HttpServlet{
		private static final long serialVersionUID = 1L;
		
		protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			System.out.println("1");
			request.setCharacterEncoding("UTF-8");
			//������
			String uri = request.getRequestURI();
			//������Ʈ �̸��� ����
			int len = request.getContextPath().length();
			//������Ʈ �̸��� �� ������
			String str = uri.substring(len);
			
			
			 if(str.equals("/Myservice/myservice.do")) {
				 
				 HttpSession hs = request.getSession(); //				
					String mId = (String)hs.getAttribute("mId");
					String iidx = request.getParameter("iidx");
					MemberDao md = new MemberDao();
					PaymentDao pmd = new PaymentDao();		
					int point = md.getPoint(mId);
					
					if(mId == null) {
						 PrintWriter out=response.getWriter();
						 out.println("<script>alert('Login please!'); location.href='/edupick/Common/login.do';</script>");
						 out.flush();
						 out.close();
					 }
				 
				 //����¡�� �Ķ���ͷ� �Ѱ��ֱ�
		         String page = request.getParameter("page");
		         //����Ʈ�� �ƹ��� �Խù��� ��� 1�� ���̵��� �Ѵ�.
		         if (page == null) page = "1";
		         int pagex = Integer.parseInt(page);
		         System.out.println(pagex);
		         
		         String keyword = request.getParameter("keyword");
		         if(keyword == null) keyword = "";
		            
		         SearchCriteria scri = new SearchCriteria();
		         scri.setPage(pagex);
		         scri.setKeyword(keyword);
		         
		         PageMaker pm = new PageMaker();
		         pm.setScri(scri);
		         
		         InstituteDao id = new InstituteDao();
		         int cnt = id.InstituteTotal(keyword);
		         
		         pm.setTotalCount(cnt);
		         
		         PaymentinfoDao pid = new PaymentinfoDao();
		         ArrayList<PaymentinfoVo> alistmy = pid.mycourse(scri);
		         
		         request.setAttribute("alistmy", alistmy);
		         request.setAttribute("pm", pm);
		         
		        
				
				
				RequestDispatcher rd = request.getRequestDispatcher("/jsp/myservice.jsp");
				rd.forward(request, response);
				
			 }else if(str.equals("/Myservice/enrolment.do")) {
				 	
				 	
				 
				 	HttpSession hs = request.getSession(); //				
					String mId = (String)hs.getAttribute("mId");
					String iidx = request.getParameter("iidx");
					MemberDao md = new MemberDao();
					PaymentDao pmd = new PaymentDao();		
					int point = md.getPoint(mId);
					
					if(mId == null) {
						 PrintWriter out=response.getWriter();
						 out.println("<script>alert('Login please!'); location.href='/edupick/Common/login.do';</script>");
						 out.flush();
						 out.close();
					 }
					
					InstituteDao id = new InstituteDao();
			         int iidx2 = Integer.parseInt(iidx);
			         InstituteVo iv = id.InstituteSelectOne(iidx2);
			         request.setAttribute("iv", iv);
			         
			         String cidx = request.getParameter("cidx");
			         
			         CourseDao cd = new CourseDao();
			         int cidx2 = Integer.parseInt(cidx);
			         CourseVo cv = cd.CourseSelectOne(cidx2);
			         request.setAttribute("cv", cv);
					
					request.setAttribute("mpoint", point);
					
					String midx =(String)hs.getAttribute("midx");
					MemberVo mv = md.getInForm(mId);
					request.setAttribute("vo", mv);
					System.out.println("mv->>>"+mv);
					
//					String piidx = request.getParameter("piidx");
//					System.out.println("piidx"+piidx);
//					int midx2 = Integer.parseInt(midx);
//					System.out.println("midx"+midx);
//			         PaymentinfoDao pid = new PaymentinfoDao();
//			         int piidx2 = Integer.parseInt(piidx);
//			         
//			         int piv = pid.Paymentinfo(piidx2,midx2,iidx2,cidx2);
//			         request.setAttribute("piv", piv);
			         
			        System.out.println("midx"+midx);
			        System.out.println("cidx"+cidx);
			        System.out.println("iidx"+iidx);

					
					
					RequestDispatcher rd = request.getRequestDispatcher("/jsp/enrolment.jsp");
					rd.forward(request, response);						
				
			
			 
			 
			 
			 
			 }else if(str.equals("/Myservice/payment.do")) {
				 
				 	HttpSession hs = request.getSession(); //				
					String mId = (String)hs.getAttribute("mId");
					String iidx = request.getParameter("iidx");
					MemberDao md = new MemberDao();
					PaymentDao pmd = new PaymentDao();		
					int point = md.getPoint(mId);
					
					InstituteDao id = new InstituteDao();
			         int iidx2 = Integer.parseInt(iidx);
			         InstituteVo iv = id.InstituteSelectOne(iidx2);
			         request.setAttribute("iv", iv);
			         
			         String cidx = request.getParameter("cidx");
			         
			         CourseDao cd = new CourseDao();
			         int cidx2 = Integer.parseInt(cidx);
			         CourseVo cv = cd.CourseSelectOne(cidx2);
			         request.setAttribute("cv", cv);
					
					request.setAttribute("mpoint", point);
					
					String midx =(String)hs.getAttribute("midx");
					MemberVo mv = md.getInForm(mId);
					request.setAttribute("vo", mv);
					System.out.println("mv->>>"+mv);
					
							
					RequestDispatcher rd = request.getRequestDispatcher("/jsp/payment.jsp");
					rd.forward(request, response);						
				
			 }else if(str.equals("/Myservice/paymentcomplete.do")) {
				 
				 	HttpSession hs = request.getSession(); //				
					String mId = (String)hs.getAttribute("mId");
					String iidx = request.getParameter("iidx");
					MemberDao md = new MemberDao();
					PaymentDao pmd = new PaymentDao();		
					int point = md.getPoint(mId);
					
					InstituteDao id = new InstituteDao();
			         int iidx2 = Integer.parseInt(iidx);
			         InstituteVo iv = id.InstituteSelectOne(iidx2);
			         request.setAttribute("iv", iv);
			         
			         String cidx = request.getParameter("cidx");
			         
			         CourseDao cd = new CourseDao();
			         int cidx2 = Integer.parseInt(cidx);
			         CourseVo cv = cd.CourseSelectOne(cidx2);
			         request.setAttribute("cv", cv);
					
					request.setAttribute("mpoint", point);
					
					String midx =(String)hs.getAttribute("midx");
					MemberVo mv = md.getInForm(mId);
					request.setAttribute("vo", mv);
					System.out.println("mv->>>"+mv);
					
					
			         
			         
					
							
					RequestDispatcher rd = request.getRequestDispatcher("/jsp/paymentcomplete.jsp");
					rd.forward(request, response);		
					
			 }else if(str.equals("/Myservice/paymentAction.do")) {
				
				 HttpSession hs = request.getSession(); //				
					String mId = (String)hs.getAttribute("mId");
					MemberDao md = new MemberDao();
					
					//String Midx =(String)hs.getAttribute("midx");
					MemberVo mv = md.getInForm(mId);
					request.setAttribute("vo", mv);
					System.out.println("mv->>>"+mv);
				 
				 
				//1. input name���� �Ѱ� �޴´�
		            
		           // String Midx = request.getParameter("midx");
		            String Iidx = request.getParameter("iidx");
		            String Cidx = request.getParameter("cidx");
		           // String Pdidx = request.getParameter("pdidx");
		          
		            System.out.println("midx = "+mv.getMidx());
		            System.out.println("iidx = "+Iidx);
		            System.out.println("cidx = "+Cidx);
		            
		            //2. Dao��ü�� �������Ѽ� �Ѿ��  ���� �Է��Ѵ�
		            PaymentinfoDao pid = new PaymentinfoDao();

		            PaymentVo pv = new PaymentVo();

		            int Iidx2 = Integer.parseInt(Iidx);
		            int Cidx2 = Integer.parseInt(Cidx);
		           // int Pdidx2 = Integer.parseInt(Pdidx);
		            
		            System.out.println("�����̵𿢽�"+mv.getMidx());
		            System.out.println("������Ʈ!"+mv.getMpoint());
		            
		            pid.Paymentinfo(mv.getMidx(),Iidx2,Cidx2);
		            
		            int value = md.PointModify(mv.getMidx(), mv.getMpoint());
				 
				RequestDispatcher rd = request.getRequestDispatcher("/Myservice/myservice.do");
				rd.forward(request, response);
			 
				
			 }else if(str.equals("/Myservice/learnerinformation.do")) {
					
							
					RequestDispatcher rd = request.getRequestDispatcher("/jsp/learnerinformation.jsp");
					rd.forward(request, response);						
				
			 }else if(str.equals("/Myservice/visitpayment.do")) {
					
							
					RequestDispatcher rd = request.getRequestDispatcher("/jsp/visitpayment.jsp");
					rd.forward(request, response);						
				
			 }else if(str.equals("/Myservice/seecart.do")) {
					
							
					RequestDispatcher rd = request.getRequestDispatcher("/jsp/seecart.jsp");
					rd.forward(request, response);						
				
			 }else if(str.equals("/Myservice/cart.do")) {
					
							
					RequestDispatcher rd = request.getRequestDispatcher("/jsp/cart.jsp");
					rd.forward(request, response);						
				
			 }else if(str.equals("/Myservice/paymentmodify.do")) {
					
					
					RequestDispatcher rd = request.getRequestDispatcher("/jsp/paymentmodify.jsp");
					rd.forward(request, response);						
				
			 }else if(str.equals("/Myservice/paymentchange.do")) {
					
					
					RequestDispatcher rd = request.getRequestDispatcher("/jsp/paymentchange.jsp");
					rd.forward(request, response);						
				
			 }
	
			 
		}

				

		protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			doGet(request, response);
			
			
		}
	
	
	
}
	
	
	
	
	
	

