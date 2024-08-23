
package admin;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/admin/shop_codecheck.do")
public class shop_codecheck extends HttpServlet {
	dbconfig dbc = new dbconfig();
	PrintWriter pw = null;
	private static final long serialVersionUID = 1L;
       
    public shop_codecheck() {
        super();
    }

	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		res.setCharacterEncoding("utf-8");
		res.setContentType("application/x-json;charset=UTF-8");
		req.setCharacterEncoding("utf-8");
		
		String scode = req.getParameter("scode");
		try {
		Connection con = this.dbc.info();
		this.pw = res.getWriter();
		
		String sql = "select * from shopproduct where scode=?";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, scode);
		
		ResultSet rs = ps.executeQuery();
		String msg = "false";
		String scodecon = ""; 
		
		while(rs.next()) {
			scodecon = rs.getString("scode");
			msg = "true";
		}
		pw.print(msg);
		con.close();
		ps.close();
		}
		catch (Exception e) {
			
		}
		
	}

}
