DROP TABLE STUDENT_T;
DROP TABLE PROFESSOR_T;
DROP TABLE DEPARTMENT_T;

CREATE TABLE DEPARTMENT_T (
    DEPT_NO   NUMBER(4)         NOT NULL
  , DEPT_NAME VARCHAR2(30 BYTE) NULL
  , DEPT_LOC  VARCHAR2(10 BYTE) NULL
  , CONSTRAINT PK_DEPT PRIMARY KEY(DEPT_NO)
);

CREATE TABLE PROFESSOR_T (
    PROF_NO    NUMBER(4)         NOT NULL
  , PROF_NAME  VARCHAR2(10 BYTE) NULL 
  , PROF_POS   VARCHAR2(20 BYTE) NULL
  , PROF_SAL   NUMBER(10)        NULL
  , PROF_HIRED DATE              NULL
  , PROF_COMM  NUMBER(2)         NULL
  , DEPT_NO    NUMBER(4)         NULL
  , CONSTRAINT PK_PROF PRIMARY KEY(PROF_NO)
  , CONSTRAINT FK_DEPT_PROF FOREIGN KEY(DEPT_NO) REFERENCES DEPARTMENT_T(DEPT_NO)
);

CREATE TABLE STUDENT_T (
    STUD_NO     NUMBER(5)         NOT NULL
  , STUD_NAME   VARCHAR2(20 BYTE) NULL
  , STUD_GRADE  VARCHAR2(1 BYTE)  NULL
  , STUD_BORN   DATE              NULL
  , STUD_TEL    VARCHAR2(13 BYTE) NULL
  , STUD_HEIGHT NUMBER(5,2)       NULL
  , STUD_WEIGHT NUMBER(5,2)       NULL
  , DEPT_NO     NUMBER(4)         NULL
  , CONSTRAINT PK_STUD PRIMARY KEY(STUD_NO)
  , CONSTRAINT FK_DEPT_STUD FOREIGN KEY(DEPT_NO) REFERENCES DEPARTMENT_T(DEPT_NO)
);

INSERT INTO DEPARTMENT_T(DEPT_NO, DEPT_NAME, DEPT_LOC) VALUES(100, '컴퓨터공학과', '1호관');
INSERT INTO DEPARTMENT_T(DEPT_NO, DEPT_NAME, DEPT_LOC) VALUES(200, '멀티미디어학과', '2호관');
INSERT INTO DEPARTMENT_T(DEPT_NO, DEPT_NAME, DEPT_LOC) VALUES(300, '전자공학과', '3호관');
INSERT INTO DEPARTMENT_T(DEPT_NO, DEPT_NAME, DEPT_LOC) VALUES(400, '기계공학과', '4호관');
INSERT INTO DEPARTMENT_T(DEPT_NO, DEPT_NAME, DEPT_LOC) VALUES(500, '정보미디어학과', '5호관');
INSERT INTO DEPARTMENT_T(DEPT_NO, DEPT_NAME, DEPT_LOC) VALUES(600, '메카트로닉스학과', '6호관');
INSERT INTO DEPARTMENT_T(DEPT_NO, DEPT_NAME, DEPT_LOC) VALUES(700, '빅데이터학과', '7호관');
INSERT INTO DEPARTMENT_T(DEPT_NO, DEPT_NAME, DEPT_LOC) VALUES(800, '응용소프트웨어학과', '8호관');
COMMIT;

