/*
    서브쿼리(sub query)
    1. 메인 쿼리에 포함되는 하위 쿼리를 서브쿼리라고 한다.
    2. 서브쿼리를 먼저 실행해서 그 결과를 메인 쿼리에 전달한다.
    3. 종류
        1) SELECT 절 : 스칼라 서브쿼리
        2)   FROM 절 : 인라인 뷰 (INLINE VIEW)
        3)  WHERE 절 : 단일 행 서브쿼리 (결과가 1개)
                       다중 행 서브쿼리 (결과가 N개)
*/
/*
    단일 행 서브쿼리(single row sub query)
    1. 결과가 1행이다. (1개이다.)
    2. 단일 행 서브쿼리인 경우
        1) WHERE 절에서 사용한 칼럼이 PK 또는 UNIQUE 칼럼인 경우 (중복된 데이터를 저장하지 않는 칼럼을 이용해 동등비교를 한 경우)
        2) 통계 함수를 사용한 경우                                예시) SELECT COUNT(*) FROM EMPLOYEES
    3. 단일 행 서브쿼리 연산자
        =, !=, >, >=, <, <=
        
    다중 행 서브쿼리(multiple row sub query)
    1. 결과가 N행이다.
    2. 다중 행 서브쿼리 연산자
        IN, ANY, ALL 등
*/

/* WHERE 절의 서브쿼리 */

-- 1. 사원번호가 101인 사원의 직업과 동일한 직업을 가진 사원을 조회하기 (단일 행)
--SELECT *
--  FROM EMPLOYEES
-- WHERE JOB_ID = (사원번호가 101인 사원의 직업);

SELECT *
  FROM EMPLOYEES
 WHERE JOB_ID = (SELECT JOB_ID               -- 서브쿼리의 결과와 메인쿼리의 비교대상은 같아야한다 (JOB_ID)
                   FROM EMPLOYEES 
                  WHERE EMPLOYEE_ID = 101);  --서브쿼리 괄호는 생략 가능(권장X)
                  -- 단일 행 서브쿼리인 이유 : EMPLOYEE_ID 가 PK, = 연산자 사용
                  -- (NULL이 들어가면 안 되는 서브쿼리도 존재)


-- 2. 부서명이 'IT'인 부서에 근무하는 사원 조회하기 (다중 행)
--SELECT *
--  FROM EMPLOYEES
-- WHERE DEPARTMENT_ID = (부서명이 'IT'인 부서의 부서번호);  -- 부서명을 참조해야하기 때문에 괄호 안엔 부서테이블이 들어가야함

SELECT *
  FROM EMPLOYEES
 WHERE DEPARTMENT_ID IN (SELECT DEPARTMENT_ID
                           FROM DEPARTMENTS
                          WHERE DEPARTMENT_NAME = 'IT');  -- 서브쿼리의 DEPARTMENT_NAME 칼럼은 중복이 있을 수 있으므로 다중 행 서브쿼리로 처리한다.
                          -- (PK, UNIQUE 둘 다 아니기 때문에 DEPARTMENT_NAME 칼럼이 중복된 데이터를 가질 수 있음.)



-- 3. 'Seattle'에서 근무하는 사원 조회하기 (다중 행)
SELECT *
  FROM EMPLOYEES
 WHERE DEPARTMENT_ID IN (SELECT DEPARTMENT_ID   -- 두번째 서브쿼리의 결과가 여러개가 나올 수 있음
                           FROM DEPARTMENTS
                          WHERE LOCATION_ID IN (SELECT LOCATION_ID    -- CITY 컬럼이 중복된 데이터 값을 가질 수 있음
                                                 FROM LOCATIONS
                                                WHERE CITY = 'Seattle'));


-- 4. 연봉 가장 높은 사원 조회하기 (통계 함수 MAX 이용)
SELECT *
  FROM EMPLOYEES
 WHERE SALARY = (SELECT MAX(SALARY)   -- 샐러리 최댓값 구하기 (가장 높은 연봉)
                   FROM EMPLOYEES);


-- 5. 가장 먼저 입사한 사원 조회하기 (통계 함수 MIN 이용)
SELECT *
  FROM EMPLOYEES
 WHERE HIRE_DATE = (SELECT MIN(HIRE_DATE)
                      FROM EMPLOYEES);


-- 6. 평균 연봉 이상을 받는 사원 조회하기 (통계 함수 AVG 이용)
SELECT *
  FROM EMPLOYEES
 WHERE SALARY >= (SELECT AVG(SALARY)
                    FROM EMPLOYEES);


/* FROM 절의 서브쿼리*/

-- 1. 연봉이 3번째로 높은 사원 조회하기
--    1) 높은 연봉 순으로 정렬 한다.
--    2) 정렬 결과에 행 번호를 붙인다.
--    3) 행 번호 3을 가져온다.

SELECT 행번호, EMPLOYEE_ID
  FROM (SELECT ROW_NUMBER() OVER(ORDER BY SALARY DESC) AS 행번호, EMPLOYEE_ID
          FROM EMPLOYEES)
 WHERE 행번호 = 3;


-- 2. 연봉 11 ~ 20번째 사원 조회하기
SELECT RN, EMPLOYEE_ID
  FROM (SELECT ROW_NUMBER() OVER(ORDER BY SALARY DESC) AS RN, EMPLOYEE_ID
          FROM EMPLOYEES)
 WHERE RN BETWEEN 11 AND 20;


-- 3. 21 ~ 30번째로 입사한 사원 조회하기
SELECT EMPLOYEE_ID
  FROM (SELECT ROW_NUMBER() OVER(ORDER BY HIRE_DATE ASC) AS RN, EMPLOYEE_ID
          FROM EMPLOYEES)
 WHERE RN BETWEEN 21 AND 30;


/* SELECT 절의 서브쿼리 */

-- 부서번호가 50인 부서에 근무하는 사원번호, 사원명, 부서명 조회하기
-- 비상관 쿼리
SELECT EMPLOYEE_ID
     , FIRST_NAME
     , LAST_NAME
     , (SELECT DEPARTMENT_NAME
          FROM DEPARTMENTS
         WHERE DEPARTMENT_ID = 50) AS DEPT_NAME   -- 비상관
  FROM EMPLOYEES
 WHERE DEPARTMENT_ID = 50;  -- 동일한 데이터가 2번 들어갔으므로 상관 쿼리보다 비 효율적임
 

-- 부서번호가 50인 부서에 근무하는 사원번호, 사원명, 부서명 조회하기
-- 상관 쿼리 (권장 : 더 효율적인 쿼리)
SELECT E.EMPLOYEE_ID
     , E.FIRST_NAME
     , E.LAST_NAME
     , (SELECT D.DEPARTMENT_NAME
          FROM DEPARTMENTS D 
         WHERE D.DEPARTMENT_ID = E.DEPARTMENT_ID
           AND D.DEPARTMENT_ID = 50) AS DEPT_NAME   -- 상관
  FROM EMPLOYEES E;

