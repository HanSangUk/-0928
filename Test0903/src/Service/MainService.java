package Service;

import java.util.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DAO.TestDAO;
import DTO.BoardDTO;

public class MainService {

	public List<BoardDTO> main(HttpServletRequest request, HttpServletResponse response) {
		TestDAO tDAO = new TestDAO();
		List<BoardDTO> mlist = new ArrayList<BoardDTO>();
		
		tDAO.dbConnection();
		
		mlist = tDAO.mainlist();
		
		tDAO.dbClose();
		
		return mlist;
	}

}
