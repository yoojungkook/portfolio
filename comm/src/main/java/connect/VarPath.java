package connect;

import java.io.File;

/**
 * 많은 경로 관련 자료가 담긴 클래스
 */
public class VarPath {
    private static final String path = "C:\\comm";
    public static String userPhotoPath(String userName) {
        return path + File.separator + userName;
    }
}
