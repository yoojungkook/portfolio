package member.controller;

import member.Member;
import member.MemberService;
import org.json.simple.JSONObject;

import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

@WebServlet("/member/login")
public class MemberLogIn extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private MemberService service;
    private RequestDispatcher dis;
    private JSONObject obj;

    public MemberLogIn() {
        super();
        service = new MemberService();
        obj = new JSONObject();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        response.setCharacterEncoding("utf-8");

        HttpSession session = request.getSession(false);
        if(session.getAttribute("loginId") != null) {
            response.sendRedirect(request.getContextPath() + "/board/list");
        } else {
            response.sendRedirect(request.getContextPath() + "/member/login.jsp");
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        response.setCharacterEncoding("utf-8");

        String id = request.getParameter("id");
        String password = request.getParameter("password");

        Member m  = service.loginCheck(id, password);
        if(m != null) {
            HttpSession session = request.getSession();
            session.setAttribute("loginId", m.getId());

            System.out.println("세션 생성 성공 및 이동!");
            response.sendRedirect(request.getContextPath() + "/board/list");
        }
    }
}
