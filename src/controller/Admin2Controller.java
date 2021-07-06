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
		
		 //업로드 파일 경로
		String uploadPath = "C:\\Users\\Administrator\\Desktop\\독수리\\에듀픽수정\\edupick\\WebContent\\";
		//저장폴더
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
		
			
			  if (str.equals("/Admin2/adminInstituteAdd.do")) {
	        	  
			         
		          RequestDispatcher rd = request.getRequestDispatcher("/jsp/adminInstituteAdd.jsp");
		         rd.forward(request, response);   
		         
		         
		         }else if(str.equals("/Admin2/adminInstituteInsertAction.do")) {
		            
		        	 int sizeLimit = 1024*1024*15;
						String fileName = null;
						String originFileName = null;
						
						//MultipartRequest 객체생성
						MultipartRequest multi = new MultipartRequest(request, saveFullPath, sizeLimit, "utf-8", new DefaultFileRenamePolicy()); 
						
						//열거자에  파일Name속성의 이름을 담는다
						Enumeration files = multi.getFileNames();
						//담긴 파일 객체의 Name값을 담는다.
						String file = (String)files.nextElement();
						//저장되는 파일이름
						fileName = multi.getFilesystemName(file); 
						//원래파일 이름
						originFileName = multi.getOriginalFileName(file);
						System.out.println("file ->"+file);
						
						String ThumbnailFileName = null;
								
						try {
							if(fileName != null)
							ThumbnailFileName = makeThumbnail(uploadPath,savedPath, fileName);
						} catch (Exception e) {
							e.printStackTrace();
						}		
						
						
						//1. input name값을 넘겨 받는다
						
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
		            
		            //3.처리한 후 이동한다.
		            response.sendRedirect(request.getContextPath()+"/Admin2/adminProductManage.do");
		         
		            
		            
		         
		         
		         
		         //관리자 계정관리
		      }else if(str.equals("/Admin2/adminInstituteDetail.do")) {
		    	  
		    	  String iidx = request.getParameter("iidx");
					
					//2.db에 저장된 데이터를 nbidx에 대한 데이터를 가져온다
					InstituteDao id = new InstituteDao();
					int iidx2 = Integer.parseInt(iidx);
					InstituteVo iv = id.InstituteSelectOne(iidx2);
					//3.리턴 받은 bv를 담는다
					request.setAttribute("iv", iv);	
		         
		         RequestDispatcher rd = request.getRequestDispatcher("/jsp/adminInstituteDetail.jsp");
		         rd.forward(request, response);   
		         
		         
		      
		         
		      }else if(str.equals("/Admin2/adminInstituteModify.do")) {
		    	  
		    	  String iidx = request.getParameter("iidx");
					
					//2.db에 저장된 데이터를 nbidx에 대한 데이터를 가져온다
					InstituteDao id = new InstituteDao();
					int iidx2 = Integer.parseInt(iidx);
					InstituteVo iv = id.InstituteSelectOne(iidx2);
					//3.리턴 받은 bv를 담는다
					request.setAttribute("iv", iv);	
		         
		         RequestDispatcher rd = request.getRequestDispatcher("/jsp/adminInstituteModify.jsp");
		         rd.forward(request, response);   
		         
		      }  else if(str.equals("/Admin2/adminInstituteModifyAction.do")) {
		             
		        	 int sizeLimit = 1024*1024*15;
						String fileName = null;
						String originFileName = null;
						
						//MultipartRequest 객체생성
						MultipartRequest multi = new MultipartRequest(request, saveFullPath, sizeLimit, "utf-8", new DefaultFileRenamePolicy()); 
						
						//열거자에  파일Name속성의 이름을 담는다
						Enumeration files = multi.getFileNames();
						//담긴 파일 객체의 Name값을 담는다.
						String file = (String)files.nextElement();
						//저장되는 파일이름
						fileName = multi.getFilesystemName(file); 
						//원래파일 이름
						originFileName = multi.getOriginalFileName(file);
						System.out.println("file ->"+file);
						
						String ThumbnailFileName = null;
								
						try {
							if(fileName != null)
							ThumbnailFileName = makeThumbnail(uploadPath,savedPath, fileName);
						} catch (Exception e) {
							e.printStackTrace();
						}		
						
						
						//1. input name값을 넘겨 받는다
						
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
		            
		            //3.처리한 후 이동한다.
		            response.sendRedirect(request.getContextPath()+"/Admin2/adminProductManage.do");
		         
		      }else if(str.equals("/Admin2/adminCoures.do")) {
		         
		         RequestDispatcher rd = request.getRequestDispatcher("/jsp/adminCoures.jsp");
		         rd.forward(request, response);   
		      
		      }else if(str.equals("/Admin2/adminCourseAction.do")) {
		          
		    	  int sizeLimit = 1024*1024*15;
					String Cfile = null;
					String originFileName = null;
					
					//MultipartRequest 객체생성
					MultipartRequest multi = new MultipartRequest(request, saveFullPath, sizeLimit, "utf-8", new DefaultFileRenamePolicy()); 
					
					//열거자에  파일Name속성의 이름을 담는다
					Enumeration files = multi.getFileNames();
					//담긴 파일 객체의 Name값을 담는다.
					String file = (String)files.nextElement();
					//저장되는 파일이름
					Cfile = multi.getFilesystemName(file); 
					//원래파일 이름
					originFileName = multi.getOriginalFileName(file);
					System.out.println("file ->"+file);
					
					String ThumbnailFileName = null;
							
					try {
						if(Cfile != null)
						ThumbnailFileName = makeThumbnail(uploadPath,savedPath, Cfile);
					} catch (Exception e) {
						e.printStackTrace();
					}		
						
						//1. input name값을 넘겨 받는다
						String Cname = multi.getParameter("cname");
						String Cprice = multi.getParameter("cprice");
						String Cperiod = multi.getParameter("cperiod");
						String Ctime = multi.getParameter("ctime");
						String Cpeople = multi.getParameter("cpeople");
						String Cbook = multi.getParameter("cbook");
						String Caim = multi.getParameter("caim");
						
						

						CourseDao cd = new CourseDao();	
						cd.CourseInsert(Cname , Cprice, Cperiod, Ctime, Cpeople, Cbook, Caim, Cfile);
		          
		          //3.처리한 후 이동한다.
		          response.sendRedirect(request.getContextPath()+"/Admin2/adminProductManage.do");
		       
		          
		         
		   
		      }else if(str.equals("/Admin2/adminCouresDetail.do")) {
		    	  
		    	  String cidx = request.getParameter("cidx");
					
					//2.db에 저장된 데이터를 nbidx에 대한 데이터를 가져온다
					CourseDao cd = new CourseDao();
					int cidx2 = Integer.parseInt(cidx);
					CourseVo cv = cd.CourseSelectOne(cidx2);
					//3.리턴 받은 bv를 담는다
					request.setAttribute("cv", cv);	
		         
		         RequestDispatcher rd = request.getRequestDispatcher("/jsp/adminCouresDetail.jsp");
		         rd.forward(request, response);   
		      
		      
		      }else if(str.equals("/Admin2/adminCouresModify.do")) {
		    	  
		    	  String cidx = request.getParameter("cidx");
					
					//2.db에 저장된 데이터를 nbidx에 대한 데이터를 가져온다
					CourseDao cd = new CourseDao();
					int cidx2 = Integer.parseInt(cidx);
					CourseVo cv = cd.CourseSelectOne(cidx2);
					//3.리턴 받은 bv를 담는다
					request.setAttribute("cv", cv);
		         
		         RequestDispatcher rd = request.getRequestDispatcher("/jsp/adminCouresModify.jsp");
		         rd.forward(request, response);   
		      
		      }else if(str.equals("/Admin2/adminCourseModifyAction.do")) {
		          
		     	 int sizeLimit = 1024*1024*15;
						String fileName = null;
						String originFileName = null;
						
						//MultipartRequest 객체생성
						MultipartRequest multi = new MultipartRequest(request, saveFullPath, sizeLimit, "utf-8", new DefaultFileRenamePolicy()); 
						
						//열거자에  파일Name속성의 이름을 담는다
						Enumeration files = multi.getFileNames();
						//담긴 파일 객체의 Name값을 담는다.
						String file = (String)files.nextElement();
						//저장되는 파일이름
						fileName = multi.getFilesystemName(file); 
						//원래파일 이름
						originFileName = multi.getOriginalFileName(file);
						System.out.println("file ->"+file);
						
						String ThumbnailFileName = null;
								
						try {
							if(fileName != null)
							ThumbnailFileName = makeThumbnail(uploadPath,savedPath, fileName);
						} catch (Exception e) {
							e.printStackTrace();
						}		
						
						
						//1. input name값을 넘겨 받는다
						
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
		         
		         //3.처리한 후 이동한다.
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
		    	  
		    	//페이징값 파라미터로 넘겨주기
					String page = request.getParameter("page");
					//리스트에 아무런 게시물이 없어도 1이 보이도록 한다.
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
		         
		         
		    	//페이징값 파라미터로 넘겨주기
					String page = request.getParameter("page");
					//리스트에 아무런 게시물이 없어도 1이 보이도록 한다.
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
		         //키워드 검색
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
		         
		         //MultipartRequest 객체생성
		         MultipartRequest multi = new MultipartRequest(request, saveFullPath, sizeLimit, "utf-8", new DefaultFileRenamePolicy()); 
		         
		         //열거자에  파일Name속성의 이름을 담는다
		         Enumeration files = multi.getFileNames();
		         //담긴 파일 객체의 Name값을 담는다.
		         String file = (String)files.nextElement();
		         //저장되는 파일이름
		         efile = multi.getFilesystemName(file); 
		         //원래파일 이름
		         originFileName = multi.getOriginalFileName(file);
		         
		         String ThumbnailFileName = null;
		               
		         try {
		            if(efile != null)
		            ThumbnailFileName = makeThumbnail(uploadPath,savedPath, efile);
		         } catch (Exception e) {
		            e.printStackTrace();
		         }      
		         
		         //1. input name값을 넘겨 받는다
		         String esubject = multi.getParameter("esubject");
		         String econtents = multi.getParameter("econtent");
		         String ewriter = multi.getParameter("ewriter");
		         String ecategory = multi.getParameter("ecategory");

		         
		         //2. Dao객체를 생성시켜서 넘어온  값을 입력한다
		         EduinformationDao ed = new EduinformationDao();
		         ed.EduinformationInsert(esubject, econtents, ewriter, ecategory , efile);
		         
		         //3. 처리한후 이동한다
		         response.sendRedirect(request.getContextPath()+"/Admin2/adminPageManage.do");
		      
		      
		      }else if(str.equals("/Admin2/adminPageCustomerService.do")) {
		         
		         RequestDispatcher rd = request.getRequestDispatcher("/jsp/adminPageCustomerService.jsp");
		         rd.forward(request, response);   
		         
		      }else if(str.equals("/Admin2/adminPageCustomerServiceAction.do")) {
		      
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
		         cd.CustomerServiceInsert(csubject, ccontents, cwriter, ccategory , cfile);
		         
		         //3. 처리한후 이동한다
		         response.sendRedirect(request.getContextPath()+"/Admin2/adminPageManage.do");   
		      
		      }else if(str.equals("/Admin2/adminPageNoticeAction.do")) {
		         
		         int sizeLimit = 1024*1024*15;
		         String nfile = null;
		         String originFileName = null;
		         
		         //MultipartRequest 객체생성
		         MultipartRequest multi = new MultipartRequest(request, saveFullPath, sizeLimit, "utf-8", new DefaultFileRenamePolicy()); 
		         
		         //열거자에  파일Name속성의 이름을 담는다
		         Enumeration files = multi.getFileNames();
		         //담긴 파일 객체의 Name값을 담는다.
		         String file = (String)files.nextElement();
		         //저장되는 파일이름
		         nfile = multi.getFilesystemName(file); 
		         //원래파일 이름
		         originFileName = multi.getOriginalFileName(file);
		         
		         String ThumbnailFileName = null;
		               
		         try {
		            if(nfile != null)
		            ThumbnailFileName = makeThumbnail(uploadPath,savedPath, nfile);
		         } catch (Exception e) {
		            e.printStackTrace();
		         }      
		         
		         //1. input name값을 넘겨 받는다
		         String nsubject = multi.getParameter("nsubject");
		         String ncontents = multi.getParameter("ncontent");
		         String nwriter = multi.getParameter("nwriter");
		         String ncategory = multi.getParameter("ncategory");

		         
		         //2. Dao객체를 생성시켜서 넘어온  값을 입력한다
		         NoticeDao nd = new NoticeDao();
		         System.out.println("nsubject"+nsubject+" ncontents,"+ ncontents+" nwriter"+ nwriter+"nfile"+nfile);
		         nd.NoticeInsert(nsubject, ncontents, nwriter, ncategory , nfile);
		         
		         //3. 처리한후 이동한다
		         response.sendRedirect(request.getContextPath()+"/Admin2/adminPageManage.do");
		         
		      }else if(str.equals("/Admin2/adminPageNoticeDetail.do")) {
		         
		         String nidx = request.getParameter("nidx");
		         
		         //2.db에 저장된 데이터를 nbidx에 대한 데이터를 가져온다
		         NoticeDao nd = new NoticeDao();
		         int nidx2 = Integer.parseInt(nidx);
		         NoticeVo nv = nd.NoticeSelectOne(nidx2);
		         //3.리턴 받은 bv를 담는다
		         request.setAttribute("nv", nv);
		         
		         RequestDispatcher rd = request.getRequestDispatcher("/jsp/adminPageNoticeDetail.jsp");
		         rd.forward(request, response);   
		      
		      }
		         else if(str.equals("/Admin2/adminPageEduInformationDetail.do")) {
		         
		            String eidx = request.getParameter("eidx");
		            
		            //2.db에 저장된 데이터를 nbidx에 대한 데이터를 가져온다
		            EduinformationDao ed = new EduinformationDao();
		            int eidx2 = Integer.parseInt(eidx);
		            EduinformationVo ev = ed.EduinformationSelectOne(eidx2);
		            //3.리턴 받은 bv를 담는다
		            request.setAttribute("ev", ev);
		            
		            RequestDispatcher rd = request.getRequestDispatcher("/jsp/adminPageEduInformationDetail.jsp");
		            rd.forward(request, response);   
		         
		      }else if(str.equals("/Admin2/adminPageCustomerServiceDetail.do")) {
		         
		         String cidx = request.getParameter("cidx");
		         
		         //2.db에 저장된 데이터를 nbidx에 대한 데이터를 가져온다
		         CustomerServiceDao cd = new CustomerServiceDao();
		         int cidx2 = Integer.parseInt(cidx);
		         CustomerServiceVo cv = cd.CustomerServiceSelectOne(cidx2);
		         //3.리턴 받은 bv를 담는다
		         request.setAttribute("cv", cv);
		         request.setAttribute("cidx", cidx2);
		         
		         RequestDispatcher rd = request.getRequestDispatcher("/jsp/adminPageCustomerServiceDetail.jsp");
		         rd.forward(request, response);   
		      
		      }else if(str.equals("/Admin2/adminPageCustomerServiceDetailAction.do")) {
		         
		         //1. input name값을 넘겨 받는다
		         String cidx = request.getParameter("cidx");
		         String canswer = request.getParameter("canswer");

		         
		         //2. Dao객체를 생성시켜서 넘어온  값을 입력한다
		         AnswerDao ad = new AnswerDao();
		         int cidx2 = Integer.parseInt(cidx);
		         ad.AnswerInsert(cidx2,canswer);
		         
		         //3. 처리한후 이동한다
		         response.sendRedirect(request.getContextPath()+"/Admin2/adminPageManage.do");
		      
		         //글 수정하기
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
		         
		         //글 수정 확인
		      }else if(str.equals("/Admin2/adminPageNoticeModifyAction.do")) {
		         
		         int sizeLimit = 1024*1024*15;
		         String nfile = null;
		         String originFileName = null;
		         
		         //MultipartRequest 객체생성
		         MultipartRequest multi = new MultipartRequest(request, saveFullPath, sizeLimit, "utf-8", new DefaultFileRenamePolicy()); 
		         
		         //열거자에  파일Name속성의 이름을 담는다
		         Enumeration files = multi.getFileNames();
		         //담긴 파일 객체의 Name값을 담는다.
		         String file = (String)files.nextElement();
		         //저장되는 파일이름
		         nfile = multi.getFilesystemName(file); 
		         //원래파일 이름
		         originFileName = multi.getOriginalFileName(file);
		         
		         String ThumbnailFileName = null;
		               
		         try {
		            if(nfile != null)
		            ThumbnailFileName = makeThumbnail(uploadPath,savedPath, nfile);
		         } catch (Exception e) {
		            e.printStackTrace();
		         }   
		         
		         //1. 넘어온 값을 변수에 저장               

		         String nsubject = multi.getParameter("nsubject");      //1. input name 값을 넘겨 받는다.
		         String ncontent = multi.getParameter("ncontent");
		         String nwriter = multi.getParameter("nwriter");
		         String nidx = multi.getParameter("nidx");
		         String ncategory = multi.getParameter("ncategory"); 

		         System.out.println("nidx"+nidx);
		         System.out.println("ncontent"+ncontent);
		         System.out.println("ncategory"+ncategory);
		         
		         int nidx2 = Integer.parseInt(nidx); 
		         
		         System.out.println(nidx + nidx2);
		         
		         NoticeDao nd = new NoticeDao();            //2. Dao 객체를 생성시켜 넘어온 값을 입력한다.
		         int value = nd.NoticeModify(nidx2, nsubject, ncontent, nwriter, ncategory, nfile);
		         
		         response.sendRedirect(request.getContextPath()+"/Admin2/adminPageManage.do?nidx="+nidx);   //3. 처리한 후 이동한다
		      
		         
		         //교육정보 수정확인
		      }else if(str.equals("/Admin2/adminPageEduInformationModifyAction.do")) {
		         
		         int sizeLimit = 1024*1024*15;
		         String efile = null;
		         String originFileName = null;
		         
		         //MultipartRequest 객체생성
		         MultipartRequest multi = new MultipartRequest(request, saveFullPath, sizeLimit, "utf-8", new DefaultFileRenamePolicy()); 
		         
		         //열거자에  파일Name속성의 이름을 담는다
		         Enumeration files = multi.getFileNames();
		         //담긴 파일 객체의 Name값을 담는다.
		         String file = (String)files.nextElement();
		         //저장되는 파일이름
		         efile = multi.getFilesystemName(file); 
		         //원래파일 이름
		         originFileName = multi.getOriginalFileName(file);
		         
		         String ThumbnailFileName = null;
		               
		         try {
		            if(efile != null)
		            ThumbnailFileName = makeThumbnail(uploadPath,savedPath, efile);
		         } catch (Exception e) {
		            e.printStackTrace();
		         }   
		         
		         //1. 넘어온 값을 변수에 저장               

		         String esubject = multi.getParameter("esubject");      //1. input name 값을 넘겨 받는다.
		         String econtent = multi.getParameter("econtent");
		         String ewriter = multi.getParameter("ewriter");
		         String eidx = multi.getParameter("eidx");
		         String ecategory = multi.getParameter("ecategory"); 

		         System.out.println("eidx"+eidx);
		         System.out.println("econtent"+econtent);
		         System.out.println("ecategory"+ecategory);
		         
		         int eidx2 = Integer.parseInt(eidx); 
		         
		         System.out.println(eidx + eidx2);
		         
		         EduinformationDao nd = new EduinformationDao();            //2. Dao 객체를 생성시켜 넘어온 값을 입력한다.
		         int value = nd.EduInformationModify(eidx2, esubject, econtent, ewriter, ecategory, efile);
		         
		         response.sendRedirect(request.getContextPath()+"/Admin2/adminPageManage.do?eidx="+eidx);   //3. 처리한 후 이동한다   
		         
		      //고객센터 수정
		      }else if(str.equals("/Admin2/adminPageCustomerServiceModifyAction.do")) {
		         
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
		         
		         //1. 넘어온 값을 변수에 저장               

		         String csubject = multi.getParameter("csubject");      //1. input name 값을 넘겨 받는다.
		         String ccontent = multi.getParameter("ccontent");
		         String cwriter = multi.getParameter("cwriter");
		         String cidx = multi.getParameter("cidx");
		         String ccategory = multi.getParameter("ccategory"); 

		         System.out.println("cidx"+cidx);
		         System.out.println("ccontent"+ccontent);
		         System.out.println("ccategory"+ccategory);
		         
		         int cidx2 = Integer.parseInt(cidx); 
		         
		         System.out.println(cidx + cidx2);
		         
		         CustomerServiceDao cd = new CustomerServiceDao();            //2. Dao 객체를 생성시켜 넘어온 값을 입력한다.
		         int value = cd.CustomerServiceModify(cidx2, csubject, ccontent, cwriter, ccategory, cfile);
		         
		         response.sendRedirect(request.getContextPath()+"/Admin2/adminPageManage.do?cidx="+cidx);   //3. 처리한 후 이동한다   
		         
		      
		      //삭제
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
		         
		      //교육정보 삭제   
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
		         
		      //고객센터 삭제   
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
		         //파일다운로드
		               else if (str.equals("/Admin2/fileDownload.do")) {
		                  
		                  //넘어오는 파일이름
		                  String Nfile = request.getParameter("Nfile");         
		                  //파일의 위치한 전체경로   
		                   String filePath = saveFullPath + File.separator + Nfile;
		                          
		                   byte[] b = new byte[4096]; 
		                  //해당위치에 존재하는 파일을 바이트 스트림으로 읽어드린다
		                  FileInputStream fileInputStream = new FileInputStream(filePath); 
		               
		                  //마임(파일)타입을 체크하여 null이면 스트림타입으로 지정한다
		               //   String mimeType = getServletContext().getMimeType(filePath); 
		                  // 절대 경로를 정의한다  
		                   Path source = Paths.get(filePath);
		                   //그 경로에 있는 파일의 마임타입을 확인하지 못하면 null을 반환
		                    String mimeType = Files.probeContentType(source);         
		                  //서버에서 다루는 확장자명
		                  if(mimeType == null) { 
		                        // 8비트로 된 데이타로 .ini확장자의 파일을 읽는다
		                        mimeType = "application/octet-stream"; 
		                     } 
		                  response.setContentType(mimeType); 
		                            
		                  
		                     // 파일명 UTF-8로 인코딩 
		                     String sEncoding = new String(Nfile.getBytes("UTF-8"),"ISO-8859-1"); 
		                     response.setHeader("Content-Disposition", "attachment; Nfile= " + sEncoding); 
		                      
		                     //  브라우저에 출력을 할때 ServletOutputStream 추상클래스
		                     ServletOutputStream servletOutStream = response.getOutputStream(); 
		                      
		                     int read= 0; 
		                     //읽어드린 파일을 4 바이트 타입으로 파일에 쓴다
		                     while((read = fileInputStream.read(b,0,b.length))!= -1){ 
		                         servletOutStream.write(b,0,read);             
		                     } 
		                      
		                     servletOutStream.flush(); 
		                     servletOutStream.close(); 
		                     fileInputStream.close();               
		                     
		               }   
		         
		                  else if (str.equals("/Admin2/fileDownload.do")) {
		                  
		                  //넘어오는 파일이름
		                  String Efile = request.getParameter("efile");         
		                  //파일의 위치한 전체경로   
		                   String filePath = saveFullPath + File.separator + Efile;
		                          
		                   byte[] b = new byte[4096]; 
		                  //해당위치에 존재하는 파일을 바이트 스트림으로 읽어드린다
		                  FileInputStream fileInputStream = new FileInputStream(filePath); 
		               
		                  //마임(파일)타입을 체크하여 null이면 스트림타입으로 지정한다
		               //   String mimeType = getServletContext().getMimeType(filePath); 
		                  // 절대 경로를 정의한다  
		                   Path source = Paths.get(filePath);
		                   //그 경로에 있는 파일의 마임타입을 확인하지 못하면 null을 반환
		                    String mimeType = Files.probeContentType(source);         
		                  //서버에서 다루는 확장자명
		                  if(mimeType == null) { 
		                        // 8비트로 된 데이타로 .ini확장자의 파일을 읽는다
		                        mimeType = "application/octet-stream"; 
		                     } 
		                  response.setContentType(mimeType); 
		                            
		                  
		                     // 파일명 UTF-8로 인코딩 
		                     String sEncoding = new String(Efile.getBytes("UTF-8"),"ISO-8859-1"); 
		                     response.setHeader("Content-Disposition", "attachment; Efile= " + sEncoding); 
		                      
		                     //  브라우저에 출력을 할때 ServletOutputStream 추상클래스
		                     ServletOutputStream servletOutStream = response.getOutputStream(); 
		                      
		                     int read= 0; 
		                     //읽어드린 파일을 4 바이트 타입으로 파일에 쓴다
		                     while((read = fileInputStream.read(b,0,b.length))!= -1){ 
		                         servletOutStream.write(b,0,read);             
		                     } 
		                      
		                     servletOutStream.flush(); 
		                     servletOutStream.close(); 
		                     fileInputStream.close();               
		                     
		               }
		         
		                  else if (str.equals("/Admin2/fileDownload.do")) {
		                     
		                     //넘어오는 파일이름
		                     String Cfile = request.getParameter("cfile");         
		                     //파일의 위치한 전체경로   
		                      String filePath = saveFullPath + File.separator + Cfile;
		                             
		                      byte[] b = new byte[4096]; 
		                     //해당위치에 존재하는 파일을 바이트 스트림으로 읽어드린다
		                     FileInputStream fileInputStream = new FileInputStream(filePath); 
		                  
		                     //마임(파일)타입을 체크하여 null이면 스트림타입으로 지정한다
		                  //   String mimeType = getServletContext().getMimeType(filePath); 
		                     // 절대 경로를 정의한다  
		                      Path source = Paths.get(filePath);
		                      //그 경로에 있는 파일의 마임타입을 확인하지 못하면 null을 반환
		                       String mimeType = Files.probeContentType(source);         
		                     //서버에서 다루는 확장자명
		                     if(mimeType == null) { 
		                           // 8비트로 된 데이타로 .ini확장자의 파일을 읽는다
		                           mimeType = "application/octet-stream"; 
		                        } 
		                     response.setContentType(mimeType); 
		                               
		                     
		                        // 파일명 UTF-8로 인코딩 
		                        String sEncoding = new String(Cfile.getBytes("UTF-8"),"ISO-8859-1"); 
		                        response.setHeader("Content-Disposition", "attachment; Cfile= " + sEncoding); 
		                         
		                        //  브라우저에 출력을 할때 ServletOutputStream 추상클래스
		                        ServletOutputStream servletOutStream = response.getOutputStream(); 
		                         
		                        int read= 0; 
		                        //읽어드린 파일을 4 바이트 타입으로 파일에 쓴다
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

