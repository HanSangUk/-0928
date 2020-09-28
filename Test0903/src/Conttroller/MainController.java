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
import Service.MainService;

@WebServlet("/main")
public class MainController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public MainController() {
        super();
    }
    
    protected void doProcess(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	request.setCharacterEncoding("UTF-8");
    	MainService mainservice = new MainService();
    	List<BoardDTO> mainlist = new ArrayList<BoardDTO>();
    	mainlist = mainservice.main(request, response);
    	
    	BoardDTO list1 = null;
    	BoardDTO list2 = null;
    	BoardDTO list3 = null;
    	
    	if(mainlist.size()!=0) {
    		list1 = mainlist.get(0);
    		list2 = mainlist.get(1);
    		list3 = mainlist.get(2);
    	}
    	
    	request.setAttribute("list1", list1);
      	request.setAttribute("list2", list2);
      	request.setAttribute("list3", list3);
     	
    	RequestDispatcher dispatcher = request.getRequestDispatcher("Main.jsp");
		dispatcher.forward(request, response);
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doProcess(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doProcess(request, response);
	}

}
