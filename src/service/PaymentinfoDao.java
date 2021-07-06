package service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import dbconn.DBconn;
import Domain.SearchCriteria;

public class PaymentinfoDao {
	
	private   Connection conn;
	private PreparedStatement pstmt;
	
	public PaymentinfoDao() {
		   DBconn dbconn = new DBconn();
		   this.conn = dbconn.getConnection();
		   
		}
	
	public int Paymentinfo(int Midx, int Iidx, int Cidx) {
		   int exec = 0;
		   
		       
		       String sql= "insert into Paymentinfo(Piidx, Midx, Iidx, Cidx) values(sq_piidx.nextval,?,?,?)";
		      
		   
		    try {
		      pstmt = conn.prepareStatement(sql);
		      pstmt.setInt(1, Midx);
		      pstmt.setInt(2, Iidx);
		      pstmt.setInt(3, Cidx);

		   
		      exec = pstmt.executeUpdate();

		   
		    } catch (SQLException e) { e.printStackTrace(); }
		    
		   
		   return exec;
		   
		   }
	
	public ArrayList<PaymentinfoVo> PaymentSelectAll(SearchCriteria scri){
		   
		   ArrayList<PaymentinfoVo> alist3 = new ArrayList<PaymentinfoVo>();
		   
		   
		   String sql =  "select B.* from (select rownum as rnum, A.* from  (select p.piidx, p.midx, p.iidx, p.cidx, m.mname, i.iname, c.cname, c.ctime, " + 
		   		"            c.cperiod, c.cwriteday " + 
		   		"		     from paymentinfo p, institute i, course c, edupickmember m " + 
		   		"		   	where p.pidelyn='N'    " + 
		   		"		   		  and p.CIDX = c.CIDX   " + 
		   		"		   		  and p.IIDX = i.IIDX  " + 
		   		"		   		 and p.MIDX = m.MIDX  " + 
		   		"		   		order by p.piidx desc) A " + 
		   		"		         where rownum >= ?) B " + 
		   		"		         where B.rnum <= ?";
		   try {
		   pstmt = conn.prepareStatement(sql);
		   //pstmt.setString(1, "%"+scri.getKeyword()+"%");
		   pstmt.setInt(1, (scri.getPage()-1)*15+1);
		   pstmt.setInt(2, scri.getPage()*15);
		  
		   ResultSet rs = pstmt.executeQuery();

		   while(rs.next()) {
			  PaymentinfoVo piv = new PaymentinfoVo();
			  piv.setPiidx(rs.getInt("piidx"));
			  piv.setMidx(rs.getInt("midx"));
			  piv.setIidx(rs.getInt("iidx"));
			  piv.setCidx(rs.getInt("cidx"));
			  piv.setMname(rs.getString("mname"));
			  piv.setIname(rs.getString("iname"));
			  piv.setCname(rs.getString("cname"));
			  piv.setCtime(rs.getString("ctime"));
			  piv.setCperiod(rs.getString("cperiod"));
			  piv.setCwriteday(rs.getString("cwriteday"));
		      alist3.add(piv);
		      }
		   
		   }catch (SQLException e) {
		         e.printStackTrace();
		   }
		   
		   return alist3;
		}      
	
