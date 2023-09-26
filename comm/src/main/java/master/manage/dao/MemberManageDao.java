package master.manage.dao;

import member.Member;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import java.util.ArrayList;

@Mapper
public interface MemberManageDao {
    @Select("select * from member")
    ArrayList<Member> select();
}
