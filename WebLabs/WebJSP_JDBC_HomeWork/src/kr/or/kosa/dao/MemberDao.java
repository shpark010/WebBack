package kr.or.kosa.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import kr.or.kosa.dto.Member;
import kr.or.kosa.utils.ConnectionHelper;

public class MemberDao {

	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;

	// 회원가입
	public int insertMember(Member m) {
		int resultrow = 0;
		String sql = "insert into koreamember(id,pwd,name,age,gender,email,ip) values(?,?,?,?,?,?,?)";
		// POOL
		try {
			// POOL
			conn = ConnectionHelper.getConnection("oracle");

			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, m.getId());
			pstmt.setString(2, m.getPwd());
			pstmt.setString(3, m.getName());
			pstmt.setInt(4, m.getAge());
			pstmt.setString(5, m.getGender());
			pstmt.setString(6, m.getEmail());
			pstmt.setString(7, m.getIp());

			resultrow = pstmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			ConnectionHelper.close(pstmt);
			ConnectionHelper.close(conn); // 반환하기
		}

		return resultrow;
	}

	// 로그인
	public Member login(String id, String pwd) {
		Member m = new Member();
		String sql = "select id, pwd from koreamember where id=?";
		try {
			conn = ConnectionHelper.getConnection("oracle");
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				m.setId(rs.getString("id"));
				m.setPwd(rs.getString("pwd"));
				m.setName(rs.getString("name"));
				m.setAge(rs.getInt("age"));
				m.setGender(rs.getString("gender"));
				m.setEmail(rs.getString("email"));
				m.setIp(rs.getString("ip"));
			}
		} catch (Exception e) {
			System.out.println(e.getMessage());
		} finally {
			ConnectionHelper.close(rs);
			ConnectionHelper.close(pstmt);
			ConnectionHelper.close(conn);
		}
		return m;
	}

	// 전체조회
	public List<Member> getMemberList() {
		List<Member> memberlist = new ArrayList<Member>();
		String sql = "select id, ip from koreamember";
		try {
			conn = ConnectionHelper.getConnection("oracle");
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				Member m = new Member();
				m.setId(rs.getString("id"));
				m.setIp(rs.getString("ip"));
				memberlist.add(m);
			}
		} catch (Exception e) {
			System.out.println(e.getMessage());
		} finally {
			ConnectionHelper.close(rs);
			ConnectionHelper.close(pstmt);
			ConnectionHelper.close(conn);
		}
		return memberlist;
	}

	// 아이디로 검색
	public Member SearchById(String id) {
		Member m = new Member();
		String sql = "select id, pwd, name, age, gender, email, ip from koreamember where id=?";
		try {
			conn = ConnectionHelper.getConnection("oracle");
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				m.setId(rs.getString("id"));
				m.setPwd(rs.getString("pwd"));
				m.setName(rs.getString("name"));
				m.setAge(rs.getInt("age"));
				m.setGender(rs.getString("gender"));
				m.setEmail(rs.getString("email"));
				m.setIp(rs.getString("ip"));
			}
		} catch (Exception e) {
			System.out.println(e.getMessage());
		} finally {
			ConnectionHelper.close(rs);
			ConnectionHelper.close(pstmt);
			ConnectionHelper.close(conn);
		}
		return m;
	}
	
	//이름으로 검색
	public List<Member> searchByName(String name) {
		List<Member> memberlist = new ArrayList<Member>();
		String sql = "select id, name, email from koreamember where name like ?";
		try {
			conn = ConnectionHelper.getConnection("oracle");
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, "%" + name + "%");
			rs = pstmt.executeQuery();
			while (rs.next()) {
				Member m = new Member();
				m.setId(rs.getString("id"));
				System.out.println("asdfasd" + rs.getString("id"));
				m.setName(rs.getString("name"));
				m.setEmail(rs.getString("email"));
				memberlist.add(m);
			}
		} catch (Exception e) {
			System.out.println(e.getMessage());
		} finally {
			ConnectionHelper.close(rs);
			ConnectionHelper.close(pstmt);
			ConnectionHelper.close(conn);
		}
		return memberlist;
	}

	// 수정
	public int updateMember(Member m) {
		int resultrow = 0;
		String sql = "update koreamember set id=?, name=?, age=?, gender=?, email=? where id=?";
		try {
			conn = ConnectionHelper.getConnection("oracle");
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, m.getId());
			pstmt.setString(2, m.getName());
			pstmt.setInt(3, m.getAge());
			pstmt.setString(4, m.getGender());
			pstmt.setString(5, m.getEmail());
			pstmt.setString(6, m.getId());
			resultrow = pstmt.executeUpdate();
		} catch (Exception e) {
			System.out.println(e.getMessage());
		} finally {
			ConnectionHelper.close(pstmt);
			ConnectionHelper.close(conn);
		}
		return resultrow;
	}

	// 삭제
	public int deleteMember(String id) {
		int resultrow = 0;
		String sql = "delete from koreamember where id=?";
		try {
			conn = ConnectionHelper.getConnection("oracle");
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			System.out.println(id);
			resultrow = pstmt.executeUpdate();
		} catch (Exception e) {
			System.out.println(e.getMessage());
		} finally {
			ConnectionHelper.close(pstmt);
			ConnectionHelper.close(conn);
		}
		return resultrow;
	}

}
