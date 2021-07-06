package controller;

import java.awt.image.BufferedImage;   
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.net.InetAddress;
import java.util.ArrayList;
import java.util.Enumeration;

import javax.imageio.ImageIO;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.imgscalr.Scalr;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import Domain.PageMaker;
import Domain.SearchCriteria;
import service.CommunityDao;
import service.CommunityVo;
import service.CourseDao;
import service.CourseVo;
import service.EduinformationDao;
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
import service.PointquizVo;
import service.ReviewDao;
import service.ReviewVo;

@WebServlet("/Institute")
public class InstituteController extends HttpServlet {
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
		
		
		 if(str.equals("/Institute/institute.do")) {
			 
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
	         
	         
	         
	         
	         
	         ArrayList<InstituteVo> alist = id.InstituteSelectAll(scri);
	         
	         request.setAttribute("alist", alist);
	         request.setAttribute("pm", pm);
	         
//	         CourseDao cd = new CourseDao();
//	         
//	         ArrayList<CourseVo> alist2 = cd.CourseSelectAll(scri);
//	         
//	         request.setAttribute("alist2", alist2);

			
//	         String piidx = request.getParameter("piidx");
//	         
//	         PaymentinfoDao pid = new PaymentinfoDao();
//	         int piidx2 = Integer.parseInt(piidx);
//	         PaymentinfoVo piv = pid.PaymentinfoSelectOne(piidx2);
//	         request.setAttribute("piv", piv);
	         
			
			RequestDispatcher rd = request.getRequestDispatcher("/jsp/institute.jsp");
			rd.forward(request, response);						
		
		}else if(str.equals("/Institute/instituteDetail.do")) {
			
			String iidx = request.getParameter("iidx");
	         
	         InstituteDao id = new InstituteDao();
	         int iidx2 = Integer.parseInt(iidx);
	         InstituteVo iv = id.InstituteSelectOne(iidx2);
	         request.setAttribute("iv", iv);
	         
	         

	         //����¡ó��
	         String page = request.getParameter("page");
	         if(page==null) page = "1";
	         int pagex = Integer.parseInt(page);   
	         //Ű���� �˻�
	         String keyword = request.getParameter("keyword");
	         if(keyword == null) keyword = "";                     
	         
	         SearchCriteria scri = new SearchCriteria();
	         scri.setPage(pagex);
	         scri.setKeyword(keyword);
	          
	         PageMaker pm = new PageMaker();
	         pm.setScri(scri);
	         
	         SearchCriteria scri2 = new SearchCriteria();
	         scri2.setPage(pagex);
	         scri2.setKeyword(keyword);
	         
	         PageMaker pm2 = new PageMaker();
	         pm2.setScri(scri2);
	         
	         CourseDao cd = new CourseDao();
	         int cnt = cd.CourseTotal(keyword);
	         
	         pm.setTotalCount(cnt);
	         
	        
	         
	         ArrayList<CourseVo> alist = cd.CourseSelectAll(scri);
	         System.out.println("Calist-->"+alist);
	         request.setAttribute("alist", alist);
	         request.setAttribute("pm", pm);
	         
	         ReviewDao red = new ReviewDao();
	         ArrayList<ReviewVo> alistm = red.ReviewSelectAll(scri);
	         
	         request.setAttribute("alistm", alistm);
			
	         CommunityDao cid = new CommunityDao();
	         ArrayList<CommunityVo> alist129 = cid.CommunitySelectAll(scri);
	         
	         request.setAttribute("alist129", alist129);
	         request.setAttribute("pm2", pm2);	
					
			RequestDispatcher rd = request.getRequestDispatcher("/jsp/instituteDetail.jsp");
			rd.forward(request, response);						
		
		}else if(str.equals("/Institute/progresslecture.do")) {
			
			String Coidx = request.getParameter("coidx");
	         
	         CommunityDao cid = new CommunityDao();
	         int Coidx2 = Integer.parseInt(Coidx);
	         CommunityVo civ = cid.CommunitySelectOne(Coidx2);
	         request.setAttribute("civ", civ);
			
					
			RequestDispatcher rd = request.getRequestDispatcher("/jsp/progresslecture.jsp");
			rd.forward(request, response);						
		
		}else if(str.equals("/Institute/CourseDetail.do")) {
			
			 String iidx = request.getParameter("iidx");
			 InstituteDao id = new InstituteDao();
	         int iidx2 = Integer.parseInt(iidx);
	         InstituteVo iv = id.InstituteSelectOne(iidx2);
	         request.setAttribute("iv", iv);
			
			
			String cidx = request.getParameter("cidx");
			CourseDao cd = new CourseDao();
			//2.db�� ����� �����͸� nbidx�� ���� �����͸� �����´�
			int cidx2 = Integer.parseInt(cidx);
			CourseVo cv = cd.CourseSelectOne(cidx2);
			//3.���� ���� bv�� ��´�
			request.setAttribute("cv", cv);
			
			

			RequestDispatcher rd = request.getRequestDispatcher("/jsp/courseDetail.jsp");
			rd.forward(request, response);
			
		 
		}else if(str.equals("/Institute/InstituteReview.do")) {
			
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
			/* String iidx = request.getParameter("iidx"); */
			InstituteDao id = new InstituteDao();
			int iidx2 = Integer.parseInt(iidx);
			InstituteVo iv = id.InstituteSelectOne(iidx2);
	        request.setAttribute("iv", iv);
			
			
			RequestDispatcher rd = request.getRequestDispatcher("/jsp/institutereview.jsp");
			rd.forward(request, response);
			
		}else if(str.equals("/Institute/InstituteReviewAction.do")) {
		 
			 String rcontent = request.getParameter("rcontent");
	         String rwriter = request.getParameter("rwriter");
	         String iidx = request.getParameter("iidx");
	         //String cidx = request.getParameter("cidx");
	         System.out.println("iidx ->>" + iidx);
	         int iidx2 = Integer.parseInt(iidx);
	        // int cidx2 = Integer.parseInt(cidx);
	         
	         
	         //2. Dao��ü�� �������Ѽ� �Ѿ��  ���� �Է��Ѵ�
	         ReviewDao rd = new ReviewDao();
	         rd.ReviewInsert(rcontent, rwriter, iidx2);
	         
	         System.out.println("rwriter >> "+ rwriter);
	         
	         //3. ó������ �̵��Ѵ�
	         response.sendRedirect(request.getContextPath()+"/Institute/institute.do");
	         
		}else if(str.equals("/Institute/CommunityWrite.do")) {
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
					/*
					 * String iidx = request.getParameter("iidx");
					 */
			InstituteDao id = new InstituteDao();
			int iidx2 = Integer.parseInt(iidx);
			InstituteVo iv = id.InstituteSelectOne(iidx2);
	        request.setAttribute("iv", iv);
			
			
			RequestDispatcher rd = request.getRequestDispatcher("/jsp/communitywrite.jsp");
			rd.forward(request, response);
	         
	         
		 
		}else if(str.equals("/Institute/CommunityWriteAction.do")) {
			
			int sizeLimit = 1024*1024*15;
	         String Cofile = null;
	         String originFileName = null;
	         
	         //MultipartRequest ��ü����
	         MultipartRequest multi = new MultipartRequest(request, saveFullPath, sizeLimit, "utf-8", new DefaultFileRenamePolicy()); 
	         
	         //�����ڿ�  ����Name�Ӽ��� �̸��� ��´�
	         Enumeration files = multi.getFileNames();
	         //��� ���� ��ü�� Name���� ��´�.
	         String file = (String)files.nextElement();
	         //����Ǵ� �����̸�
	         Cofile = multi.getFilesystemName(file); 
	         //�������� �̸�
	         originFileName = multi.getOriginalFileName(file);
	         
	         String ThumbnailFileName = null;
	               
	         try {
	            if(Cofile != null)
	            ThumbnailFileName = makeThumbnail(uploadPath,savedPath, Cofile);
	         } catch (Exception e) {
	            e.printStackTrace();
	         }
			 
			 String Cosubject = multi.getParameter("cosubject");
	         String Cocontent = multi.getParameter("cocontent");
	         String Cowrite = multi.getParameter("cowrite");
	         
	         System.out.println("������"+Cocontent);
	         System.out.println("����"+Cosubject);
	         System.out.println("�ۼ���"+Cowrite);
	         //2. Dao��ü�� �������Ѽ� �Ѿ��  ���� �Է��Ѵ�
	         CommunityDao cid = new CommunityDao();
	         cid.CommunityInsert(Cosubject, Cocontent, Cowrite, Cofile);
	         
	         
	         
	       //3. ó������ �̵��Ѵ�
	         response.sendRedirect(request.getContextPath()+"/Institute/institute.do");
		 
		}
}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);

	}private static String makeThumbnail(String uploadPath,String path,String fileName) throws Exception{
	      
	      //�ø� �ҽ������� �о�帰��
	      BufferedImage sourceImg = ImageIO.read(new File(uploadPath+path+File.separator+fileName));
	      //�̹����� ������¡�Ѵ�(���� 100�� ���缭 �����̹��� ������ �����Ѵ�)
	      BufferedImage destImg = Scalr.resize(sourceImg,Scalr.Method.AUTOMATIC,Scalr.Mode.FIT_TO_HEIGHT,100);
	      //����� Ǯ���
	      String thumbnailPath = uploadPath + path + File.separator + "s-"+fileName;
	      //���� ��ü����
	      File newFile = new File(thumbnailPath);
	      //Ȯ���� ����
	      String formatName = fileName.substring(fileName.lastIndexOf(".")+1);
	      //����� �̹��� �����(������¡�� �̹����� �ش� �̹����������� �ش� ��ġ�� ���� ��ü�����Ѵ�)
	      ImageIO.write(destImg, formatName.toUpperCase(), newFile);
	      
	      //����� ���� �̸� ����
	      return thumbnailPath.substring((uploadPath+path).length()).replace(File.separatorChar, ' ');
	   }
	
	
	}		