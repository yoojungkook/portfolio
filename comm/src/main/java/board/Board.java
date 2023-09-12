package board;

import lombok.*;

import java.sql.Date;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@ToString
public class Board {
    private int no;
    private String id;
    private String password;
    private String title;
    private String content;
    private Date wdate;
    private int views;
}
