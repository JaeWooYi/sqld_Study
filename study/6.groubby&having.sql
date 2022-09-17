-- 2022/09/17 SATURDAY

-- GROUP BY, HAVING !!!!!!

-- COUNT(*) -> NULL값을 포함한 행의 수 
-- COUNT(표현식) -> 표현식 값이 NULL이 아닌 행의 수
-- SUM(표현식) -> 표현식이 NULL값인 것을 제외한 합계
-- AVG(표현식) -> 표현식이 NULL값인 것을 제외한 평균
-- MAX(표현식) -> 표현식이 NULL값인 것을 제외한 최대값
-- MIN(표현식) -> 표현식이 NULL값인 것을 제외한 최소값
-- STDDEV(표현식) -> 표현식이 NULL값인 것을 제외한 표준편차

SELECT MAX(BIRTH_DE), MIN(BIRTH_DE), COUNT(*) FROM SQLD.TB_EMP;

-- 사원들 중 부서 코드별 가장 늦은 생일, 가장 빠른 생일, 직원 수를 출력.
SELECT A.DEPT_CD
	, (SELECT L.DEPT_NM FROM SQLD.TB_DEPT L WHERE L.DEPT_CD = A.DEPT_CD) AS DEPT_NM
	, MAX(A.BIRTH_DE) AS "가장 늦은 생년월일"
	, MIN(A.BIRTH_DE) AS "가장 빠른 생년월일"
	, COUNT(*) AS "직원수"
FROM SQLD.TB_EMP A
GROUP BY A.DEPT_CD
ORDER BY A.DEPT_CD;

SELECT A.DEPT_CD
	, (SELECT L.DEPT_NM FROM SQLD.TB_DEPT L WHERE L.DEPT_CD = A.DEPT_CD) AS DEPT_NM
	, MAX(A.BIRTH_DE) AS "SLOW BIRTH"
	, MIN(A.BIRTH_DE) AS "FAST BIRTH"
	, COUNT(*) AS "NUMBER OF EMPLOYEE"
FROM SQLD.TB_EMP A
GROUP BY A.DEPT_CD
HAVING(COUNT(*)) > 1
ORDER BY A.DEPT_CD;

-- GROUP BY : 중복되지 않는 정보를 보여주는 것이래....
--ex) 
--1. 멜론 차트를 뽑고 싶습니다. (→ 음원별 스트리밍 횟수 내림차순)
--2. 판매 된 상품 중 베스트 상품을 알고 싶습니다. (→ 상품별 주문수량 내림차순)
--3. 자유게시판 게시글 목록에 코멘트 개수랑 같이 보여주세요. (→ 게시글별 코멘트 개수)
--4. 지역별 부동산 매물 수를 알고 싶습니다. (→ 지역별 매물의 개수)
--여기서 OO별 --> 이것때문에 GROUP by를 쓰는거

SELECT * FROM sqld.TB_EMP;
SELECT count(*) FROM sqld.TB_EMP;
SELECT count(*) FROM sqld.TB_EMP WHERE SEX_CD = 1;
SELECT count(SEX_CD) AS "그룹별" FROM sqld.TB_EMP GROUP by SEX_CD;
SELECT * FROM sqld.TB_EMP ORDER BY EMP_NO;

-- ORDER BY OOO --> OOO 별로 정렬하라는 뜻이구나... 
-- HAVING 은 필터조건 같은거야..
-- group by 에서 뭔가 또 조건을 주고싶을떄!!!

-- SELECT 에 조건을 주는건 where인데  -->  group by에 조건을 주는건 having이다!!

-- 2019년도의 급여 내역중에서 직원별로 평균 급여액이 470이상인 직원들의 직원번호, 직원명, 최대급여액수, 최소급여액수, 평균급여액수를 출력하는 SQL문
SELECT 
	A.EMP_NO
	, (SELECT L.EMP_NM FROM SQLD.TB_EMP L WHERE L.EMP_NO = A.EMP_NO) AS EMP_NM
	, MAX(A.PAY_AMT) AS MAX_PAY_AMT
	, MIN(A.PAY_AMT) AS MIN_PAY_AMT
	, ROUND(AVG(A.PAY_AMT), 2) AS AVG_PAY_AMT
