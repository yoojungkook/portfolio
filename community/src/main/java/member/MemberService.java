package member;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import connect.Factory;

public class MemberService {
private SqlSessionFactory sqlSessionFactory;
	
	public MemberService() {
		sqlSessionFactory = Factory.getSqlSessionFactory();
	}
	
	public Member loginCheck(String id, String password) {
		SqlSession session = sqlSessionFactory.openSession();//session open
		MemberDao dao = (MemberDao)session.getMapper(MemberDao.class);//session을 통해 맵퍼 객체 획득
		Member user = dao.select(id, password);
		session.close();
		
		return user;
	}
}
