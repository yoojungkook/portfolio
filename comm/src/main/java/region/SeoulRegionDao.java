package region;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import java.util.ArrayList;

@Mapper
public interface SeoulRegionDao {
    @Select("SELECT R.NO no, R.NAME name, S.NO autonomyNo, S.NAME autonomyName FROM REGION R, SEOUL_AUTONOMY S WHERE R.NO = S.REGIONNO ORDER BY S.NO")
    ArrayList<SeoulRegion> select();
}
