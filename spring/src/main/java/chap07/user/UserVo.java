package chap07.user;

import java.sql.Timestamp;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;
@Getter
@Setter
@ToString
public class UserVo {
	
	private int userno;
	private String id;
	private String pwd;
	private String name;
	private Timestamp regdate;
	private String checkId; // 아이디 저장
	
	private String[] school;
	private String[] year;
	
	
}
