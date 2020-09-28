package Service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DAO.TestDAO;
import DTO.BoardDTO;

public class BoardViewService {

	public BoardDTO view(HttpServletRequest request, HttpServletResponse response) {
		int bnumber = Integer.parseInt(request.getParameter("bnumber"));

		TestDAO bDAO = new TestDAO();
		
		bDAO.dbConnection();
		bDAO.hitsup(bnumber);
		BoardDTO mDTO = bDAO.boardView(bnumber);
		
		bDAO.dbClose();
		
		return mDTO;
	}

}
