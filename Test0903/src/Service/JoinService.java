package Service;

import java.io.IOException;
import java.sql.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import DAO.TestDAO;
import DTO.MemberDTO;

public class JoinService {

	public int joinService(HttpServletRequest request, HttpServletResponse response) throws IOException {
		MemberDTO mDTO = new MemberDTO();
		String savePath = "D:\\source\\servlet\\Test0903\\WebContent\\File";
		
		MultipartRequest mulit = new MultipartRequest(
				request, savePath, 10*1024*1024, "UTF-8", 
				new DefaultFileRenamePolicy());
		String mid = mulit.getParameter("mid");
		String mpassword = mulit.getParameter("mpassword");
		String mname = mulit.getParameter("mname");
		String mgender = mulit.getParameter("mgender");
		String mphone = mulit.getParameter("mphone");
		String maddress1 = mulit.getParameter("maddress1");
		String maddress2 = mulit.getParameter("maddress2");
		String maddress3 = mulit.getParameter("maddress3");
		String maddress4 = mulit.getParameter("maddress4");
		String memail = mulit.getParameter("memail");
		String mbirth = mulit.getParameter("mbirth"); 
		Date date = Date.valueOf(mbirth);
		
		
		String mfile = mulit.getOriginalFileName((String)mulit.getFileNames().nextElement());
		
		mDTO.setMid(mid);
		mDTO.setMpassword(mpassword);
		mDTO.setMname(mname);
		mDTO.setMgender(mgender);
		mDTO.setMphone(mphone);
		mDTO.setMaddress1(maddress1);
		mDTO.setMaddress2(maddress2);
		mDTO.setMaddress3(maddress3);
		mDTO.setMaddress4(maddress4);
		mDTO.setMemail(memail);
		mDTO.setMfile(mfile);
		mDTO.setMbirth(date);
		
		TestDAO mDAO = new TestDAO();
		mDAO.dbConnection();
		int result = mDAO.Join(mDTO);
		mDAO.dbClose();
		return result;
	}

}
