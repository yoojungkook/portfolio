package board;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import java.util.ArrayList;

@Mapper
public interface BoardDao {
    @Select("select no, id, title, content from board")
    ArrayList<Board> selectAll();
}
