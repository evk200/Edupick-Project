package controller;

import java.io.IOException; 
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Domain.PageMaker;
import Domain.SearchCriteria;
import service.EduinformationDao;
import service.EduinformationVo;
import service.NoticeDao;
import service.NoticeVo;


	@WebServlet("/Eduinformation")
	public class EduinformationController extends HttpServlet {
		
		private static final long serialVersionUID = 1L;

		protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

			request.setCharacterEncoding("UTF-8");
			//절대경로
			String uri = request.getRequestURI();
			//프로젝트 이름의 길이
			int len = request.getContextPath().length();
			//프로젝트 이름을 뺀 가상경로
			String str = uri.substring(len);
		
			 if(str.equals("/Eduinformation/eduinformation.do")) {
					
				//페이징처리
					String page = request.getParameter("page");
					if(page==null) page = "1";
					int pagex = Integer.parseInt(page);	
					//키워드 검색
					String keyword = request.getParameter("keyword");
					if(keyword == null) keyword = "";							
					
					SearchCriteria scri = new SearchCriteria();
					
					scri.setPage(pagex);
					scri.setKeyword(keyword);
					
					PageMaker pm = new PageMaker();
					pm.setScri(scri);
					
					EduinformationDao ed = new EduinformationDao();
					int cnt = ed.EduinformationTotal(keyword);
					
		
					pm.setTotalCount(cnt);
						
					
					//BoardDao bd = new BoardDao();
					ArrayList<EduinformationVo> alist2 = ed.EduinformationSelectAll(scri);
					
					request.setAttribute("alist2", alist2);
					request.setAttribute("pm", pm);	
					
					ArrayList<EduinformationVo> alistelementary = ed.EduinformationelementarySelect(scri);
					
					request.setAttribute("alistelementary", alistelementary);
					request.setAttribute("pm", pm);	
					
					ArrayList<EduinformationVo> alistmiddle = ed.EduinformationmiddleSelect(scri);
					
					request.setAttribute("alistmiddle", alistmiddle);
					request.setAttribute("pm", pm);
					
					ArrayList<EduinformationVo> alisthigh = ed.EduinformationhighSelect(scri);
					
					request.setAttribute("alisthigh", alisthigh);
					request.setAttribute("pm", pm);
					
					ArrayList<EduinformationVo> alistuniversity = ed.EduinformationuniversitySelect(scri);
					
					request.setAttribute("alistuniversity", alistuniversity);
					request.setAttribute("pm", pm);
				 
				 
					RequestDispatcher rd = request.getRequestDispatcher("/jsp/eduinformation.jsp");
					rd.forward(request, response);
					
			}else if(str.equals("/Eduinformation/eduinformationdetail.do")) {
				
				String eidx = request.getParameter("eidx");
				
				//2.db에 저장된 데이터를 nbidx에 대한 데이터를 가져온다
				EduinformationDao ed = new EduinformationDao();
				int eidx2 = Integer.parseInt(eidx);
				EduinformationVo ev = ed.EduinformationSelectOne(eidx2);
				//3.리턴 받은 bv를 담는다
				request.setAttribute("ev", ev);
				
				
				RequestDispatcher rd = request.getRequestDispatcher("/jsp/eduinformationdetail.jsp");
				rd.forward(request, response);
				
		
			}
		
		
		
		
		
		
		
		
		}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	doPost(request, response);


	}
}