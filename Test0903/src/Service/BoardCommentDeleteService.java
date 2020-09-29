package Service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DAO.TestDAO;

public class BoardCommentDeleteService {

	public int commentdelete(HttpServletRequest request, HttpServletResponse response) {
		
		int cnumber = Integer.parseInt(request.getParameter("cnumber"));
		
		TestDAO tDAO = new TestDAO();
		
		tDAO.dbConnection();
		
		int result = tDAO.commentdelete(cnumber);
		
		tDAO.dbClose();
		
		return result;
	}

}
