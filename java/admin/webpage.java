package admin;

import java.io.File;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.junit.runner.Request;
import org.junit.runners.Parameterized.Parameters;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.commons.CommonsMultipartResolver;

import com.google.protobuf.DescriptorProtos.SourceCodeInfo.Location;

@Controller
public class webpage {

	
	@Inject
	private SqlSessionTemplate sqlSession;

	
	
	@RequestMapping("/admin/admin_main.do")
	public void test(HttpServletRequest req, Model m, @ModelAttribute("board") noticevo noticevo) throws Exception{
		HttpSession se = req.getSession();
		m.addAttribute("unm",se.getAttribute("unm"));
		
		List<noticevo> nc = sqlSession.selectList("noticeDB.select2");
		
		m.addAttribute("nc", nc);			
			
	}
		
	@PostMapping("/admin/okgo.do")
	public void okgo(HttpServletRequest req, HttpServletResponse res, @ModelAttribute("board") noticevo noticevo) throws Exception{
		req.setCharacterEncoding("utf-8");
		res.setCharacterEncoding("utf-8");
		res.setContentType("text/html");
		
		String uid = req.getParameter("uid");
		int w = sqlSession.update("noticeDB.okupdate",uid);
		PrintWriter pw = res.getWriter();
		if(w > 0) {
			pw.write("<script>location.href = './admin_main.do';</script>");
		}
		else {
			System.out.println("Database 오류!!");
		}
	}
		
	@PostMapping("/admin/nogo.do")
	public void nogo(HttpServletRequest req, HttpServletResponse res, @ModelAttribute("board") noticevo noticevo) throws Exception{
		req.setCharacterEncoding("utf-8");
		res.setCharacterEncoding("utf-8");
		res.setContentType("text/html");

		String uid = req.getParameter("uid");
		int w = sqlSession.update("noticeDB.noupdate",uid);
		PrintWriter pw = res.getWriter();
		if(w > 0) {
			pw.write("<script>location.href = './admin_main.do';</script>");
		}
		else {
			System.out.println("Database 오류!!");
		}
	}
	
	@RequestMapping("/admin/member_list.do")
	public void mlist(HttpServletRequest req, Model m, @ModelAttribute("board") memberlog memberlog) throws Exception{
		String p = req.getParameter("page");
		int page = 0;
		int vpage = 0;
		if(p==null || p.equals("1") || p=="" || p=="null") {
			page = 0;
			vpage = 1;
		}
		else {
			page = (Integer.valueOf(p) * 4) - 4;
			vpage = Integer.valueOf(p);
		}
		/*
		String memsel1 = req.getAttribute("memsel1").toString();
		String memsel2 = req.getAttribute("memsel2").toString();
		if(memsel2 != "") {
	        req.setAttribute("memsel1",memsel1);
	        req.setAttribute("memsel2",memsel2);
		}
		*/
		
		
		List<noticevo> ml = sqlSession.selectList("noticeDB.membersel");
		int totals = ml.size();
		int sum = totals - (vpage - 1) * 4;
		int sum2 = totals - (vpage - 1) * 4;
		int delnum = 0;
		while(sum > sum2 - 4) {
			String sid = req.getParameter("sul"+sum);
			if(sid != "") {
				int dno = sqlSession.delete("noticeDB.memberdel",sid);
				delnum += dno;
			}
			sum--;
		}
		List<noticevo> ml2 = sqlSession.selectList("noticeDB.membersel2",page);
        req.setAttribute("totals", totals - delnum);
        req.setAttribute("now_page",vpage);
		m.addAttribute("ml", ml2);
	}
	
	@RequestMapping("/admin/notice_list.do")
	public void nlist(HttpServletRequest req, Model m, @ModelAttribute("board") writelist writelist) throws Exception{
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
		List<noticevo> ml = sqlSession.selectList("noticeDB.writesel1");
		int totals = ml.size();
		int sum = totals - (vpage - 1) * 8;
		int sum2 = totals - (vpage - 1) * 8;
		int delnum = 0;
		while(sum > sum2 - 8) {
			String nsub = req.getParameter("sul" +sum);
			if(nsub != "") {
				int del = sqlSession.delete("noticeDB.writedel",nsub);
				delnum += del;
			}
			sum--;
		}
		List<noticevo> ml2 = sqlSession.selectList("noticeDB.writesel2",page);
		
		List<noticevo> ml3 = sqlSession.selectList("noticeDB.writesel5");
		
		int arno = ml2.size();
		int arno2 = ml3.size();
		int wrno = 8 - arno;
		int wrno2 = 8 * (vpage - 1)  - arno2;
		if(arno < 8) {
			if(arno == 0) {
				ml2.addAll(sqlSession.selectList("noticeDB.writesel4",wrno2));
			}
			else {
				ml2.addAll(sqlSession.selectList("noticeDB.writesel3",wrno));
			}
		}
		req.setAttribute("totals", totals - delnum);
        req.setAttribute("now_page",vpage);
		m.addAttribute("ml", ml2);
			
	}
	
