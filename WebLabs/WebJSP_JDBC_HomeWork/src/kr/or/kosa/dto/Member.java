package kr.or.kosa.dto;

import lombok.Data;

/*
CREATE TABLE koreaMember
(
    id VARCHAR2(50) PRIMARY KEY ,
    pwd VARCHAR2(50) NOT NULL,
    NAME VARCHAR2(50) NOT NULL,
    age NUMBER ,
    gender CHAR(4),
    email VARCHAR2(50),
    ip   VARCHAR2(50)
)
*/

@Data
public class Member {
	
	private String id;
	private String pwd;
	private String name;
	private int age;
	private String gender;
	private String email;
	private String ip;
}
