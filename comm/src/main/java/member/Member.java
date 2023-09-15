package member;

import lombok.*;

import java.sql.Date;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@ToString
public class Member {
	private int no;
	private String id;
	private String password;
	private String name;
	private String email;
	private Date birth;
	private String phone;
	private String autonomy;
	private Date mDate;
	private String photo;
	private Date lastLog;
	private Date logout;
}
