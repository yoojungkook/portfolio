package region;

import connect.Factory;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import java.util.ArrayList;

public class SeoulRegionService {
    private SqlSessionFactory sqlSessionFactory;
    private SqlSession session;
    private SeoulRegionDao dao;

    public SeoulRegionService() {
        super();
        sqlSessionFactory = Factory.getSqlSessionFactory();
    }

    public ArrayList<SeoulRegion> getSeoulAutonomyList() {
        session = sqlSessionFactory.openSession();
        dao = session.getMapper(SeoulRegionDao.class);
        ArrayList<SeoulRegion> list = dao.select();
        session.close();

        return list;
    }
}
