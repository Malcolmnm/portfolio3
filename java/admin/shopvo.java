package admin;

import org.springframework.web.multipart.MultipartFile;

import lombok.Getter;
import lombok.Setter;

@Setter
@Getter
public class shopvo {
	int sidx,scode,ssel,sdis,sdissel,scon;
	String smenu1,smenu2,sname,stext1,scan,ssold,smfile1,smfile2,smfile3,stext2;
	MultipartFile sfile1,sfile2,sfile3;
}