INSERT INTO PROFESSOR_T(PROF_NO, PROF_NAME, PROF_POS, PROF_SAL, PROF_HIRED, PROF_COMM, DEPT_NO) VALUES(9901, '김도훈', '교수', 5000, TO_DATE('24-01-1982','DD-MM-YYYY'), 20, 100);
INSERT INTO PROFESSOR_T(PROF_NO, PROF_NAME, PROF_POS, PROF_SAL, PROF_HIRED, PROF_COMM, DEPT_NO) VALUES(9902, '이재우', '조교수', 4200, TO_DATE('12-04-1995','DD-MM-YYYY'), NULL, 200);
INSERT INTO PROFESSOR_T(PROF_NO, PROF_NAME, PROF_POS, PROF_SAL, PROF_HIRED, PROF_COMM, DEPT_NO) VALUES(9903, '성연희', '조교수', 4600, TO_DATE('17-05-1993','DD-MM-YYYY'), 15, 300);
INSERT INTO PROFESSOR_T(PROF_NO, PROF_NAME, PROF_POS, PROF_SAL, PROF_HIRED, PROF_COMM, DEPT_NO) VALUES(9904, '염일웅', '전임강사', 5400, TO_DATE('02-12-1998','DD-MM-YYYY'), NULL, 400);
INSERT INTO PROFESSOR_T(PROF_NO, PROF_NAME, PROF_POS, PROF_SAL, PROF_HIRED, PROF_COMM, DEPT_NO) VALUES(9905, '권혁일', '교수', 6500, TO_DATE('08-01-1986','DD-MM-YYYY'), 25, 500);
INSERT INTO PROFESSOR_T(PROF_NO, PROF_NAME, PROF_POS, PROF_SAL, PROF_HIRED, PROF_COMM, DEPT_NO) VALUES(9906, '이만식', '부교수', 4200, TO_DATE('13-09-1988','DD-MM-YYYY'), NULL, 600);
INSERT INTO PROFESSOR_T(PROF_NO, PROF_NAME, PROF_POS, PROF_SAL, PROF_HIRED, PROF_COMM, DEPT_NO) VALUES(9907, '전은지', '전임강사', 6100, TO_DATE('01-06-2001','DD-MM-YYYY'), NULL, 700);
INSERT INTO PROFESSOR_T(PROF_NO, PROF_NAME, PROF_POS, PROF_SAL, PROF_HIRED, PROF_COMM, DEPT_NO) VALUES(9908, '남은혁', '부교수', 4200, TO_DATE('18-11-1990','DD-MM-YYYY'), 17, 800);
COMMIT;

INSERT INTO STUDENT_T(STUD_NO, STUD_NAME, STUD_GRADE, STUD_BORN, STUD_TEL, STUD_HEIGHT, STUD_WEIGHT, DEPT_NO) VALUES(10101, '전인하', '4', TO_DATE('02-01-1979','DD-MM-YYYY'), '051)781-2158', 176, 72, 100);
INSERT INTO STUDENT_T(STUD_NO, STUD_NAME, STUD_GRADE, STUD_BORN, STUD_TEL, STUD_HEIGHT, STUD_WEIGHT, DEPT_NO) VALUES(20101, '이동훈', '1', TO_DATE('10-12-1983','DD-MM-YYYY'), '055)426-1752', 172, 64, 300);
INSERT INTO STUDENT_T(STUD_NO, STUD_NAME, STUD_GRADE, STUD_BORN, STUD_TEL, STUD_HEIGHT, STUD_WEIGHT, DEPT_NO) VALUES(10102, '박미경', '1', TO_DATE('16-05-1984','DD-MM-YYYY'), '055)261-8947', 168, 52, 100);
INSERT INTO STUDENT_T(STUD_NO, STUD_NAME, STUD_GRADE, STUD_BORN, STUD_TEL, STUD_HEIGHT, STUD_WEIGHT, DEPT_NO) VALUES(10103, '김영균', '3', TO_DATE('11-01-1981','DD-MM-YYYY'), '051)824-9637', 170, 88 ,100);
INSERT INTO STUDENT_T(STUD_NO, STUD_NAME, STUD_GRADE, STUD_BORN, STUD_TEL, STUD_HEIGHT, STUD_WEIGHT, DEPT_NO) VALUES(20102, '박동진', '1', TO_DATE('24-11-1985','DD-MM-YYYY'), '051)742-6384', 182, 70, 300);
INSERT INTO STUDENT_T(STUD_NO, STUD_NAME, STUD_GRADE, STUD_BORN, STUD_TEL, STUD_HEIGHT, STUD_WEIGHT, DEPT_NO) VALUES(10201, '김진영', '2', TO_DATE('06-06-1982','DD-MM-YYYY'), '055)419-6328', 164, 48, 200);
INSERT INTO STUDENT_T(STUD_NO, STUD_NAME, STUD_GRADE, STUD_BORN, STUD_TEL, STUD_HEIGHT, STUD_WEIGHT, DEPT_NO) VALUES(10104, '지은경', '2', TO_DATE('12-04-1980','DD-MM-YYYY'), '055)418-9627', 161, 42, 100);
INSERT INTO STUDENT_T(STUD_NO, STUD_NAME, STUD_GRADE, STUD_BORN, STUD_TEL, STUD_HEIGHT, STUD_WEIGHT, DEPT_NO) VALUES(10202, '오유석', '4', TO_DATE('12-10-1977','DD-MM-YYYY'), '051)724-9618', 177, 92, 200);
INSERT INTO STUDENT_T(STUD_NO, STUD_NAME, STUD_GRADE, STUD_BORN, STUD_TEL, STUD_HEIGHT, STUD_WEIGHT, DEPT_NO) VALUES(10203, '하나리', '1', TO_DATE('18-12-1984','DD-MM-YYYY'), '055)296-3784', 160, 68, 200);
INSERT INTO STUDENT_T(STUD_NO, STUD_NAME, STUD_GRADE, STUD_BORN, STUD_TEL, STUD_HEIGHT, STUD_WEIGHT, DEPT_NO) VALUES(10105, '임유진', '2', TO_DATE('21-01-1983','DD-MM-YYYY'), '02)312-9838', 171, 54, 100);
INSERT INTO STUDENT_T(STUD_NO, STUD_NAME, STUD_GRADE, STUD_BORN, STUD_TEL, STUD_HEIGHT, STUD_WEIGHT, DEPT_NO) VALUES(10106, '서재진', '1', TO_DATE('29-11-1985','DD-MM-YYYY'), '051)239-4861', 186, 72, 100);
INSERT INTO STUDENT_T(STUD_NO, STUD_NAME, STUD_GRADE, STUD_BORN, STUD_TEL, STUD_HEIGHT, STUD_WEIGHT, DEPT_NO) VALUES(10204, '윤진욱', '3', TO_DATE('02-04-1979','DD-MM-YYYY'), '053)487-2698', 171, 70, 200);
INSERT INTO STUDENT_T(STUD_NO, STUD_NAME, STUD_GRADE, STUD_BORN, STUD_TEL, STUD_HEIGHT, STUD_WEIGHT, DEPT_NO) VALUES(10107, '이광훈', '4', TO_DATE('13-10-1981','DD-MM-YYYY'), '055)736-4981', 175, 92, 100);
INSERT INTO STUDENT_T(STUD_NO, STUD_NAME, STUD_GRADE, STUD_BORN, STUD_TEL, STUD_HEIGHT, STUD_WEIGHT, DEPT_NO) VALUES(20103, '김진경', '2', TO_DATE('28-02-1983','DD-MM-YYYY'), '052)175-3941', 166, 51, 300);
INSERT INTO STUDENT_T(STUD_NO, STUD_NAME, STUD_GRADE, STUD_BORN, STUD_TEL, STUD_HEIGHT, STUD_WEIGHT, DEPT_NO) VALUES(20104, '조명훈', '1', TO_DATE('16-09-1984','DD-MM-YYYY'), '02)785-6984', 184, 62, 300);
INSERT INTO STUDENT_T(STUD_NO, STUD_NAME, STUD_GRADE, STUD_BORN, STUD_TEL, STUD_HEIGHT, STUD_WEIGHT, DEPT_NO) VALUES(10108, '류민정', '2', TO_DATE('19-08-1981','DD-MM-YYYY'), '055)248-3679', 162, 72, 100);
COMMIT;

