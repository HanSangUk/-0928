package Service;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import DAO.TestDAO;
import DTO.MemberDTO;

public class MemberUpdateProcessService {

	public int memberupdate(HttpServletRequest request, HttpServletResponse response) throws IOException {
		MemberDTO mDTO = new MemberDTO();
		String savePath = "D:\\source\\servlet\\Test0903\\WebContent\\File";
		
		MultipartRequest mulit = new MultipartRequest(
				request, savePath, 10*1024*1024, "UTF-8", 
				new DefaultFileRenamePolicy());
		
		String mid = mulit.getParameter("mid");
		String mpassword = mulit.getParameter("mpassword");
		String mname = mulit.getParameter("mname");
		String mphone = mulit.getParameter("mphone");
		String maddress1 = mulit.getParameter("maddress1");
		String maddress2 = mulit.getParameter("maddress2");
		String maddress3 = mulit.getParameter("maddress3");
		String maddress4 = mulit.getParameter("maddress4");
		String memail = mulit.getParameter("memail");
		
		
		String mfile = mulit.getOriginalFileName((String)mulit.getFileNames().nextElement());
		
		mDTO.setMfile(mfile);
		mDTO.setMid(mid);
		mDTO.setMpassword(mpassword);
		mDTO.setMname(mname);
		mDTO.setMphone(mphone);
		mDTO.setMemail(memail);
		mDTO.setMaddress1(maddress1);
		mDTO.setMaddress2(maddress2);
		mDTO.setMaddress3(maddress3);
		mDTO.setMaddress4(maddress4);
		
		TestDAO tDAO = new TestDAO();
		tDAO.dbConnection();
		int result = tDAO.memberupdateprocess(mDTO);
		tDAO.dbClose();
		
		return result;
	}

}
