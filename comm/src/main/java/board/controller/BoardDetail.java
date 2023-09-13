package board.controller;

import board.Board;
import board.BoardService;

import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

@WebServlet("/board/detail")
public class BoardDetail extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private RequestDispatcher dis;
    private BoardService service;

    public BoardDetail() {
        super();
        service = new BoardService();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int no = Integer.parseInt(request.getParameter("no"));

        Board board = service.getBoard(no);

        request.setAttribute("board", board);

        dis = request.getRequestDispatcher("/board/detail.jsp");
        dis.forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
