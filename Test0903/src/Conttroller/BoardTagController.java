package Conttroller;

import java.io.IOException;
import java.util.*;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DTO.BoardDTO;
import DTO.PageDTO;
import Service.BoardTagService;

@WebServlet("/boardtag")
public class BoardTagController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public BoardTagController() {
        super();
    }

    protected void doProcess(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	request.setCharacterEncoding("UTF-8");
    	BoardTagService btag = new BoardTagService();
    	List<BoardDTO> taglist = new ArrayList<BoardDTO>();
    	PageDTO tagserch = btag.btag(request, response);
    	taglist = btag.btagserch(request, response);    
    	
    	request.setAttribute("taglist", taglist);
    	request.setAttribute("tagserch", tagserch);
    	
    	RequestDispatcher dispatcher = request.getRequestDispatcher("BoardTagSerch.jsp");
		dispatcher.forward(request, response);
    }
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doProcess(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doProcess(request, response);
	}

}
