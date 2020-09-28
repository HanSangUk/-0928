package Service;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DAO.TestDAO;
import DTO.BoardDTO;
import DTO.PageDTO;

public class BoardSerchService {

	private static final int PAGE_LIMIT = 3;
	private static final int BLOCK_LIMIT = 5;
	
	public List<BoardDTO> serchservice(HttpServletRequest request, HttpServletResponse response) {
		int page = 1;
		if(request.getParameter("page") != null) {
			page = Integer.parseInt(request.getParameter("page"));
		}
		TestDAO bDAO = new TestDAO();
		bDAO.dbConnection();
		int startRow = (page-1) * PAGE_LIMIT + 1; //=1
		int endRow = page * PAGE_LIMIT;
		String btitle = request.getParameter("keyword");
		String wtsearch = request.getParameter("wtsearch");
		String listpaging = request.getParameter("kategorie");
		System.out.println(listpaging);
		List<BoardDTO> boardList = new ArrayList<BoardDTO>();
		if(wtsearch.equals("btitle")) {
			boardList = bDAO.boardPaging(startRow, endRow, btitle, listpaging);
		} else if(wtsearch.equals("bwriter")) {
			boardList = bDAO.boardPaging2(startRow, endRow, btitle, listpaging);
		}
		bDAO.dbClose();
		
		return boardList;
	
	}

	
	public PageDTO paging(HttpServletRequest request, HttpServletResponse response) {
		int page = 1;
		int count = 0;
		if(request.getParameter("page") != null) {
			page = Integer.parseInt(request.getParameter("page"));
		}
		TestDAO bDAO = new TestDAO();
		bDAO.dbConnection();
		// DB에 저장된 전체 글 갯수
		String btitle = request.getParameter("keyword");
		String wtsearch = request.getParameter("wtsearch");
		String listpaging = request.getParameter("kategorie");
		System.out.println(listpaging);
		if(wtsearch.equals("btitle")) {
			count = bDAO.serchCount(btitle, listpaging);
		} else if(wtsearch.equals("bwriter")) {
			count = bDAO.serchCount2(btitle, listpaging);
		}
		int listCount = count;
		bDAO.dbClose();
		// 최대 필요한 페이지 갯수
		int maxPage = (int)(Math.ceil((double)listCount/PAGE_LIMIT));
		// 시작페이지 (1,6,11,16,21 ~~~~~~~)
		int startPage = (((int)(Math.ceil((double)page/BLOCK_LIMIT))) - 1) * BLOCK_LIMIT + 1;
		// 마지막페이지 (5,10,15,20 ~~~~~~~)
		int endPage = startPage + BLOCK_LIMIT - 1;
		// 마지막 페이지가 n개일경우 최대 페이자가 n개 이상으로 필요가 없기 때문에
		if (endPage > maxPage) {
			endPage = maxPage;
		}
		PageDTO paging = new PageDTO();
		paging.setPage(page);
		paging.setStartPage(startPage);
		paging.setEndPage(endPage);
		paging.setMaxPage(maxPage);
		
		return paging;
	}

}
