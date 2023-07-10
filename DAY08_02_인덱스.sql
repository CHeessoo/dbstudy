/*
    ROWID 
    1. 오라클에서 제공하는 가상 칼럼(PSEUDO COLUMN)이다.  --P는 묵음 (수도칼럼)
    2. 어떤 행이 어디에 저장되어 있는지 알고 있는 칼럼이다.
    3. 실제로 저장된 물리적 저장위치를 확인할 수 있다. 
*/

-- ROWID 확인
SELECT ROWID, EMPLOYEE_ID, FIRST_NAME, LAST_NAME
  FROM EMPLOYEES;

-- ROWID를 이용한 조회
-- 1. 오라클에서 가장 빠른 조회이다.
-- 2. 실제로 사용하기가 불가능하다. 대신 인덱스를 사용한다.
SELECT *
  FROM EMPLOYEES
 WHERE ROWID = 'AAAR92AAHAAAADOAAE';
 
 
 /*
    인덱스
    1. 빠른 조회를 지원하는 데이터베이스 객체이다.
    2. 어떤 데이터가 어던 ROWID를 가지고 있는지 알고 있다.
    3. 기본키(PK)와 중복이 없는 칼럼(UNIQUE)은 자동으로 인덱스가 만들어진다.
    4. 인덱스가 많으면 데이터의 삽입/수정/삭제 시 인덱스도 함께 갱신해야 하기 때문에 전체적인 성능이 떨어질 수 있다.
 */
 
 -- 인덱스를 타는 조회
 SELECT *
   FROM EMPLOYEES
 WHERE EMPLOYEE_ID = 150;  -- PK값을 타고 있기에 빠른 조회가 가능하다
 
-- 인덱스를 안 타는 조회 (인덱스 칼럼을 그대로 사용하지 않고 함수를 적용해서 사용하면 인덱스를 타지 않는다.)
SELECT *
  FROM EMPLOYEES
 WHERE TO_CHAR(EMPLOYEE_ID) = '150';  -- 가능하면 함수를 뒤(오른쪽)로 빼는 것이 좋다. (=등호 기준으로 가능한 왼쪽은 변경하지 않는게 좋다. -> 성능문제)
 
 
 
 

 /*
    데이터 사전
    1. 특정 데이터의 정보를 담고 있는 객체이다.
    2. 시스템 카탈로그, 메타데이터라고도 한다.
    3. 계정 유형별로 관리한다.
        1) DBA_       -- 가장 많은 정보를 갖고있음
        2) USER_      -- 유저가 갖고 있는 것
        3) ALL_       -- 유저가 접근할 수 있는 것
 */
 
 -- 인덱스 정보가 저장되어 있는 데이터 사전(이미 만들어진 테이블)
 -- DBA_INDEXES, USER_INDEXES, ALL_INDEXES
 SELECT * FROM USER_INDEXES;   -- 현재 사용중인 HR계정에 저장된 인덱스 보기
 
 
-- 인덱스가 설정된 칼럼 정보가 저장되어 있는 데이터 사전 (어느 테이블, 어느 칼럼에 인덱스가 주어져 있는지 명확하게 알 수 있다.)
-- DBA_IND_COLUMNS, USER_IND_COLUMNS, ALL_IND_COLUMNS
SELECT * FROM USER_IND_COLUMNS;
 
-- 실습. 사원 테이블의 인덱스만 보기
SELECT * FROM USER_IND_COLUMNS WHERE TABLE_NAME = 'EMPLOYEES'; 
 

-- 인덱스 만들기 CREATE INDEX
-- 부서 테이블의 부서명(DEPARTMENT_NAME) 칼럼에 인덱스 설정하기
CREATE INDEX DEPT_NAME_IX            -- DEPT_NAME_IX -> 인덱스 이름 설정
    ON DEPARTMENTS(DEPARTMENT_NAME);


-- 인덱스 DEPT_NAME_IX 삭제하기
DROP INDEX DEPT_NAME_IX;


-- 인덱스는 만드는게 어렵지 않고, 적용하기 쉽지만 
-- 너무 많은 인덱스를 만들 경우 데이터의 삽입/수정/삭제시 전체적인 성능이 떨어질 수 있기에 
-- 만들기에 주의해야 한다 (거의 만들 일 없을것)

-- 인덱스 장점 : 검색 속도가 빨라질 수 잇음
-- 인덱스 단점 : 변경 작업(INSERT, UPDATE, DELETE)이 자주 발생되면 오히려 성능 저하가 될 수 있음



 