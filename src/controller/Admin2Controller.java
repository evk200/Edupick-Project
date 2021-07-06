package controller;

import java.awt.image.BufferedImage;  
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.Enumeration;

import javax.imageio.ImageIO;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
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
import service.AnswerDao;
import service.CommunityDao;
import service.CommunityVo;
import service.CourseDao;
import service.CourseVo;
import service.CustomerServiceDao;
import service.CustomerServiceVo;
import service.EduinformationDao;
import service.EduinformationVo;
import service.InstituteDao;
import service.InstituteVo;
import service.MemberVo;
import service.NoticeDao;
import service.NoticeVo;
import service.PaymentinfoDao;
import service.PaymentinfoVo;
import service.PointquizDao;
import service.PointquizVo;
import service.ReviewDao;
import service.ReviewVo;
	@WebServlet("/Admin2")
	public class Admin2Controller extends HttpServlet{
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
		
			
			  if (str.equals("/Admin2/adminInstituteAdd.do")) {
	        	  
			         
		          RequestDispatcher rd = request.getRequestDispatcher("/jsp/adminInstituteAdd.jsp");
		         rd.forward(request, response);   
		         
		         
		         }else if(str.equals("/Admin2/adminInstituteInsertAction.do")) {
		            
		        	 int sizeLimit = 1024*1024*15;
						String fileName = null;
						String originFileName = null;
						
						//MultipartRequest ��ü����
						MultipartRequest multi = new MultipartRequest(request, saveFullPath, sizeLimit, "utf-8", new DefaultFileRenamePolicy()); 
						
						//�����ڿ�  ����Name�Ӽ��� �̸��� ��´�
						Enumeration files = multi.getFileNames();
						//��� ���� ��ü�� Name���� ��´�.
						String file = (String)files.nextElement();
						//����Ǵ� �����̸�
						fileName = multi.getFilesystemName(file); 
						//�������� �̸�
						originFileName = multi.getOriginalFileName(file);
						System.out.println("file ->"+file);
						
						String ThumbnailFileName = null;
								
						try {
							if(fileName != null)
							ThumbnailFileName = makeThumbnail(uploadPath,savedPath, fileName);
						} catch (Exception e) {
							e.printStackTrace();
						}		
						
						
						//1. input name���� �Ѱ� �޴´�
						
						String iName = multi.getParameter("iname");
						String iPostCode = multi.getParameter("sample4_postcode");
						String iRoadAddr = multi.getParameter("sample4_roadAddress");
						String iJibunAddr = multi.getParameter("sample4_jibunAddress");
						String iDetailAddr = multi.getParameter("sample4_detailAddress");
						String iExtraAddr = multi.getParameter("sample4_extraAddress");
						String iTel1 = multi.getParameter("itel1");
						String iTel2 = multi.getParameter("itel2");
						String iTel3 = multi.getParameter("itel3");
						String iTel = iTel1 +"-" +iTel2 +"-" + iTel3;
						String iMin = multi.getParameter("imin");
						String iMax = multi.getParameter("imax");
						String iSubjects = multi.getParameter("isubjects");
						String iNeeds = multi.getParameter("ineeds");
						String iIntroduce = multi.getParameter("iintroduce");
						String iFile = fileName;
					
					    System.out.println("Ciname--->"+ iName);
					    System.out.println("CiPostCode--->" + iPostCode);
					    System.out.println("Ciroadaddr--->"+iRoadAddr);
					    System.out.println("CiJibunaddr--->"+iJibunAddr);
					    System.out.println("Cidetailaddr--->"+iDetailAddr);
					    System.out.println("Ciextraaddr--->"+iExtraAddr);
					    System.out.println("Citel--->"+iTel);
					    System.out.println("Cimin--->"+iMin);
					    System.out.println("Cimax--->"+iMax);
					    System.out.println("CiSubjects--->"+iSubjects);
					    System.out.println("Cineeds--->"+iNeeds);
					    System.out.println("Ciintroduce--->"+iIntroduce);
					    System.out.println("Cifile--->"+iFile);	
					
						
						
						InstituteDao id = new InstituteDao();	
						id.InstituteInsert(iName, iPostCode, iRoadAddr, iJibunAddr ,iDetailAddr, iExtraAddr ,iTel, iMin, iMax, iSubjects, iNeeds, iIntroduce,iFile);
		            
		            //3.ó���� �� �̵��Ѵ�.
		            response.sendRedirect(request.getContextPath()+"/Admin2/adminProductManage.do");
		         
		            
		            
		         
		         
		         
		         //������ ��������
		      }else if(str.equals("/Admin2/adminInstituteDetail.do")) {
		    	  
		    	  String iidx = request.getParameter("iidx");
					
					//2.db�� ����� �����͸� nbidx�� ���� �����͸� �����´�
					InstituteDao id = new InstituteDao();
					int iidx2 = Integer.parseInt(iidx);
					InstituteVo iv = id.InstituteSelectOne(iidx2);
					//3.���� ���� bv�� ��´�
					request.setAttribute("iv", iv);	
		         
		         RequestDispatcher rd = request.getRequestDispatcher("/jsp/adminInstituteDetail.jsp");
		         rd.forward(request, response);   
		         
		         
		      
		         
		      }else if(str.equals("/Admin2/adminInstituteModify.do")) {
		    	  
		    	  String iidx = request.getParameter("iidx");
					
					//2.db�� ����� �����͸� nbidx�� ���� �����͸� �����´�
					InstituteDao id = new InstituteDao();
					int iidx2 = Integer.parseInt(iidx);
					InstituteVo iv = id.InstituteSelectOne(iidx2);
					//3.���� ���� bv�� ��´�
					request.setAttribute("iv", iv);	
		         
		         RequestDispatcher rd = request.getRequestDispatcher("/jsp/adminInstituteModify.jsp");
		         rd.forward(request, response);   
		         
		      }  else if(str.equals("/Admin2/adminInstituteModifyAction.do")) {
		             
		        	 int sizeLimit = 1024*1024*15;
						String fileName = null;
						String originFileName = null;
						
						//MultipartRequest ��ü����
						MultipartRequest multi = new MultipartRequest(request, saveFullPath, sizeLimit, "utf-8", new DefaultFileRenamePolicy()); 
						
						//�����ڿ�  ����Name�Ӽ��� �̸��� ��´�
						Enumeration files = multi.getFileNames();
						//��� ���� ��ü�� Name���� ��´�.
						String file = (String)files.nextElement();
						//����Ǵ� �����̸�
						fileName = multi.getFilesystemName(file); 
						//�������� �̸�
						originFileName = multi.getOriginalFileName(file);
						System.out.println("file ->"+file);
						
						String ThumbnailFileName = null;
								
						try {
							if(fileName != null)
							ThumbnailFileName = makeThumbnail(uploadPath,savedPath, fileName);
						} catch (Exception e) {
							e.printStackTrace();
						}		
						
						
						//1. input name���� �Ѱ� �޴´�
						
						String iName = multi.getParameter("iname");
						String iPostCode = multi.getParameter("sample4_postcode");
						String iRoadAddr = multi.getParameter("sample4_roadAddress");
						String iJibunAddr = multi.getParameter("sample4_jibunAddress");
						String iDetailAddr = multi.getParameter("sample4_detailAddress");
						String iExtraAddr = multi.getParameter("sample4_extraAddress");
						String iTel1 = multi.getParameter("itel1");
						String iTel2 = multi.getParameter("itel2");
						String iTel3 = multi.getParameter("itel3");
						String iTel = iTel1 +"-" +iTel2 +"-" + iTel3;
						String iMin = multi.getParameter("imin");
						String iMax = multi.getParameter("imax");
						String iSubjects = multi.getParameter("isubjects");
						String iNeeds = multi.getParameter("ineeds");
						String iIntroduce = multi.getParameter("iintroduce");
						String iFile = fileName;
						String Iidx = multi.getParameter("iidx");
						
						int Iidx2 = Integer.parseInt(Iidx);
//						InstituteVo iv = new InstituteVo();
						System.out.println("Iidx!!!!"+Iidx);
						InstituteDao id = new InstituteDao();	
						id.InstituteModify(Iidx2, iName, iRoadAddr ,iDetailAddr, iTel, iSubjects, iNeeds, iIntroduce,iFile);
		            
		            //3.ó���� �� �̵��Ѵ�.
		            response.sendRedirect(request.getContextPath()+"/Admin2/adminProductManage.do");
		         
		      }else if(str.equals("/Admin2/adminCoures.do")) {
		         
		         RequestDispatcher rd = request.getRequestDispatcher("/jsp/adminCoures.jsp");
		         rd.forward(request, response);   
		      
		      }else if(str.equals("/Admin2/adminCourseAction.do")) {
		          
		    	  int sizeLimit = 1024*1024*15;
					String Cfile = null;
					String originFileName = null;
					
					//MultipartRequest ��ü����
					MultipartRequest multi = new MultipartRequest(request, saveFullPath, sizeLimit, "utf-8", new DefaultFileRenamePolicy()); 
					
					//�����ڿ�  ����Name�Ӽ��� �̸��� ��´�
					Enumeration files = multi.getFileNames();
					//��� ���� ��ü�� Name���� ��´�.
					String file = (String)files.nextElement();
					//����Ǵ� �����̸�
					Cfile = multi.getFilesystemName(file); 
					//�������� �̸�
					originFileName = multi.getOriginalFileName(file);
					System.out.println("file ->"+file);
					
					String ThumbnailFileName = null;
							
					try {
						if(Cfile != null)
						ThumbnailFileName = makeThumbnail(uploadPath,savedPath, Cfile);
					} catch (Exception e) {
						e.printStackTrace();
					}		
						
						//1. input name���� �Ѱ� �޴´�
						String Cname = multi.getParameter("cname");
						String Cprice = multi.getParameter("cprice");
						String Cperiod = multi.getParameter("cperiod");
						String Ctime = multi.getParameter("ctime");
						String Cpeople = multi.getParameter("cpeople");
						String Cbook = multi.getParameter("cbook");
						String Caim = multi.getParameter("caim");
						
						

						CourseDao cd = new CourseDao();	
						cd.CourseInsert(Cname , Cprice, Cperiod, Ctime, Cpeople, Cbook, Caim, Cfile);
		          
		          //3.ó���� �� �̵��Ѵ�.
		          response.sendRedirect(request.getContextPath()+"/Admin2/adminProductManage.do");
		       
		          
		         
		   
		      }else if(str.equals("/Admin2/adminCouresDetail.do")) {
		    	  
		    	  String cidx = request.getParameter("cidx");
					
					//2.db�� ����� �����͸� nbidx�� ���� �����͸� �����´�
					CourseDao cd = new CourseDao();
					int cidx2 = Integer.parseInt(cidx);
					CourseVo cv = cd.CourseSelectOne(cidx2);
					//3.���� ���� bv�� ��´�
					request.setAttribute("cv", cv);	
		         
		         RequestDispatcher rd = request.getRequestDispatcher("/jsp/adminCouresDetail.jsp");
		         rd.forward(request, response);   
		      
		      
		      }else if(str.equals("/Admin2/adminCouresModify.do")) {
		    	  
		    	  String cidx = request.getParameter("cidx");
					
					//2.db�� ����� �����͸� nbidx�� ���� �����͸� �����´�
					CourseDao cd = new CourseDao();
					int cidx2 = Integer.parseInt(cidx);
					CourseVo cv = cd.CourseSelectOne(cidx2);
					//3.���� ���� bv�� ��´�
					request.setAttribute("cv", cv);
		         
		         RequestDispatcher rd = request.getRequestDispatcher("/jsp/adminCouresModify.jsp");
		         rd.forward(request, response);   
		      
		      }else if(str.equals("/Admin2/adminCourseModifyAction.do")) {
		          
		     	 int sizeLimit = 1024*1024*15;
						String fileName = null;
						String originFileName = null;
						
						//MultipartRequest ��ü����
						MultipartRequest multi = new MultipartRequest(request, saveFullPath, sizeLimit, "utf-8", new DefaultFileRenamePolicy()); 
						
						//�����ڿ�  ����Name�Ӽ��� �̸��� ��´�
						Enumeration files = multi.getFileNames();
						//��� ���� ��ü�� Name���� ��´�.
						String file = (String)files.nextElement();
						//����Ǵ� �����̸�
						fileName = multi.getFilesystemName(file); 
						//�������� �̸�
						originFileName = multi.getOriginalFileName(file);
						System.out.println("file ->"+file);
						
						String ThumbnailFileName = null;
								
						try {
							if(fileName != null)
							ThumbnailFileName = makeThumbnail(uploadPath,savedPath, fileName);
						} catch (Exception e) {
							e.printStackTrace();
						}		
						
						
						//1. input name���� �Ѱ� �޴´�
						
						String Cname = multi.getParameter("cname");
						String Cprice = multi.getParameter("cprice");
						String Cperiod = multi.getParameter("cperiod");
						String Ctime = multi.getParameter("ctime");
						String Cpeople = multi.getParameter("cpeople");
						String Cbook = multi.getParameter("cbook");
						String Caim = multi.getParameter("caim");
						String Cfile = multi.getParameter("cfile");
						String Cidx = multi.getParameter("cidx");
						
						int Cidx2 = Integer.parseInt(Cidx);

						
						CourseDao cd = new CourseDao();	
						cd.CourseModify(Cidx2, Cname, Cprice, Cperiod, Ctime, Cpeople, Cbook, Caim, Cfile);
		         
		         //3.ó���� �� �̵��Ѵ�.
		         response.sendRedirect(request.getContextPath()+"/Admin2/adminProductManage.do");
		         
		      
		      }else if(str.equals("/Admin2/adminCommunityDetail.do")) {
		    	  
		    	  String Coidx = request.getParameter("coidx");
					 CommunityDao cid = new CommunityDao();
			         int Coidx2 = Integer.parseInt(Coidx);
			         CommunityVo civ = cid.CommunitySelectOne(Coidx2);
			         request.setAttribute("civ", civ);
		         
		         RequestDispatcher rd = request.getRequestDispatcher("/jsp/adminCommunityDetail.jsp");
		         rd.forward(request, response);   
		      
		      
		      }else if(str.equals("/Admin2/adminOrderManage.do")) {
		    	  
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
					PaymentinfoDao pid = new PaymentinfoDao();
					int cnt = pid.PaymentinfoTotal(keyword);
					
					pm.setTotalCount(cnt);
					
					PageMaker pm2 = new PageMaker();
					pm2.setScri(scri);
					int cnt2 = pid.PaymentinfoTotal(keyword);
					
					ArrayList<PaymentinfoVo> alist4 = pid.PaymentAdmin(scri);
					
					request.setAttribute("alist4", alist4);
					request.setAttribute("pm2", pm2);
		         
		         RequestDispatcher rd = request.getRequestDispatcher("/jsp/adminOrderManage.jsp");
		         rd.forward(request, response);     
		      
		      
		      }else if(str.equals("/Admin2/adminPayDetail.do")) {
		         
		         RequestDispatcher rd = request.getRequestDispatcher("/jsp/adminPayDetail.jsp");
		         rd.forward(request, response);   
		      
		      
		      }else if(str.equals("/Admin2/adminProductManage.do")) {
		         
		         
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
					PaymentinfoDao pid = new PaymentinfoDao();
					int cnt = id.InstituteTotal(keyword);
					
					pm.setTotalCount(cnt);
					
					PageMaker pm2 = new PageMaker();
					pm2.setScri(scri);
					int cnt2 = pid.PaymentinfoTotal(keyword);
					
					ArrayList<InstituteVo> alist = id.InstituteSelectAll(scri);
					
					request.setAttribute("alist", alist);
					request.setAttribute("pm", pm);
					
					CourseDao cd = new CourseDao();
					ArrayList<CourseVo> alist2 = cd.Courseshow(scri);
					
					request.setAttribute("alist2", alist2);
					request.setAttribute("pm", pm);
					
					
					ArrayList<PaymentinfoVo> alist3 = pid.PaymentSelectAll(scri);
					
					request.setAttribute("alist3", alist3);
					request.setAttribute("pm2", pm2);
					
					ReviewDao red = new ReviewDao();
					
					
					ArrayList<ReviewVo> alistmu = red.AdminReview(scri);
					
					request.setAttribute("alistmu", alistmu);
					
					System.out.println("alistmu:::::::::::::"+alistmu.size());
					
					CommunityDao cid = new CommunityDao();
					ArrayList<CommunityVo> alist129 = cid.CommunitySelectAll(scri);
					
					request.setAttribute("alist129", alist129);
		      
		      
		         RequestDispatcher rd = request.getRequestDispatcher("/jsp/adminProductManage.jsp");
		         rd.forward(request, response);   
		         
		         
		         
		      

		         
		      }else if(str.equals("/Admin2/adminReviewDetail.do")) {
		         
		         RequestDispatcher rd = request.getRequestDispatcher("/jsp/adminReviewDetail.jsp");
		         rd.forward(request, response);   
		      
		      
		      }else if(str.equals("/Admin2/adminStudentDetail.do")) {
		         
		         RequestDispatcher rd = request.getRequestDispatcher("/jsp/adminStudentDetail.jsp");
		         rd.forward(request, response);   
		      
		      
		      }else if(str.equals("/Admin2/adminStudentModify.do")) {
		         
		         RequestDispatcher rd = request.getRequestDispatcher("/jsp/adminStudentModify.jsp");
		         rd.forward(request, response);   
		      
		      
		      }else if(str.equals("/Admin2/adminVisitDetail.do")) {
		         
		         RequestDispatcher rd = request.getRequestDispatcher("/jsp/adminVisitDetail.jsp");
		         rd.forward(request, response);   
		      
		      
		      }else if(str.equals("/Admin2/adminPageManage.do")) {       
		      
		         String page = request.getParameter("page");
		         if(page==null) page = "1";
		         int pagex = Integer.parseInt(page);   
		         //Ű���� �˻�
		         String keyword = request.getParameter("keyword");
		         if(keyword == null) keyword = "";                     
		         
		         SearchCriteria scri = new SearchCriteria();
		         SearchCriteria scri2 = new SearchCriteria();
		         scri.setPage(pagex);
		         scri.setKeyword(keyword);
		         
		         PageMaker pm = new PageMaker();
		         pm.setScri(scri);
		         
		         PageMaker pm2 = new PageMaker();
		         pm2.setScri(scri2);
		         
		         PageMaker pm3 = new PageMaker();
		         pm3.setScri(scri2);
		         
		         NoticeDao nd = new NoticeDao();
		         int cnt = nd.NoticeTotal(keyword);
		         
		         EduinformationDao ed = new EduinformationDao();
		         int cnt2 = ed.EduinformationTotal(keyword);
		         
		         CustomerServiceDao cd = new CustomerServiceDao();
		         int cnt3 = cd.CustomerServiceTotal(keyword);
		         
		         pm.setTotalCount(cnt);
		         pm2.setTotalCount(cnt2);
		         pm3.setTotalCount(cnt3);
		         
		         
		         
		         //BoardDao bd = new BoardDao();
		         ArrayList<NoticeVo> alist = nd.NoticeSelectAll(scri);
		         
		         request.setAttribute("alist", alist);
		         request.setAttribute("pm", pm);
		         
		         ArrayList<EduinformationVo> alist2 = ed.EduinformationSelectAll(scri);
		         
		         request.setAttribute("alist2", alist2);
		         request.setAttribute("pm2", pm2);
		         
		         ArrayList<CustomerServiceVo> alist3 = cd.CustomerServiceSelectAll(scri);
		         
		         request.setAttribute("alist3", alist3);
		         request.setAttribute("pm3", pm3);
		         
		         RequestDispatcher rd = request.getRequestDispatcher("/jsp/adminPageManage.jsp");
		         rd.forward(request, response);   
		      
		      }else if(str.equals("/Admin2/adminAdviceDetail.do")) {
		         
		         RequestDispatcher rd = request.getRequestDispatcher("/jsp/adminAdviceDetail.jsp");
		         rd.forward(request, response);   
		      
		      }else if(str.equals("/Admin2/adminBoardManage.do")) {
		         
		         RequestDispatcher rd = request.getRequestDispatcher("/jsp/adminBoardManage.jsp");
		         rd.forward(request, response);   
		      
		      }else if(str.equals("/Admin2/adminBoardModify.do")) {
		         
		         RequestDispatcher rd = request.getRequestDispatcher("/jsp/adminBoardModify.jsp");
		         rd.forward(request, response);   
		      
		      }else if(str.equals("/Admin2/adminBoardDetail.do")) {
		         
		         RequestDispatcher rd = request.getRequestDispatcher("/jsp/adminBoardDetail.jsp");
		         rd.forward(request, response);   
		      
		      }else if(str.equals("/Admin2/adminBoardAdd.do")) {
		         
		         RequestDispatcher rd = request.getRequestDispatcher("/jsp/adminBoardAdd.jsp");
		         rd.forward(request, response);   
		      
		      }else if(str.equals("/Admin2/adminOther.do")) {
		         
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
		          
		          PointquizDao pd = new PointquizDao();
		          int cnt = pd.PointquizTotal(keyword);
		          
		          pm.setTotalCount(cnt);
		          
		          
		          ArrayList<PointquizVo> alist = pd.PointquizSelectAll(scri);
		          
		          request.setAttribute("alist", alist);
		          request.setAttribute("pm", pm);
		          
		          RequestDispatcher rd = request.getRequestDispatcher("/jsp/adminOther.jsp");
		          rd.forward(request, response);
		      
		      }
		         else if(str.equals("/Admin2/adminPageNotice.do")) {
		         
		         RequestDispatcher rd = request.getRequestDispatcher("/jsp/adminPageNotice.jsp");
		         rd.forward(request, response);   
		      
		      }else if(str.equals("/Admin2/adminPageEduInformation.do")) {
		         
		         
		         RequestDispatcher rd = request.getRequestDispatcher("/jsp/adminPageEduInformation.jsp");
		         rd.forward(request, response);   
		      
		      }else if(str.equals("/Admin2/adminPageEduInformationAction.do")) {
		      
		         int sizeLimit = 1024*1024*15;
		         String efile = null;
		         String originFileName = null;
		         
		         //MultipartRequest ��ü����
		         MultipartRequest multi = new MultipartRequest(request, saveFullPath, sizeLimit, "utf-8", new DefaultFileRenamePolicy()); 
		         
		         //�����ڿ�  ����Name�Ӽ��� �̸��� ��´�
		         Enumeration files = multi.getFileNames();
		         //��� ���� ��ü�� Name���� ��´�.
		         String file = (String)files.nextElement();
		         //����Ǵ� �����̸�
		         efile = multi.getFilesystemName(file); 
		         //�������� �̸�
		         originFileName = multi.getOriginalFileName(file);
		         
		         String ThumbnailFileName = null;
		               
		         try {
		            if(efile != null)
		            ThumbnailFileName = makeThumbnail(uploadPath,savedPath, efile);
		         } catch (Exception e) {
		            e.printStackTrace();
		         }      
		         
		         //1. input name���� �Ѱ� �޴´�
		         String esubject = multi.getParameter("esubject");
		         String econtents = multi.getParameter("econtent");
		         String ewriter = multi.getParameter("ewriter");
		         String ecategory = multi.getParameter("ecategory");

		         
		         //2. Dao��ü�� �������Ѽ� �Ѿ��  ���� �Է��Ѵ�
		         EduinformationDao ed = new EduinformationDao();
		         ed.EduinformationInsert(esubject, econtents, ewriter, ecategory , efile);
		         
		         //3. ó������ �̵��Ѵ�
		         response.sendRedirect(request.getContextPath()+"/Admin2/adminPageManage.do");
		      
		      
		      }else if(str.equals("/Admin2/adminPageCustomerService.do")) {
		         
		         RequestDispatcher rd = request.getRequestDispatcher("/jsp/adminPageCustomerService.jsp");
		         rd.forward(request, response);   
		         
		      }else if(str.equals("/Admin2/adminPageCustomerServiceAction.do")) {
		      
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
		         cd.CustomerServiceInsert(csubject, ccontents, cwriter, ccategory , cfile);
		         
		         //3. ó������ �̵��Ѵ�
		         response.sendRedirect(request.getContextPath()+"/Admin2/adminPageManage.do");   
		      
		      }else if(str.equals("/Admin2/adminPageNoticeAction.do")) {
		         
		         int sizeLimit = 1024*1024*15;
		         String nfile = null;
		         String originFileName = null;
		         
		         //MultipartRequest ��ü����
		         MultipartRequest multi = new MultipartRequest(request, saveFullPath, sizeLimit, "utf-8", new DefaultFileRenamePolicy()); 
		         
		         //�����ڿ�  ����Name�Ӽ��� �̸��� ��´�
		         Enumeration files = multi.getFileNames();
		         //��� ���� ��ü�� Name���� ��´�.
		         String file = (String)files.nextElement();
		         //����Ǵ� �����̸�
		         nfile = multi.getFilesystemName(file); 
		         //�������� �̸�
		         originFileName = multi.getOriginalFileName(file);
		         
		         String ThumbnailFileName = null;
		               
		         try {
		            if(nfile != null)
		            ThumbnailFileName = makeThumbnail(uploadPath,savedPath, nfile);
		         } catch (Exception e) {
		            e.printStackTrace();
		         }      
		         
		         //1. input name���� �Ѱ� �޴´�
		         String nsubject = multi.getParameter("nsubject");
		         String ncontents = multi.getParameter("ncontent");
		         String nwriter = multi.getParameter("nwriter");
		         String ncategory = multi.getParameter("ncategory");

		         
		         //2. Dao��ü�� �������Ѽ� �Ѿ��  ���� �Է��Ѵ�
		         NoticeDao nd = new NoticeDao();
		         System.out.println("nsubject"+nsubject+" ncontents,"+ ncontents+" nwriter"+ nwriter+"nfile"+nfile);
		         nd.NoticeInsert(nsubject, ncontents, nwriter, ncategory , nfile);
		         
		         //3. ó������ �̵��Ѵ�
		         response.sendRedirect(request.getContextPath()+"/Admin2/adminPageManage.do");
		         
		      }else if(str.equals("/Admin2/adminPageNoticeDetail.do")) {
		         
		         String nidx = request.getParameter("nidx");
		         
		         //2.db�� ����� �����͸� nbidx�� ���� �����͸� �����´�
		         NoticeDao nd = new NoticeDao();
		         int nidx2 = Integer.parseInt(nidx);
		         NoticeVo nv = nd.NoticeSelectOne(nidx2);
		         //3.���� ���� bv�� ��´�
		         request.setAttribute("nv", nv);
		         
		         RequestDispatcher rd = request.getRequestDispatcher("/jsp/adminPageNoticeDetail.jsp");
		         rd.forward(request, response);   
		      
		      }
		         else if(str.equals("/Admin2/adminPageEduInformationDetail.do")) {
		         
		            String eidx = request.getParameter("eidx");
		            
		            //2.db�� ����� �����͸� nbidx�� ���� �����͸� �����´�
		            EduinformationDao ed = new EduinformationDao();
		            int eidx2 = Integer.parseInt(eidx);
		            EduinformationVo ev = ed.EduinformationSelectOne(eidx2);
		            //3.���� ���� bv�� ��´�
		            request.setAttribute("ev", ev);
		            
		            RequestDispatcher rd = request.getRequestDispatcher("/jsp/adminPageEduInformationDetail.jsp");
		            rd.forward(request, response);   
		         
		      }else if(str.equals("/Admin2/adminPageCustomerServiceDetail.do")) {
		         
		         String cidx = request.getParameter("cidx");
		         
		         //2.db�� ����� �����͸� nbidx�� ���� �����͸� �����´�
		         CustomerServiceDao cd = new CustomerServiceDao();
		         int cidx2 = Integer.parseInt(cidx);
		         CustomerServiceVo cv = cd.CustomerServiceSelectOne(cidx2);
		         //3.���� ���� bv�� ��´�
		         request.setAttribute("cv", cv);
		         request.setAttribute("cidx", cidx2);
		         
		         RequestDispatcher rd = request.getRequestDispatcher("/jsp/adminPageCustomerServiceDetail.jsp");
		         rd.forward(request, response);   
		      
		      }else if(str.equals("/Admin2/adminPageCustomerServiceDetailAction.do")) {
		         
		         //1. input name���� �Ѱ� �޴´�
		         String cidx = request.getParameter("cidx");
		         String canswer = request.getParameter("canswer");

		         
		         //2. Dao��ü�� �������Ѽ� �Ѿ��  ���� �Է��Ѵ�
		         AnswerDao ad = new AnswerDao();
		         int cidx2 = Integer.parseInt(cidx);
		         ad.AnswerInsert(cidx2,canswer);
		         
		         //3. ó������ �̵��Ѵ�
		         response.sendRedirect(request.getContextPath()+"/Admin2/adminPageManage.do");
		      
		         //�� �����ϱ�
		      }else if(str.equals("/Admin2/adminPageNoticeModify.do")) {
		         
		         String nidx = request.getParameter("nidx");
		         int nidx2 = Integer.parseInt(nidx);
		         
		         NoticeDao nd = new NoticeDao();
		         NoticeVo nv = nd.NoticeSelectOne(nidx2);
		         
		         
		         request.setAttribute("nv", nv);
		         
		         RequestDispatcher rd = request.getRequestDispatcher("/jsp/adminPageNoticeModify.jsp");
		         rd.forward(request, response);
		         
		      }else if(str.equals("/Admin2/adminPageEduInformationModify.do")) {
		         
		         String eidx = request.getParameter("eidx");
		         int eidx2 = Integer.parseInt(eidx);
		         
		         EduinformationDao ed = new EduinformationDao();
		         EduinformationVo ev = ed.EduinformationSelectOne(eidx2);
		         
		         
		         request.setAttribute("ev", ev);
		         
		         RequestDispatcher rd = request.getRequestDispatcher("/jsp/adminPageEduInformationModify.jsp");
		         rd.forward(request, response);   
		         
		         
		      }else if(str.equals("/Admin2/adminPageCustomerServiceModify.do")) {
		         
		         String cidx = request.getParameter("cidx");
		         int cidx2 = Integer.parseInt(cidx);
		         
		         CustomerServiceDao cd = new CustomerServiceDao();
		         CustomerServiceVo cv = cd.CustomerServiceSelectOne(cidx2);
		         
		         
		         request.setAttribute("cv", cv);
		         
		         RequestDispatcher rd = request.getRequestDispatcher("/jsp/adminPageCustomerServiceModify.jsp");
		         rd.forward(request, response);   
		         
		         //�� ���� Ȯ��
		      }else if(str.equals("/Admin2/adminPageNoticeModifyAction.do")) {
		         
		         int sizeLimit = 1024*1024*15;
		         String nfile = null;
		         String originFileName = null;
		         
		         //MultipartRequest ��ü����
		         MultipartRequest multi = new MultipartRequest(request, saveFullPath, sizeLimit, "utf-8", new DefaultFileRenamePolicy()); 
		         
		         //�����ڿ�  ����Name�Ӽ��� �̸��� ��´�
		         Enumeration files = multi.getFileNames();
		         //��� ���� ��ü�� Name���� ��´�.
		         String file = (String)files.nextElement();
		         //����Ǵ� �����̸�
		         nfile = multi.getFilesystemName(file); 
		         //�������� �̸�
		         originFileName = multi.getOriginalFileName(file);
		         
		         String ThumbnailFileName = null;
		               
		         try {
		            if(nfile != null)
		            ThumbnailFileName = makeThumbnail(uploadPath,savedPath, nfile);
		         } catch (Exception e) {
		            e.printStackTrace();
		         }   
		         
		         //1. �Ѿ�� ���� ������ ����               

		         String nsubject = multi.getParameter("nsubject");      //1. input name ���� �Ѱ� �޴´�.
		         String ncontent = multi.getParameter("ncontent");
		         String nwriter = multi.getParameter("nwriter");
		         String nidx = multi.getParameter("nidx");
		         String ncategory = multi.getParameter("ncategory"); 

		         System.out.println("nidx"+nidx);
		         System.out.println("ncontent"+ncontent);
		         System.out.println("ncategory"+ncategory);
		         
		         int nidx2 = Integer.parseInt(nidx); 
		         
		         System.out.println(nidx + nidx2);
		         
		         NoticeDao nd = new NoticeDao();            //2. Dao ��ü�� �������� �Ѿ�� ���� �Է��Ѵ�.
		         int value = nd.NoticeModify(nidx2, nsubject, ncontent, nwriter, ncategory, nfile);
		         
		         response.sendRedirect(request.getContextPath()+"/Admin2/adminPageManage.do?nidx="+nidx);   //3. ó���� �� �̵��Ѵ�
		      
		         
		         //�������� ����Ȯ��
		      }else if(str.equals("/Admin2/adminPageEduInformationModifyAction.do")) {
		         
		         int sizeLimit = 1024*1024*15;
		         String efile = null;
		         String originFileName = null;
		         
		         //MultipartRequest ��ü����
		         MultipartRequest multi = new MultipartRequest(request, saveFullPath, sizeLimit, "utf-8", new DefaultFileRenamePolicy()); 
		         
		         //�����ڿ�  ����Name�Ӽ��� �̸��� ��´�
		         Enumeration files = multi.getFileNames();
		         //��� ���� ��ü�� Name���� ��´�.
		         String file = (String)files.nextElement();
		         //����Ǵ� �����̸�
		         efile = multi.getFilesystemName(file); 
		         //�������� �̸�
		         originFileName = multi.getOriginalFileName(file);
		         
		         String ThumbnailFileName = null;
		               
		         try {
		            if(efile != null)
		            ThumbnailFileName = makeThumbnail(uploadPath,savedPath, efile);
		         } catch (Exception e) {
		            e.printStackTrace();
		         }   
		         
		         //1. �Ѿ�� ���� ������ ����               

		         String esubject = multi.getParameter("esubject");      //1. input name ���� �Ѱ� �޴´�.
		         String econtent = multi.getParameter("econtent");
		         String ewriter = multi.getParameter("ewriter");
		         String eidx = multi.getParameter("eidx");
		         String ecategory = multi.getParameter("ecategory"); 

		         System.out.println("eidx"+eidx);
		         System.out.println("econtent"+econtent);
		         System.out.println("ecategory"+ecategory);
		         
		         int eidx2 = Integer.parseInt(eidx); 
		         
		         System.out.println(eidx + eidx2);
		         
		         EduinformationDao nd = new EduinformationDao();            //2. Dao ��ü�� �������� �Ѿ�� ���� �Է��Ѵ�.
		         int value = nd.EduInformationModify(eidx2, esubject, econtent, ewriter, ecategory, efile);
		         
		         response.sendRedirect(request.getContextPath()+"/Admin2/adminPageManage.do?eidx="+eidx);   //3. ó���� �� �̵��Ѵ�   
		         
		      //������ ����
		      }else if(str.equals("/Admin2/adminPageCustomerServiceModifyAction.do")) {
		         
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
		         
		         //1. �Ѿ�� ���� ������ ����               

		         String csubject = multi.getParameter("csubject");      //1. input name ���� �Ѱ� �޴´�.
		         String ccontent = multi.getParameter("ccontent");
		         String cwriter = multi.getParameter("cwriter");
		         String cidx = multi.getParameter("cidx");
		         String ccategory = multi.getParameter("ccategory"); 

		         System.out.println("cidx"+cidx);
		         System.out.println("ccontent"+ccontent);
		         System.out.println("ccategory"+ccategory);
		         
		         int cidx2 = Integer.parseInt(cidx); 
		         
		         System.out.println(cidx + cidx2);
		         
		         CustomerServiceDao cd = new CustomerServiceDao();            //2. Dao ��ü�� �������� �Ѿ�� ���� �Է��Ѵ�.
		         int value = cd.CustomerServiceModify(cidx2, csubject, ccontent, cwriter, ccategory, cfile);
		         
		         response.sendRedirect(request.getContextPath()+"/Admin2/adminPageManage.do?cidx="+cidx);   //3. ó���� �� �̵��Ѵ�   
		         
		      
		      //����
		      }else if(str.equals("/Admin2/adminPageNoticeDelete.do")) {

		         String nidx = request.getParameter("nidx");
		         
		         request.setAttribute("nidx", nidx);
		         
		         
		         
		         RequestDispatcher rd = request.getRequestDispatcher("/jsp/adminPageNoticeDelete.jsp");
		         rd.forward(request, response);
		         
		      }else if(str.equals("/Admin2/adminPageNoticeDeleteAction.do")) {
		         String nidx = request.getParameter("nidx");                     
		         int nidx2 = Integer.parseInt(nidx);
		         
		         NoticeDao nd = new NoticeDao();         
		         nd.NoticeDelete(nidx2);
		         
		         response.sendRedirect(request.getContextPath()+"/Admin2/adminPageManage.do");
		         
		      //�������� ����   
		      }else if(str.equals("/Admin2/adminPageEduInformationDelete.do")) {

		         String eidx = request.getParameter("eidx");
		         
		         request.setAttribute("eidx", eidx);
		         
		         
		         
		         RequestDispatcher rd = request.getRequestDispatcher("/jsp/adminPageEduInformationDelete.jsp");
		         rd.forward(request, response);
		         
		      }else if(str.equals("/Admin2/adminPageEduInformationDeleteAction.do")) {
		         String eidx = request.getParameter("eidx");                     
		         int eidx2 = Integer.parseInt(eidx);
		         
		         EduinformationDao ed = new EduinformationDao();         
		         ed.EduInformationDelete(eidx2);
		         
		         response.sendRedirect(request.getContextPath()+"/Admin2/adminPageManage.do");   
		         
		      //������ ����   
		      }   else if(str.equals("/Admin2/adminPageCustomerServiceDelete.do")) {

		         String cidx = request.getParameter("cidx");
		         
		         request.setAttribute("cidx", cidx);
		         
		         
		         
		         RequestDispatcher rd = request.getRequestDispatcher("/jsp/adminPageCustomerServiceDelete.jsp");
		         rd.forward(request, response);
		         
		      }else if(str.equals("/Admin2/adminPageCustomerServiceDeleteAction.do")) {
		         String cidx = request.getParameter("cidx");                     
		         int cidx2 = Integer.parseInt(cidx);
		         
		         CustomerServiceDao cd = new CustomerServiceDao();         
		         cd.CustomerServiceDelete(cidx2);
		         
		         response.sendRedirect(request.getContextPath()+"/Admin2/adminPageManage.do");   
		         
		      }
		         //���ϴٿ�ε�
		               else if (str.equals("/Admin2/fileDownload.do")) {
		                  
		                  //�Ѿ���� �����̸�
		                  String Nfile = request.getParameter("Nfile");         
		                  //������ ��ġ�� ��ü���   
		                   String filePath = saveFullPath + File.separator + Nfile;
		                          
		                   byte[] b = new byte[4096]; 
		                  //�ش���ġ�� �����ϴ� ������ ����Ʈ ��Ʈ������ �о�帰��
		                  FileInputStream fileInputStream = new FileInputStream(filePath); 
		               
		                  //����(����)Ÿ���� üũ�Ͽ� null�̸� ��Ʈ��Ÿ������ �����Ѵ�
		               //   String mimeType = getServletContext().getMimeType(filePath); 
		                  // ���� ��θ� �����Ѵ�  
		                   Path source = Paths.get(filePath);
		                   //�� ��ο� �ִ� ������ ����Ÿ���� Ȯ������ ���ϸ� null�� ��ȯ
		                    String mimeType = Files.probeContentType(source);         
		                  //�������� �ٷ�� Ȯ���ڸ�
		                  if(mimeType == null) { 
		                        // 8��Ʈ�� �� ����Ÿ�� .iniȮ������ ������ �д´�
		                        mimeType = "application/octet-stream"; 
		                     } 
		                  response.setContentType(mimeType); 
		                            
		                  
		                     // ���ϸ� UTF-8�� ���ڵ� 
		                     String sEncoding = new String(Nfile.getBytes("UTF-8"),"ISO-8859-1"); 
		                     response.setHeader("Content-Disposition", "attachment; Nfile= " + sEncoding); 
		                      
		                     //  �������� ����� �Ҷ� ServletOutputStream �߻�Ŭ����
		                     ServletOutputStream servletOutStream = response.getOutputStream(); 
		                      
		                     int read= 0; 
		                     //�о�帰 ������ 4 ����Ʈ Ÿ������ ���Ͽ� ����
		                     while((read = fileInputStream.read(b,0,b.length))!= -1){ 
		                         servletOutStream.write(b,0,read);             
		                     } 
		                      
		                     servletOutStream.flush(); 
		                     servletOutStream.close(); 
		                     fileInputStream.close();               
		                     
		               }   
		         
		                  else if (str.equals("/Admin2/fileDownload.do")) {
		                  
		                  //�Ѿ���� �����̸�
		                  String Efile = request.getParameter("efile");         
		                  //������ ��ġ�� ��ü���   
		                   String filePath = saveFullPath + File.separator + Efile;
		                          
		                   byte[] b = new byte[4096]; 
		                  //�ش���ġ�� �����ϴ� ������ ����Ʈ ��Ʈ������ �о�帰��
		                  FileInputStream fileInputStream = new FileInputStream(filePath); 
		               
		                  //����(����)Ÿ���� üũ�Ͽ� null�̸� ��Ʈ��Ÿ������ �����Ѵ�
		               //   String mimeType = getServletContext().getMimeType(filePath); 
		                  // ���� ��θ� �����Ѵ�  
		                   Path source = Paths.get(filePath);
		                   //�� ��ο� �ִ� ������ ����Ÿ���� Ȯ������ ���ϸ� null�� ��ȯ
		                    String mimeType = Files.probeContentType(source);         
		                  //�������� �ٷ�� Ȯ���ڸ�
		                  if(mimeType == null) { 
		                        // 8��Ʈ�� �� ����Ÿ�� .iniȮ������ ������ �д´�
		                        mimeType = "application/octet-stream"; 
		                     } 
		                  response.setContentType(mimeType); 
		                            
		                  
		                     // ���ϸ� UTF-8�� ���ڵ� 
		                     String sEncoding = new String(Efile.getBytes("UTF-8"),"ISO-8859-1"); 
		                     response.setHeader("Content-Disposition", "attachment; Efile= " + sEncoding); 
		                      
		                     //  �������� ����� �Ҷ� ServletOutputStream �߻�Ŭ����
		                     ServletOutputStream servletOutStream = response.getOutputStream(); 
		                      
		                     int read= 0; 
		                     //�о�帰 ������ 4 ����Ʈ Ÿ������ ���Ͽ� ����
		                     while((read = fileInputStream.read(b,0,b.length))!= -1){ 
		                         servletOutStream.write(b,0,read);             
		                     } 
		                      
		                     servletOutStream.flush(); 
		                     servletOutStream.close(); 
		                     fileInputStream.close();               
		                     
		               }
		         
		                  else if (str.equals("/Admin2/fileDownload.do")) {
		                     
		                     //�Ѿ���� �����̸�
		                     String Cfile = request.getParameter("cfile");         
		                     //������ ��ġ�� ��ü���   
		                      String filePath = saveFullPath + File.separator + Cfile;
		                             
		                      byte[] b = new byte[4096]; 
		                     //�ش���ġ�� �����ϴ� ������ ����Ʈ ��Ʈ������ �о�帰��
		                     FileInputStream fileInputStream = new FileInputStream(filePath); 
		                  
		                     //����(����)Ÿ���� üũ�Ͽ� null�̸� ��Ʈ��Ÿ������ �����Ѵ�
		                  //   String mimeType = getServletContext().getMimeType(filePath); 
		                     // ���� ��θ� �����Ѵ�  
		                      Path source = Paths.get(filePath);
		                      //�� ��ο� �ִ� ������ ����Ÿ���� Ȯ������ ���ϸ� null�� ��ȯ
		                       String mimeType = Files.probeContentType(source);         
		                     //�������� �ٷ�� Ȯ���ڸ�
		                     if(mimeType == null) { 
		                           // 8��Ʈ�� �� ����Ÿ�� .iniȮ������ ������ �д´�
		                           mimeType = "application/octet-stream"; 
		                        } 
		                     response.setContentType(mimeType); 
		                               
		                     
		                        // ���ϸ� UTF-8�� ���ڵ� 
		                        String sEncoding = new String(Cfile.getBytes("UTF-8"),"ISO-8859-1"); 
		                        response.setHeader("Content-Disposition", "attachment; Cfile= " + sEncoding); 
		                         
		                        //  �������� ����� �Ҷ� ServletOutputStream �߻�Ŭ����
		                        ServletOutputStream servletOutStream = response.getOutputStream(); 
		                         
		                        int read= 0; 
		                        //�о�帰 ������ 4 ����Ʈ Ÿ������ ���Ͽ� ����
		                        while((read = fileInputStream.read(b,0,b.length))!= -1){ 
		                            servletOutStream.write(b,0,read);             
		                        } 
		                         
		                        servletOutStream.flush(); 
		                        servletOutStream.close(); 
		                        fileInputStream.close();               
		                        
		                  }
		      }
		   
		   
		   
		   
		   protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		   doGet(request, response);
		   
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

