package member.controller;

import member.Member;
import member.MemberService;

import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

@WebServlet("/member/login")
public class MemberLogIn extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private MemberService service;
    private RequestDispatcher dis;

    public MemberLogIn() {
        super();
        service = new MemberService();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String id = request.getParameter("id");
        String password = request.getParameter("password");

        Member m  = service.loginCheck(id, password);
        String path = "";

        if(m != null) {
            path = "/board/list";
        } else {
            path = "/hello.jsp";
        }

        System.out.println("post path:" + path);

        response.sendRedirect(request.getContextPath() + path);

//        dis = request.getRequestDispatcher(path);
//        dis.forward(request, response);
    }
}
