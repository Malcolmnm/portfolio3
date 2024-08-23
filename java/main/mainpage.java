package main;

import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.text.DecimalFormat;
import java.text.NumberFormat;
import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import admin.memberlog;
import admin.noticevo;
import admin.writelist;

@Controller
public class mainpage {

	
	@Inject
	private SqlSessionTemplate sqlSession;

	
	
	@RequestMapping("/main/newarrival.do")
	public void test(HttpServletRequest req, HttpServletResponse res, Model m, @ModelAttribute("board") shopvo shopvo) throws Exception{
		res.setCharacterEncoding("utf-8");
		req.setCharacterEncoding("utf-8");
		
		PrintWriter pw = res.getWriter();
		
		JSONArray array = new JSONArray();
		DecimalFormat format = new DecimalFormat("###,###");
		//ArrayList<ArrayList<String>> array2 = new ArrayList<ArrayList<String>>();
		
		List<shopvo> nc = sqlSession.selectList("noticeDB.newarri");
			for(shopvo datas : nc) {
				array.add(datas.getSmfile1());
				array.add(datas.getSname());
				array.add(datas.getStext1());
				array.add(format.format((int)(datas.getSdissel())));
				NumberFormat formatter;
				
			}
		
			pw.print(array);
			pw.flush();
			pw.close();
	}
	
	@RequestMapping("/main/ad1.do")
	public void ad1(HttpServletRequest req, HttpServletResponse res, Model m, @ModelAttribute("board") shopbanner shopbanner) throws Exception{
		res.setCharacterEncoding("utf-8");
		req.setCharacterEncoding("utf-8");
		
		PrintWriter pw = res.getWriter();
		JSONArray array = new JSONArray();
		
		List<shopbanner> nc = sqlSession.selectList("noticeDB.adban");
		for(shopbanner datas : nc) {
			array.add(datas.getAdbanner1());
			array.add(datas.getAdbannerurl1());
			
		}
			pw.print(array);
			pw.flush();
			pw.close();
	}
	
	@RequestMapping("/main/ad2.do")
	public void ad2(HttpServletRequest req, HttpServletResponse res, Model m, @ModelAttribute("board") shopbanner shopbanner) throws Exception{
		res.setCharacterEncoding("utf-8");
		req.setCharacterEncoding("utf-8");
		
		PrintWriter pw = res.getWriter();
		JSONArray array = new JSONArray();
		
		List<shopbanner> nc = sqlSession.selectList("noticeDB.adban");
		for(shopbanner datas : nc) {
			array.add(datas.getAdbanner2());
			array.add(datas.getAdbannerurl2());
			
		}
			pw.print(array);
			pw.flush();
			pw.close();
	}
	
	
	@RequestMapping("/main/notice.do")
	public void notice(HttpServletRequest req, HttpServletResponse res, Model m, @ModelAttribute("board") writelist2 writelist2) throws Exception{
		res.setCharacterEncoding("utf-8");
		req.setCharacterEncoding("utf-8");
		res.setContentType("text/html");
		
		PrintWriter pw = res.getWriter();
		ArrayList<ArrayList<String>> notlist = new ArrayList<>();

		JSONArray array = new JSONArray();
		JSONArray array2 = new JSONArray();

		List<writelist2> ml = sqlSession.selectList("noticeDB.notisel1");
		for (writelist2 datas : ml) {
		    array.add(datas.getNsub());
		    array.add(datas.getNdate().toString());
		}

		if (ml.size() < 6) {
		    int num = 6 - ml.size();
		    List<writelist2> ml2 = sqlSession.selectList("noticeDB.notisel2", num);
		    for (writelist2 datas : ml2) {
		        array2.add(datas.getNsub());
		        array2.add(datas.getNdate().toString());
		    }
		}

		notlist.add(array);
		notlist.add(array2);
			pw.print(notlist);
			pw.flush();
			pw.close();
	}
	
	@RequestMapping("/main/copy.do")
	public void copywriter(HttpServletRequest req, HttpServletResponse res, Model m, @ModelAttribute("board") homeinfo homeinfo) throws Exception{
		res.setCharacterEncoding("utf-8");
		req.setCharacterEncoding("utf-8");
		
		PrintWriter pw = res.getWriter();
		JSONArray array = new JSONArray();
		
		List<homeinfo> ml = sqlSession.selectList("noticeDB.copysel");
		for (homeinfo datas : ml) {
		    array.add(datas.getStitle());
		    array.add(datas.getSceo());
		    array.add(datas.getSno());
		    array.add(datas.getSnu());
		    array.add(datas.getSare());
		    array.add(datas.getSname());
		    array.add(datas.getSema());
		    array.add(datas.getSbank());
		    array.add(datas.getSbno());
		    array.add(datas.getStel());
		    
		    
			pw.print(array);
			pw.flush();
			pw.close();
		}
	}
	