SET SERVEROUTPUT ON;

-- 1. 다음 사용자를 만드는 쿼리문을 모두 작성하시오.(5점)
--    1) 사용자명 : SUPERVISOR
--    2) 비밀번호 : SUPERVISOR
--    3) 사용자명이 "C##SUPERVISOR"가 되지 않도록 주의하시오.
ALTER SESSION SET "_ORACLE_SCRIPT" = TRUE;
CREATE USER SUPERVISOR IDENTIFIED BY SUPERVISOR;


-- 2. SUPERVISOR 계정에 DBA 권한을 부여하는 쿼리문을 작성하시오.(5점)
GRANT DBA TO SUPERVISOR;


-- 3. SUPERVISOR 계정의 DBA 권한을 회수하는 쿼리문을 작성하시오.(5점)
REVOKE DBA FROM SUPERVISOR;


-- 4. SUPERVISOR 계정을 삭제하는 쿼리문을 작성하시오.(5점)
DROP USER SUPERVISOR CASCADE;


-- 5. 학생(STUDENT_T) 테이블에서 학생 이름과 생일을 조회하시오. 생일(STUD_BORN)은 'YYYY-MM-DD' 형식으로 조회하시오.(5점)
--학생명  생일
--전인하  1979-01-02
--이동훈  1983-12-10
--박미경  1984-05-16
--김영균  1981-01-11
--박동진  1985-11-24
--김진영  1982-06-06
--지은경  1980-04-12
--오유석  1977-10-12
--하나리  1984-12-18
--임유진  1983-01-21
--서재진  1985-11-29
--윤진욱  1979-04-02
--이광훈  1981-10-13
--김진경  1983-02-28
--조명훈  1984-09-16
--류민정  1981-08-19
SELECT STUD_NAME AS 학생명
     , TO_CHAR(STUD_BORN, 'YYYY-MM-DD') AS 생일
  FROM STUDENT_T;


