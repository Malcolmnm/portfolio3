package admin;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/admin/joinok.do")
public class joinok extends HttpServlet {
	PrintWriter pw = null;
	gojoin gj = new gojoin();
	private static final long serialVersionUID = 1L;
       
    public joinok() {
        super();
    }

	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		res.setCharacterEncoding("utf-8");
		req.setCharacterEncoding("utf-8");
		res.setContentType("text/html");
		this.pw = res.getWriter();
		
		String uid = req.getParameter("uid").intern();
		String upw = req.getParameter("upw").intern();
		String unm = req.getParameter("unm").intern();
		String uem = req.getParameter("uem").intern();
		String utel = req.getParameter("utel").intern();
		String uteam = req.getParameter("uteam").intern();
		String umen = req.getParameter("umen").intern();
		
		try {
			String result = this.gj.gojoinok(uid, upw, unm, uem, utel, uteam, umen);
			if(result == "true") {
				pw.write("<script>alert('" + unm +"님 가입을 환영합니다.'); window.location = './index.html';</script>");
			}
		}
		catch (Exception e) {
			System.out.println("데이터베이스오류2");
		}
	}

}
