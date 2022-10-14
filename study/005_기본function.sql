-- 2022/09/12 MONDAY

--여러가지 함수들~

-- 단일행 문자열 함수들 
SELECT 
	  LOWER('SQL DEVELOPER') AS "LOWER('SQL DEVELOPER')"	-- 소문자로 변환
	, upper('sql developer') AS "upper('sql developer')"	-- 대문자로 변환
	, ascii('a') AS "ascii9('a')"	-- 아스키코드값 출력
	, chr('65') AS "chr('65')"	-- 아스키코드값의 문자 출력
	, concat('sql', ' developer') AS "concat('sql', 'developer')"	-- 문자열 결합
	, substr('sql developer', 1, 3) AS "substr('sql developer', 1, 3)"	-- 문자열 잘라내기(1~3까지 여기서는)
	, LENGTH('sql') AS "LENGTH('sql')"	-- 문자열의 길이 출력
	, LTRIM(' sql') AS "LTRIM(' sql')"	-- 왼쪽 공백 제거
	, rTrim('sql ') AS "rTrim('sql ')"	-- 오른쪽 공백 제거
FROM dual;

-- 숫자형 함수들 
SELECT
	  abs(-15) AS "abs(-15)"	-- 절대값을 반환
	, sign(1) AS "sign(1)"	-- 사인값을 반환 
	, mod(8,3) AS "mod(8,3)"	-- 나머지를 반환 
	, ceil(38.678) AS "ceil(38.678)"	-- 무조건 올림 
	, floor(38.678) AS "floor(38.678)"	-- 무조건 내림
	, round(38.678, 2) AS "round(38.678, 2)"	-- 소수점 2번쨰 자리에서 반올림 
	, trunc(38.678) AS "trunc(38.678)"	-- 0의자리에서 자름 
	, trunc(38.678, 1) AS "trunc(38.678, 1)" 	-- 1의자리에서 자름
	, trunc(38.678, 2) AS "trunc(38.678, 2)"	-- 2의자리에서 자름
	, trunc(38.678, 3) AS "trunc(38.678, 3)"	-- 3의자리에서 자름
FROM dual;

-- 날짜형 함수들
SELECT 
	  sysdate AS "sysdate"	-- 현재 년월일분초 출력 
	, EXTRACT(YEAR FROM sysdate) AS "EXTRACT (YEAR FROM sysdate)"	-- 년 출력 
	, EXTRACT(MONTH FROM sysdate) AS "EXTRACT (MONTH FROM sysdate)"	-- 달 출력 
	, extract(DAY FROM sysdate) AS "extract(DAY FROM sysdate)"		-- 일 출력 
	, to_number(to_char(sysdate, 'yyyy')) AS "to_number(to_char(sysdate, 'yyyy'))"	-- 년 출력 
	, to_number(to_char(sysdate, 'mm')) AS "to_number(to_char(sysdate, 'mm'))"		-- 달 출력 
	, to_number(to_char(sysdate, 'dd')) AS "to_number(to_char(sysdate, 'dd'))"		-- 일 출력 
	, to_number(to_char(sysdate, 'hh24')) AS "to_number(to_char(sysdate, 'hh24'))"	-- 시 출력 
	, to_number(to_char(sysdate, 'mi')) AS "to_number(to_char(sysdate, 'mi'))"		-- 분 출력 
	, to_number(to_char(sysdate, 'ss')) AS "to_number(to_char(sysdate, 'ss'))"		-- 초 출력 
	, to_char(sysdate, 'yyyy') AS "to_char(sysdate, 'yyyy')"	-- 년 출력(문자열)
	, to_char(sysdate, 'mm') AS "to_char(sysdate, 'mm')"		-- 달 출력(문자열)
	, to_char(sysdate, 'dd') AS "to_char(sysdate, 'dd')"		-- 일 출력(문자열)
	, to_char(sysdate, 'hh24') AS "to_char(sysdate, 'hh24')"	-- 시 출력(문자열)
	, to_char(sysdate, 'mi') AS "to_char(sysdate, 'mi')"		-- 분 출력(문자열)
	, to_char(sysdate, 'ss') AS "to_char(sysdate, 'ss')"		-- 초 출력(문자열)
FROM dual;

