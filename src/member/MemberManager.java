package member;



import java.sql.Connection;

import java.sql.PreparedStatement;

import java.sql.ResultSet;

import java.util.ArrayList;

import javax.naming.Context;

import javax.naming.InitialContext;

import javax.sql.DataSource;



public class MemberManager {

	private Connection conn;

	private PreparedStatement pstmt;

	private ResultSet rs;

	private DataSource ds;

	

	//데이터베이스 연결

	public MemberManager() {

		try {

			Context context = new InitialContext();

			ds = (DataSource)context.lookup("java:comp/env/jdbc_maria");

		} catch (Exception e) {

			System.out.println("connection err:" + e);

		}

	}

	

	//id 체크
	/*
	 * public boolean checkId(String mid){
	 * 
	 * boolean b = false;
	 * 
	 * try {
	 * 
	 * String sql = "select mid from edupickmember where mid = ?";
	 * 
	 * conn = ds.getConnection();
	 * 
	 * pstmt = conn.prepareStatement(sql);
	 * 
	 * pstmt.setString(1, mid);
	 * 
	 * rs = pstmt.executeQuery();
	 * 
	 * b=rs.next();
	 * 
	 * } catch (Exception e) {
	 * 
	 * System.out.println("checkId err : " + e);
	 * 
	 * } finally {
	 * 
	 * try {
	 * 
	 * if(rs!=null)rs.close();
	 * 
	 * if(pstmt!=null)pstmt.close();
	 * 
	 * if(conn!=null)conn.close();
	 * 
	 * } catch (Exception e2) {
	 * 
	 * // TODO: handle exception
	 * 
	 * }
	 * 
	 * }
	 * 
	 * return b;
	 * 
	 * }
	 */

}