package chap03;

/*
 * XXDao는 데이터 처리를 위한 클래스
 * DAO (Data Access Object)
 * 예) insert, select, update, delete....
 */
public class MemberDao {
	
	public MemberDao() {
		System.out.println("MemberDao 생성자");
	}

	// db에 회원 등록하는 메서드
	public int insert(String name) {
		// db에 저장
		System.out.println(name + " 저장!!!");
		return 1; // 성공시 1리턴
	}
}
