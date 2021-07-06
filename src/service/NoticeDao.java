package service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import dbconn.DBconn;
import Domain.SearchCriteria;

public class NoticeDao {

	private Connection conn; //전역변수 (멤버변수 이기 때문)
	private PreparedStatement pstmt;
	
	//생성자
	public NoticeDao() {
		
		//DB연결객체생성
		DBconn dbconn = new DBconn();
		//DB연결
		this.conn = dbconn.getConnection();
		
	}
	
	public int NoticeInsert(String nsubject, String ncontent, String nwriter, String ncategory ,String nfile) {
		int exec=0;
		
		String sql = "insert into notice(nidx,nsubject,ncontent,nwriter,ncategory,nhit,nimage,nfile) values(nidx_seq.nextval,?,?,?,?,0,'1',?)";
		try{
			
			PreparedStatement pstmt = conn.prepareStatement(sql); //보안 (해킹방지)

				pstmt.setString(1,nsubject);
				pstmt.setString(2,ncontent);
				pstmt.setString(3,nwriter);
				pstmt.setString(4,ncategory);
				pstmt.setString(5,nfile);
				exec = pstmt.executeUpdate();

		}catch (Exception e){
			e.printStackTrace();
		}return exec;
	}
	
	public ArrayList<NoticeVo> NoticeSelectAll(SearchCriteria scri){	
			
			ArrayList<NoticeVo> alist = new ArrayList<NoticeVo>();
			
			String sql = "select rnum, B.* from (select rownum as rnum, A.* from (select * from notice where ndelyn='N' and nsubject like ? order by nidx desc)A where rownum <= ?)B where rnum >= ?";
					
			try {
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, "%"+scri.getKeyword()+"%");
				pstmt.setInt(2, scri.getPage()*15);
				pstmt.setInt(3, (scri.getPage()-1)*15+1);
				ResultSet rs = pstmt.executeQuery();
			
			while(rs.next()) {
				NoticeVo nv = new NoticeVo();
				nv.setNidx(rs.getInt("nidx"));
				nv.setNsubject(rs.getString("nsubject"));
				nv.setNcontent(rs.getString("ncontent"));
				nv.setNwriter(rs.getString("nwriter"));
				nv.setNwriteday(rs.getString("nwriteday"));
				nv.setNcategory(rs.getString("ncategory"));
				nv.setNfile(rs.getString("nfile"));
				
				alist.add(nv);
			}
			} catch (SQLException e) {
				e.printStackTrace();
			}
		
			return alist;
		}
	public NoticeVo NoticeSelectOne(int nidx) {
		NoticeVo nv = null;
		ResultSet rs = null;
		
		String sql="select * from notice where nidx=?";
		
		 try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, nidx);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				nv = new NoticeVo();
				nv.setNsubject(rs.getString("nsubject"));
				nv.setNcontent(rs.getString("ncontent"));
				nv.setNwriter(rs.getString("nwriter"));
				nv.setNwriteday(rs.getString("nwriteday"));
				nv.setNcategory(rs.getString("ncategory"));
				nv.setNfile(rs.getString("nfile"));
				nv.setNidx(rs.getInt("nidx"));
				
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
		
		return nv;
	}
	public int NoticeTotal(String keyword) {
		int cnt=0;
		ResultSet rs = null; 
		
		String sql = "select count(*) as cnt from notice where ndelyn='N' and nsubject like ?";
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
	
	//수정
		public int NoticeModify(int nidx, String nsubject, String ncontent, String nwriter, String ncategory, String nfile) {
			System.out.println("nidx"+nidx);
			System.out.println("nsubject"+nsubject);
			System.out.println("ncontent"+ncontent);
			System.out.println("nwriter"+nwriter);
			System.out.println("ncategory"+ncategory);
			System.out.println("nfile"+nfile);
			
			
			int value=0;
			
			String sql = "update notice set nsubject=?, ncontent=?, nwriter=?, ncategory=?,nfile=? where nidx=?";
			
			try {
				pstmt = conn.prepareStatement(sql);
				
				pstmt.setString(1, nsubject);
				pstmt.setString(2, ncontent);
				pstmt.setString(3, nwriter);
				pstmt.setString(4, ncategory);
				pstmt.setString(5, nfile);
				pstmt.setInt(6, nidx);
				value = pstmt.executeUpdate();
				
				
			} catch (SQLException e) {	
				e.printStackTrace();
			}
		
			return value;
		}
		//삭제
		public int NoticeDelete(int nidx) {
			int value=0;
			
			String sql = "update notice set ndelyn='Y' where nidx=?";
			
			try {
				pstmt = conn.prepareStatement(sql);
				
				pstmt.setInt(1, nidx);
				value = pstmt.executeUpdate();
				
				
			} catch (SQLException e) {	
				e.printStackTrace();
			}
			
			return value;
		}
		
		public ArrayList<NoticeVo> NoticeuseSelect(SearchCriteria scri){	
			
			ArrayList<NoticeVo> alistuse = new ArrayList<NoticeVo>();
			
			String sql = "select rnum, B.* from (select rownum as rnum, A.* from (select * from notice where ncategory = 'use' and ndelyn='N' and nsubject like ? order by nidx desc)A where rownum <= ?)B where rnum >= ?";
					
			try {
				pstmt = conn.prepareStatement(sql);
				
				pstmt.setString(1, "%"+scri.getKeyword()+"%");
				pstmt.setInt(2, scri.getPage()*15);
				pstmt.setInt(3, (scri.getPage()-1)*15+1);
				ResultSet rs = pstmt.executeQuery();
			
			while(rs.next()) {
				NoticeVo nv = new NoticeVo();
				nv.setNidx(rs.getInt("nidx"));
				nv.setNsubject(rs.getString("nsubject"));
				nv.setNcontent(rs.getString("ncontent"));
				nv.setNwriter(rs.getString("nwriter"));
				nv.setNwriteday(rs.getString("nwriteday"));
				nv.setNcategory(rs.getString("ncategory"));
				nv.setNfile(rs.getString("nfile"));
				
				alistuse.add(nv);
			}
			} catch (SQLException e) {
				e.printStackTrace();
			}
		
			return alistuse;
		}
		
			public ArrayList<NoticeVo> NoticeeventSelect(SearchCriteria scri){	
			
			ArrayList<NoticeVo> alistevent = new ArrayList<NoticeVo>();
			
			String sql = "select rnum, B.* from (select rownum as rnum, A.* from (select * from notice where ncategory = 'event' and ndelyn='N' and nsubject like ? order by nidx desc)A where rownum <= ?)B where rnum >= ?";
					
			try {
				pstmt = conn.prepareStatement(sql);
				
				pstmt.setString(1, "%"+scri.getKeyword()+"%");
				pstmt.setInt(2, scri.getPage()*15);
				pstmt.setInt(3, (scri.getPage()-1)*15+1);
				ResultSet rs = pstmt.executeQuery();
			
			while(rs.next()) {
				NoticeVo nv = new NoticeVo();
				nv.setNidx(rs.getInt("nidx"));
				nv.setNsubject(rs.getString("nsubject"));
				nv.setNcontent(rs.getString("ncontent"));
				nv.setNwriter(rs.getString("nwriter"));
				nv.setNwriteday(rs.getString("nwriteday"));
				nv.setNcategory(rs.getString("ncategory"));
				nv.setNfile(rs.getString("nfile"));
				
				alistevent.add(nv);
			}
			} catch (SQLException e) {
				e.printStackTrace();
			}
		
			return alistevent;
		}
	
}
