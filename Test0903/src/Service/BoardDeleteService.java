package Service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DAO.TestDAO;

public class BoardDeleteService {

	public String deleteService(HttpServletRequest request, HttpServletResponse response) {
		int bnumber = Integer.parseInt(request.getParameter("bnumber"));
		
		TestDAO bDAO = new TestDAO();
		bDAO.dbConnection();
		
		String kategorie = bDAO.bkategorie(bnumber);
		
		int result = bDAO.Delete(bnumber);
		
		if(result>0) {
			return kategorie;
		}
		bDAO.dbClose();
		
		return null;
	}

}
