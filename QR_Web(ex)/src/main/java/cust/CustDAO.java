package cust;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import cust.Cust;
import java.util.ArrayList;

public class CustDAO {
	
	private Connection conn;
	private PreparedStatement pstmt; 
	private ResultSet rs; 
	
	Cust cust = new Cust();
	
	public CustDAO() {
		try {
			String dbURL = "jdbc:mysql://localhost:3306/CUST?characterEncoding=UTF-8&serverTimezone=UTC";
			String dbID = "root";
			String dbPassword = "root";
			Class.forName("com.mysql.cj.jdbc.Driver");
			conn = DriverManager.getConnection(dbURL, dbID, dbPassword);
		}catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public String getDate() {
		   String SQL = "SELECT NOW()";
		   try {
		      PreparedStatement pstmt = conn.prepareStatement(SQL);
		      rs = pstmt.executeQuery();
		      if(rs.next()) {
		         return rs.getString(1);
		      }
		   }catch(Exception e) {
		      e.printStackTrace();
		   }
		   return ""; 
	 }	
	
	public int Write(String number, String user_ID) {
		  String sql = "insert into cust(number, time, user_ID) values(?, ?, ?)";
		  try {
		    pstmt = conn.prepareStatement(sql);
		    pstmt.setString(1, cust.getNumber());
		    pstmt.setString(2, getDate());
		    pstmt.setString(3,  cust.getUser_ID());
		    return pstmt.executeUpdate();
		  }catch (Exception e) {
		 	e.printStackTrace();
		  }
		  return -1;
		}
	
    public ArrayList<Cust> getList(String user_ID){
        String SQL = "select * from cust where user_ID = ? order by time desc";
        ArrayList<Cust> list = new ArrayList<Cust>();
        try {
           PreparedStatement pstmt = conn.prepareStatement(SQL);
           pstmt.setString(1, user_ID);
           rs = pstmt.executeQuery(); 
            while(rs.next()) {
              Cust cust = new Cust();
              cust.setNumber(rs.getString(1));
              cust.setTime(rs.getString(2));
              cust.setUser_ID(rs.getString(3));
              list.add(cust);
           }
        }catch(Exception e) {
           e.printStackTrace();
        }
        return list;
     }
    public int delete(String user_ID) {
        String SQL = "delete from cust where time < date_add(now(), interval -60 second)";
        try {
           PreparedStatement pstmt = conn.prepareStatement(SQL);
           return pstmt.executeUpdate();
        }catch(Exception e) {
           e.printStackTrace();
        }
        return -1; 
    }
	
	

}

	
	
	
	
	
	
	
	
	
	
	
	
