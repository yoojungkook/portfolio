package member;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

@Mapper
public interface MemberDao {
	@Select("select * from member where id=#{id} and password=#{password}")
	Member select(@Param("id") String id, @Param("password") String password);
}
