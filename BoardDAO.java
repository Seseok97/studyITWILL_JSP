package com.itwillbs.board;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class BoardDAO {
	// DAO (Data Access Object) // >> DB 데이터 처리 객체
	// >> Access : 접근 / 처리
	// 퍼시스턴스 (연속성) 개념은 조금 더 상위개념 !! 나중에 알게될거임 ~
	
	// DAO가 하는 일 >> DB에 관한 모든 동작 수행 !!
	
	//공통사용 변수(전역변수)
	private Connection con = null;
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;
	private String sql = "";
	
	// getCon() > DB연결에 관한 모든 처리 수행
	private Connection getCon() throws Exception  {
		//DB연결
		//1. 드라이버 로드
//		final String DRIVER = "com.mysql.cj.jdbc.Driver";
//		final String DBURL = "jdbc:mysql://localhost:3306/jspdb";
//		final String DBID = "root";
//		final String DBPW = "1234";
//		Class.forName(DRIVER);
//		System.out.println("드라이버 로드 성공!");
//		//2. 디비연결
//		Connection con =
//			DriverManager.getConnection(DBURL, DBID, DBPW);
//		System.out.println("DB연결 성공!");
//		System.out.println(con);
		
		// 이 방식은 에러가 발생한다.
		
		// 커넥션 풀 사용
		//  0 - 디비 연결정보(context.xml)
		//  1 - 드라이버로드, 2 - 디비연결
		Context initCTX = new InitialContext();
		DataSource ds // 연결정보 저장
			= (DataSource)initCTX.lookup("java:comp/env/jdbc/mysqlDB"); // META-INF 파일 사용 코드
		con = ds.getConnection();
		
		System.out.println("DAO: DB 연결 성공 (CP)");
		System.out.println("DAO: "+ con);
		
		return con;
	}//getCon() method end
	
	// DB 자원해제 메서드
	public void closeDB() {
		try {
			if(rs != null)		rs.close();
			if(pstmt != null)   pstmt.close();
			if(con != null) 	con.close();
			// finally절에 실행될것이기때문에, if문을 통한 제어가 필요하다 !
		} catch (SQLException e) {
			e.printStackTrace();
		}// try-catch end
		
	}// closeDB method() end
	
	public void insertBoard(BoardDTO dto) throws Exception {
		// 글쓰기 동작 수행
		con = getCon();
		
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
		
		closeDB();

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
		
		closeDB();
		
		return boardList;
	}//getBoardListAll() method end
	
	// 커넥션풀 사용
	public ArrayList getBoardList(int startRow, int pageSize)  {
			
			// ArrayList 만들기
			ArrayList boardList = new ArrayList();
			
			// 정보 가져오기 동작 수행
			
			// 1,2 디비연결 (커넥션풀)
			try {
				con = getCon();
				String sql = "select * from itwill_board"
						+ " order by re_ref desc, re_seq asc limit ?,?";
//						+ " where bno > 0"
//						+ " order by bno desc";
				
				pstmt = con.prepareStatement(sql);
				
				pstmt.setInt(1, startRow -1); // 시작 위치
				pstmt.setInt(2, pageSize); // 글의 개수
				
				rs = pstmt.executeQuery();
				
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
				
			} catch (Exception e) {
				e.printStackTrace();
			}finally {
				// 예외여부와 상관없이 실행되는 구문 작성
				// >> 자원 해제 (DB 연결 정보 해제 - 사용한 객체의 역순 종료)
//				try {
//					rs.close();
//					pstmt.close();
//					con.close();
//				} catch (SQLException e) {
//					e.printStackTrace();
//				}
				closeDB();
				
			}// finally end
			
			return boardList;
		}//getBoardList() method end
	
	public int getBoardCount() {
		int result = 0;
		// 1,2 디비 연결
		try {
			con = getCon();
			// 3 SQL쿼리 작성, pstmt
			sql = "select count(*) from itwill_board";
			pstmt = con.prepareStatement(sql);
			// 4 sql 실행
			rs = pstmt.executeQuery();
			// 5 데이터 처리
			if(rs.next()) {
				result = rs.getInt(1);
			}
			System.out.println("DAO: 전체 글 개수 = "+ result);
			pstmt.close();
			con.close();
			rs.close();
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			closeDB();
		} // finally end

		return result;
	}//getBoardCount() method end
	
	//getBoard()
	public BoardDTO getBoard(int bno) {
		BoardDTO dto=null; // 로컬변수로 선언되지 않도록 주의.
						   // 왜 인스턴스 생성을 하지 않고 변수 저장만 해두나 ?
						    //  >> 메모리 영역을 아끼기 위해서. > rs.next 가 true일때(데이터가 존재할때)만 !! 가져오면 메모리를 아낄수 있다 !!
							//  >>> 당장에는 차이가 거의 나지 않지만, 이런것들이 조금조금 쌓이면서 커진다 !! (메모리 누수)
		// 1,2 DB 연결
		try {
			con=getCon();
			// 3 sql query & pstmt
			sql="select * from itwill_board where bno =?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, bno);
			// 4 sql execute
			rs = pstmt.executeQuery();
			
			// 5 DATA 처리
			if(rs.next()) {
				//데이터 저장(rs >> dto)
				dto = new BoardDTO();
				dto.setBno(rs.getInt("bno"));
				dto.setContent(rs.getString("content"));
				dto.setDate(rs.getDate("date"));
				dto.setFile(rs.getString("file"));
				dto.setIp(rs.getString("ip"));
				dto.setName(rs.getString("name"));
				dto.setPass(rs.getString("pass"));
				dto.setRe_lev(rs.getInt("re_lev"));
				dto.setRe_ref(rs.getInt("re_ref"));
				dto.setRe_seq(rs.getInt("re_seq"));
				dto.setReadcount(rs.getInt("readcount"));
				dto.setSubject(rs.getString("subject"));
				//시간줄이는방법
				// 1. 인덱스넘버로 들고오기
				// 2. 지난번에 사용한 소스 복붙하기.
				System.out.println("DAO: "+bno+"번 글, 정보 저장 완료!");
			}// if end
		} catch (Exception e) {
			System.out.println("DAO: getBoard(int bno) Method Error!!");
			e.printStackTrace();
		}finally {
			closeDB();
		}// t-c-f end
		// >> 위 내용이 항상 DB와 관련된 작업의 시작임 !!(t-c-f)
		return dto;
	}//getBoard() method end
	
	// updateReadCount() method
	public void updateReadCount(int bno) {
		try {
			con=getCon();
			// 특정 글의 조회수를 1 증가시키자.
			sql = "update itwill_board set readcount=readcount+1"
					+ " where bno=?";
			pstmt = con.prepareStatement(sql);
			
			pstmt.setInt(1, bno);
			
			int cnt = pstmt.executeUpdate();
			if(cnt == 1) {
				// pstmt.executeUpdate() 메서드의 리턴값은 몇 줄이 영향을 받았는지를 int로 리턴한다 !!!
				// cnt가 1이 아니라는것은 0이거나 1 초과 >> 정상적인 작동이 아님!!
				System.out.println("DAO: updateReadCount() 정상작동, 글 조회수 1 증가.");
			}
			
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("DAO: updateReadCount() ERROR!!");
		} finally {
			closeDB();
		}// t-c-f end
		
	}//updateReadCount() method end

}// DAO class end










