FROM SQLD.TB_SAL_HIS A
WHERE A.PAY_DE BETWEEN '20190101' AND '20191231'
GROUP BY A.EMP_NO
HAVING(ROUND(AVG(A.PAY_AMT), 2)) >= 4700000
ORDER BY A.EMP_NO DESC;

-- 2019년도의 급여 내역 중 급여의 합계가 (연봉) 5500만원 이상인 직원의 직원번호, 직원명, 합계급여, 액수를 출력하는 sql문
SELECT
	a.emp_no
	, (SELECT l.emp_nm FROM sqld.TB_EMP l WHERE l.EMP_NO = a.emp_no) AS EMP_NM
	, sum(a.pay_amt) AS sum_pay_amt
FROM sqld.TB_SAL_HIS a
WHERE a.PAY_DE BETWEEN '20190101' AND '20191231'
GROUP BY a.EMP_NO
HAVING sum(a.PAY_AMT) > 55000000
ORDER BY sum_pay_amt DESC;

-- 직원들의 정보 중 몇 십년대생인지에 대한 카운트를 구하는 sql
-- birth_de의 값이 매칭되면 1을 더해서 카운트를 하고 그렇지 않으면 0을 더해서 카운트를 안함.
SELECT
	sum(CASE WHEN BIRTH_DE LIKE '195%' THEN 1 ELSE 0 end) AS "1950..."
	, sum(CASE WHEN BIRTH_DE LIKE '196%' THEN 1 ELSE 0 end) AS "1960..."
	, sum(CASE WHEN BIRTH_DE LIKE '197%' THEN 1 ELSE 0 end) AS "1970..."
	, sum(CASE WHEN BIRTH_DE LIKE '198%' THEN 1 ELSE 0 end) AS "1980..."
	, sum(CASE WHEN BIRTH_DE LIKE '199%' THEN 1 ELSE 0 end) AS "1990..."
	, count(*) AS cnt
FROM sqld.tb_emp;

-- 부서별로 직원들이 몇십년대생인지에 대한 카운트
-- birth_de의 값이 매칭되면 1을 더해서 카운트를 하고 그렇지 않으면 0을 더해서 카운트를 안함.
SELECT
	DEPT_CD
	, (SELECT l.dept_nm FROM sqld.TB_DEPT l WHERE l.DEPT_CD = a.DEPT_CD) AS dept_nm
	, sum(CASE WHEN BIRTH_DE LIKE '195%' THEN 1 ELSE 0 end) AS "1950..."
	, sum(CASE WHEN BIRTH_DE LIKE '196%' THEN 1 ELSE 0 end) AS "1960..."
	, sum(CASE WHEN BIRTH_DE LIKE '197%' THEN 1 ELSE 0 end) AS "1970..."
	, sum(CASE WHEN BIRTH_DE LIKE '198%' THEN 1 ELSE 0 end) AS "1980..."
	, sum(CASE WHEN BIRTH_DE LIKE '199%' THEN 1 ELSE 0 end) AS "1990..."
	, count(*) AS cnt
FROM sqld.TB_EMP a
GROUP BY a.DEPT_CD
ORDER BY a.DEPT_CD;

-- null은 집계함수의 계산에 포함되지 않는다
-- avg(num)의 값이 25임 -> 즉 집계함수는 평균을 구할때 관여 하지 않는다.
SELECT sum(num), avg(num), max(num), min(num) AS sum_num
FROM
(
SELECT NULL AS num FROM dual 
UNION ALL
SELECT 10 AS num FROM dual 
UNION all
SELECT 20 AS num FROM dual 
UNION all
SELECT 30 AS num FROM dual 
UNION all
SELECT 40 AS num FROM dual
);