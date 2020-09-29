package Conttroller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Service.BoardCommentInsertService;

@WebServlet("/commentinsert")
public class BoardCommentController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public BoardCommentController() {
        super();
    }

    protected void doProcess(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	request.setCharacterEncoding("UTF-8");
    	BoardCommentInsertService cis = new BoardCommentInsertService();
    	int result = cis.commentinsert(request, response);
    	
    	int bnumber = Integer.parseInt(request.getParameter("clist_bnumber"));
    	
    	if(result>0) {
    		response.sendRedirect("boardview?bnumber="+bnumber);
    	} else {
    		response.sendRedirect("main");
    	}
    }
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doProcess(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doProcess(request, response);
	}

}
