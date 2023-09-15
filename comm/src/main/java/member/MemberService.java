package member;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import connect.Factory;

public class MemberService {
	private SqlSessionFactory sqlSessionFactory;
	private SqlSession session;
	private MemberDao dao;
	
	public MemberService() {
		sqlSessionFactory = Factory.getSqlSessionFactory();
	}
	
	public Member loginCheck(String id, String password) {
		session = sqlSessionFactory.openSession();//session open
		dao = session.getMapper(MemberDao.class);//session을 통해 맵퍼 객체 획득
		Member user = dao.selectCheck(id, password);
		session.close();
		
		return user;
	}

	public Member idCheck(String id) {
		session = sqlSessionFactory.openSession();//session open
		dao = session.getMapper(MemberDao.class);
		Member user = dao.select(id);
		session.close();

		return user;
	}

	public void addMember(Member m) {
		session = sqlSessionFactory.openSession();
		dao =  session.getMapper(MemberDao.class);
		dao.insert(m);

		session.commit();
		session.close();
	}
}
