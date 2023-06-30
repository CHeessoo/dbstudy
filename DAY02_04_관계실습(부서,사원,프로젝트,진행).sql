
-- 삭제는 생성의 역순으로 진행
DROP TABLE PROCEEDING_TBL;
DROP TABLE PROJECT_TBL;
DROP TABLE EMPLOYEE_TBL;
DROP TABLE DEPARTMENT_TBL;



--1번 '부서 테이블' 만들기 실습 (+제약조건 바꿔주기)
CREATE TABLE DEPARTMENT_TBL (
    DEPT_NO       VARCHAR2(15 BYTE) NOT NULL                --부서번호
  , DEPT_NAME     VARCHAR2(30 BYTE) NULL                    --부서명
  , DEPT_LOCATION VARCHAR2(50 BYTE) NULL                    --부서위치
  
  , CONSTRAINT PK_DEP PRIMARY KEY(DEPT_NO)                  --제약조건의 이름은 PK_DEP, DEPT_NO에 PRIMARY KEY 지정
);



--2번 '사원 테이블' 만들기 실습(+제약조건 바꿔주기)
CREATE TABLE EMPLOYEE_TBL (
    EMP_NO    NUMBER            NOT NULL                              --사원번호
  , DEPT_NO   VARCHAR2(15 BYTE) NULL                                  --부서번호
  , POSITION  CHAR(10 BYTE)     NULL                                  --직급  
  , NAME      VARCHAR2(15 BYTE) NULL                                  --이름
  , HIRE_DATE DATE              NULL                                  --입사일자
  , SALARY    NUMBER            NULL                                  --연봉
  
  , CONSTRAINT PK_EMP PRIMARY KEY(EMP_NO)
  , CONSTRAINT FK_DEP_EMP FOREIGN KEY(DEPT_NO) REFERENCES DEPARTMENT_TBL(DEPT_NO) ON DELETE SET NULL  --부서가 삭제되면 사원들의 해당 부서 정보만 NULL처리한다.
);



--3번 '프로젝트 테이블' 만들기 실습(+제약조건 바꿔주기)
CREATE TABLE PROJECT_TBL (
    PJT_NO     NUMBER            NOT NULL              --프로젝트 번호
  , PJT_NAME   VARCHAR2(30 BYTE) NULL                  --프로젝트명
  , BEGIN_DATE DATE              NULL                  --시작일자
  , END_DATE   DATE              NULL                  --종료일자
  
  , CONSTRAINT PK_PJT PRIMARY KEY(PJT_NO)
);


--4번 '프로젝트진행 테이블' 만들기 실습(+제약조건 바꿔주기)
CREATE TABLE PROCEEDING_TBL (
    PCD_NO    NUMBER NOT NULL                          --진행번호
  , EMP_NO    NUMBER NOT NULL                          --사원번호                    --NOT NULL 추가 (ON DELETE 시 SET NULL 불가)
  , PJT_NO    NUMBER NOT NULL                          --프로젝트 번호               --NOT NULL 추가 (ON DELETE 시 SET NULL 불가)
  , PJT_STATE NUMBER NOT NULL                          --프로젝트 진행상태
  
  , CONSTRAINT PK_PCD PRIMARY KEY(PCD_NO)
  , CONSTRAINT FK_EMP_PCD FOREIGN KEY(EMP_NO)  REFERENCES EMPLOYEE_TBL(EMP_NO) ON DELETE CASCADE  --사원이 삭제되면 프로젝트진행 명단에서 함께 삭제된다.
  , CONSTRAINT FK_PJT_PCD FOREIGN KEY(PJT_NO) REFERENCES PROJECT_TBL(PJT_NO)   ON DELETE CASCADE  -- 프로젝트가 삭제되면 프로젝트진행 명단에서 함께 삭제된다
);

