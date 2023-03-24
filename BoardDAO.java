package com.itwillbs.board;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class BoardDAO {
	// DAO (Data Access Object) // >> DB 데이터 처리 객체
	// >> Access : 접근 / 처리
	// 퍼시스턴스 (연속성) 개념은 조금 더 상위개념 !! 나중에 알게될거임 ~
	
	// DAO가 하는 일 >> DB에 관한 모든 동작 수행 !!
	
	public void insertBoard(BoardDTO dto) throws Exception {
		// 글쓰기 동작 수행
		//DB연결
		//1. 드라이버 로드
		final String DRIVER = "com.mysql.cj.jdbc.Driver";
		final String DBURL = "jdbc:mysql://localhost:3306/jspdb";
		final String DBID = "root";
		final String DBPW = "1234";
		Class.forName(DRIVER);
		System.out.println("드라이버 로드 성공!");
		//2. 디비연결
		Connection con =
			DriverManager.getConnection(DBURL, DBID, DBPW);
		System.out.println("DB연결 성공!");
		System.out.println(con);
		//3. sql(insert) 작성 & pstmt 객체
		String sql = "select MAX(bno) from itwill_board";
		
		//4. 쿼리 실행
		PreparedStatement pstmt = con.prepareStatement(sql);
		
		ResultSet rs = pstmt.executeQuery();
		//5. 데이터 처리(글번호 최대값 +1)
		int bno = 0;
		if(rs.next()){
//	 		bno = rs.getInt("MAX(bno)")+1 // 연산된 DB값을 가져오는 것 !!
			bno = rs.getInt(1) +1; // 번거롭기때문에 인덱스넘버로 적는거다!
			System.out.println("if");
		}
//	 	else{
//	 		bno = 1;
//	 		System.out.println("else");
//	 	}
		// getInt()에 Null값이 반환된 경우 0을 출력하기 때문에, else문은 없어도 상관없다 !!
		// 내장함수 호출시에는 칼럼명 보다는 인덱스넘버 접근이 유리하다.(성능차이!)
		// 내장함수를 사용한 값은 항상 true를 반환한다 !!!
		System.out.println("bno: "+ bno);
		
		// 정보 저장 (글쓰기)
		// 3단계부터 시작!
		// 3. sql 쿼리 작성 + pstmt
		sql = 
		"insert into itwill_board (bno,name,pass,subject,content,readcount,re_ref,re_lev,re_seq,date,ip,file) values (?,?,?,?,?,?,?,?,?,now(),?,?)";
		pstmt = con.prepareStatement(sql);
		
		pstmt.setInt(1, bno);
		pstmt.setString(2,dto.getName());
		pstmt.setString(3,dto.getPass());
		pstmt.setString(4,dto.getSubject());
		pstmt.setString(5,dto.getContent());
		
		pstmt.setInt(6,0); // 모든 글의 조회수는 0 초기화
		pstmt.setInt(7,bno);	//re_ref 그룹번호, 일반글번호 == 그룹번호
		pstmt.setInt(8,0);		//re_lev 레벨값  , 일반글 0
		pstmt.setInt(9,0);		//re_seq 순서값(시퀀스), 일반글 0
		// 10번째는 date가 들어갔기때문에, 10번째 물음표는 IP 주소가 들어가야 한다.
		pstmt.setString(10,dto.getIp());
		pstmt.setString(11,dto.getFile());
		// 4. 쿼리 실행
		pstmt.executeUpdate(); // Insert
		
		System.out.println("글쓰기 완료 !");
	}// insertBoard() method end
	
	/**
	 * 디비에 저장된 모든 게시판 정보를 조회.
	 * @return ArrayList 형태로 리턴
	 */
	
	public ArrayList getBoardListAll() throws Exception {
		
		// ArrayList 만들기
		ArrayList boardList = new ArrayList();
		
		// 정보 가져오기 동작 수행
		final String DRIVER = "com.mysql.cj.jdbc.Driver";
		final String DBURL = "jdbc:mysql://localhost:3306/jspdb";
		final String DBID = "root";
		final String DBPW = "1234";
		Class.forName(DRIVER);
		System.out.println("드라이버 로드 성공!");
		Connection con =
			DriverManager.getConnection(DBURL, DBID, DBPW);
		System.out.println("DB연결 성공!");
		System.out.println(con);
		String sql = "select * from itwill_board"
				+ " where bno > 0"
				+ " order by bno desc";
		PreparedStatement pstmt = con.prepareStatement(sql);
		ResultSet rs = pstmt.executeQuery();
		
		// 데이터를 DB >> DTO로 옮기기 !
		// DTO에 여러개의 데이터가 저장될 것이기 때문에 !! >> ArrayList 사용.
		// 1 row > 1 DTO > 1 ArrayList
		
		
		while(rs.next()) { // 데이터가 있을때 (=EOF에 도달하지 않는다면,)
			// rs(1 row) > dto (1 dto)
			BoardDTO dto = new BoardDTO();
			dto.setBno(rs.getInt("bno"));
			dto.setContent(rs.getString("content"));
			dto.setDate(rs.getDate("date"));
			dto.setFile(rs.getString("File"));
			dto.setIp(rs.getString("ip"));
			dto.setName(rs.getString("name")); // 6
			dto.setPass(rs.getString("pass"));
			dto.setRe_lev(rs.getInt("re_lev"));
			dto.setRe_ref(rs.getInt("re_ref"));
			dto.setRe_seq(rs.getInt("re_seq"));
			dto.setReadcount(rs.getInt("readcount"));
			dto.setSubject(rs.getString("subject"));
			
			// 1 dto > 1 ArrayList
			boardList.add(dto);
			
		}// while
		System.out.println("DAO: 게시판 글 정보 모두 저장 완료!");
		
		return boardList;
	}//getBoardListAll() method end
	
	



}// DAO class end










































