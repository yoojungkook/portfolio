package member.controller;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import member.Member;
import member.MemberService;

import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

@WebServlet("/member/join")
public class MemberJoin extends HttpServlet {
    private static final long serialVersionUID = 1L;
    
    public MemberJoin() {
        super();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        RequestDispatcher dis = request.getRequestDispatcher("/member/join.jsp");
        dis.forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // 파일 업로드 경로
        String path = "C:\\comm";

        // 파일 사이즈
        int size = 100 * 1024 * 1024;
        
        MultipartRequest multipartRequest = new MultipartRequest(request, path, size, "utf-8", new DefaultFileRenamePolicy());

        String id = request.getParameter("id");
        String password = request.getParameter("password");

        MemberService service = new MemberService();
        service.addMember(new Member(0, id, password));
    }
}
