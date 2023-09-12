package board;

import connect.Factory;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import java.util.ArrayList;

public class BoardService {
    private SqlSessionFactory sqlSessionFactory;
    private SqlSession session;

    public BoardService() {
        sqlSessionFactory = Factory.getSqlSessionFactory();
    }

    public ArrayList<Board> allBoardList() {
        return null;
    }
}
