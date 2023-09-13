package member;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

@Mapper
public interface MemberDao {
	@Insert("insert into member values(seq_member_no.nextval, #{id}, #{password}," +
			"#{name}, #{email}, #{birth}, #{phone}, #{postcode}, #{roadAddress}," +
			"#{jibunAddress}, #{detailAddress}, #{extraAddress}, #{mDate}, #{photo}," +
			"sysdate, sysdate)")
	void insert(Member m);

	@Select("select * from member where id=#{id} and password=#{password}")
	Member select(@Param("id") String id, @Param("password") String password);

	@Select("select id from member where id = #{id}")
	Member select(@Param("id") String id);
}
