package board;

import connect.Factory;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import java.util.ArrayList;

public class BoardService {
    private SqlSessionFactory sqlSessionFactory;
    private SqlSession session;
    private BoardDao dao;

    public BoardService() {
        sqlSessionFactory = Factory.getSqlSessionFactory();
    }

    public ArrayList<Board> allBoardList() {
        session = sqlSessionFactory.openSession();
        dao = session.getMapper(BoardDao.class);
        ArrayList<Board> list = dao.selectAll();
        session.close();

        return list;
    }

    public Board getBoard(int no) {
        session = sqlSessionFactory.openSession();
        dao = session.getMapper(BoardDao.class);
        Board board = dao.selectBoard(no);
        session.close();

        return board;
    }
}
