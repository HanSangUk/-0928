package Conttroller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Service.BoardSerchService;
import DTO.BoardDTO;
import DTO.PageDTO;

@WebServlet("/searchs")
public class BoardSerchController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public BoardSerchController() {
        super();
    }

    protected void doProcess(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	request.setCharacterEncoding("UTF-8");
    	BoardSerchService serch = new BoardSerchService();
    	List<BoardDTO> serchlist = new ArrayList<BoardDTO>();
    	serchlist = serch.serchservice(request, response);
    	PageDTO boardserch = serch.paging(request, response);
    	
    	String keyword = request.getParameter("keyword");
    	String wtsearch = request.getParameter("wtsearch");
    	String kategorie = request.getParameter("kategorie");
    	
    	request.setAttribute("kategorie", kategorie);    	
    	request.setAttribute("wtsearch", wtsearch);
    	request.setAttribute("keyword", keyword);
    	request.setAttribute("boardserch", boardserch);
    	request.setAttribute("serchlist", serchlist);
    	
		RequestDispatcher dispatcher = request.getRequestDispatcher("BoardSerchList.jsp");
		dispatcher.forward(request, response);
    }
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doProcess(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doProcess(request, response);
	}

}
