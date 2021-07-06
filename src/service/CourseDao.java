package service;

import java.sql.Connection;      
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import Domain.SearchCriteria;
import dbconn.DBconn;


public class CourseDao {
   //엠버변수이기 때문에 전역변수로도 사용된다.         
private   Connection conn;
private PreparedStatement pstmt;
            
            //생성자         
            
public CourseDao() {
   DBconn dbconn = new DBconn();
   this.conn = dbconn.getConnection();
   
}


public int CourseInsert(String Cname , String Cprice, String Cperiod, String Ctime, String Cpeople, String Cbook, String Caim, String Cfile) {
	   int exec = 0;
	   
	       
	       
	       String sql= "insert into course(cidx, cname, cprice, cperiod, ctime, cpeople, cbook, caim, cfile ) values(sq_course.nextval,?,?,?,?,?,?,?,?)";
	      
	   
	    try {
	      pstmt = conn.prepareStatement(sql);
	      pstmt.setString(1, Cname);
	      pstmt.setString(2, Cprice);
	      pstmt.setString(3, Cperiod);
	      pstmt.setString(4, Ctime);
	      pstmt.setString(5, Cpeople);
	      pstmt.setString(6, Cbook);
	      pstmt.setString(7, Caim);
	      pstmt.setString(8, Cfile);
	      
	      
	      System.out.println("cName--->"+ Cname);
	      System.out.println("cPrice--->" + Cprice);
	      System.out.println("cperiod--->"+Cperiod);
	      System.out.println("cTime--->"+Ctime);
	      System.out.println("cpeople--->"+Cpeople);
	      System.out.println("cbook--->"+Cbook);
	      System.out.println("cAime--->"+Caim);
	      System.out.println("cFile--->"+Cfile);
	   
	      exec = pstmt.executeUpdate();

	   
	    } catch (SQLException e) { e.printStackTrace(); }
	    
	   
	   return exec;
	   
	   }
	public ArrayList<CourseVo> CourseSelectAll(SearchCriteria scri){
	   
	   ArrayList<CourseVo> alist = new ArrayList<CourseVo>();
	   
	   
	   String sql =  " select B.* from (select rownum as rnum, A.* from  ("
	         + " select * from course where cdelyn='N'"
	         + " order by cidx desc) A"
	         + " where rownum <= ?) B"
	         + " where B.rnum >= ?";
	   try {
	   pstmt = conn.prepareStatement(sql);
	   //pstmt.setString(1, "%"+scri.getKeyword()+"%");
	   pstmt.setInt(1, scri.getPage()*15);
	   pstmt.setInt(2, (scri.getPage()-1)*15+1);
	   ResultSet rs = pstmt.executeQuery();

	   while(rs.next()) {
	      CourseVo cv = new CourseVo();
	      cv.setCidx(rs.getInt("cidx"));
	      cv.setCname(rs.getString("cname"));
	      cv.setCprice(rs.getString("cprice"));
	      cv.setCperiod(rs.getString("cperiod"));
	      cv.setCtime(rs.getString("ctime"));
	      cv.setCpeople(rs.getString("cpeople"));
	      cv.setCbook(rs.getString("cbook"));
	      cv.setCaim(rs.getString("caim"));
	      cv.setCfile(rs.getString("cfile"));
	      
	      alist.add(cv);
	      }
	   
	   }catch (SQLException e) {
	         e.printStackTrace();
	   }
	   
	   return alist;
	}      

	public int CourseTotal(String keyword) {
	   int cnt = 0;
	   ResultSet rs = null;
	   String sql = "select count(*) as cnt from course where cdelyn='N' and cname like ?";
	   try {
	      pstmt = conn.prepareStatement(sql);
	      pstmt.setString(1, "%"+keyword+"%");
	      rs = pstmt.executeQuery();

	      if(rs.next()) {
	         cnt = rs.getInt("cnt");
	      }
	   } catch (SQLException e) {
	   
	   e.printStackTrace();
	   }
	   System.out.println("sql->"+cnt);
	   return cnt;

	}
	public CourseVo CourseSelectOne(int cidx) {
		CourseVo cv = null;
		ResultSet rs = null;
		
		String sql="select * from course where cidx=?";
		
		 try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, cidx);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				cv = new CourseVo();
				cv.setCname(rs.getString("cname"));
				cv.setCprice(rs.getString("cprice"));
				cv.setCperiod(rs.getString("cperiod"));
				cv.setCtime(rs.getString("ctime"));
				cv.setCpeople(rs.getString("cpeople"));
				cv.setCbook(rs.getString("cbook"));
				cv.setCaim(rs.getString("caim"));
				cv.setCfile(rs.getString("cfile"));
				cv.setCidx(rs.getInt("cidx"));
				
			}
			
			
			
			
		} catch (SQLException e) {
			
			e.printStackTrace();
		} finally {
			try {
				rs.close();
				pstmt.close();
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
			
		}
		
		return cv;
	}

	public ArrayList<CourseVo> Courseshow(SearchCriteria scri){
		   
		   ArrayList<CourseVo> alist2 = new ArrayList<CourseVo>();
		   
		   
		   String sql =  " select B.* from (select rownum as rnum, A.* from  ("
		         + " select * from course where cdelyn='N'"
		         + " order by cidx desc) A"
		         + " where rownum <= ?) B"
		         + " where B.rnum >= ?";
		   try {
		   pstmt = conn.prepareStatement(sql);
		   //pstmt.setString(1, "%"+scri.getKeyword()+"%");
		   pstmt.setInt(1, scri.getPage()*15);
		   pstmt.setInt(2, (scri.getPage()-1)*15+1);
		   ResultSet rs = pstmt.executeQuery();

		   while(rs.next()) {
		      CourseVo cv = new CourseVo();
		      cv.setCidx(rs.getInt("cidx"));
		      cv.setCname(rs.getString("cname"));
		      cv.setCprice(rs.getString("cprice"));
		      cv.setCperiod(rs.getString("cperiod"));
		      cv.setCtime(rs.getString("ctime"));
		      cv.setCpeople(rs.getString("cpeople"));
		      cv.setCbook(rs.getString("cbook"));
		      cv.setCaim(rs.getString("caim"));
		      cv.setCfile(rs.getString("cfile"));
		      cv.setCwriteday(rs.getString("cwriteday"));
		      
		      alist2.add(cv);
		      }
		   
		   }catch (SQLException e) {
		         e.printStackTrace();
		   }
		   
		   return alist2;
		}


	public int CourseModify(int cidx, String cname, String cprice, String cperiod, String ctime, String cpeople, String cbook, String caim, String cfile) {
		
		int value=0;
		
		String sql = "update course set cname=?, cprice=?, cperiod=?, ctime=?, cpeople=?, cbook=?, caim=?, cfile=? where cidx=?";
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			
			pstmt.setString(1, cname);
			pstmt.setString(2, cprice);
			pstmt.setString(3, cperiod);
			pstmt.setString(4, ctime);
			pstmt.setString(5, cpeople);
			pstmt.setString(6, cbook);
			pstmt.setString(7, caim);
			pstmt.setString(8, cfile);
			pstmt.setInt(9, cidx);
			value = pstmt.executeUpdate();
			
			
		} catch (SQLException e) {	
			e.printStackTrace();
		}

		return value;
	}



	}






