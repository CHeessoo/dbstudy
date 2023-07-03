-- 실습. 수강신청 데이터베이스

DROP TABLE LECTURE_TBL;
DROP TABLE ENROLL_TBL;
DROP TABLE STUDENT_TBL;
DROP TABLE COURSE_TBL;
DROP TABLE PROFESSOR_TBL;

-- 1. 교수 (PROFESSOR_TBL) 테이블
CREATE TABLE PROFESSOR_TBL (
    PROF_NO   NUMBER            NOT NULL        --교수번호
  , RROF_NAME VARCHAR2(10 BYTE) NOT NULL        --교수이름
  , MAJOR      VARCHAR2(20 BYTE) NULL           --교수전공
  , CONSTRAINT PK_PROF PRIMARY KEY(PROF_NO)
);

-- 2. 과목 (COURSE_TBL) 테이블
CREATE TABLE COURSE_TBL (
    COUR_NO   NUMBER            NOT NULL        --과목번호 
  , COUR_NAME VARCHAR2(20 BYTE) NOT NULL        --과목명
  , CREDIT    NUMBER                            --이수학점
  , CONSTRAINT PK_COUR PRIMARY KEY(COUR_NO)
);

-- 3. 학생 (STUDENT_TBL) 테이블
CREATE TABLE STUDENT_TBL (
    STU_NO      NUMBER             NOT NULL     --학번
  , STU_NAME    VARCHAR2(20 BYTE)  NOT NULL     --이름
  , STU_ADDRESS VARCHAR2(100 BYTE) NULL         --주소
  , GRADE       NUMBER             NULL         --학년
  , PROF_NO     NUMBER             NOT NULL     --담당교수번호
  , CONSTRAINT PK_STUD      PRIMARY KEY(STU_NO)
  , CONSTRAINT FK_PROF_STUD FOREIGN KEY(PROF_NO) REFERENCES PROFESSOR_TBL(PROF_NO) ON DELETE CASCADE
);

-- 4. 강의 (LECTURE_TBL) 테이블
CREATE TABLE LECTURE_TBL (
    LEC_NO   NUMBER NOT NULL        --강의번호
  , PROF_NO  NUMBER                 --교수번호
  , COUR_NO   NUMBER                --과목번호    (수강신청번호->과목번호로 변경)
  , LEC_NAME VARCHAR2(30 BYTE)      --강의이름
  , LEC_ROOM NUMBER                 --강의실
  , CONSTRAINT PK_LECT      PRIMARY KEY(LEC_NO) 
  , CONSTRAINT FK_PROF_LECT FOREIGN KEY(PROF_NO) REFERENCES PROFESSOR_TBL(PROF_NO) ON DELETE SET NULL
  , CONSTRAINT FK_ENR_COUR  FOREIGN KEY(COUR_NO)   REFERENCES COURSE_TBL(COUR_NO)      ON DELETE SET NULL
);

-- 5. 수강신청 (ENROLL_TBL) 테이블
CREATE TABLE ENROLL_TBL (
    EN_NO   NUMBER NOT NULL     --수강신청번호
  , STU_NO  NUMBER NOT NULL     --학번
  , LEC_NO  NUMBER NOT NULL     --강의번호      (과목번호->강의번호로 변경)
  , EN_DATE DATE                --신청일자
  , CONSTRAINT PK_ENR      PRIMARY KEY(EN_NO)
  , CONSTRAINT FK_STUD_ENR FOREIGN KEY(STU_NO)  REFERENCES STUDENT_TBL(STU_NO) ON DELETE CASCADE
  , CONSTRAINT FK_COUR_LECT FOREIGN KEY(LEC_NO) REFERENCES LECTURE_TBL(LEC_NO) ON DELETE CASCADE
);


--인서트로 데이터 삽입
-- 1. 교수(PROFESSOR_TBL) 테이블 데이터 입력
INSERT INTO PROFESSOR_TBL(PROF_NO, RROF_NAME, MAJOR) VALUES(1, '홍길동', '의적');
INSERT INTO PROFESSOR_TBL(PROF_NO, RROF_NAME, MAJOR) VALUES(2, '김철수', '복싱');
INSERT INTO PROFESSOR_TBL(PROF_NO, RROF_NAME, MAJOR) VALUES(3, '이승아', '요가');


-- 2. 과목(COURSE_TBL) 테이블 데이터 입력
INSERT INTO COURSE_TBL(COUR_NO, COUR_NAME, CREDIT) VALUES(1, '도적질', 2.4);
INSERT INTO COURSE_TBL(COUR_NO, COUR_NAME, CREDIT) VALUES(2, '권투', 1.5);
INSERT INTO COURSE_TBL(COUR_NO, COUR_NAME, CREDIT) VALUES(3, '하타요가', 2);


-- 3. 학생(STUDENT_TBL) 테이블 데이터 입력
INSERT INTO STUDENT_TBL(STU_NO, STU_NAME, STU_ADDRESS, GRADE, PROF_NO) VALUES(22001, '콩쥐', '조선광역시 강남구', 2, 1);
INSERT INTO STUDENT_TBL(STU_NO, STU_NAME, STU_ADDRESS, GRADE, PROF_NO) VALUES(22002, '팥쥐', '길바닥', 2, 2);
INSERT INTO STUDENT_TBL(STU_NO, STU_NAME, STU_ADDRESS, GRADE, PROF_NO) VALUES(23001, '신데렐라', '신데렐라 성', 1, 3);


-- 4. 강의번호 시퀀스 + 강의(LECTURE_TBL) 테이블 데이터 입력
DROP SEQUENCE LEC_SEQ;
CREATE SEQUENCE LEC_SEQ ORDER;

INSERT INTO LECTURE_TBL(LEC_NO, PROF_NO, COUR_NO, LEC_NAME, LEC_ROOM) VALUES(LEC_SEQ.NEXTVAL, 1, 1, '의로운 도적이 되는 법', 305);
INSERT INTO LECTURE_TBL(LEC_NO, PROF_NO, COUR_NO, LEC_NAME, LEC_ROOM) VALUES(LEC_SEQ.NEXTVAL, 2, 2, '핵심의 카운터', 304);
INSERT INTO LECTURE_TBL(LEC_NO, PROF_NO, COUR_NO, LEC_NAME, LEC_ROOM) VALUES(LEC_SEQ.NEXTVAL, 3, 3, '마음의 평화 INNER PEACE', 302);

-- 5. 수강신청번호 시퀀스 + 수강신청(ENROLL_TBL) 테이블 데이터 입력
DROP SEQUENCE ENR_SEQ;
CREATE SEQUENCE ENR_SEQ ORDER;

INSERT INTO ENROLL_TBL(EN_NO, STU_NO, LEC_NO, EN_DATE) VALUES(ENR_SEQ.NEXTVAL, 22001, 1, '23/07/03');
INSERT INTO ENROLL_TBL(EN_NO, STU_NO, LEC_NO, EN_DATE) VALUES(ENR_SEQ.NEXTVAL, 22002, 2, '23/07/03');
INSERT INTO ENROLL_TBL(EN_NO, STU_NO, LEC_NO, EN_DATE) VALUES(ENR_SEQ.NEXTVAL, 23001, 3, '23/07/03');


--변경된 내용을 DB에 반영
COMMIT;

ROLLBACK;
