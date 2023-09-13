package board.controller;

import board.BoardService;

import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

@WebServlet("/board/list")
public class BoardList extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private BoardService service;
    private RequestDispatcher dis;

    public BoardList() {
        super();
        service = new BoardService();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setAttribute("list", service.allBoardList());

        System.out.println("/board/list 통과");

        dis = request.getRequestDispatcher("/board/list.jsp");
        dis.forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
