package member.controller;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import member.Member;
import member.MemberService;
import region.SeoulRegion;
import region.SeoulRegionService;

import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;
import java.sql.Date;
import java.util.ArrayList;

@WebServlet("/member/join")
public class MemberJoin extends HttpServlet {
    private static final long serialVersionUID = 1L;
    
    public MemberJoin() {
        super();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        SeoulRegionService seoulRegionService = new SeoulRegionService();
        ArrayList<SeoulRegion> seoulAutonomyList = seoulRegionService.getSeoulAutonomyList();

        request.setAttribute("seoulAutonomyList", seoulAutonomyList);

        RequestDispatcher dis = request.getRequestDispatcher("/member/join.jsp");
        dis.forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // 파일 업로드 경로
        String path = "C:\\comm";

         // 파일 사이즈
        int size = 100 * 1024 * 1024;

        MultipartRequest multipartRequest = new MultipartRequest(request, path+File.separator, size, "utf-8", new DefaultFileRenamePolicy());

        String id = multipartRequest.getParameter("id");
        String password = multipartRequest.getParameter("password");
        String name = multipartRequest.getParameter("name");
        String email = multipartRequest.getParameter("email");
        String phone = multipartRequest.getParameter("phone");
        String date = multipartRequest.getParameter("date");
        Date birth = Date.valueOf(date);

        String autonomy = multipartRequest.getParameter("autonomy");
        File photo = multipartRequest.getFile("file");

        // 프로필 사진을 선택한 경우
        // 파일 이동 시작!
        if(photo.exists()) {
            // 기존에 사진이 저장되는 폴더
            String oldFilePath = (path + File.separator + photo.getName());

            // 새롭게 사진이 옮겨질 폴더
            String newFilePath = (path + File.separator + name + File.separator + photo.getName());

            // 새롭게 사진이 옮겨질 폴더 유무 확인
            // 처음 회원가입시 반드시 폴더가 만들어짐
            File dirPath = new File(path + File.separator + name);
            if (!dirPath.exists()) {
                dirPath.mkdir();
            }

            // 기존 폴더에 있던 사진이 새로운 폴더로 옮겨짐
            File oldFile = new File(oldFilePath);
            if (oldFile.renameTo(new File(newFilePath))) {
                System.out.println("파일 이동 성공!");
            } else {
                System.out.println("파일 이동 실패!");
            }
        }
        // 끝!

        Member m= new Member(0, id, password, name, email, birth, phone, autonomy, null, photo.getName(), null, null);
        System.out.println(m.toString());

        MemberService service = new MemberService();
        service.addMember(m);

        response.sendRedirect(request.getContextPath() + "/hello.jsp");
    }
}
