package Service;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import DAO.TestDAO;
import DTO.BoardDTO;

public class BoardUpdateProcessService {

	public int updatrpro(HttpServletRequest request, HttpServletResponse response) throws IOException {
		String savePath = "D:\\source\\servlet\\Test0903\\WebContent\\images";
		
		MultipartRequest mulit = new MultipartRequest(
				request, savePath, 10*1024*1024, "UTF-8", 
				new DefaultFileRenamePolicy());
		
		
		int bnumber = Integer.parseInt(mulit.getParameter("bnumber"));
		String bwriter = mulit.getParameter("bwriter");
		String btitle = mulit.getParameter("btitle");
		String bcontents = mulit.getParameter("bcontents");
		String bfile = mulit.getParameter("bfile");
		String btag1 = mulit.getParameter("btag1");
		String btag2 = mulit.getParameter("btag2");
		String updatefile = mulit.getOriginalFileName((String)mulit.getFileNames().nextElement());
		BoardDTO bDTO = new BoardDTO();
		
		System.out.println(updatefile);
		System.out.println(bfile);
		
		bDTO.setBnumber(bnumber);
		bDTO.setBwriter(bwriter);
		bDTO.setBtitle(btitle);
		bDTO.setBcontents(bcontents);
		bDTO.setBtag1(btag1);
		bDTO.setBtag2(btag2);
		
		if(updatefile == null) {
			bDTO.setBfile(bfile);
		} else {
			bDTO.setBfile(updatefile);
		}
		
		System.out.println(bDTO.getUpdatefile());
		System.out.println(bDTO.getBfile());
		
		TestDAO bDAO = new TestDAO();
		bDAO.dbConnection();
		
		int result = bDAO.UpdateProcess(bDTO);
		
		bDAO.dbClose();
		
		return result;
	}

}
