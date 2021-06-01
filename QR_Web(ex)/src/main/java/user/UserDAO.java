package user;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class UserDAO {

	private Connection conn;
	private PreparedStatement pstmt; 
	private ResultSet rs; 
	
	
	public UserDAO() {
		try {
			String dbURL = "jdbc:mysql://localhost:3306/USER?characterEncoding=UTF-8&serverTimezone=UTC";
			String dbID = "root";
			String dbPassword = "root";
			Class.forName("com.mysql.cj.jdbc.Driver");
			conn = DriverManager.getConnection(dbURL, dbID, dbPassword);
		}catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public int login(String user_ID, String user_PW) {
		String sql = "select user_PW from user where user_ID = ?";
		try {
			pstmt = conn.prepareStatement(sql); 
			pstmt.setString(1, user_ID); 
			rs = pstmt.executeQuery(); 
			if(rs.next()) {
				if(rs.getString(1).equals(user_PW)) {
					return 1;
				}else
					return 0; 
			}
			return -1; 
		}catch (Exception e) {
			e.printStackTrace();
		}
		return -2; 
	}
	
	public int join(user user) {
		  String sql = "insert into user values(?, ?, ?, ?, ?)";
		  try {
		    pstmt = conn.prepareStatement(sql);
		    pstmt.setString(1, user.getUser_ID());
		    pstmt.setString(2, user.getUser_PW());
		    pstmt.setString(3, user.getUser_Name());
		    pstmt.setString(4, user.getUser_WN());
		    pstmt.setString(5, user.getUser_WpN());
		    return pstmt.executeUpdate();
		  }catch (Exception e) {
		 	e.printStackTrace();
		  }
		  return -1;
		}
}
