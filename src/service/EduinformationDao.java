package service;

import java.sql.Connection; 
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import dbconn.DBconn;
import Domain.SearchCriteria;

public class EduinformationDao {

	private Connection conn; //전역변수 (멤버변수 이기 때문)
	private PreparedStatement pstmt;
	
	//생성자
	public EduinformationDao() {
		
		//DB연결객체생성
		DBconn dbconn = new DBconn();
		//DB연결
		this.conn = dbconn.getConnection();
		
	}
	
	public int EduinformationInsert(String esubject, String econtent, String ewriter, String ecategory ,String efile) {
		int exec=0;
		
		String sql = "insert into Eduinformation(eidx,esubject,econtent,ewriter,ecategory,ehit,eimage,efile) values(eidx_seq.nextval,?,?,?,?,0,'1',?)";
		try{
			
			PreparedStatement pstmt = conn.prepareStatement(sql); //보안 (해킹방지)

				pstmt.setString(1,esubject);
				pstmt.setString(2,econtent);
				pstmt.setString(3,ewriter);
				pstmt.setString(4,ecategory);
				pstmt.setString(5,efile);
				exec = pstmt.executeUpdate();

		}catch (Exception e){
			e.printStackTrace();
		}return exec;
	}
	
	public ArrayList<EduinformationVo> EduinformationSelectAll(SearchCriteria scri){	
			
			ArrayList<EduinformationVo> alist2 = new ArrayList<EduinformationVo>();
			
			String sql = "select rnum, B.* from (select rownum as rnum, A.* from (select * from eduinformation where edelyn='N' and esubject like ? order by eidx desc)A where rownum <= ?)B where rnum >= ?";
					
			try {
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, "%"+scri.getKeyword()+"%");
				pstmt.setInt(2, scri.getPage()*15);
				pstmt.setInt(3, (scri.getPage()-1)*15+1);
				ResultSet rs = pstmt.executeQuery();
			
			while(rs.next()) {
				EduinformationVo ev = new EduinformationVo();
				ev.setEidx(rs.getInt("eidx"));
				ev.setEsubject(rs.getString("esubject"));
				ev.setEcontent(rs.getString("econtent"));
				ev.setEwriter(rs.getString("ewriter"));
				ev.setEwriteday(rs.getString("ewriteday"));
				ev.setEcategory(rs.getString("ecategory"));
				ev.setEfile(rs.getString("efile"));
				
				alist2.add(ev);
			}
			} catch (SQLException e) {
				e.printStackTrace();
			}
		