-- 날짜형 데이터 연산 함수
SELECT
	  sysdate AS "sysdate"											-- 현재 년월일 시분초
	, sysdate - 1 AS "sysdate - 1"									-- 1일을 뺀 년월일 시분초 
	, sysdate - (1/24) AS "sysdate - (1/24)"						-- 1시간을 뺀 년월일 시분초 
	, sysdate - (1/24/60) AS "sysdate - (1/24/60)"					-- 1분을 뺀 년월일 시분초 
	, sysdate - (1/24/60/60) AS "sysdate - (1/24/60/60)"			-- 1초를 뺀 년월일 시분초 
	, sysdate - (1/24/60/60) * 10 AS "sysdate - (1/24/60/60) * 10"	-- 10초를 뺀 년원일 시분초 
	, sysdate - (1/24/60/60) * 30 AS "sysdate - (1/24/60/60) * 30"	-- 30초를 뺀 년월일 시분초 
FROM dual;

-- 데이터 변환 함수 사용 예시
SELECT
	  to_char(sysdate, 'yyyy-mm-dd') AS "to_char(sysdate, 'yyyy-mm-dd')"						-- 
	, to_char(sysdate, 'yyyy-mm-dd hh24:mi:ss') AS "to_char(sysdate, 'yyyy-mm-dd hh24:mi:ss')"	-- 
	, to_char(10.25, '$999,999,999,99') AS "to_char(10.25, '$999,999,999,99')"					-- 
	, to_char(12500, 'L999,999,999') AS "to_char(12500, 'L999,999,999')"						-- 
	, to_number('100') + to_number('100') AS "to_number('100') + to_number('100')"				-- 
FROM dual;


-- 단일 행 CASE 표현의 종류
SELECT CASE
			WHEN sal_cd = '100001' THEN '기본급'
			WHEN sal_cd = '100002' THEN '상여급'
			WHEN sal_cd = '100003' THEN '특별상여급'
			WHEN sal_cd = '100004' THEN '야근수당'
			WHEN sal_cd = '100005' THEN '주말수당'
			WHEN sal_cd = '100006' THEN '점심식대'
			WHEN sal_cd = '100007' THEN '복지포인트'
			ELSE '유효하지 않다.'
			END sal_nm
FROM sqld.TB_SAL ts;

SELECT * FROM sqld.TB_SAL;
SELECT decode(sal_cd, '100001', '기본급', '100002', '상여급', '기타') AS sal_nm FROM sqld.TB_SAL;

SELECT * FROM sqld.TB_EMP;
SELECT nvl(direct_manager_emp_no, '최상위자'), EMP_NO, EMP_NM AS 관리자 FROM sqld.TB_EMP WHERE DIRECT_MANAGER_EMP_NO IS NULL;
SELECT nvl(upper_dept_cd, '최상위 부서') AS 상위부서 FROM sqld.TB_DEPT WHERE upper_dept_cd IS null;
SELECT nvl(max(EMP_nm), '존재안함') AS EMP_NM  FROM sqld.TB_EMP WHERE EMP_NM = '김회장';
SELECT nvl(max(EMP_NM), '존재안함') AS EMP_NM  FROM sqld.TB_EMP WHERE EMP_NM = '박찬호';
SELECT nvl(EMP_NM, '존재안함') AS EMP_NM  FROM sqld.TB_EMP WHERE EMP_NM = '박찬호';
-- max함수를 쓰면 공집합인 경우에도 한개의 row가 나온다.

-- 전부다 null이네 --> 널은 연산이 안되는구나.
SELECT (NULL+2) FROM dual;
SELECT (NULL-2) FROM dual;
SELECT (NULL*2) FROM dual;
SELECT (NULL/2) FROM dual;

SELECT NULLIF('박찬호', '박지성') FROM dual;	-- 같지 않다면 박찬호를 리턴한다.
SELECT nvl(NULLIF('박찬호', '박찬호'), '같다면 null') AS 흠흠흠 FROM dual;

-- null이 아닌 첫번째 수식/값을 리턴 함
SELECT COALESCE(NULL, NULL, 1) AS sal FROM dual;
SELECT COALESCE(NULL, NULL, 0) AS sal FROM dual;
SELECT COALESCE(5000, NULL, 0) AS sal FROM dual;
SELECT COALESCE(NULL, 6000, 0) AS sal FROM dual;