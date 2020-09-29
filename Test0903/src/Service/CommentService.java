package Service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DAO.TestDAO;
import DTO.CommentDTO;

public class CommentService {

	public List<CommentDTO> clist(HttpServletRequest request, HttpServletResponse response) {
		int bnumber = Integer.parseInt(request.getParameter("bnumber"));
		TestDAO tDAO = new TestDAO();
		tDAO.dbConnection();
		List<CommentDTO> clist = tDAO.boardViewComment(bnumber);
		tDAO.dbClose();
		return clist;
	}

}