			return alist2;
		}
	
	public EduinformationVo EduinformationSelectOne(int eidx) {
		EduinformationVo ev = null;
		ResultSet rs = null;
		
		String sql="select * from eduinformation where eidx=?";
		
		 try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, eidx);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				ev = new EduinformationVo();
				ev.setEsubject(rs.getString("esubject"));
				ev.setEcontent(rs.getString("econtent"));
				ev.setEwriter(rs.getString("ewriter"));
				ev.setEwriteday(rs.getString("ewriteday"));
				ev.setEcategory(rs.getString("ecategory"));
				ev.setEfile(rs.getString("efile"));
				ev.setEidx(rs.getInt("eidx")); //------------------------------------------------------id 좀 넘겨요
				
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
		
		return ev;
	}
	public int EduinformationTotal(String keyword) {
		int cnt=0;
		ResultSet rs = null; 
		
		String sql = "select count(*) as cnt from eduinformation where edelyn='N' and esubject like ?";
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
			public int EduInformationModify(int eidx, String esubject, String econtent, String ewriter, String ecategory, String efile) {
				System.out.println("eidx"+eidx);
				System.out.println("esubject"+esubject);
				System.out.println("econtent"+econtent);
				System.out.println("ewriter"+ewriter);
				System.out.println("ecategory"+ecategory);
				System.out.println("efile"+efile);
				
				
				int value=0;
				
				String sql = "update eduinformation set esubject=?, econtent=?, ewriter=?, ecategory=?,efile=? where eidx=?";
				
				try {
					pstmt = conn.prepareStatement(sql);
					
					pstmt.setString(1, esubject);
					pstmt.setString(2, econtent);
					pstmt.setString(3, ewriter);
					pstmt.setString(4, ecategory);
					pstmt.setString(5, efile);
					pstmt.setInt(6, eidx);
					value = pstmt.executeUpdate();
					
					
				} catch (SQLException e) {	
					e.printStackTrace();
				}
			
				return value;
			}
			
			//삭제
			public int EduInformationDelete(int eidx) {
				int value=0;
				
				String sql = "update eduinformation set edelyn='Y' where eidx=?";
				
				try {
					pstmt = conn.prepareStatement(sql);
					
					pstmt.setInt(1, eidx);
					value = pstmt.executeUpdate();
					
					
				} catch (SQLException e) {	
					e.printStackTrace();
				}
				
				return value;
			}	
			
			public ArrayList<EduinformationVo> EduinformationelementarySelect(SearchCriteria scri){	
				
				ArrayList<EduinformationVo> alistelementary = new ArrayList<EduinformationVo>();
				
				String sql = "select rnum, B.* from (select rownum as rnum, A.* from (select * from eduinformation where ecategory = 'elementary' and edelyn='N' and esubject like ? order by eidx desc)A where rownum <= ?)B where rnum >= ?";
						
				try {
					pstmt = conn.prepareStatement(sql);
					
					pstmt.setString(1, "%"+scri.getKeyword()+"%");
					pstmt.setInt(2, scri.getPage()*15);
					pstmt.setInt(3, (scri.getPage()-1)*15+1);
					ResultSet rs = pstmt.executeQuery();
				
				while(rs.next()) {
					EduinformationVo ev = new EduinformationVo();
					ev.setEidx(rs.getInt("eidx"));
					ev.setEsubject(rs.getString("esubject"));
					ev.setEcontent(rs.getString("econtent"));
					ev.setEwriter(rs.getString("ewriter"));
					ev.setEwriteday(rs.getString("ewriteday"));
					ev.setEcategory(rs.getString("ecategory"));
					ev.setEfile(rs.getString("efile"));
					
					alistelementary.add(ev);
				}
				} catch (SQLException e) {
					e.printStackTrace();
				}
			
				return alistelementary;
			}
			
			public ArrayList<EduinformationVo> EduinformationmiddleSelect(SearchCriteria scri){	
				
				ArrayList<EduinformationVo> alistmiddle = new ArrayList<EduinformationVo>();
				
				String sql = "select rnum, B.* from (select rownum as rnum, A.* from (select * from eduinformation where ecategory = 'middle' and edelyn='N' and esubject like ? order by eidx desc)A where rownum <= ?)B where rnum >= ?";
						
				try {
					pstmt = conn.prepareStatement(sql);
					
					pstmt.setString(1, "%"+scri.getKeyword()+"%");
					pstmt.setInt(2, scri.getPage()*15);
					pstmt.setInt(3, (scri.getPage()-1)*15+1);
					ResultSet rs = pstmt.executeQuery();
				
				while(rs.next()) {
					EduinformationVo ev = new EduinformationVo();
					ev.setEidx(rs.getInt("eidx"));
					ev.setEsubject(rs.getString("esubject"));
					ev.setEcontent(rs.getString("econtent"));
					ev.setEwriter(rs.getString("ewriter"));
					ev.setEwriteday(rs.getString("ewriteday"));
					ev.setEcategory(rs.getString("ecategory"));
					ev.setEfile(rs.getString("efile"));
					
					alistmiddle.add(ev);
				}
				} catch (SQLException e) {
					e.printStackTrace();
				}
			
				return alistmiddle;
			}
			
			public ArrayList<EduinformationVo> EduinformationhighSelect(SearchCriteria scri){	
				
				ArrayList<EduinformationVo> alisthigh = new ArrayList<EduinformationVo>();
				
				String sql = "select rnum, B.* from (select rownum as rnum, A.* from (select * from eduinformation where ecategory = 'high' and edelyn='N' and esubject like ? order by eidx desc)A where rownum <= ?)B where rnum >= ?";
						
				try {
					pstmt = conn.prepareStatement(sql);
					
					pstmt.setString(1, "%"+scri.getKeyword()+"%");
					pstmt.setInt(2, scri.getPage()*15);
					pstmt.setInt(3, (scri.getPage()-1)*15+1);
					ResultSet rs = pstmt.executeQuery();
				
				while(rs.next()) {
					EduinformationVo ev = new EduinformationVo();
					ev.setEidx(rs.getInt("eidx"));
					ev.setEsubject(rs.getString("esubject"));
					ev.setEcontent(rs.getString("econtent"));
					ev.setEwriter(rs.getString("ewriter"));
					ev.setEwriteday(rs.getString("ewriteday"));
					ev.setEcategory(rs.getString("ecategory"));
					ev.setEfile(rs.getString("efile"));
					
					alisthigh.add(ev);
				}
				} catch (SQLException e) {
					e.printStackTrace();
				}
			
				return alisthigh;
			}
			
			public ArrayList<EduinformationVo> EduinformationuniversitySelect(SearchCriteria scri){	
				
				ArrayList<EduinformationVo> alistuniversity = new ArrayList<EduinformationVo>();
				
				String sql = "select rnum, B.* from (select rownum as rnum, A.* from (select * from eduinformation where ecategory = 'university' and edelyn='N' and esubject like ? order by eidx desc)A where rownum <= ?)B where rnum >= ?";
						
				try {
					pstmt = conn.prepareStatement(sql);
					
					pstmt.setString(1, "%"+scri.getKeyword()+"%");
					pstmt.setInt(2, scri.getPage()*15);
					pstmt.setInt(3, (scri.getPage()-1)*15+1);
					ResultSet rs = pstmt.executeQuery();
				
				while(rs.next()) {
					EduinformationVo ev = new EduinformationVo();
					ev.setEidx(rs.getInt("eidx"));
					ev.setEsubject(rs.getString("esubject"));
					ev.setEcontent(rs.getString("econtent"));
					ev.setEwriter(rs.getString("ewriter"));
					ev.setEwriteday(rs.getString("ewriteday"));
					ev.setEcategory(rs.getString("ecategory"));
					ev.setEfile(rs.getString("efile"));
					
					alistuniversity.add(ev);
				}
				} catch (SQLException e) {
					e.printStackTrace();
				}
			
				return alistuniversity;
			}
	
}
