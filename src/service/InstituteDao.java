package service;

import java.sql.Connection;      
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import Domain.SearchCriteria;
import dbconn.DBconn;

public class InstituteDao {
	//엠버변수이기 때문에 전역변수로도 사용된다.			
private	Connection conn;
private PreparedStatement pstmt;
				
				//생성자			
				
public InstituteDao() {
	DBconn dbconn = new DBconn();
	this.conn = dbconn.getConnection();
	
}


public int InstituteInsert(String iName , String iPostCode, String iRoadAddr, String iJibunAddr, String iDetailAddr, String iExtraAddr, String iTel, String iMin, String iMax, String iSubjects, String iNeeds, String iIntroduce, String iFile) {
	int exec = 0;
	
	 	System.out.println("Diname--->"+ iName);
	    System.out.println("DiPostCode--->" + iPostCode);
	    System.out.println("Diroadaddr--->"+iRoadAddr);
	    System.out.println("DiJibunaddr--->"+iJibunAddr);
	    System.out.println("Didetailaddr--->"+iDetailAddr);
	    System.out.println("Diextraaddr--->"+iExtraAddr);
	    System.out.println("Ditel--->"+iTel);
	    System.out.println("Dimin--->"+iMin);
	    System.out.println("Dimax--->"+iMax);
	    System.out.println("DiSubjects--->"+iSubjects);
	    System.out.println("Dineeds--->"+iNeeds);
	    System.out.println("Diintroduce--->"+iIntroduce);
	    System.out.println("Difile--->"+iFile);	
	    String sql= "insert into institute(iidx,iname, ipostcode, iroadaddr, ijibunaddr, idetailaddr, iextraaddr, itel, imin, imax, isubjects, ineeds, iintroduce, ifile) values(sq_institute.nextval,?,?,?,?,?,?,?,?,?,?,?,?,?)";
		
	
	 try {
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, iName);
		pstmt.setString(2, iPostCode);
		pstmt.setString(3, iRoadAddr);
		pstmt.setString(4, iJibunAddr);
		pstmt.setString(5, iDetailAddr);
		pstmt.setString(6, iExtraAddr);
		pstmt.setString(7, iTel);
		pstmt.setString(8, iMin);
		pstmt.setString(9, iMax);
		pstmt.setString(10, iSubjects);
		pstmt.setString(11, iNeeds);
		pstmt.setString(12, iIntroduce);
		pstmt.setString(13, iFile);
		
		exec = pstmt.executeUpdate();

	
	 } catch (SQLException e) { e.printStackTrace(); }
	 
	
	return exec;
	
	}
public ArrayList<InstituteVo> InstituteSelectAll(SearchCriteria scri){
	
	ArrayList<InstituteVo> alist = new ArrayList<InstituteVo>();

	
	String sql =  " select B.* from (select rownum as rnum, A.* from  ("
	         + " select * from institute where idelyn='N'"
	         + " order by iidx desc) A"
	         + " where rownum <= ?) B"
	         + " where B.rnum >= ?";
	try {
	pstmt = conn.prepareStatement(sql);
	//pstmt.setString(1, "%"+scri.getKeyword()+"%");
	pstmt.setInt(1, scri.getPage()*15);
	pstmt.setInt(2, (scri.getPage()-1)*15+1);
	ResultSet rs = pstmt.executeQuery();

	while(rs.next()) {
		InstituteVo iv = new InstituteVo();
		iv.setIidx(rs.getInt("iidx"));
		iv.setIname(rs.getString("iname"));
		iv.setIpostcode(rs.getString("ipostcode"));
		iv.setIroadaddr(rs.getString("iroadaddr"));
		iv.setIjibunaddr(rs.getString("ijibunaddr"));
		iv.setIdetailaddr(rs.getString("idetailaddr"));
		iv.setIextraaddr(rs.getString("iextraaddr"));
		iv.setItel(rs.getString("itel"));
		iv.setImin(rs.getString("imin"));
		iv.setImax(rs.getString("imax"));
		iv.setIsubjects(rs.getString("isubjects"));
		iv.setIneeds(rs.getString("ineeds"));
		iv.setIintroduce(rs.getString("iintroduce"));
		iv.setIdelyn(rs.getString("idelyn"));
		iv.setIfile(rs.getString("ifile"));
		iv.setIwriteday(rs.getString("iwriteday"));
		alist.add(iv);
		}
	
	}catch (SQLException e) {
			e.printStackTrace();
	}
	
	return alist;
}		

public int InstituteTotal(String keyword) {
	int cnt = 0;
	ResultSet rs = null;


	String sql = "select count(*) as cnt from institute where idelyn='N' and iname like ?";
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
public InstituteVo InstituteSelectOne(int iidx) {
    InstituteVo iv = null;
    
    try {
       String sql = "select * from institute where iidx =?";
       //String sql2 = "select"
       pstmt = conn.prepareStatement(sql);
       pstmt.setInt(1, iidx);
       ResultSet rs = pstmt.executeQuery();      
       if(rs.next()) {
          iv = new InstituteVo();
          iv.setIname(rs.getString("iname"));
          iv.setIpostcode(rs.getString("ipostcode"));
          iv.setIroadaddr(rs.getString("iroadaddr"));
          iv.setIjibunaddr(rs.getString("ijibunaddr"));
          iv.setIdetailaddr(rs.getString("idetailaddr"));
          iv.setIextraaddr(rs.getString("iextraaddr"));
          iv.setItel(rs.getString("itel"));
          iv.setImin(rs.getString("imin"));
          iv.setImax(rs.getString("imax"));
          iv.setIsubjects(rs.getString("isubjects"));
          iv.setIneeds(rs.getString("ineeds"));
          iv.setIintroduce(rs.getString("iintroduce"));
          iv.setIfile(rs.getString("ifile"));
          iv.setIidx(rs.getInt("iidx"));
       }
       
       }catch (Exception e){
          e.printStackTrace();
       }
       System.out.println("selectsql--->"+iv);
    	return iv ;
       
 
       }
	public int instituteKeywordAll(int iidx, String iName) {
		
		
		
		
		return iidx;
	}
	
	public int InstituteModify(int iidx, String iname, String iroadaddr, String idetailaddr, String itel, String isubjects, String ineeds, String iintroduce, String ifile) {
		
		int value=0;
		
		String sql = "update institute set iname=?, iroadaddr=?, idetailaddr=?, itel=?, isubjects=?, ineeds=?, iintroduce=?, ifile=? where iidx=?";
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			
			pstmt.setString(1, iname);
			pstmt.setString(2, iroadaddr);
			pstmt.setString(3, idetailaddr);
			pstmt.setString(4, itel);
			pstmt.setString(5, isubjects);
			pstmt.setString(6, ineeds);
			pstmt.setString(7, iintroduce);
			pstmt.setString(8, ifile);
			pstmt.setInt(9, iidx);
			value = pstmt.executeUpdate();
			
			
		} catch (SQLException e) {	
			e.printStackTrace();
		}
	
		return value;
	}
}