	public int PaymentinfoTotal(String keyword) {
		   int cnt2 = 0;
		   ResultSet rs = null;
		   String sql = "select count(*) as cnt from paymentinfo where pidelyn='N' and piidx like ?";
		   try {
		      pstmt = conn.prepareStatement(sql);
		      pstmt.setString(1, "%"+keyword+"%");
		      rs = pstmt.executeQuery();

		      if(rs.next()) {
		         cnt2 = rs.getInt("cnt");
		      }
		   } catch (SQLException e) {
		   
		   e.printStackTrace();
		   }
		   System.out.println("sql->"+cnt2);
		   return cnt2;

		}
	
	
	public ArrayList<PaymentinfoVo> PaymentAdmin(SearchCriteria scri){
		   
		   ArrayList<PaymentinfoVo> alist4 = new ArrayList<PaymentinfoVo>();
		   
		   
		   String sql =  "select B.* from (select rownum as rnum, A.* from  (select p.piidx, p.midx, p.iidx, p.cidx, m.mname, i.iname, c.cname, c.ctime, " + 
		   		"            c.cperiod, c.cwriteday, c.cprice " + 
		   		"		     from paymentinfo p, institute i, course c, edupickmember m  " + 
		   		"		   	where p.pidelyn='N'    " + 
		   		"		   		  and p.CIDX = c.CIDX   " + 
		   		"		   		  and p.IIDX = i.IIDX  " + 
		   		"		   		 and p.MIDX = m.MIDX  " + 
		   		"		   		order by p.piidx desc) A " + 
		   		"		         where rownum >= ?) B " + 
		   		"		         where B.rnum <= ?";
		   try {
		   pstmt = conn.prepareStatement(sql);
		   //pstmt.setString(1, "%"+scri.getKeyword()+"%");
		   pstmt.setInt(1, (scri.getPage()-1)*15+1);
		   pstmt.setInt(2, scri.getPage()*15);
		  
		   ResultSet rs = pstmt.executeQuery();

		   while(rs.next()) {
			  PaymentinfoVo piv = new PaymentinfoVo();
			  piv.setPiidx(rs.getInt("piidx"));
			  piv.setMidx(rs.getInt("midx"));
			  piv.setIidx(rs.getInt("iidx"));
			  piv.setCidx(rs.getInt("cidx"));
			  piv.setMname(rs.getString("mname"));
			  piv.setIname(rs.getString("iname"));
			  piv.setCname(rs.getString("cname"));
			  piv.setCtime(rs.getString("ctime"));
			  piv.setCperiod(rs.getString("cperiod"));
			  piv.setCwriteday(rs.getString("cwriteday"));
			  piv.setCprice(rs.getString("cprice"));
		      alist4.add(piv);
		      }
		   
		   }catch (SQLException e) {
		         e.printStackTrace();
		   }
		   
		   return alist4;
		}
	
	
	public PaymentinfoVo PaymentinfoSelectOne(int piidx) {
		PaymentinfoVo piv = null;
	    
	    try {
	       String sql = "select * from paymentinfo where piidx =?";
	       //String sql2 = "select"
	       pstmt = conn.prepareStatement(sql);
	       pstmt.setInt(1, piidx);
	       ResultSet rs = pstmt.executeQuery();      
	       if(rs.next()) {
	          piv = new PaymentinfoVo();
	          piv.setMidx(rs.getInt("midx"));
	          piv.setIidx(rs.getInt("iidx"));
	          piv.setCidx(rs.getInt("cidx"));
	          piv.setIname(rs.getString("iname"));
	          piv.setCname(rs.getString("cname"));
	          piv.setCprice(rs.getString("cprice"));
	          piv.setMname(rs.getString("mname"));
	          piv.setMtel(rs.getString("mtel"));
	          piv.setMpostcode(rs.getString("mpostcode"));
	          piv.setMjibunaddr(rs.getString("mjibunaddr"));
	          piv.setPiidx(rs.getInt("piidx"));
	          
	       }
	       
	       }catch (Exception e){
	          e.printStackTrace();
	       }
	       
	       return piv ;
	       
	 
	       }
	
	public ArrayList<PaymentinfoVo> mycourse(SearchCriteria scri){
		   
		   ArrayList<PaymentinfoVo> alistmy = new ArrayList<PaymentinfoVo>();
		   
		   
		   String sql =  "select B.* from (select rownum as rnum, A.* from  (select p.piidx, p.midx, p.iidx, p.cidx, i.ifile, i.iname, c.cname, c.ctime, " + 
		   		"             c.cprice " + 
		   		"		     from paymentinfo p, institute i, course c, edupickmember m  " + 
		   		"		   	where p.pidelyn='N'    " + 
		   		"		   		  and p.CIDX = c.CIDX   " + 
		   		"		   		  and p.IIDX = i.IIDX  " + 
		   		"		   		 and p.MIDX = m.MIDX  " + 
		   		"		   		order by p.piidx desc) A " + 
		   		"		         where rownum >= ?) B " + 
		   		"		         where B.rnum <= ?";
		   try {
		   pstmt = conn.prepareStatement(sql);
		   //pstmt.setString(1, "%"+scri.getKeyword()+"%");
		   pstmt.setInt(1, (scri.getPage()-1)*15+1);
		   pstmt.setInt(2, scri.getPage()*15);
		  
		   ResultSet rs = pstmt.executeQuery();

		   while(rs.next()) {
			  PaymentinfoVo piv = new PaymentinfoVo();
			  piv.setPiidx(rs.getInt("piidx"));
			  piv.setMidx(rs.getInt("midx"));
			  piv.setIidx(rs.getInt("iidx"));
			  piv.setCidx(rs.getInt("cidx"));
			  piv.setIfile(rs.getString("ifile"));
			  piv.setIname(rs.getString("iname"));
			  piv.setCname(rs.getString("cname"));
			  piv.setCtime(rs.getString("ctime"));
			  piv.setCprice(rs.getString("cprice"));
		      alistmy.add(piv);
		      }
		   
		   }catch (SQLException e) {
		         e.printStackTrace();
		   }
		   
		   return alistmy;
		}

	

}
