package Conttroller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DTO.MemberDTO;
import Service.MemberViewService;

@WebServlet("/memberview")
public class MemberViewController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public MemberViewController() {
        super();
    }

	protected void doProcess(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		MemberViewService memberview = new MemberViewService();
		MemberDTO View = memberview.mview(request, response);
		request.setAttribute("View", View);
        // dispatch 객체선언
        RequestDispatcher dispatcher = request.getRequestDispatcher("MemberView.jsp");
        dispatcher.forward(request, response);
	}

    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doProcess(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doProcess(request, response);
	}

}
