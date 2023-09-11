package log.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import member.Member;
import member.MemberService;

/**
 * Servlet implementation class LogIn
 */
@WebServlet("/member/login")
public class LogIn extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private MemberService service;
	private HttpSession session;
	private RequestDispatcher dis;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LogIn() {
        super();
        service = new MemberService();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		if(request.getSession().getAttribute("id") != null) {
			dis = request.getRequestDispatcher("/board/list.jsp");
			dis.forward(request, response);
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		
		String id = request.getParameter("id");
		String password = request.getParameter("password");
		
		Member user = service.loginCheck(id, password);
		
		// 로그인 성공!
		if(user != null) {
			session =  request.getSession();
			session.setAttribute("id", user.getId());
			
			dis = request.getRequestDispatcher("/board/list.jsp");
			dis.forward(request, response);
		}
		
		// 로그인 실패
		dis = request.getRequestDispatcher("/hello.jsp");
		dis.forward(request, response);
	}

}
