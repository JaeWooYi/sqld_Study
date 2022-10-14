-- 2022/09/17 SUNDAY!!

-- ORDER BY : 정렬!!
SELECT
	A.CERTI_CD
	, A.CERTI_NM 
	, A.ISSUE_INSTI_NM 
FROM SQLD.TB_CERTI A
ORDER BY A.CERTI_NM;

SELECT
	A.CERTI_CD
	, A.CERTI_NM 
	, A.ISSUE_INSTI_NM 
FROM SQLD.TB_CERTI A
ORDER BY A.CERTI_NM DESC;

-- null 포함 정렬
SELECT
	*
FROM SQLD.TB_EMP A WHERE BIRTH_DE LIKE '196%'
ORDER BY A.DIRECT_MANAGER_EMP_NO DESC;

-- select문의 실행 순서
	-- FROM절 -> 조회 테이블을 참조
	-- WHERE절 -> 조회 대상을 조회
	-- GROUP BY절 -> 대상 행을 그룹화
	-- HAVING절 -> 그룹화한 값에서 조건 맞는 것을 출력
	-- SELECT절  -> select절에 기재한 칼람이나 식을 계산
	-- ORDER by절 -> 출력되는 결과 집합을 정렬

SELECT *
FROM SQLD.TB_CERTI A ORDER BY A.CERTI_NM DESC;

SELECT
	A.DEPT_CD
	, (SELECT L.DEPT_CD FROM SQLD.TB_DEPT L WHERE L.DEPT_CD = A.DEPT_CD) AS DEPT_NM
	, MAX(A.BIRTH_DE) AS "SLOW BIRTH"
	, MIN(A.BIRTH_DE) AS "FAST BIRTH"
	, COUNT(*) AS "NUM OF EMPLOYEE"
FROM SQLD.TB_EMP A
GROUP BY A.DEPT_CD 
HAVING(COUNT(*)) > 1
ORDER BY A.DEPT_CD ;

-- 급여가 높은 10건 나오는거 X , 랜덤으로 나온 10건이 정렬
SELECT * FROM SQLD.TB_SAL_HIS A
WHERE A.PAY_DE >= '20200501' AND A.PAY_DE <= '20200531' AND ROWNUM <= 10
ORDER BY A.PAY_AMT DESC;

-- 급여가 높은 순으로 10건 정렬
SELECT * FROM
	(SELECT * FROM SQLD.TB_SAL_HIS A
	WHERE A.PAY_DE >= '20200501' AND A.PAY_DE <= '20200531'
	ORDER BY A.PAY_AMT DESC)
WHERE ROWNUM <= 10;



------------------------------------------------------------------------------------------


-- 조인이란? 두개 이상의 테이블들을 연결 or 결합하여 데이터를 출력하는것

-- 2개 테이블 조인
SELECT * FROM sqld.TB_EMP z1, sqld.TB_DEPT z2 WHERE z1.DEPT_CD = z2.DEPT_CD AND z2.DEPT_NM ='지원팀';

-- 3개 테이블 조인
-- 부서명이 지원팀인 직원의 사원번호, 사원명, 부서코드, 부서명, 보유자격증 코드를 출력
SELECT * FROM
	sqld.TB_EMP a1
	, sqld.TB_DEPT a2
	, sqld.TB_EMP_CERTI a3
WHERE a1.DEPT_CD = a2.DEPT_CD AND
a2.DEPT_NM = '지원팀' AND
a1.EMP_NO = a3.EMP_NO;

-- 4개 테이블 조인
-- 부서명이 지원팀인 직원의 모든것을 출력
SELECT * FROM 
	sqld.TB_EMP z1
	, sqld.TB_DEPT z2
	, sqld.TB_EMP_CERTI z3
	, sqld.TB_CERTI z4
WHERE z1.DEPT_CD = z2.DEPT_CD
AND z2.DEPT_NM = '지원팀'
AND z1.EMP_NO = z3.EMP_NO
AND z3.CERTI_CD = z4.CERTI_CD;