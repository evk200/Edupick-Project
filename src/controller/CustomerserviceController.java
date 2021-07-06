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
	
			//���ε� ���� ���
			String uploadPath = "C:\\Users\\Administrator\\Desktop\\������\\�����ȼ���\\edupick\\WebContent\\";
			//���� ����
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
		
		if(str.equals("/Customerservice/customerservice.do")) {
			
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

			
			
			//2.db�� ����� �����͸� nbidx�� ���� �����͸� �����´�
			CustomerServiceDao cd = new CustomerServiceDao();
			int cidx2 = Integer.parseInt(cidx);
			CustomerServiceVo cv = cd.CustomerServiceSelectOne(cidx2);
			AnswerDao ad = new AnswerDao();
			AnswerVo av = ad.AnswerSelectOne(cidx2);
			//3.���� ���� bv�� ��´�
			request.setAttribute("cv", cv);
			request.setAttribute("av", av);
			
			
					
			RequestDispatcher rd = request.getRequestDispatcher("/jsp/customerservicedetail.jsp");
			rd.forward(request, response);						
		
		}
		
		else if(str.equals("/Customerservice/customerserviceqnaAction.do")) {
			
			int sizeLimit = 1024*1024*15;
			String cfile = null;
			String originFileName = null;
			
			//MultipartRequest ��ü����
			MultipartRequest multi = new MultipartRequest(request, saveFullPath, sizeLimit, "utf-8", new DefaultFileRenamePolicy()); 
			
			//�����ڿ�  ����Name�Ӽ��� �̸��� ��´�
			Enumeration files = multi.getFileNames();
			//��� ���� ��ü�� Name���� ��´�.
			String file = (String)files.nextElement();
			//����Ǵ� �����̸�
			cfile = multi.getFilesystemName(file); 
			//�������� �̸�
			originFileName = multi.getOriginalFileName(file);
			
			String ThumbnailFileName = null;
					
			try {
				if(cfile != null)
				ThumbnailFileName = makeThumbnail(uploadPath,savedPath, cfile);
			} catch (Exception e) {
				e.printStackTrace();
			}		
			
			//1. input name���� �Ѱ� �޴´�
			String csubject = multi.getParameter("csubject");
			String ccontents = multi.getParameter("ccontent");
			String cwriter = multi.getParameter("cwriter");
			String ccategory = multi.getParameter("ccategory");

			
			//2. Dao��ü�� �������Ѽ� �Ѿ��  ���� �Է��Ѵ�
			CustomerServiceDao cd = new CustomerServiceDao();
			System.out.println("csubject"+csubject+" ccontents,"+ ccontents+" cwriter"+ cwriter+"cfile"+cfile);
			cd.CustomerServiceInsert(csubject, ccontents, cwriter, ccategory , cfile);
			
			//3. ó������ �̵��Ѵ�
			response.sendRedirect(request.getContextPath()+"/Customerservice/customerservice.do");
			
		}
	
	
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	doPost(request, response);
	}
	private static String makeThumbnail(String uploadPath, String path, String fileName) throws Exception{
		
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