	@RequestMapping("/main/join.do")
	public void joingo(HttpServletRequest req, HttpServletResponse res, @ModelAttribute("board") memberlog memberlog ) throws Exception{
		res.setCharacterEncoding("utf-8");
		req.setCharacterEncoding("utf-8");
		res.setContentType("text/html");
		
		PrintWriter pw = res.getWriter();
		
		int wo = sqlSession.insert("noticeDB.mainjoin", memberlog);
		
		if(wo > 0) {
			pw.write("<script>alert('회원가입 되었습니다.'); location.href = './index.jsp';</script>");
		}
		else {
			System.out.println("Database 오류!!");
		}
		pw.flush();
		pw.close();
	}
	
	@RequestMapping("/main/login.do")
	public void logingo(HttpServletRequest req, HttpServletResponse res, @ModelAttribute("board") memberlog memberlog) throws Exception{
		res.setCharacterEncoding("utf-8");
		req.setCharacterEncoding("utf-8");
		res.setContentType("text/html");
		
		String mnm = "";
		PrintWriter pw = res.getWriter();
		List<memberlog> ml = sqlSession.selectList("noticeDB.mainlogin",memberlog);
		for (memberlog datas : ml) {
		    mnm = datas.getMnm();
		}
		if(mnm == null || mnm == "") {
			pw.write("<script>alert('아이디 및 패스워드를 확인해주세요.');location.href = './subpage.jsp';</script>");
		}
		else {
			HttpSession se = req.getSession();
			se.setAttribute("mnm", mnm);
			pw.write("<script> location.href = './index.jsp';</script>");
		}
		pw.flush();
		pw.close();
	}
	
	//메인 faq 리스트
	@RequestMapping("/main/faq.do")
	public void faqview(HttpServletRequest req, Model m, @ModelAttribute("board") faqvo faqvo) throws Exception{
		req.setCharacterEncoding("utf-8");
		
		//String a = sqlSession.selectOne("noticeDB.page_select2");
		//System.out.print(a);
		//req.setAttribute("page", a);
		// m.addAttribute("page",a);
		
		String sel = (String)req.getParameter("sel");
		String mo = (String)req.getParameter("sel");
		//System.out.println(sel);
		if(sel == null || sel=="") {
		List<faqvo> faq = sqlSession.selectList("noticeDB.faq");
		m.addAttribute("faq",faq);
		}
		else if(sel.equals("1")) {
			sel = "상품구매";
			List<faqvo> faq = sqlSession.selectList("noticeDB.faqse",sel);
			m.addAttribute("faq",faq);
		}
		else if(sel.equals("2")) {
			sel = "상품배송";
			List<faqvo> faq = sqlSession.selectList("noticeDB.faqse",sel);
			m.addAttribute("faq",faq);
		}
		else if(sel.equals("3")) {
			sel = "상품반품";
			List<faqvo> faq = sqlSession.selectList("noticeDB.faqse",sel);
			m.addAttribute("faq",faq);
		}
		else if(sel.equals("4")) {
			sel = "개인정보변경";
			List<faqvo> faq = sqlSession.selectList("noticeDB.faqse",sel);
			m.addAttribute("faq",faq);
		}
		else{
			sel = "회원가입/탈퇴";
			List<faqvo> faq = sqlSession.selectList("noticeDB.faqse",sel);
			m.addAttribute("faq",faq);
		}
		req.setAttribute("mo", mo);
	}
	
	@RequestMapping("/main/notice_view.do")
	public void nlist(HttpServletRequest req, Model m, @ModelAttribute("board") writelist2 writelist2) throws Exception{
		String p = req.getParameter("page");
    	int page = 0;
    	int vpage = 0;
    	if(p==null || p.equals("1") || p=="" || p=="null") {
    		page = 0;
    		vpage = 1;
    	}
    	else {
    		page = (Integer.valueOf(p) * 8) - 8;
    		vpage = Integer.valueOf(p);
    	}
		List<noticevo> ml = sqlSession.selectList("noticeDB.nosel1");
		int totals = ml.size();
		List<noticevo> ml2 = sqlSession.selectList("noticeDB.nosel2",page);
		
		List<noticevo> ml3 = sqlSession.selectList("noticeDB.nosel5");
		
		int arno = ml2.size();
		int arno2 = ml3.size();
		int wrno = 8 - arno;
		int wrno2 = 8 * (vpage - 1)  - arno2;
		if(arno < 8) {
			if(arno == 0) {
				ml2.addAll(sqlSession.selectList("noticeDB.nosel4",wrno2));
			}
			else {
				ml2.addAll(sqlSession.selectList("noticeDB.nosel3",wrno));
			}
		}
		req.setAttribute("totals", totals);
        req.setAttribute("now_page",vpage);
		m.addAttribute("ml", ml2);
			
	}
	
	
}