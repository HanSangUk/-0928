package Service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DAO.TestDAO;
import DTO.MemberDTO;

public class MemberViewService {

	public MemberDTO mview(HttpServletRequest request, HttpServletResponse response) {
		String mid = request.getParameter("mid");
		TestDAO tDAO = new TestDAO();
		tDAO.dbConnection();
		MemberDTO view = tDAO.memberview(mid);
		tDAO.dbClose();
		return view;
	}

}
