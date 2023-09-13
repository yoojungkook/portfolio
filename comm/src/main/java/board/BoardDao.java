package board;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import java.util.ArrayList;

@Mapper
public interface BoardDao {
    @Select("select * from board")
    ArrayList<Board> selectAll();

    @Select("select * from board where no = #{no}")
    Board selectBoard(@Param("no") int no);
}
