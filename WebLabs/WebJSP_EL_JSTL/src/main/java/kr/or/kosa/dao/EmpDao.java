package kr.or.kosa.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import kr.or.kosa.dto.Emp;
import kr.or.kosa.Utils.SingletonHelper;

public class EmpDao {
	//1. 전체조회 >> select 결과 >> return multi row
		//select empno, ename, job, mgr, hiredate, sal ,comm ,deptno from emp
		public List<Emp> getEmpAllList() {
			List<Emp> emplist = new ArrayList<Emp>();
			Connection conn = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			try {
				conn = SingletonHelper.getConnection("oracle");
				String sql = "select empno, ename, job, mgr, hiredate, sal ,comm ,deptno from emp";
				pstmt = conn.prepareStatement(sql);
				rs = pstmt.executeQuery();
				
				while(rs.next()) {
					Emp emp = new Emp();	//하나의 row를 담을 수 있는 DTO 객체 생성
					emp.setEmpno(rs.getInt("empno"));
					emp.setEname(rs.getString("ename"));
					emp.setJob(rs.getString("job"));
					emp.setMgr(rs.getInt("mgr"));
					emp.setHiredate(rs.getDate("hiredate"));
					emp.setSal(rs.getInt("sal"));
					emp.setComm(rs.getInt("comm"));
					emp.setDeptno(rs.getInt("deptno"));
					emplist.add(emp); //ArrayList에 객체 담기
				}
			} catch (Exception e) {
				System.out.println(e.getMessage());
			} finally {
				SingletonHelper.close(rs);
				SingletonHelper.close(pstmt);
			}
			return emplist;
		}
		
		//2.조건조회 >> select 결과(where deptno=?) >> return single row (Dept 객체 한개)
		//select empno, ename, job, mgr, hiredate, sal ,comm ,deptno from emp where empno=?
		public Emp getEmpListByEmpno(int empno) {
			Emp emp = new Emp();
			Connection conn = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			try {
				conn = SingletonHelper.getConnection("oracle");
				String sql = "select empno, ename, job, mgr, hiredate, sal ,comm ,deptno from emp where empno=?";
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1,empno);
				rs = pstmt.executeQuery();
				if(rs.next()) {	//1건 또는 1건 이상의 데이터가 있는 경우
					emp.setEmpno(rs.getInt("empno"));
					emp.setEname(rs.getString("ename"));
					emp.setJob(rs.getString("job"));
					emp.setMgr(rs.getInt("mgr"));
					emp.setHiredate(rs.getDate("hiredate"));
					emp.setSal(rs.getInt("sal"));
					emp.setComm(rs.getInt("comm"));
					emp.setDeptno(rs.getInt("deptno"));
				}else {	//데이터가 없는 경우
					System.out.println("조회된 데이터가 없습니다.");
				}
			} catch (Exception e) {
				System.out.println(e.getMessage());
			} finally {
				SingletonHelper.close(rs);
				SingletonHelper.close(pstmt);
			}
			return emp;
		}
		
		//3.데이터 삽입(insert) >> parameter(Emp 객체) >> return 정수
		//insert into emp(empno,ename,job,mgr,hiredate,sal,comm,deptno) values(?,?,?,?,?,?,?,?)
		public int insertDept(Emp emp) {
			int row = 0;
			Connection conn = null;
			PreparedStatement pstmt = null;
			try {
				conn = SingletonHelper.getConnection("oracle");
				String sql = "insert into emp(empno,ename,job,mgr,hiredate,sal,comm,deptno) values(?,?,?,?,?,?,?,?)";
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1,emp.getEmpno());
				pstmt.setString(2,emp.getEname());
				pstmt.setString(3,emp.getJob());
				pstmt.setInt(4,emp.getMgr());
				pstmt.setDate(5,emp.getHiredate());
				pstmt.setInt(6,emp.getSal());
				pstmt.setInt(7,emp.getComm());
				pstmt.setInt(8,emp.getDeptno());
				row = pstmt.executeUpdate();
			} catch (Exception e) {
				System.out.println(e.getMessage());
			} finally {
				SingletonHelper.close(pstmt);
			}
			return row;
		}
		
		//4.데이터 수정(update) >> parameter(Emp 객체) >> return 정수
		//update emp set ename=? , job=? , sal=? , hiredate=? where empno=?
		public int updateEmp(Emp emp) {
			int row = 0;
			Connection conn = null;
			PreparedStatement pstmt = null;
			try {
				conn = SingletonHelper.getConnection("oracle");
				String sql = "update emp set ename=? , job=? , sal=? , hiredate=? where empno=?";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1,emp.getEname());
				pstmt.setString(2,emp.getJob());
				pstmt.setInt(3,emp.getSal());
				pstmt.setDate(4,emp.getHiredate());
				pstmt.setInt(5, emp.getEmpno());
				row = pstmt.executeUpdate();
			} catch (Exception e) {
				System.out.println(e.getMessage());
			} finally {
				SingletonHelper.close(pstmt);
			}
			return row;
		}
		
		//5.데이터 삭제(delete) >> parameter(Emp 객체) >> return 정수
		//delete from emp where empno=?
		public int deleteEmp(int empno) {
			int row = 0;
			Connection conn = null;
			PreparedStatement pstmt = null;
			try {
				conn = SingletonHelper.getConnection("oracle");
				String sql = "delete from emp where empno=?";
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1,empno);
				row = pstmt.executeUpdate();
			} catch (Exception e) {
				System.out.println(e.getMessage());
			} finally {
				SingletonHelper.close(pstmt);
			}
			return row;
		}
		
		//이름 검색
		public List<Emp> getEmpSearchByEname(String ename) {
			List<Emp> emplist = new ArrayList<Emp>();
			Connection conn = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			try {
				conn = SingletonHelper.getConnection("oracle");
				String sql = "select empno, ename, job, mgr, hiredate, sal ,comm ,deptno from emp where ename like ?";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, "%"+ename+"%");
				rs = pstmt.executeQuery();
				
				while(rs.next()) {
					Emp emp = new Emp();	//하나의 row를 담을 수 있는 DTO 객체 생성
					emp.setEmpno(rs.getInt("empno"));
					emp.setEname(rs.getString("ename"));
					emp.setJob(rs.getString("job"));
					emp.setMgr(rs.getInt("mgr"));
					emp.setHiredate(rs.getDate("hiredate"));
					emp.setSal(rs.getInt("sal"));
					emp.setComm(rs.getInt("comm"));
					emp.setDeptno(rs.getInt("deptno"));
					emplist.add(emp); //ArrayList에 객체 담기
				}
			} catch (Exception e) {
				System.out.println(e.getMessage());
			} finally {
				SingletonHelper.close(rs);
				SingletonHelper.close(pstmt);
			}
			return emplist;
		}
}
