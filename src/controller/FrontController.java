package controller;

import java.io.IOException; 
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("*.do")
public class FrontController extends HttpServlet {
	
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String uri = request.getRequestURI();
		String projectname = request.getContextPath();
		int jarinum = projectname.length();
		String str = uri.substring(jarinum);
	
		String[] po = str.split("/");
		String hc = po[1];
		
		if(hc.equals("Common")) {
			//System.out.println("Common");
			CommonController cc = new CommonController();
			cc.doGet(request, response);
			
		}else if(hc.equals("Member")) {
			System.out.println("Member");
			MemberController mbc = new MemberController();
			mbc.doGet(request, response);
			
		}else if(hc.equals("Licensee")) {
			System.out.println("Licensee");
			LicenseeController lc = new LicenseeController(); 
			lc.doGet(request, response);
			
		}else if(hc.equals("Notice")) {
			NoticeController nc = new NoticeController();
			nc.doGet(request, response);
	
		}else if(hc.equals("Eduinformation")) {
			EduinformationController ec = new EduinformationController();
			ec.doGet(request, response);
	
		}else if(hc.equals("Customerservice")) {
			CustomerserviceController cc = new CustomerserviceController();
			cc.doGet(request, response);
	
		}else if(hc.equals("Institute")) {
			InstituteController ic = new InstituteController();
			ic.doGet(request, response);
	
		}else if(hc.equals("Admin")) {
			AdminController ac = new AdminController();
			ac.doGet(request, response);
		
		}else if(hc.equals("Admin2")) {
			System.out.println("Admin2");
			Admin2Controller a2c = new Admin2Controller();
			a2c.doGet(request, response);
		
		}else if(hc.equals("Myservice")) {
			MyserviceController mc = new MyserviceController();
			mc.doGet(request, response);
			
		}
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
   
}
