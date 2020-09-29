package Service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DAO.TestDAO;
import DTO.CommentDTO;

public class BoardCommentInsertService {

	public int commentinsert(HttpServletRequest request, HttpServletResponse response) {
		String mid = request.getParameter("clist_mid");
		String content = request.getParameter("clist_content");
		int bnumber = Integer.parseInt(request.getParameter("clist_bnumber"));
		
		CommentDTO cDTO = new CommentDTO();
		
		cDTO.setBnumber(bnumber);
		cDTO.setContent(content);
		cDTO.setMid(mid);
		
		TestDAO tDAO = new TestDAO();
		
		tDAO.dbConnection();
		
		int result = tDAO.commentinsert(cDTO);
		
		tDAO.dbClose();
		
		return result;
	}

}
