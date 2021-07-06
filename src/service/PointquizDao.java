package service;

import java.sql.Connection; 
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import dbconn.DBconn;
import Domain.SearchCriteria;

public class PointquizDao {

	private Connection conn; //전역변수 (멤버변수 이기 때문)
	private PreparedStatement pstmt;
	
public PointquizDao() {
		
		//DB연결객체생성
		DBconn dbconn = new DBconn();
		//DB연결
		this.conn = dbconn.getConnection();
		
	}

public int PointquizInsert(String psubject, String pcontent1, String pcontent2, String pcontent3 ,String pcontent4, String pdifficulty, int pscore, String panswer, String pexplanation) {
	int exec=0;
	
	String sql = "insert into pointquiz(pidx,psubject,pcontent1,pcontent2,pcontent3,pcontent4,pdifficulty,pscore,panswer,pexplanation) values(pidx_seq.nextval,?,?,?,?,?,?,?,?,?)";
	try{
		
		PreparedStatement pstmt = conn.prepareStatement(sql); //보안 (해킹방지)

			pstmt.setString(1,psubject);
			pstmt.setString(2,pcontent1);
			pstmt.setString(3,pcontent2);
			pstmt.setString(4,pcontent3);
			pstmt.setString(5,pcontent4);
			pstmt.setString(6,pdifficulty);
			pstmt.setInt(7,pscore);
			pstmt.setString(8,panswer);
			pstmt.setString(9,pexplanation);			
			
			System.out.println("psubject"+psubject);
			System.out.println("pcontent1"+pcontent1);
			System.out.println("pcontent2"+pcontent2);
			System.out.println("pcontent3"+pcontent3);
			System.out.println("pcontent4"+pcontent4);
			System.out.println("pdifficulty"+pdifficulty);
			System.out.println("pscore"+pscore);
			System.out.println("panswer"+panswer);
			System.out.println("pexplanation"+pexplanation);
			
			exec = pstmt.executeUpdate();

	}catch (Exception e){
		e.printStackTrace();
	}return exec;
}

public ArrayList<PointquizVo> PointquizSelectAll(SearchCriteria scri){	
	
	ArrayList<PointquizVo> alist = new ArrayList<PointquizVo>();
	
	String sql = "select rnum, B.* from (select rownum as rnum, A.* from (select * from pointquiz where pdelyn='N' and psubject like ? order by pidx desc)A where rownum <= ?)B where rnum >= ?";
			
	try {
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, "%"+scri.getKeyword()+"%");
		pstmt.setInt(2, scri.getPage()*15);
		pstmt.setInt(3, (scri.getPage()-1)*15+1);
		ResultSet rs = pstmt.executeQuery();
	
	while(rs.next()) {
		PointquizVo pv = new PointquizVo();
		pv.setPidx(rs.getInt("pidx"));
		pv.setPsubject(rs.getString("psubject"));
		pv.setPcontent1(rs.getString("pcontent1"));
		pv.setPcontent2(rs.getString("pcontent2"));
		pv.setPcontent3(rs.getString("pcontent3"));
		pv.setPcontent4(rs.getString("pcontent4"));
		pv.setPdifficulty(rs.getString("Pdifficulty"));
		pv.setPscore(rs.getInt("pscore"));
		pv.setPanswer(rs.getString("Panswer"));
		pv.setPexplanation(rs.getString("pexplanation"));
		
		alist.add(pv);
	}
	} catch (SQLException e) {
		e.printStackTrace();
	}

	return alist;
}

public PointquizVo PointquizSelectOne(int pidx) {
	PointquizVo pv = null;
	ResultSet rs = null;
	
	String sql="select * from pointquiz where pidx=?";
	
	 try {
		pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, pidx);
		rs = pstmt.executeQuery();
		
		if(rs.next()) {
			pv = new PointquizVo();
			pv.setPsubject(rs.getString("psubject"));
			pv.setPcontent1(rs.getString("pcontent1"));
			pv.setPcontent2(rs.getString("pcontent2"));
			pv.setPcontent3(rs.getString("pcontent3"));
			pv.setPcontent4(rs.getString("pcontent4"));
			pv.setPdifficulty(rs.getString("pdifficulty"));
			pv.setPscore(rs.getInt("pscore"));
			pv.setPanswer(rs.getString("panswer"));
			pv.setPexplanation(rs.getString("pexplanation"));
			pv.setPidx(rs.getInt("pidx"));
			
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
	
	return pv;
	
}

public int PointquizTotal(String keyword) {
	int cnt=0;
	ResultSet rs = null; 
	
	String sql = "select count(*) as cnt from pointquiz where pdelyn='N' and psubject like ?";
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
public int PointquizModify(int pidx, String psubject, String pcontent1, String pcontent2, String pcontent3, String pcontent4, String pdifficulty, int pscore, String panswer, String pexplanation) {
	
	
	int value=0;
	
	String sql = "update pointquiz set psubject=?, pcontent1=?, pcontent2=?, pcontent3=?, pcontent4=?, pdifficulty=?, pscore=?,panswer=? , pexplanation=? where pidx=?";
	
	try {
		pstmt = conn.prepareStatement(sql);
		
		pstmt.setString(1, psubject);
		pstmt.setString(2, pcontent1);
		pstmt.setString(3, pcontent2);
		pstmt.setString(4, pcontent3);
		pstmt.setString(5, pcontent4);
		pstmt.setString(6, pdifficulty);
		pstmt.setInt(7, pscore);
		pstmt.setString(8, panswer);
		pstmt.setString(9, pexplanation);
		pstmt.setInt(10, pidx);
		
		value = pstmt.executeUpdate();
		
		
	} catch (SQLException e) {	
		e.printStackTrace();
	}

	return value;
}

//삭제
	public int PointquizDelete(int pidx) {
		int value=0;
		
		String sql = "update pointquiz set pdelyn='Y' where pidx=?";
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, pidx);
			value = pstmt.executeUpdate();
			
			
		} catch (SQLException e) {	
			e.printStackTrace();
		}
		
		return value;
	}
	
	public PointquizVo PointquizRandom() {
		PointquizVo pv = null;
		ResultSet rs = null;
		
		String sql="select * from  (select * from pointquiz order by dbms_random.value) where rownum <= 1";
		
		 try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				pv = new PointquizVo();
				pv.setPsubject(rs.getString("psubject"));
				pv.setPcontent1(rs.getString("pcontent1"));
				pv.setPcontent2(rs.getString("pcontent2"));
				pv.setPcontent3(rs.getString("pcontent3"));
				pv.setPcontent4(rs.getString("pcontent4"));
				pv.setPdifficulty(rs.getString("pdifficulty"));
				pv.setPscore(rs.getInt("pscore"));
				pv.setPanswer(rs.getString("panswer"));
				pv.setPexplanation(rs.getString("pexplanation"));
				pv.setPidx(rs.getInt("pidx"));
				
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
		
		return pv;
		
	}
	
}
