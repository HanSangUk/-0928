package Conttroller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Service.BoardCommentDeleteService;

@WebServlet("/commentdelete")
public class BoardCommentDeleteController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public BoardCommentDeleteController() {
        super();
    }
    
    protected void doProcess(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	request.setCharacterEncoding("UTF-8");
    	
    	BoardCommentDeleteService cdelete = new BoardCommentDeleteService();
    	
    	int result = cdelete.commentdelete(request, response);
    	
    	int bnumber = Integer.parseInt(request.getParameter("bnumber"));
    	System.out.println(bnumber);
    	if(result>0) {
    		response.sendRedirect("boardview?bnumber="+bnumber);
    	}
    }
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doProcess(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doProcess(request, response);
	}

}
