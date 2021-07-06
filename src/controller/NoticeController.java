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
import service.CustomerServiceDao;
import service.CustomerServiceVo;
import service.EduinformationDao;
import service.EduinformationVo;
import service.NoticeDao;
import service.NoticeVo;

	@WebServlet("/Notice")
	public class NoticeController extends HttpServlet {
	
		private static final long serialVersionUID = 1L;

		protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			
			request.setCharacterEncoding("UTF-8");
			//절대경로
			String uri = request.getRequestURI();
			//프로젝트 이름의 길이
			int len = request.getContextPath().length();
			//프로젝트 이름을 뺀 가상경로
			String str = uri.substring(len);	

			if(str.equals("/Notice/notice.do")) {
				
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
				
				NoticeDao nd = new NoticeDao();
				int cnt = nd.NoticeTotal(keyword);
				
	
				pm.setTotalCount(cnt);
					
				
				//BoardDao bd = new BoardDao();
				ArrayList<NoticeVo> alist = nd.NoticeSelectAll(scri);
				
				request.setAttribute("alist", alist);
				request.setAttribute("pm", pm);	
				
				ArrayList<NoticeVo> alistuse = nd.NoticeuseSelect(scri);
				
				request.setAttribute("alistuse", alistuse);
				request.setAttribute("pm", pm);	
				
				ArrayList<NoticeVo> alistevent = nd.NoticeeventSelect(scri);
				
				request.setAttribute("alistevent", alistevent);
				request.setAttribute("pm", pm);	
				
				RequestDispatcher rd = request.getRequestDispatcher("/jsp/notice.jsp");
				rd.forward(request, response);	
				
						
				
			
			}else if(str.equals("/Notice/noticedetail.do")) {
				
				String nidx = request.getParameter("nidx");
				
				//2.db에 저장된 데이터를 nbidx에 대한 데이터를 가져온다
				NoticeDao nd = new NoticeDao();
				int nidx2 = Integer.parseInt(nidx);
				NoticeVo nv = nd.NoticeSelectOne(nidx2);
				//3.리턴 받은 bv를 담는다
				request.setAttribute("nv", nv);	
				
						
				RequestDispatcher rd = request.getRequestDispatcher("/jsp/noticedetail.jsp");
				rd.forward(request, response);	
		
			}		
			
		}
	

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);

}
}		