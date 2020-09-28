package Service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DAO.TestDAO;
import DTO.MemberDTO;

public class LoginService {

	public String loginService(HttpServletRequest request, HttpServletResponse response) {
		String mid = request.getParameter("mid");
		String mpassword = request.getParameter("mpassword");
		String id = null;
		MemberDTO mDTO = new MemberDTO();
		mDTO.setMid(mid);
		mDTO.setMpassword(mpassword);
		
		TestDAO mDAO = new TestDAO();
		mDAO.dbConnection();
		
		boolean boo = mDAO.Login(mDTO);
		if(boo) {
			id = mid;
		} else {
			id = null;
		}
		
		mDAO.dbClose();
		return id;
	}

}
