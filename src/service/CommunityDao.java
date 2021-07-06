package service;

import java.sql.Connection; 
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import dbconn.DBconn;
import Domain.SearchCriteria;

public class CommunityDao {
	
	private Connection conn; //전역변수 (멤버변수 이기 때문)
	private PreparedStatement pstmt;
	
	//생성자
		public CommunityDao() {
			
			//DB연결객체생성
			DBconn dbconn = new DBconn();
			//DB연결
			this.conn = dbconn.getConnection();
			
		}
		
		public int CommunityInsert(String Cosubject, String Cocontent, String Cowrite, String Cofile) {
			int exec=0;
			
			String sql = "insert into community(coidx,cosubject,cocontent,cowrite,cofile) values(sq_coidx.nextval,?,?,?,?)";
			try{
				
				PreparedStatement pstmt = conn.prepareStatement(sql); //보안 (해킹방지)
					pstmt.setString(1,Cosubject);
					pstmt.setString(2,Cocontent);
					pstmt.setString(3,Cowrite);
					pstmt.setString(4,Cofile);
					
					exec = pstmt.executeUpdate();

			}catch (Exception e){
				e.printStackTrace();
			}return exec;
		}
		
public ArrayList<CommunityVo> CommunitySelectAll(SearchCriteria scri){	
			
			ArrayList<CommunityVo> alist129 = new ArrayList<CommunityVo>();
			
			String sql = "select rnum, B.* from (select rownum as rnum, A.* from (select * from community where codelyn='N' and cosubject like ? order by coidx desc)A where rownum <= ?)B where rnum >= ?";
					
			try {
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, "%"+scri.getKeyword()+"%");
				pstmt.setInt(2, scri.getPage()*15);
				pstmt.setInt(3, (scri.getPage()-1)*15+1);
				ResultSet rs = pstmt.executeQuery();
			
			while(rs.next()) {
				CommunityVo civ = new CommunityVo();
				civ.setCoidx(rs.getInt("coidx"));
				civ.setCosubject(rs.getString("cosubject"));
				civ.setCocontent(rs.getString("cocontent"));
				civ.setCowrite(rs.getString("cowrite"));
				civ.setCowriteday(rs.getString("cowriteday"));
				civ.setCofile(rs.getString("cofile"));
				
				alist129.add(civ);
			}
			} catch (SQLException e) {
				e.printStackTrace();
			}
		
			return alist129;
		}

public CommunityVo CommunitySelectOne(int Coidx) {
	CommunityVo civ = null;
	ResultSet rs = null;
	
	String sql="select * from community where coidx=?";
	
	 try {
		pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, Coidx);
		rs = pstmt.executeQuery();
		
		if(rs.next()) {
			civ = new CommunityVo();
			civ.setCoidx(rs.getInt("coidx"));			
			civ.setCosubject(rs.getString("cosubject"));
			civ.setCowrite(rs.getString("cowrite"));
			civ.setCowriteday(rs.getString("cowriteday"));
			civ.setCocontent(rs.getString("cocontent"));
			civ.setCofile(rs.getString("cofile"));
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
	
	return civ;
}

}
