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
import service.AnswerDao;
import service.AnswerVo;
import service.CustomerServiceDao;
import service.CustomerServiceVo;
import service.EduinformationDao;
import service.EduinformationVo;
import service.NoticeDao;





@WebServlet("/Customerservice")
public class CustomerserviceController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
			//업로드 파일 경로
			String uploadPath = "C:\\Users\\Administrator\\Desktop\\독수리\\에듀픽수정\\edupick\\WebContent\\";
			//저장 폴더
			String savedPath = "filefolder";
			//저장된 총 경로
			String saveFullPath = uploadPath + savedPath;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		//절대경로
		String uri = request.getRequestURI();
		//프로젝트 이름의 길이
		int len = request.getContextPath().length();
		//프로젝트 이름을 뺀 가상경로
		String str = uri.substring(len);	
		
		if(str.equals("/Customerservice/customerservice.do")) {
			
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
			
			CustomerServiceDao cd = new CustomerServiceDao();
			int cnt = cd.CustomerServiceTotal(keyword);
			

			pm.setTotalCount(cnt);
				
			
			//BoardDao bd = new BoardDao();
			ArrayList<CustomerServiceVo> alist3 = cd.CustomerServiceSelectAll(scri);
			
			request.setAttribute("alist3", alist3);
			request.setAttribute("pm", pm);	
			
			ArrayList<CustomerServiceVo> alistqna = cd.CustomerServiceqnaSelect(scri);
			
			request.setAttribute("alistqna", alistqna);
			request.setAttribute("pm", pm);	
			
			ArrayList<CustomerServiceVo> alistfaq = cd.CustomerServicefaqSelect(scri);
			
			request.setAttribute("alistfaq", alistfaq);
			request.setAttribute("pm", pm);			
			
			
			RequestDispatcher rd = request.getRequestDispatcher("/jsp/customerservice.jsp");
			rd.forward(request, response);						
		
		}else if(str.equals("/Customerservice/customerservicedetail.do")) {
			
			String cidx = request.getParameter("cidx");

			
			
			//2.db에 저장된 데이터를 nbidx에 대한 데이터를 가져온다
			CustomerServiceDao cd = new CustomerServiceDao();
			int cidx2 = Integer.parseInt(cidx);
			CustomerServiceVo cv = cd.CustomerServiceSelectOne(cidx2);
			AnswerDao ad = new AnswerDao();
			AnswerVo av = ad.AnswerSelectOne(cidx2);
			//3.리턴 받은 bv를 담는다
			request.setAttribute("cv", cv);
			request.setAttribute("av", av);
			
			
					
			RequestDispatcher rd = request.getRequestDispatcher("/jsp/customerservicedetail.jsp");
			rd.forward(request, response);						
		
		}
		
		else if(str.equals("/Customerservice/customerserviceqnaAction.do")) {
			
			int sizeLimit = 1024*1024*15;
			String cfile = null;
			String originFileName = null;
			
			//MultipartRequest 객체생성
			MultipartRequest multi = new MultipartRequest(request, saveFullPath, sizeLimit, "utf-8", new DefaultFileRenamePolicy()); 
			
			//열거자에  파일Name속성의 이름을 담는다
			Enumeration files = multi.getFileNames();
			//담긴 파일 객체의 Name값을 담는다.
			String file = (String)files.nextElement();
			//저장되는 파일이름
			cfile = multi.getFilesystemName(file); 
			//원래파일 이름
			originFileName = multi.getOriginalFileName(file);
			
			String ThumbnailFileName = null;
					
			try {
				if(cfile != null)
				ThumbnailFileName = makeThumbnail(uploadPath,savedPath, cfile);
			} catch (Exception e) {
				e.printStackTrace();
			}		
			
			//1. input name값을 넘겨 받는다
			String csubject = multi.getParameter("csubject");
			String ccontents = multi.getParameter("ccontent");
			String cwriter = multi.getParameter("cwriter");
			String ccategory = multi.getParameter("ccategory");

			
			//2. Dao객체를 생성시켜서 넘어온  값을 입력한다
			CustomerServiceDao cd = new CustomerServiceDao();
			System.out.println("csubject"+csubject+" ccontents,"+ ccontents+" cwriter"+ cwriter+"cfile"+cfile);
			cd.CustomerServiceInsert(csubject, ccontents, cwriter, ccategory , cfile);
			
			//3. 처리한후 이동한다
			response.sendRedirect(request.getContextPath()+"/Customerservice/customerservice.do");
			
		}
	
	
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	doPost(request, response);
	}
	private static String makeThumbnail(String uploadPath, String path, String fileName) throws Exception{
		
		//올린 소스파일을 읽어드린다
		BufferedImage sourceImg = ImageIO.read(new File(uploadPath+path+File.separator+fileName));
		//이미지를 리사이징한다(높이 100에 맞춰서 원본이미지 비율을 유지한다)
		BufferedImage destImg = Scalr.resize(sourceImg,Scalr.Method.AUTOMATIC,Scalr.Mode.FIT_TO_HEIGHT,100);
		//썸네일 풀경로
		String thumbnailPath = uploadPath + path + File.separator + "s-"+fileName;
		//파일 객체생성
		File newFile = new File(thumbnailPath);
		//확장자 추출
		String formatName = fileName.substring(fileName.lastIndexOf(".")+1);
		//썸네일 이미지 만들기(리사이징한 이미지를 해당 이미지형식으로 해당 위치에 파일 객체생성한다)
		ImageIO.write(destImg, formatName.toUpperCase(), newFile);
		
		//썸네일 파일 이름 추출
		return thumbnailPath.substring((uploadPath+path).length()).replace(File.separatorChar, ' ');
	}
}		