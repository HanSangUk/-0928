package Conttroller;

import java.io.IOException;
import java.util.*;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Service.BoardViewService;
import Service.CommentService;
import DTO.BoardDTO;
import DTO.CommentDTO;

@WebServlet("/boardview")
public class BoardViewController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public BoardViewController() {
        super();
    }

    protected void doProcess(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	request.setCharacterEncoding("UTF-8");
    	BoardViewService viewservice = new BoardViewService();
    	CommentService cservice = new CommentService();
    	BoardDTO viewDTO = new BoardDTO();
    	List<CommentDTO> clist = new ArrayList<CommentDTO>();
    	
    	viewDTO = viewservice.view(request, response);
    	clist = cservice.clist(request, response);
    	
    	request.setAttribute("clist", clist);
    	request.setAttribute("viewDTO", viewDTO);
         // dispatch 객체선언
        RequestDispatcher dispatcher = request.getRequestDispatcher("BoardView.jsp");
        dispatcher.forward(request, response);
    }
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doProcess(request, response);

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doProcess(request, response);
	}

}
