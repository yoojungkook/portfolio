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

    /**
     *
     * @param currentPage : 현재 페이지 번호
     * @param viewRows : 현재 페이지 글 목록 개수
     */
    public ArrayList<Board> getPageRowCount(int currentPage, int viewRows) {
        session = sqlSessionFactory.openSession();
        dao = session.getMapper(BoardDao.class);

        ArrayList<Board> list = null;
        // 글 목록 개수를 5개 보일 때
        if(viewRows == 5) {
            list = dao.selectPageRow((currentPage * 5 - 4), (currentPage * 5));
        }
        // 글 목록 개수를 10개 보일 때
        else if(viewRows == 10) {
            list = dao.selectPageRow((currentPage * 10 - 9), (currentPage * 10));
        }

        // 정한 글 목록 수(viewRows)보다 작을 경우 차이 만큼 수를 늘려 출력
        if(list.size() != viewRows) {
            list.clear();
            int num = viewRows - list.size();

            if(viewRows == 5) {
                list = dao.selectPageRow((currentPage * 5 - 4), (currentPage * 5) + num);
            }
            // 글 목록 개수를 10개 보일 때
            else if(viewRows == 10) {
                list = dao.selectPageRow((currentPage * 10 - 9), (currentPage * 10) + num);
            }
        }
        session.close();

        System.out.println("페이지 시작");
        for(Board b : list) {
            System.out.println(b.toString());
        }
        System.out.println("페이지 끝");

        return list;
    }
}
