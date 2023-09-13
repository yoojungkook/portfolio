package board;

import lombok.*;

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
}
