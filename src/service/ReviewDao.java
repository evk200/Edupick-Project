package service;

import java.sql.Connection; 
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import dbconn.DBconn;
import Domain.SearchCriteria;

public class ReviewDao {
	
	private   Connection conn;
	private PreparedStatement pstmt;
	            
	            //»ý¼ºÀÚ         
	            
	public ReviewDao() {
	   DBconn dbconn = new DBconn();
	   this.conn = dbconn.getConnection();
	   
	}
	
	public int ReviewInsert(String rcontent , String rwriter, int iidx) {
		   int exec = 0;
		   
		      
		       String sql= "insert into review(ridx, rcontent, rwriter, iidx) values(ridx_seq.nextval, ?,?,?)";
		      
		   
		    try {
		      pstmt = conn.prepareStatement(sql);
		      pstmt.setString(1, rcontent);
		      pstmt.setString(2, rwriter);
		      pstmt.setInt(3, iidx);
		     // pstmt.setInt(4, cidx);
		      
		      exec = pstmt.executeUpdate();

		   
		    } catch (SQLException e) { e.printStackTrace(); }
		    
		   
		   return exec;
		   
		   }
	
	public ArrayList<ReviewVo> ReviewSelectAll(SearchCriteria scri){
		   
		   ArrayList<ReviewVo> alistm = new ArrayList<ReviewVo>();
		   
		   
		   String sql =  " select B.* from (select rownum as rnum, A.* from  ("
		         + " select * from review where rdelyn='N'"
		         + " order by ridx desc) A"
		         + " where rownum <= ?) B"
		         + " where B.rnum >= ?";
		   try {
		   pstmt = conn.prepareStatement(sql);
		   //pstmt.setString(1, "%"+scri.getKeyword()+"%");
		   pstmt.setInt(1, scri.getPage()*15);
		   pstmt.setInt(2, (scri.getPage()-1)*15+1);
		   ResultSet rs = pstmt.executeQuery();

		   while(rs.next()) {
			  ReviewVo rv = new ReviewVo();
		      
		      rv.setRcontent(rs.getString("rcontent"));
		      rv.setRwriter(rs.getString("rwriter"));
		      rv.setRwriteday(rs.getString("rwriteday"));
		      alistm.add(rv);
		      }
		   
		   }catch (SQLException e) {
		         e.printStackTrace();
		   }
		   
		   return alistm;
		} 
	
	public ArrayList<ReviewVo> AdminReview(SearchCriteria scri){
		   
		   ArrayList<ReviewVo> alistmu = new ArrayList<ReviewVo>();
		   
		   
		   String sql =  " select B.* from (select rownum as rnum, A.* from  ("
		         + " select * from review where rdelyn='N'"
		         + " order by ridx desc) A"
		         + " where rownum >= ?) B"
		         + " where B.rnum <= ?";
		   try {
		   pstmt = conn.prepareStatement(sql);
		   //pstmt.setString(1, "%"+scri.getKeyword()+"%");
		   System.out.println("scri.getPage()*15->"+scri.getPage()*15);
		   System.out.println("(scri.getPage()-1)*15+1->"+(scri.getPage()-1)*15+1);
		   pstmt.setInt(1, (scri.getPage()-1)*15+1);
		   pstmt.setInt(2, scri.getPage()*15);
		   
		   ResultSet rs = pstmt.executeQuery();

		   while(rs.next()) {
			  ReviewVo rv = new ReviewVo();
		      rv.setRidx(rs.getInt("ridx"));
		      rv.setRcontent(rs.getString("rcontent"));
		      rv.setRwriter(rs.getString("rwriter"));
		      rv.setRwriteday(rs.getString("rwriteday"));
//		      rv.setIname(rs.getString("iname"));
//		      rv.setCname(rs.getString("cname"));
		      alistmu.add(rv);
		      }
		   
		   
		   
		   }catch (SQLException e) {
		         e.printStackTrace();
		   }
		   
		   return alistmu;
		}

}