-- 6. 교수(PROFESSOR_T) 테이블에서 교수 이름과 '2020-12-31'까지 근무한 근속일을 조회하시오. 근속일은 정수로 내림 또는 절사하여 조회하시오.(5점)
--교수명  근속일
--김도훈  14221
--이재우  9395
--성연희  10090
--염일웅  8065
--권혁일  12776
--이만식  11797
--전은지  7153
--남은혁  11001
SELECT PROF_NAME AS 교수명
     , TRUNC(TO_DATE('20/12/31') - PROF_HIRED) AS 근속일
  FROM PROFESSOR_T;


-- 7. 학생(STUDENT_T) 테이블에서 가장 키가 큰 학생과 가장 키가 작은 학생을 조회하시오.(10점)
--학번  학생명  키
--10203 하나리  160
--10106 서재진  186
SELECT STUD_NO AS 학번, STUD_NAME AS 학생명, STUD_HEIGHT AS 키
  FROM STUDENT_T
 WHERE STUD_HEIGHT =(SELECT MAX(STUD_HEIGHT)
                       FROM STUDENT_T)
    OR STUD_HEIGHT =(SELECT MIN(STUD_HEIGHT)
                       FROM STUDENT_T);



-- 8. 학과별 학생수를 조회하시오.(5점)
--학과번호  학생수
--300       4
--200       4
--100       8
SELECT DEPT_NO AS 학과번호
     , COUNT(STUD_NO) AS 학생수
  FROM STUDENT_T
 GROUP BY DEPT_NO;


-- 9. 학과별 학생수를 조회하시오. 소속 학생이 없으면 0으로 조회하시오.(10점)
--학과번호  학과명             학생수
--300       전자공학과         4
--200       멀티미디어학과     4
--100       컴퓨터공학과       8
--400       기계공학과         0
--600       메카트로닉스학과   0
--700       빅데이터학과       0
--500       정보미디어학과     0
--800       응용소프트웨어학과 0
SELECT D.DEPT_NO AS 학과번호, D.DEPT_NAME AS 학과명, NVL(COUNT(S.STUD_NO), 0) AS 학생수
  FROM DEPARTMENT_T D LEFT OUTER JOIN STUDENT_T S
    ON D.DEPT_NO = S.DEPT_NO
 GROUP BY D.DEPT_NO, D.DEPT_NAME;


-- 10. 모든 학생의 학생명, 학과명을 조회하시오.(10점)
--학생명  학과명
--전인하  컴퓨터공학과
--이동훈  전자공학과
--박미경  컴퓨터공학과
--김영균  컴퓨터공학과
--박동진  전자공학과
--김진영  멀티미디어학과
--지은경  컴퓨터공학과
--오유석  멀티미디어학과
--하나리  멀티미디어학과
--임유진  컴퓨터공학과
--서재진  컴퓨터공학과
--윤진욱  멀티미디어학과
--이광훈  컴퓨터공학과
--김진경  전자공학과
--조명훈  전자공학과
--류민정  컴퓨터공학과
SELECT STUD_NAME AS 학생명, DEPT_NAME AS 학과명
  FROM DEPARTMENT_T D INNER JOIN STUDENT_T S
    ON D.DEPT_NO = S.DEPT_NO;


-- 11. 모든 교수들의 연봉순위, 교수명, 연봉을 조회하시오.(10점)
--순위  교수명  연봉
--1     권혁일  6500
--2     전은지  6100
--3     염일웅  5400
--4     김도훈  5000
--5     성연희  4600
--6     남은혁  4200
--6     이재우  4200
--6     이만식  4200
SELECT RANK() OVER(ORDER BY PROF_SAL DESC) AS 순위
     , PROF_NAME AS 교수명
     , PROF_SAL AS 연봉
  FROM PROFESSOR_T;


-- 12. 학년별 평균키와 평균몸무게를 조회하시오. 학년을 기준으로 오름차순 정렬하고, 평균키와 평균몸무게는 모두 소수점 1자리만 남기고 반올림하시오.(10점)
--학년  평균키  평균몸무게
--1     175.3   64.7
--2     164.8   53.4
--3     170.5   79
--4     176     85.3
SELECT STUD_GRADE AS 학년
     , ROUND(AVG(STUD_HEIGHT), 1) AS 평균키
     , ROUND(AVG(STUD_WEIGHT), 1) AS 평균몸무게
  FROM STUDENT_T
 GROUP BY STUD_GRADE
 ORDER BY STUD_GRADE ASC;


