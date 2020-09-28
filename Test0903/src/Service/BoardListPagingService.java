package Service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DAO.TestDAO;
import DTO.BoardDTO;
import DTO.PageDTO;

public class BoardListPagingService {
	/* 상수 선언
	 *  상수 : 바뀌지 않는 값이며, 현재 클래스 내에서 고정값으로 사용이 가능함. 
	 *  	  상수에 담긴 값을 변환을 할 수 없음. */
	// PAGE_LIMIT : 한페이지에 보여줄 글 갯수 
	private static final int PAGE_LIMIT = 3;
	// BLOCK_LIMIT : 한 화면상에 노출되는 페이지 갯수 
	// 예를 들어 1~5까지 보이고 그다음은 6~10, 11~15 .......
	private static final int BLOCK_LIMIT = 5;
	
	
	public List<BoardDTO> boardList(HttpServletRequest request, HttpServletResponse response) {
		int page = 1;
		if(request.getParameter("page") != null) {
			page = Integer.parseInt(request.getParameter("page"));
		}
		TestDAO bDAO = new TestDAO();
		String listpaging = request.getParameter("kategorie");
		System.out.println(listpaging);
		bDAO.dbConnection();
		int startRow = (page-1) * PAGE_LIMIT + 1; //=1
		int endRow = page * PAGE_LIMIT;
		List<BoardDTO> boardList = bDAO.boardListPaging(startRow, endRow, listpaging);
		bDAO.dbClose();
		// 현재 페이지에 필요한 글만 가지고 와서 컨트롤러로 리턴
		return boardList;
	}


	public PageDTO paging(HttpServletRequest request, HttpServletResponse response) {
		int page = 1;
		if(request.getParameter("page") != null) {
			page = Integer.parseInt(request.getParameter("page"));
		}
		TestDAO bDAO = new TestDAO();
		String listpaging = request.getParameter("kategorie");
		System.out.println(listpaging);
		bDAO.dbConnection();
		// DB에 저장된 전체 글 갯수
		int listCount = bDAO.listCount(listpaging);
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