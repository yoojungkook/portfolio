package master;

import master.manage.service.MemberManageService;
import member.Member;

import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.ArrayList;

@WebServlet("/master/member")
public class MasterController extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public MasterController() {
        super();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
       memberManager(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    private void memberManager(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        MemberManageService service = new MemberManageService();
        ArrayList<Member> list = service.getAllUser();

        request.setAttribute("list", list);
        request.setAttribute("msg", "회원관리");
        request.setAttribute("view", "/master/member/list.jsp");

        request.getRequestDispatcher("/master/index.jsp").forward(request, response);
    }
}
