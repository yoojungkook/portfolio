package master.manage.service;

import connect.Factory;
import master.manage.dao.MemberManageDao;
import member.Member;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import java.util.ArrayList;

public class MemberManageService {
    private SqlSessionFactory factory;
    private SqlSession session;
    private MemberManageDao dao;

    public MemberManageService() {
        super();
        factory = Factory.getSqlSessionFactory();
    }

    public ArrayList<Member> getAllUser() {
        session = factory.openSession();
        dao = session.getMapper(MemberManageDao.class);
        ArrayList<Member> list = dao.select();

        session.close();

        return list;
    }
}
