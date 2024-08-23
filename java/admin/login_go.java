package admin;

import java.security.MessageDigest;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class login_go {
	dbconfig dbg = new dbconfig();
	
	public String logingo(String uid, String upw) {
		String msg = "false";
		String usuc = " ";
		String idcon = " "; 
		String unm = " ";
		try {
		MessageDigest md = MessageDigest.getInstance("MD5");
		md.update(upw.getBytes("utf-8"));
		byte[] code = md.digest();
		StringBuilder pw = new StringBuilder();
		for(byte b : code) {
		String repass = String.format("%02x", b);
		pw.append(repass);
		}
		Connection con = this.dbg.info();
		
		String sql = "select * from userlogin where uid=? and upw=?";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, uid);
		ps.setString(2, pw.toString());
		
		ResultSet rs = ps.executeQuery();
		
		while(rs.next()) {
			idcon = rs.getString("uid");
			
			if(idcon != "") {
				unm = rs.getString("unm");
				usuc = rs.getString("usuc");
				msg = "true";
			}
		}
		
		
		}
		catch (Exception e) {}
		
		return msg +","+ unm + ","+ usuc;
	}
}
