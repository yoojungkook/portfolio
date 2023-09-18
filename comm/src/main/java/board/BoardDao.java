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

    @Select("select * from (select rownum r, no, content, title, id, wdate, views  from board) where r between #{min} and #{max}")
    ArrayList<Board> selectPageRow(@Param("min") int min, @Param("max") int max);
}
