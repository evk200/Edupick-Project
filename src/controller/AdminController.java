package controller;

import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException; 
import java.util.ArrayList;
import java.util.Enumeration;

import javax.imageio.ImageIO;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.imgscalr.Scalr;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import Domain.PageMaker;
import Domain.SearchCriteria;
import service.AdminDao;
import service.CourseDao;
import service.InstituteDao;
import service.MemberDao;
import service.MemberVo;
import service.PointquizDao;
import service.PointquizVo;
	@WebServlet("/Admin")
	public class AdminController extends HttpServlet{
		private static final long serialVersionUID = 1L;
		
			//���ε� ���� ���
			String uploadPath = "C:\\Users\\Administrator\\Desktop\\������\\�����ȼ���\\edupick\\WebContent\\";
			//��������
			String savedPath = "filefolder";
			//����� �� ���
			String saveFullPath = uploadPath + savedPath;
		
		protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			
			request.setCharacterEncoding("UTF-8");
			//������
			String uri = request.getRequestURI();
			//������Ʈ �̸��� ����
			int len = request.getContextPath().length();
			//������Ʈ �̸��� �� ������
			String str = uri.substring(len);
		
			//������ ����
		     if (str.equals("/Admin/admin.do")) {
		         
		          RequestDispatcher rd = request.getRequestDispatcher("/jsp/admin.jsp");
		         rd.forward(request, response);   
		               
		         //������ ��������
		      }else if(str.equals("/Admin/adminManage.do")) {
		         
		         RequestDispatcher rd = request.getRequestDispatcher("/jsp/adminManage.jsp");
		         rd.forward(request, response);   
		         
		         
		         
		      }else if(str.equals("/Admin/adminMemberDetail.do")) {
		         
		         RequestDispatcher rd = request.getRequestDispatcher("/jsp/adminMemberDetail.jsp");
		         rd.forward(request, response);   
		         
		      
		      }
		         
		         else if(str.equals("/Admin/adminMemberManage.do")) {
		            
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
		            
		            AdminDao ad = new AdminDao();
		            int cnt = ad.memberTotal(keyword);
		            
		            pm.setTotalCount(cnt);
		            
		            
		            ArrayList<MemberVo> alist = ad.memberSelectAll(scri);
		            
		            request.setAttribute("alist", alist);
		            request.setAttribute("pm", pm);
		            
		            RequestDispatcher rd = request.getRequestDispatcher("/jsp/adminMemberManage.jsp");
		            rd.forward(request, response);
		            
		         
		         
		         
		         
		      }
		         else if(str.equals("/Admin/adminBoardAdd.do")) {
		         
		         RequestDispatcher rd = request.getRequestDispatcher("/jsp/adminBoardAdd.jsp");
		         rd.forward(request, response);   
		         
		      
		      }
		         else if(str.equals("/Admin/adminBoardDetail.do")) {
		         
		         RequestDispatcher rd = request.getRequestDispatcher("/jsp/adminBoardDetail.jsp");
		         rd.forward(request, response);   
		         
		      
		      }
		         else if(str.equals("/Admin/adminBoardManage.do")) {
		         
		         RequestDispatcher rd = request.getRequestDispatcher("/jsp/adminBoardManage.jsp");
		         rd.forward(request, response);   
		         
		      }
		         else if(str.equals("/Admin/adminOther.do")) {
		         
		         RequestDispatcher rd = request.getRequestDispatcher("/jsp/adminOther.jsp");
		         rd.forward(request, response);   
		         
		      }
		         else if(str.equals("/Admin/adminQuizAdd.do")) {
		         
		         RequestDispatcher rd = request.getRequestDispatcher("/jsp/adminQuizAdd.jsp");
		         rd.forward(request, response);   
		         
		      }
		         else if(str.equals("/Admin/adminQuizAddAction.do")) {
		            
		            //1. input name���� �Ѱ� �޴´�
		            String psubject = request.getParameter("psubject");
		            String pcontent1 = request.getParameter("pcontent1");
		            String pcontent2 = request.getParameter("pcontent2");
		            String pcontent3 = request.getParameter("pcontent3");
		            String pcontent4 = request.getParameter("pcontent4");
		            String pdifficulty = request.getParameter("pdifficulty");
		            int pscore = 100;
		            String panswer = request.getParameter("panswer");
		            String pexplanation = request.getParameter("pexplanation");
		            
		            //2. Dao��ü�� �������Ѽ� �Ѿ��  ���� �Է��Ѵ�
		            PointquizDao pd = new PointquizDao();
		            
		            
		            pd.PointquizInsert(psubject, pcontent1, pcontent2, pcontent3 , pcontent4 ,pdifficulty ,pscore , panswer,pexplanation);
		            
		            //3. ó������ �̵��Ѵ�
		            response.sendRedirect(request.getContextPath()+"/Admin2/adminOther.do");
		            
		         }
		      
		         else if(str.equals("/Admin/adminPointQuizDetail.do")) {
		            
		            String pidx = request.getParameter("pidx");
		            
		            //2.db�� ����� �����͸� nbidx�� ���� �����͸� �����´�
		            PointquizDao pd = new PointquizDao();
		            int pidx2 = Integer.parseInt(pidx);
		            PointquizVo pv = pd.PointquizSelectOne(pidx2);
		            //3.���� ���� bv�� ��´�
		            request.setAttribute("pv", pv);
		            request.setAttribute("pidx", pidx2);
		            
		            RequestDispatcher rd = request.getRequestDispatcher("/jsp/adminPointQuizDetail.jsp");
		            rd.forward(request, response);
		         
		         
		         }else if(str.equals("/Admin/adminPointQuizModify.do")) {
		            
		            String pidx = request.getParameter("pidx");
		            int pidx2 = Integer.parseInt(pidx);
		            
		            PointquizDao pd = new PointquizDao();
		            PointquizVo pv = pd.PointquizSelectOne(pidx2);
		            
		            
		            request.setAttribute("pv", pv);
		            
		            RequestDispatcher rd = request.getRequestDispatcher("/jsp/adminPointQuizModify.jsp");
		            rd.forward(request, response);
		            
		         }else if(str.equals("/Admin/adminPointQuizModifyAction.do")) {
		            
		            
		            //1. �Ѿ�� ���� ������ ����               

		            String psubject = request.getParameter("psubject");      //1. input name ���� �Ѱ� �޴´�.
		            String pcontent1 = request.getParameter("pcontent1");
		            String pcontent2 = request.getParameter("pcontent2");
		            String pcontent3 = request.getParameter("pcontent3");
		            String pcontent4 = request.getParameter("pcontent4");
		            String pdifficulty = request.getParameter("pdifficulty");
		            String pscore = request.getParameter("pscore");
		            String panswer = request.getParameter("panswer");
		            String pexplanation = request.getParameter("pexplanation");
		            String pidx = request.getParameter("pidx");
		            
		            int pscore2 = Integer.parseInt(pscore); 
		            int pidx2 = Integer.parseInt(pidx); 
		            
		            System.out.println("psubject"+psubject+"pcontent1"+pcontent1+"pcontent2"+pcontent2+"pcontent3"+pcontent3+"pcontent4"+pcontent4);         
		            System.out.println("pdifficulty"+pdifficulty+"pscore2"+pscore2+"panswer"+panswer+"pexplanation"+pexplanation+"pdix2"+pidx2);
		            
		            PointquizDao pd = new PointquizDao();            //2. Dao ��ü�� �������� �Ѿ�� ���� �Է��Ѵ�.
		            int value = pd.PointquizModify(pidx2, psubject, pcontent1, pcontent2, pcontent3, pcontent4, pdifficulty, pscore2, panswer, pexplanation);
		            
		            response.sendRedirect(request.getContextPath()+"/Admin/adminPointQuizDetail.do?pidx="+pidx);   //3. ó���� �� �̵��Ѵ�
		         
		         
		         //����
		         }else if(str.equals("/Admin/adminPointQuizDelete.do")) {

		            String pidx = request.getParameter("pidx");
		            
		            request.setAttribute("pidx", pidx);
		            
		            
		            
		            RequestDispatcher rd = request.getRequestDispatcher("/jsp/adminPointQuizDelete.jsp");
		            rd.forward(request, response);
		            
		         }else if(str.equals("/Admin/adminPointQuizDeleteAction.do")) {
		            String pidx = request.getParameter("pidx");                     
		            int pidx2 = Integer.parseInt(pidx);
		            
		            PointquizDao pd = new PointquizDao();         
		            pd.PointquizDelete(pidx2);
		            
		            response.sendRedirect(request.getContextPath()+"/Admin2/adminOther.do");
		         
		         }
		         
		         else if(str.equals("/Admin/adminAnswer.do")) {
		         
		         RequestDispatcher rd = request.getRequestDispatcher("/jsp/adminAnswer.jsp");
		         rd.forward(request, response);   
		         
		      }
		   
		      
		   }
		      
		      
		      
		      
		   
		   protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		   doGet(request, response);
		   }

		   
		   
		   }