	@RequestMapping("/admin/notice_write.do")
	public void nwrite(@ModelAttribute("board") writelist writelist) throws Exception{
		
	}
	
	@RequestMapping("/admin/notice_view.do")
	public void viewlist(HttpServletRequest req, Model m, @ModelAttribute("board") memberlog memberlog) throws Exception{
		String nidx = (String)req.getParameter("nidx");
		List<noticevo> ml = sqlSession.selectList("noticeDB.writeview", nidx);
		m.addAttribute("ml",ml);
	}	
	
	@PostMapping("/admin/writego.do")
	public void gowrite(@ModelAttribute("board") writelist writelist) throws Exception{
			sqlSession.insert("noticeDB.writein", writelist);
	}
	
	@PostMapping("/admin/shiftwrite.do")
	public void shiftwrite(HttpServletRequest req, @ModelAttribute("board") writelist writelist) throws Exception{
		//System.out.println(writelist.getNidx());
		sqlSession.update("noticeDB.writeupdate", writelist);
	}
	
	@PostMapping("/admin/shiftdelete.do")
	public void shiftdelete(@ModelAttribute("board") writelist writelist) throws Exception{
		sqlSession.delete("noticeDB.writedelete", writelist);
	}
	
	@RequestMapping("/admin/member_modify.do")
	public void modify(HttpServletRequest req, Model m, @ModelAttribute("board") memberlog memberlog) throws Exception{
		String midx = req.getParameter("midx");
		List<memberlog> mody = sqlSession.selectList("noticeDB.membersel3", midx);
		m.addAttribute("mody",mody);
	}
	
	@RequestMapping("/admin/modify_up.do")
	public void modify_up(@ModelAttribute("board") memberlog memberlog) throws Exception{
		int a = sqlSession.update("noticeDB.modifyupdate", memberlog);
	}
	
	@RequestMapping("/admin/shop_setup.do")
	public void shop(@ModelAttribute("board") shopbanner shopbanner,Model m) throws Exception{
		List<noticevo> ml = sqlSession.selectList("noticeDB.sbanner");
		m.addAttribute("ml",ml);
	}
	
	@RequestMapping("/admin/shop_setup2.do")
	public void shop2(@ModelAttribute("board") shopbanner shopbanner,HttpServletResponse res) throws Exception{
		PrintWriter pw = null;
		res.setCharacterEncoding("utf-8");
	    res.setContentType("text/html; charset=utf-8");
	    
		int sel = sqlSession.update("noticeDB.sbannerup",shopbanner);
		
		pw = res.getWriter();
		if(sel > 0) {
			pw.write("<script>alert('쇼핑몰 메인설정이 변경되었습니다.'); location.href='./shop_setup.do';</script>");
		}
		else {
			pw.write("<script>alert('sql 오류'); location.href='./shop_product_write.jsp';</script>");
		}
	}
	
	@RequestMapping("/admin/imageupload.do")
	public void imgupload(HttpServletRequest req, HttpServletResponse res, MultipartFile upload) {
		OutputStream out = null;
		PrintWriter pw = null;
		res.setCharacterEncoding("utf-8");
	    res.setContentType("text/html; charset=utf-8");
	    
	    try {
	    	
	        String fileName = upload.getOriginalFilename(); 
	        byte[] bytes = upload.getBytes();
	       
	        
	        String uploadpath = req.getSession().getServletContext().getRealPath("/product_img/");
	        String imgsave = uploadpath + fileName;
	        System.out.println(imgsave);
	        out = new FileOutputStream(new File(imgsave));
	        out.write(bytes);
	        
	        pw = res.getWriter();
	        String fileurl = "../product_img/" + fileName;
	        pw.println("{\"filename\":\"" + fileName + "\", \"uploaded\":1,\"url\":\"" + fileurl + "\"}");
	        pw.flush();
	        
	    }
	    catch(Exception e) {
	    	e.printStackTrace();
	    }
	}
	
