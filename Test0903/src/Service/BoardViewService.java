package Service;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DAO.TestDAO;
import DTO.BoardDTO;

public class BoardViewService {

	public BoardDTO view(HttpServletRequest request, HttpServletResponse response) {
		int bnumber = Integer.parseInt(request.getParameter("bnumber"));
		System.out.println("bnumber찍어봄 = "+bnumber);
		TestDAO bDAO = new TestDAO();
		
		bDAO.dbConnection();
		System.out.println("view DAO 넘어감");
		bDAO.hitsup(bnumber);
		
		BoardDTO mDTO = bDAO.boardView(bnumber);
		
		bDAO.dbClose();
		
		return mDTO;
	}

}
