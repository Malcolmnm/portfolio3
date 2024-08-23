package admin;

import java.security.MessageDigest;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class gojoin {
	dbconfig dbc = new dbconfig();
	
	public String gojoinok(String uid, String upw, String unm, String uem, String utel, String uteam, String umen) {
		String msg = "";
		
		
		try {
			MessageDigest md = MessageDigest.getInstance("MD5");
			md.update(upw.getBytes("utf-8"));
			byte[] code = md.digest();
			StringBuilder pw = new StringBuilder();
			for(byte b : code) {
				String repass = String.format("%02x", b);
				pw.append(repass);
			}
			
			Connection con = this.dbc.info();
			
			String sql = "insert into userlogin values ('0',?,?,?,?,?,?,?,default)";
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, uid);
			ps.setString(2, pw.toString());
			ps.setString(3, unm);
			ps.setString(4, uem);
			ps.setString(5, utel);
			ps.setString(6, uteam);
			ps.setString(7, umen);
			
			int call = ps.executeUpdate();
			System.out.println(call);
			msg = "true";
			
			con.close();
			ps.close();
			
			}
			catch (Exception e) {System.out.println("데이터베이스오류");}
		
		
		
		return msg;
	}
}
