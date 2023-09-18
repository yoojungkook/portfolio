package member.controller;

import member.Member;
import member.MemberService;
import org.json.simple.JSONObject;

import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

@WebServlet("/LoginCheck")
public class LoginCheck extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private MemberService service;
    private RequestDispatcher dis;
    private JSONObject obj;

    public LoginCheck() {
        super();
        service = new MemberService();
        obj = new JSONObject();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("/member/login.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        response.setCharacterEncoding("utf-8");
        response.setContentType("text/html; charset=utf-8");

        String id = request.getParameter("id");
        System.out.println("id: " + id);

        String password = request.getParameter("password");
        System.out.println("password: " + password);

        JSONObject obj = new JSONObject();
        obj.put("flag", "true");

        Member m  = service.loginCheck(id, password);
        if(m != null) {
            response.getWriter().append(obj.toJSONString());
        } else {
            obj.clear();
            obj.put("flag", "false");
            response.getWriter().append(obj.toJSONString());
        }
    }
}
