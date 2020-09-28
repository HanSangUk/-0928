package Conttroller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import DTO.MemberDTO;
import Service.MemberUpdateService;

@WebServlet("/MemberUpdate")
public class MemberUpdateController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public MemberUpdateController() {
        super();
    }

    protected void doProcess(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	request.setCharacterEncoding("UTF-8");
    	MemberUpdateService memberupdate = new MemberUpdateService();
    	HttpSession session = request.getSession();
    	String mid = (String) session.getAttribute("loginId");
    	MemberDTO update = memberupdate.mupdate(mid);
    	request.setAttribute("update", update);
        RequestDispatcher dispatcher = request.getRequestDispatcher("MemberUpdate.jsp");
        dispatcher.forward(request, response);
    }

    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doProcess(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doProcess(request, response);
	}

}
