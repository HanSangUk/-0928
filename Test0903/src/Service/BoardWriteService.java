package Service;


import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import DAO.TestDAO;
import DTO.BoardDTO;

public class BoardWriteService {

	public String writeservice(HttpServletRequest request, HttpServletResponse response) throws IOException {
		String savePath = "D:\\source\\servlet\\Test0903\\WebContent\\images";
		
		MultipartRequest mulit = new MultipartRequest(
				request, savePath, 10*1024*1024, "UTF-8", 
				new DefaultFileRenamePolicy());
		
		BoardDTO bDTO = new BoardDTO();
		String bkategorie = mulit.getParameter("bkategorie");
		String bwriter = mulit.getParameter("bwriter");
		String btitle = mulit.getParameter("btitle");
		String bcontents = mulit.getParameter("bcontents");
		String btag1 = mulit.getParameter("btag1");
		String btag2 = mulit.getParameter("btag2");
		String bfile = mulit.getOriginalFileName((String)mulit.getFileNames().nextElement());
		bDTO.setBkategorie(bkategorie);
		bDTO.setBwriter(bwriter);
		bDTO.setBtitle(btitle);
		bDTO.setBcontents(bcontents);
		bDTO.setBfile(bfile);
		bDTO.setBtag1(btag1);
		bDTO.setBtag2(btag2);
		TestDAO bDAO = new TestDAO();
		bDAO.dbConnection();
		
		int result = bDAO.write(bDTO);

		if(result>0) {
			return bkategorie;
		}
		bDAO.dbClose();
		
		return null;
	}
	
}
