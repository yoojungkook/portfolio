package board.controller;

import board.Board;
import board.BoardService;

import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.ArrayList;

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
        ArrayList<Board> list = service.allBoardList();

        System.out.println("list.size:" + list.size());

        request.setAttribute("list", list);

        System.out.println("/board/list get 통과");

        dis = request.getRequestDispatcher("/board/list.jsp");
        dis.forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        ArrayList<Board> list = service.allBoardList();

        System.out.println("list.size:" + list.size());

        request.setAttribute("list", list);

        System.out.println("/board/list post 통과");

        dis = request.getRequestDispatcher("/board/list.jsp");
        dis.forward(request, response);
    }
}
