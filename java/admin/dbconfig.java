package admin;

import java.sql.Connection;
import java.sql.DriverManager;

//db 연결 부분(Module)

public class dbconfig {
	
	public static Connection info() throws Exception {
		String db_driver = "com.mysql.cj.jdbc.Driver";
		String db_url = "jdbc:mysql://localhost/hytuby22";
		String db_user = "hytuby22";
		String db_pass = "skawks22^^";

		//String db_url = "jdbc:mysql://umj7-020.cafe24.com/hytuby22";	
		Class.forName(db_driver);
		Connection con = DriverManager.getConnection(db_url,db_user,db_pass);
		
		return con;
	}
	
}
