package Service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DAO.TestDAO;
import DTO.BoardDTO;

public class BoardUpdateService {

	public BoardDTO update(HttpServletRequest request, HttpServletResponse response) {
		int bnumber = Integer.parseInt(request.getParameter("bnumber"));
		TestDAO bDAO = new TestDAO();
		
		bDAO.dbConnection();

		BoardDTO bDTO = bDAO.Update(bnumber);
		
		bDAO.dbClose();
		return bDTO;
	}

}