	@RequestMapping("/admin/shop_product_list.do")
	public void shoplist(HttpServletRequest req,  @ModelAttribute("board") shopvo shopvo, Model m) throws Exception{
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
		List<noticevo> ml = sqlSession.selectList("noticeDB.shoppro1");
		int totals = ml.size();
		int sum = totals - (vpage - 1) * 8;
		int sum2 = totals - (vpage - 1) * 8;
		int delnum = 0;
		while(sum > sum2 - 8) {
			String sidx = req.getParameter("sul" +sum);
			if(sidx  != "") {
				int del = sqlSession.delete("noticeDB.shoprodel",sidx);
				delnum += del;
			}
			sum--;
		}
		System.out.println(delnum);
		List<noticevo> ml2 = sqlSession.selectList("noticeDB.shoppro2",page);
		
		req.setAttribute("totals", totals - delnum);
        req.setAttribute("now_page",vpage);
		m.addAttribute("ml", ml2);
	}
	
	
	@RequestMapping("/admin/shop_write.do")
	public void shopwrite(HttpServletRequest req, HttpServletResponse res, @ModelAttribute("board") shopvo shopvo) throws Exception{
		PrintWriter pw = null;
		res.setCharacterEncoding("utf-8");
	    res.setContentType("text/html; charset=utf-8");
	    
	    String names = shopvo.getSfile1().getOriginalFilename();
	    long filesize = shopvo.getSfile1().getSize();
	    
	    InputStream fis = shopvo.getSfile1().getInputStream();
	    String path = req.getServletContext().getRealPath("");
	    String uploadfile = path + "product_img/" + names + shopvo.getScode();
	    System.out.println(path);
	    FileOutputStream fos = new FileOutputStream(uploadfile);
	    
	    byte[] buf = new byte[1024];
	    int size = 0;
	    while((size = fis.read(buf)) != -1) {
	    	fos.write(buf, 0, size);
	    }
	    fos.close();
	    
	    
	    String imgurl = "../product_img/" + names+ shopvo.getScode();
	    shopvo.setSmfile1(imgurl);
	    
	    
	    
		int sel = sqlSession.insert("noticeDB.shop_insert", shopvo);
		pw = res.getWriter();
		if(sel > 0) {
			pw.write("<script>alert('상품이 등록되었습니다.'); location.href='./shop_product_list.do';</script>");
		}
		else {
			pw.write("<script>alert('sql 오류'); location.href='./shop_product_write.jsp';</script>");
		}
	}
	
	@RequestMapping("/admin/shop_config.do")
	public void shopconfig1(@ModelAttribute("board") homeinfo homeinfo, Model m) throws Exception{
		List<noticevo> ml = sqlSession.selectList("noticeDB.homesel");
		m.addAttribute("ml",ml);
	}
	
	@RequestMapping("/admin/shop_config2.do")
	public void shopconfig2(@ModelAttribute("board") homeinfo homeinfo, HttpServletResponse res) throws Exception{
		PrintWriter pw = null;
		res.setCharacterEncoding("utf-8");
	    res.setContentType("text/html; charset=utf-8");
	    pw = res.getWriter();
	    
	    int sel = sqlSession.update("noticeDB.homeup",homeinfo);
		if(sel > 0) {
			pw.write("<script>alert('홈페지이 설정이 변경되었습니다.'); location.href='./shop_config.do';</script>");
		}
		else {
			pw.write("<script>alert('sql 오류'); location.href='./shop_config.do';</script>");
		}
	}
	
	/*
	@RequestMapping("/admin/memlist_memsel.do")
	public void meme(@ModelAttribute("board") memberlog memberlog,HttpServletRequest req, Model m, HttpServletResponse res) throws Exception{
		String memsel1 = req.getAttribute("memsel1").toString();
		String memsel2 = req.getAttribute("memsel2").toString();
		List<noticevo> ml2 = null;
		if(memsel1 == "1") {
			ml2 = sqlSession.selectList("noticeDB.memid",memsel2);
		}
		else if(memsel1 == "2") {
			ml2 = sqlSession.selectList("noticeDB.memnm",memsel2);
		}		
		else if(memsel1 == "3") {
			ml2 = sqlSession.selectList("noticeDB.memtel",memsel2);
		}
		
		m.addAttribute("ml",ml2);
		PrintWriter pw = null;
		res.setCharacterEncoding("utf-8");
	    res.setContentType("text/html; charset=utf-8");
	    pw = res.getWriter();
	    
	    pw.write("<script>location.href='./member_list.jsp';</script>");
	}
	*/
	
	
	
	
}
