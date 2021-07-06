package service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import dbconn.DBconn;

public class AnswerDao {

	private Connection conn; //전역변수 (멤버변수 이기 때문)
	private PreparedStatement pstmt;
	
	//생성자
		public AnswerDao() {
			
			//DB연결객체생성
			DBconn dbconn = new DBconn();
			//DB연결
			this.conn = dbconn.getConnection();
			
		}
		
		public int AnswerInsert(int cidx , String canswer) {
			int exec=0;
			
			String sql = "insert into customerserviceanswer(caidx,cidx,canswer) values(caidx_seq.nextval,?,?)";
			try{
				
				PreparedStatement pstmt = conn.prepareStatement(sql); //보안 (해킹방지)
					pstmt.setInt(1,cidx);
					pstmt.setString(2,canswer);
					
					exec = pstmt.executeUpdate();

			}catch (Exception e){
				e.printStackTrace();
			}return exec;
		}
		
		public AnswerVo AnswerSelectOne(int cidx) {
			AnswerVo av = null;
			ResultSet rs = null;
			
			String sql="select * from customerserviceanswer where cidx=?";
			
			 try {
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, cidx);
				rs = pstmt.executeQuery();
				
				if(rs.next()) {
					av = new AnswerVo();
					av.setCaidx(rs.getInt("caidx"));	
					av.setCidx(rs.getInt("cidx"));	
					av.setCanswer(rs.getString("canswer"));					
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
			
			return av;
		}
	
	
}
