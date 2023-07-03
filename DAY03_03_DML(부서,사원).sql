DROP TABLE EMPLOYEE_T;
DROP TABLE DEPARTMENT_T;

-- 부서(DEPARTMENT_T) 테이블
CREATE TABLE DEPARTMENT_T (
    DEPT_NO   NUMBER            NULL
  , DEPT_NAME VARCHAR2(15 BYTE) NOT NULL
  , LOCATION  VARCHAR2(15 BYTE) NOT NULL
  , CONSTRAINT PK_DEPART PRIMARY KEY(DEPT_NO)
);


-- 사원(EMPLOYEE_T) 테이블
CREATE TABLE EMPLOYEE_T (
    EMP_NO    NUMBER            NULL 
  , NAME      VARCHAR2(20 BYTE) NOT NULL
  , DEPART    NUMBER            NULL 
  , POSITION  VARCHAR2(20 BYTE) NULL
  , GENDER    CHAR(2 BYTE)      NULL
  , HIRE_DATE DATE              NULL
  , SALARY    NUMBER            NULL
  , CONSTRAINT PK_EMPLOYEE   PRIMARY KEY(EMP_NO)
  , CONSTRAINT FK_DEPART_EMP FOREIGN KEY(DEPART) REFERENCES DEPARTMENT_T(DEPT_NO) ON DELETE SET NULL
);


--부서 시퀀스, 인서트 생성
DROP SEQUENCE DEPT_SEQ;
CREATE SEQUENCE DEPT_SEQ ORDER;

INSERT INTO DEPARTMENT_T(DEPT_NO, DEPT_NAME, LOCATION) VALUES(DEPT_SEQ.NEXTVAL, '영업부', '대구');
INSERT INTO DEPARTMENT_T(DEPT_NO, DEPT_NAME, LOCATION) VALUES(DEPT_SEQ.NEXTVAL, '인사부', '서울');
INSERT INTO DEPARTMENT_T(DEPT_NO, DEPT_NAME, LOCATION) VALUES(DEPT_SEQ.NEXTVAL, '총무부', '대구');
INSERT INTO DEPARTMENT_T(DEPT_NO, DEPT_NAME, LOCATION) VALUES(DEPT_SEQ.NEXTVAL, '기획부', '서울');


--사원 시퀀스, 인서트 생성
DROP SEQUENCE EMP_SEQ;
CREATE SEQUENCE EMP_SEQ 
    START WITH   1001
    ORDER;

INSERT INTO EMPLOYEE_T(EMP_NO, NAME, DEPART, POSITION, GENDER, HIRE_DATE, SALARY) VALUES(EMP_SEQ.NEXTVAL, '구창민', 1, '과장', 'M', '95-05-01', '5000000');  -- 날짜는 하이픈(-) 또는 슬래시(/)로 구분
INSERT INTO EMPLOYEE_T(EMP_NO, NAME, DEPART, POSITION, GENDER, HIRE_DATE, SALARY) VALUES(EMP_SEQ.NEXTVAL, '김민서', 1, '사원', 'M', '17-09-01', '2500000');  -- 날짜는 하이픈(-) 또는 슬래시(/)로 구분
INSERT INTO EMPLOYEE_T(EMP_NO, NAME, DEPART, POSITION, GENDER, HIRE_DATE, SALARY) VALUES(EMP_SEQ.NEXTVAL, '이은영', 2, '부장', 'F', '90/09/01', '5500000');  -- 날짜는 하이픈(-) 또는 슬래시(/)로 구분
INSERT INTO EMPLOYEE_T(EMP_NO, NAME, DEPART, POSITION, GENDER, HIRE_DATE, SALARY) VALUES(EMP_SEQ.NEXTVAL, '한성일', 2, '과장', 'M', '93/04/01', '5000000');  -- 날짜는 하이픈(-) 또는 슬래시(/)로 구분

commit;

ROLLBACK;