-- 13. 다음 지시사항에 따라 GET_DEPT 사용자 함수를 완성하시오.(5점)
--     1) 학과번호를 전달하면 학과명을 반환하는 GET_DEPT 사용자 함수이다.
--     2) 중괄호{} 대신 그 자리에 들어가야 할 변수명을 작성하여 GET_DEPT 사용자 함수를 완성하시오.

-- GET_DEPT 함수 정의
CREATE OR REPLACE FUNCTION GET_DEPT(DEPTNO DEPARTMENT_T.DEPT_NO%TYPE)
RETURN VARCHAR2
AS
    DEPTNAME DEPARTMENT_T.DEPT_NAME%TYPE;
BEGIN
    SELECT DEPT_NAME INTO DEPTNAME
      FROM DEPARTMENT_T
     WHERE DEPT_NO = DEPTNO;
    RETURN DEPTNAME;
END;

-- GET_DEPT 함수 호출
--학번  학생명  학과번호  학과명
--10101 전인하  100       컴퓨터공학과
--20101 이동훈  300       전자공학과
--10102 박미경  100       컴퓨터공학과
--10103 김영균  100       컴퓨터공학과
--20102 박동진  300       전자공학과
--10201 김진영  200       멀티미디어학과
--10104 지은경  100       컴퓨터공학과
--10202 오유석  200       멀티미디어학과
--10203 하나리  200       멀티미디어학과
--10105 임유진  100       컴퓨터공학과
--10106 서재진  100       컴퓨터공학과
--10204 윤진욱  200       멀티미디어학과
--10107 이광훈  100       컴퓨터공학과
--20103 김진경  300       전자공학과
--20104 조명훈  300       전자공학과
--10108 류민정  100       컴퓨터공학과
SELECT STUD_NO AS 학번
     , STUD_NAME AS 학생명
     , DEPT_NO AS 학과번호
     , GET_DEPT(DEPT_NO) AS 학과명
  FROM STUDENT_T;

-- 14. 다음 설명을 읽고 STUD_TRIG 트리거를 완성하시오.(5점)
--     1) 학생 테이블의 데이터를 삭제하면 '학생 데이터가 삭제되었습니다.'라는 서버 메시지가 나타난다.
--     2) 학생 테이블의 데이터를 수정하면 '학생 데이터가 수정되었습니다.'라는 서버 메시지가 나타난다.
--     3) AFTER 트리거를 이용한다.
--     4) 중괄호{} 대신 그 자리에 들어가야 할 키워드를 작성하여 STUD_TRIG 트리거를 완성하시오.
CREATE OR REPLACE TRIGGER STUD_TRIG
    AFTER
    UPDATE OR DELETE
    ON STUDENT_T
    FOR EACH ROW
BEGIN
    IF DELETING THEN
        DBMS_OUTPUT.PUT_LINE('학생 데이터가 삭제되었습니다.');
    ELSIF UPDATING THEN
        DBMS_OUTPUT.PUT_LINE('학생 데이터가 수정되었습니다.');
    END IF;
END;

-- 15. 다음 설명을 읽고 REMOVE_DEPT 프로시저를 완성하시오.(5점)
--     1) 학과번호를 전달하면 해당 학과에 소속된 학생, 교수, 학과를 모두 삭제하는 프로시저를 작성하시오.
--     2) 프로시저가 정상 동작하면 COMMIT, 종류에 상관없이 예외가 발생하면 ROLLBACK 처리하시오.
--     3) 학과번호가 '100'인 학과를 MY_PROC 프로시저를 이용하여 삭제하시오.
--     4) 중괄호{} 대신 그 자리에 들어가야 할 키워드를 작성하여 REMOVE_DEPT 프로시저를 완성하시오.

-- REMOVE_DEPT 프로시저 정의
CREATE OR REPLACE PROCEDURE REMOVE_DEPT(DEPTNO IN DEPARTMENT_T.DEPT_NO%TYPE)
AS
BEGIN
    DELETE FROM PROFESSOR_T WHERE DEPT_NO = DEPTNO;
    DELETE FROM STUDENT_T WHERE DEPT_NO = DEPTNO;
    DELETE FROM DEPARTMENT_T WHERE DEPT_NO = DEPTNO;
    COMMIT;
EXCEPTION
    WHEN OTHERS THEN

        ROLLBACK;
END;

-- REMOVE_DEPT 프로시저 호출
EXEC REMOVE_DEPT(100);