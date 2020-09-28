package Service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DAO.TestDAO;

public class MemberDeleteService {

	public int mdelete(HttpServletRequest request, HttpServletResponse response) {
		String mid = request.getParameter("mid");
		
		TestDAO tDAO = new TestDAO();
		
		tDAO.dbConnection();
		int result = tDAO.memberdelete(mid);
		tDAO.dbClose();
		
		return result;
	}

}
