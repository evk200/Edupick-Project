package service;

import java.sql.Connection; 
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import dbconn.DBconn;
import Domain.SearchCriteria;

public class CustomerServiceDao {

	private Connection conn; //전역변수 (멤버변수 이기 때문)
	private PreparedStatement pstmt;
	
	//생성자
	public CustomerServiceDao() {
		
		//DB연결객체생성
		DBconn dbconn = new DBconn();
		//DB연결
		this.conn = dbconn.getConnection();
		
	}
	
	public int CustomerServiceInsert(String csubject, String ccontent, String cwriter, String ccategory ,String cfile) {
		int exec=0;
		
		String sql = "insert into customerservice(cidx,csubject,ccontent,cwriter,ccategory,chit,cimage,cfile) values(cidx_seq.nextval,?,?,?,?,0,'1',?)";
		try{
			
			PreparedStatement pstmt = conn.prepareStatement(sql); //보안 (해킹방지)

				pstmt.setString(1,csubject);
				pstmt.setString(2,ccontent);
				pstmt.setString(3,cwriter);
				pstmt.setString(4,ccategory);
				pstmt.setString(5,cfile);
				exec = pstmt.executeUpdate();

		}catch (Exception e){
			e.printStackTrace();
		}return exec;
	}
	
	public ArrayList<CustomerServiceVo> CustomerServiceSelectAll(SearchCriteria scri){	
			
			ArrayList<CustomerServiceVo> alist3 = new ArrayList<CustomerServiceVo>();
			
			String sql = "select rnum, B.* from (select rownum as rnum, A.* from (select * from customerservice where cdelyn='N' and csubject like ? order by cidx desc)A where rownum <= ?)B where rnum >= ?";
					
			try {
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, "%"+scri.getKeyword()+"%");
				pstmt.setInt(2, scri.getPage()*15);
				pstmt.setInt(3, (scri.getPage()-1)*15+1);
				ResultSet rs = pstmt.executeQuery();
			
			while(rs.next()) {
				CustomerServiceVo cv = new CustomerServiceVo();
				cv.setCidx(rs.getInt("cidx"));
				cv.setCsubject(rs.getString("csubject"));
				cv.setCcontent(rs.getString("ccontent"));
				cv.setCwriter(rs.getString("cwriter"));
				cv.setCwriteday(rs.getString("cwriteday"));
				cv.setCcategory(rs.getString("ccategory"));
				cv.setCfile(rs.getString("cfile"));
				
				alist3.add(cv);
			}
			} catch (SQLException e) {
				e.printStackTrace();
			}
		
			return alist3;
		}
	public CustomerServiceVo CustomerServiceSelectOne(int cidx) {
		CustomerServiceVo cv = null;
		ResultSet rs = null;
		
		String sql="select * from customerservice where cidx=?";
		
		 try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, cidx);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				cv = new CustomerServiceVo();
				cv.setCsubject(rs.getString("csubject"));
				cv.setCcontent(rs.getString("ccontent"));
				cv.setCwriter(rs.getString("cwriter"));
				cv.setCwriteday(rs.getString("cwriteday"));
				cv.setCcategory(rs.getString("ccategory"));
				cv.setCfile(rs.getString("cfile"));
				cv.setCidx(rs.getInt("Cidx"));
				
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
	public int CustomerServiceTotal(String keyword) {
		int cnt=0;
		ResultSet rs = null; 
		
		String sql = "select count(*) as cnt from customerservice where cdelyn='N' and csubject like ?";
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
	}//수정
	public int CustomerServiceModify(int cidx, String csubject, String ccontent, String cwriter, String ccategory, String cfile) {
		System.out.println("cidx"+cidx);
		System.out.println("csubject"+csubject);
		System.out.println("ccontent"+ccontent);
		System.out.println("cwriter"+cwriter);
		System.out.println("ccategory"+ccategory);
		System.out.println("cfile"+cfile);
		
		
		int value=0;
		
		String sql = "update customerservice set csubject=?, ccontent=?, cwriter=?, ccategory=?,cfile=? where cidx=?";
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, csubject);
			pstmt.setString(2, ccontent);
			pstmt.setString(3, cwriter);
			pstmt.setString(4, ccategory);
			pstmt.setString(5, cfile);
			pstmt.setInt(6, cidx);
			value = pstmt.executeUpdate();
			
			
		} catch (SQLException e) {	
			e.printStackTrace();
		}
	
		return value;
	}
	//삭제
	public int CustomerServiceDelete(int cidx) {
		int value=0;
		
		String sql = "update customerservice set cdelyn='Y' where cidx=?";
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, cidx);
			value = pstmt.executeUpdate();
			
			
		} catch (SQLException e) {	
			e.printStackTrace();
		}
		
		return value;
	}
	
	public ArrayList<CustomerServiceVo> CustomerServiceqnaSelect(SearchCriteria scri){	
		
		ArrayList<CustomerServiceVo> alistqna = new ArrayList<CustomerServiceVo>();
		
		String sql = "select rnum, B.* from (select rownum as rnum, A.* from (select * from customerservice where ccategory = 'qna' and cdelyn='N' and csubject like ? order by cidx desc)A where rownum <= ?)B where rnum >= ?";
				
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, "%"+scri.getKeyword()+"%");
			pstmt.setInt(2, scri.getPage()*15);
			pstmt.setInt(3, (scri.getPage()-1)*15+1);
			ResultSet rs = pstmt.executeQuery();
		
		while(rs.next()) {
			CustomerServiceVo cv = new CustomerServiceVo();
			cv.setCidx(rs.getInt("cidx"));
			cv.setCsubject(rs.getString("csubject"));
			cv.setCcontent(rs.getString("ccontent"));
			cv.setCwriter(rs.getString("cwriter"));
			cv.setCwriteday(rs.getString("cwriteday"));
			cv.setCcategory(rs.getString("ccategory"));
			cv.setCfile(rs.getString("cfile"));
			
			alistqna.add(cv);
		}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	
		return alistqna;
	}
	
	public ArrayList<CustomerServiceVo> CustomerServicefaqSelect(SearchCriteria scri){	
		
		ArrayList<CustomerServiceVo> alistfaq = new ArrayList<CustomerServiceVo>();
		
		String sql = "select rnum, B.* from (select rownum as rnum, A.* from (select * from customerservice where ccategory = 'faq' and cdelyn='N' and csubject like ? order by cidx desc)A where rownum <= ?)B where rnum >= ?";
				
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, "%"+scri.getKeyword()+"%");
			pstmt.setInt(2, scri.getPage()*15);
			pstmt.setInt(3, (scri.getPage()-1)*15+1);
			ResultSet rs = pstmt.executeQuery();
		
		while(rs.next()) {
			CustomerServiceVo cv = new CustomerServiceVo();
			cv.setCidx(rs.getInt("cidx"));
			cv.setCsubject(rs.getString("csubject"));
			cv.setCcontent(rs.getString("ccontent"));
			cv.setCwriter(rs.getString("cwriter"));
			cv.setCwriteday(rs.getString("cwriteday"));
			cv.setCcategory(rs.getString("ccategory"));
			cv.setCfile(rs.getString("cfile"));
			
			alistfaq.add(cv);
		}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	
		return alistfaq;
	}
	
	
}

	
	
