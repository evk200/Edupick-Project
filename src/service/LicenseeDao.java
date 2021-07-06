package service;

import java.sql.Connection;  
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import dbconn.DBconn;

public class LicenseeDao {

	private Connection conn; 
	private PreparedStatement pstmt;

	public LicenseeDao(){
		DBconn dbconn = new DBconn();	
		this.conn = dbconn.getConnection();
	
}
	//회원가입 db에 입력
	public int licenseeInsert(String lId, String lName, String lPwd, String lJumin, String lPostCode, String lRoadAddr, String lJibunAddr, String lDetailAddr, String lExtraAddr, String lEmail, String lTel, String lComName, String lNumber) {
	      int exec = 0;
	      
	      System.out.println("lId->"+lId);
	      System.out.println("lName->"+lName);
	      System.out.println("lPwd->"+lPwd);
	      System.out.println("lJumin->"+lJumin);
	      System.out.println("lPostCode->"+lPostCode);
	      System.out.println("lRoadAddr->"+lRoadAddr);
	      System.out.println("lJibunAddr->"+lJibunAddr);
	      System.out.println("lDetailAddr->"+lDetailAddr);
	      System.out.println("lExtraAddr->"+lExtraAddr);
	      System.out.println("lEmail->"+lEmail);
	      System.out.println("lTel->"+lTel);
	      System.out.println("lComName->"+lComName);
	      System.out.println("lNumber->"+lNumber);
	      
	      
	      
	       try {
	         String sql= "insert into licensee(lidx, lid, lname, lpwd, ljumin, lpostcode, lroadaddr, ljibunaddr, ldetailaddr, lextraaddr, lemail, ltel, lcomname, lnumber, lgrade) values(sq_licensee.nextval,?,?,?,?,?,?,?,?,?,?,?,?,?,'L')";
	         pstmt = conn.prepareStatement(sql);
	         pstmt.setString(1, lId);
	         pstmt.setString(2, lName);
	         pstmt.setString(3, lPwd);
	         pstmt.setString(4, lJumin);
	         pstmt.setString(5, lPostCode);
	         pstmt.setString(6, lRoadAddr);
	         pstmt.setString(7, lJibunAddr);
	         pstmt.setString(8, lDetailAddr);
	         pstmt.setString(9, lExtraAddr);
	         pstmt.setString(10, lEmail);
	         pstmt.setString(11, lTel);
	         pstmt.setString(12, lComName);
	         pstmt.setString(13, lNumber);
	         
	         pstmt.executeUpdate();
	      
	         
	       } catch (SQLException e) { e.printStackTrace(); }
	       
	      System.out.println("licensee->"+exec);
	      return exec;
	      
	   }
	public int loginCheck(String lId, String lPwd) {
	System.out.println("lId->>>>>" + lId);
	System.out.println("lPwd->>>>>>"+lPwd);
		int value2 = 0;
		try {
		String sql = "select count(*) as cnt from licensee where lid = ? and lpwd = ?" ;
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, lId);
		pstmt.setString(2, lPwd);
		ResultSet rs = pstmt.executeQuery();
		
		if(rs.next()) {
		value2 = rs.getInt("cnt");
		}
		}catch(Exception e) {
			System.out.println("해당하는 사람이 존재하지 않습니다.");
		}
		System.out.println("value logincheck->"+value2);
		return value2;

}
public LicenseeVo getName(String lName, String lPwd) {
	LicenseeVo lv = new LicenseeVo();
	String name = null;
	String lgrade = null;
	try {
		String sql = "select lname,lgrade from licensee where lid=? and lpwd=?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, lName);
		pstmt.setString(2, lPwd);
		ResultSet rs = pstmt.executeQuery();
		
		if(rs.next()) {
			name = rs.getString("lname");
			lgrade = rs.getString("lgrade");
			lv.setLname(name);
			lv.setLgrade(lgrade);
		}
	}catch(Exception e) {
		System.out.println("해당하는 사람이 존재하지 않습니다.");
	}
	return lv;	

}
public String findId(String lName, String lTel) {
	String id = null;
	try {
		String sql = "select lid from licensee where lname=? and ltel=?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, lName);
		pstmt.setString(2, lTel);
		ResultSet rs = pstmt.executeQuery();
	
		if(rs.next()) {
		id = rs.getString("lid");
		}
		}catch(Exception e) {
			System.out.println("해당하는 사람이 존재하지 않습니다.");
		}
	return id;

}
public String findPwd(String lId, String lName, String lJumin) {
	
		String pwd = null;
		try {
			String sql = "select lpwd from licensee where lid=? and lname=? and ljumin=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, lId);
			pstmt.setString(2, lName);
			pstmt.setString(2, lJumin);
		
			ResultSet rs = pstmt.executeQuery();
		
			if(rs.next()) {
				pwd = rs.getString("lpwd");
			}
		}catch(Exception e) {
			System.out.println("해당하는 사람이 존재하지 않습니다.");
		}
		return pwd;
	}
	
	public LicenseeVo getInForm(String lId) {
	      LicenseeVo lv = null;
	      
	      try {
	         String sql = "select * from licensee where lid =?";
	         //String sql2 = "select"
	         pstmt = conn.prepareStatement(sql);
	         pstmt.setString(1, lId);
	         ResultSet rs = pstmt.executeQuery();      
	         if(rs.next()) {
	            lv = new LicenseeVo();
	            lv.setLidx(rs.getInt("lidx"));
	            lv.setLid(rs.getString("lid"));
	            lv.setLpwd(rs.getString("lpwd"));
	            lv.setLname(rs.getString("lname"));
	            lv.setLjumin(rs.getString("ljumin"));
	            lv.setLtel(rs.getString("ltel"));
	            lv.setLemail(rs.getString("lemail"));
	            lv.setLpostcode(rs.getString("lpostcode"));
	            lv.setLroadaddr(rs.getString("lroadaddr"));
	            lv.setLjibunaddr(rs.getString("ljibunaddr"));
	            lv.setLdetailaddr(rs.getString("ldetailaddr"));
	            lv.setLextraaddr(rs.getString("lextraaddr"));
	            lv.setLcomname(rs.getString("lcomname"));
	            lv.setLnumber(rs.getString("lnumber"));
	         }
	         
	         }catch (Exception e){
	            e.printStackTrace();
	         }
	         return lv ;
	         
	   
	         }
	   public int licenseeModify(int lidx, String lPwd, String lPostCode, String lRoadAddr, String lJibunAddr, String lDetailAddr, String lExtraAddr, String lEmail, String lTel, String lComName, String lNumber ) {
	      
	      int value2 = 0;
	      
	      try {
	         String sql = "update licensee set lpwd=? , lpostcode =?, lroadaddr =?, ljibunaddr=? , ldetailaddr=? , lextraaddr =?, lemail=? ,ltel = ?, lcomname=?, lnumber=?"
	               +"where lidx=?";
	         
	         pstmt = conn.prepareStatement(sql);
	         pstmt.setString(1, lPwd);
	         pstmt.setString(2, lPostCode);
	         pstmt.setString(3, lRoadAddr);
	         pstmt.setString(4, lJibunAddr);
	         pstmt.setString(5, lDetailAddr);
	         pstmt.setString(6, lExtraAddr);
	         pstmt.setString(7, lEmail);
	         pstmt.setString(8, lTel);
	         pstmt.setString(9, lComName);
	         pstmt.setString(10, lNumber);
	         pstmt.setInt(11, lidx);
	         value2 = pstmt.executeUpdate();
	      
	      }catch(Exception e) {
	         e.printStackTrace();
	      }finally {
	         try {pstmt.close(); }catch(SQLException s) {}
	         try {conn.close();}catch(SQLException s) {}
	      }   
	      return value2;
	      
	      
	   } 
	   public int licenseeDelete(int lidx, String lPwd) {
			
      	 int value = 0;
      	 
      	 String sql = "update licensee set ldelyn='Y' where lpwd=?";
      	 	try {
      			pstmt =	conn.prepareStatement(sql);
      			
      			pstmt.setString(1, lPwd);
      			
      			value = pstmt.executeUpdate();
      			
      			} catch (SQLException e) {
      				
      				e.printStackTrace();
      			}
      			return value; 
      	 
      }
	 
	   
}