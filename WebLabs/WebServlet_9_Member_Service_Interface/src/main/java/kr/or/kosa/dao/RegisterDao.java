package kr.or.kosa.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;

import kr.or.kosa.dto.RegisterDto;
import kr.or.kosa.utils.ConnectionHelper;

/*
1. DB작업은 DBCP 사용
2. insert
2.1 insert into mvcregister(id,pwd,email) values(?,?,?)
*/
public class RegisterDao {
	public int writeOk(RegisterDto dto) {
		Connection conn = null;	//연결 객체 생성
		PreparedStatement pstmt = null;	//sql문 미리 shared pool에 올리기 및 이미 올라간거 가져오기
		int result = 0;	//반환 변수 생성
		try {
			conn = ConnectionHelper.getConnection("oracle");	//DBCP를 이용한 DB 연결
			String sql = "insert into mvcregister(id,pwd,email) values(?,?,?)";
			pstmt = conn.prepareStatement(sql);	//sql문 미리 등록
			
			pstmt.setInt(1, dto.getId());	//인자값 설정
			pstmt.setString(2, dto.getPwd());
			pstmt.setString(3, dto.getEmail());
			
			result = pstmt.executeUpdate();	//실행 및 빤환값 생성
			System.out.println("회원가입 완료");
		} catch (Exception e) {
			System.out.println(e.getMessage());
		} finally {
			ConnectionHelper.close(pstmt);
			//연결 반환
			ConnectionHelper.close(conn);
		}
		return result;
	}
}
