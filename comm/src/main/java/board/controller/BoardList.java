package board.controller;

import board.Board;
import board.BoardService;

import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.ArrayList;

@WebServlet( urlPatterns = {"/board/list", "/"})
public class BoardList extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private BoardService service;
    private RequestDispatcher dis;
    private final int PAGE_5 = 5;
    private final int PAGE_10 = 10;

    public BoardList() {
        super();
        service = new BoardService();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String no = request.getParameter("no");
        int currentPage = 0;

        if(no == null) currentPage = 1;
        else currentPage = Integer.parseInt(no);
        request.setAttribute("list", service.getPageRowCount(currentPage, PAGE_5));
        request.setAttribute("pages", (int)Math.ceil(Math.round((double)service.allBoardList().size()/PAGE_5)));
        request.setAttribute("currentPage", currentPage);

        dis = request.getRequestDispatcher("/board/list.jsp");
        dis.forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        ArrayList<Board> list = service.allBoardList();

        request.setAttribute("list", list);

        dis = request.getRequestDispatcher("/board/list.jsp");
        dis.forward(request, response);
    }
}
