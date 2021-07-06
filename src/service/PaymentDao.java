package service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import dbconn.DBconn;

public class PaymentDao {

	private Connection conn; //전역변수 (멤버변수 이기 때문)
	private PreparedStatement pstmt;
	
	//생성자
	public PaymentDao() {
		
		//DB연결객체생성
		DBconn dbconn = new DBconn();
		//DB연결
		this.conn = dbconn.getConnection();
		
	}
	
	public PaymentVo PaymentSelectOne(int pdidx) {
		PaymentVo pmv = null;
		ResultSet rs = null;
		
		String sql="select * from payment where pdidx=?";
		
		 try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, pdidx);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				pmv = new PaymentVo();
				pmv.setPddate(rs.getString("pddate"));
				pmv.setPdprice(rs.getString("pdprice"));
				pmv.setPdmethod(rs.getString("pdmethod"));
				pmv.setPdidx(rs.getInt("pdidx"));
				
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
		
		return pmv;
	}
	
}
