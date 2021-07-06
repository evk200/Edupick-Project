package service;

import java.sql.Connection; 
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import Domain.SearchCriteria;
import dbconn.DBconn;

public class AdminDao {
	//엠버변수이기 때문에 전역변수로도 사용된다.			
private	Connection conn;
private PreparedStatement pstmt;
				
				//생성자			
				
public AdminDao() {
	DBconn dbconn = new DBconn();
	this.conn = dbconn.getConnection();
	

	}
public ArrayList<MemberVo> memberSelectAll(SearchCriteria scri){
	ArrayList<MemberVo> alist = new ArrayList<MemberVo>();
	
	String sql= "select * from (\r\n" +
		   "select midx as idx, mgrade as grade, mid as id, mname as name, memail as email, mtel as tel, mjoindate as joindate \r\n"+
		    "from edupickmember \r\n" + 
		    "union all \r\n" + 
		    "select lidx, lgrade, lid, lname, lemail, ltel, ljoindate \r\n"+
		    "from licensee \r\n" +
		    ") order by joindate desc";


	try {
	pstmt = conn.prepareStatement(sql);
	ResultSet rs = pstmt.executeQuery();

	while(rs.next()) {
		MemberVo mv = new MemberVo();
		mv.setMidx(rs.getInt("idx"));
		mv.setMgrade(rs.getString("grade"));
		mv.setMid(rs.getString("id"));
		mv.setMname(rs.getString("name"));
		mv.setMemail(rs.getString("email"));
		mv.setMtel(rs.getString("tel"));
		mv.setMjoindate(rs.getString("joindate"));
		alist.add(mv);
		}
	
	}catch (SQLException e) {
		
		
		
		
		
		
			e.printStackTrace();
		
	}
	

	return  alist;
}
	public int memberTotal(String keyword) {
		int cnt = 0;
		ResultSet rs = null;
		String sql = "select count(*) as cnt from where mdelyn='N', ldelyn='N', mname and name like ?";
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
	
		return cnt;
	
}




}

