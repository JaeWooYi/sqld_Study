-- 2022/10/13 FRIDAY!!

SELECT * FROM sqld.TB_EMP;

-- TO_NUMBER : varchar가 숫자로 바꼇네?
SELECT FINAL_EDU_SE_CD, TO_NUMBER(FINAL_EDU_SE_CD) FROM sqld.TB_EMP;

-- TO_NUMBER : where절, order by절 모두 사용 가능
SELECT FINAL_EDU_SE_CD, TO_NUMBER(FINAL_EDU_SE_CD)
FROM sqld.TB_EMP
WHERE TO_NUMBER(FINAL_EDU_SE_CD) <= 6
ORDER BY TO_NUMBER(FINAL_EDU_SE_CD) ASC;

SELECT * FROM dual;
-- REPLACE : X를 1로 바꿔라
SELECT REPLACE(dummy, 'X', '1') FROM dual;
SELECT TO_NUMBER(REPLACE(dummy, 'X', '1')) FROM dual;	-- 문자를 다시 숫자로


-- 단일행 문자형 함수 사용 예시
SELECT
      LOWER('SQL Developer') AS "LOWER('SQL Developer')"				-- 소문자 변환
	, UPPER('SQL Developer') AS "UPPER('SQL Developer')"				-- 대문자 변환
	, ASCII('A') AS "ASCII('A')"										-- 아스코드값 출력
	, CHR('65') AS  "CHR('65')"											-- 아스키코드값의 문자 출력
	, CONCAT('SQL ', 'Developer') AS "CONCAT('SQL ', 'Developer')"		-- 문자열 결합
	, SUBSTR('SQL Developer', 1, 5) AS "SUBSTR('SQL Developer', 1, 5)"	-- 문자열 잘라내기
	, LENGTH('SQL') AS "LENGTH('SQL')"									-- 문자열의 길이 출력
	, LTRIM(' SQL') as "LTRIM(' SQL')"									-- 왼쪽 공백 제거
	, RTRIM('SQL ') as "RTRIM('SQL ')"									-- 오른쪽 공백 제거
	, TRIM(' SQL ') as "TRIM('SQL ')"									-- 오른쪽 공백 제거
	, LENGTH(RTRIM(' SQL ')) AS "진짜공백제거되었는지 길이로 확인"
FROM dual;

-- 단일행 숫자형 함수 사용 예시
SELECT
  	  ABS(-15) AS "ABS(-15)"					-- 절대값을 반환
	, SIGN(10) AS "SIGN(10)"					-- 양수일경우 1, 음수일경우 -1, 	0일경우 0 반환
	, MOD(8, 3) AS "MOD(8, 3)"					-- 나머지를 반환
	, CEIL(38.678) AS "CEIL(38.678)"			-- 무조건 올림
	, FLOOR(38.678) AS "FLOOR(38.678)"			-- 무조건 버림
	, ROUND(38.678) AS "ROUND(38.678)"			-- 소수점 0번째 자리에서 반올림
	, ROUND(38.678, 1) AS "ROUND(38.678, 1)"	-- 소수점 1번째 자리에서 반올림
	, ROUND(38.678, 2) AS "ROUND(38.678, 2)"	-- 소수점 2번째 자리에서 반올림
	, ROUND(38.678, 3) AS "ROUND(38.678, 3)"	-- 소수점 3번째 자리에서 반올림
	, TRUNC(38.678) AS "TRUNC(38.678)"  		-- 0의자리에서 무조건 자름
	, TRUNC(38.678, 1) AS "TRUNC(38.678, 1)"	-- 1의자리에서 무조건 자름
	, TRUNC(38.678, 2) AS "TRUNC(38.678, 2)"	-- 2의자리에서 무조건 자름
	, TRUNC(38.678, 3) AS "TRUNC(38.678, 3)"	-- 3의자리에서 무조건 자름
FROM dual;

-- 날짜형 데이터 변환 함수 사용 예시
SELECT
	  sysdate AS "sysdate"															-- 현재 년월시분초 출력
	, EXTRACT(YEAR FROM sysdate) AS "EXTRACT(YEAR FROM sysdate)"					-- 년 출력
	, EXTRACT(MONTH FROM sysdate) AS "EXTRACT(MONTH FROM sysdate)"					-- 월 출력
	, EXTRACT(DAY FROM sysdate) AS "EXTRACT(DAY FROM sysdate)"						-- 일 출력
	, TO_CHAR(SYSDATE, 'YYYY') AS "TO_CHAR(SYSDATE, 'YYYY')"						-- 년 출력(문자열)
	, TO_CHAR(SYSDATE, 'MM') AS "TO_CHAR(SYSDATE, 'MM')"							-- 월 출력(문자열)
	, TO_CHAR(SYSDATE, 'DD') AS "TO_CHAR(SYSDATE, 'DD')"							-- 일 출력(문자열)
	, TO_CHAR(SYSDATE, 'HH24') AS "TO_CHAR(SYSDATE, 'HH24')"						-- 시 출력(문자열)
	, TO_CHAR(SYSDATE, 'MI') AS "TO_CHAR(SYSDATE, 'MI')"							-- 분 출력(문자열)
	, TO_CHAR(SYSDATE, 'SS') AS "TO_CHAR(SYSDATE, 'SS')"							-- 초 출력(문자열)
	, TO_NUMBER(TO_CHAR(SYSDATE, 'YYYY')) AS "TO_NUMBER(TO_CHAR(SYSDATE, 'YYYY'))"	-- 년 출력
	, TO_NUMBER(TO_CHAR(SYSDATE, 'MM')) AS "TO_NUMBER(TO_CHAR(SYSDATE, 'MM'))"		-- 월 출력
	, TO_NUMBER(TO_CHAR(SYSDATE, 'DD')) AS "TO_NUMBER(TO_CHAR(SYSDATE, 'DD'))"		-- 일 출력
	, TO_NUMBER(TO_CHAR(SYSDATE, 'HH24')) AS "TO_NUMBER(TO_CHAR(SYSDATE, 'HH24'))"	-- 시 출력
	, TO_NUMBER(TO_CHAR(SYSDATE, 'MI')) AS "TO_NUMBER(TO_CHAR(SYSDATE, 'MI'))"		-- 분 출력
	, TO_NUMBER(TO_CHAR(SYSDATE, 'SS')) AS "TO_NUMBER(TO_CHAR(SYSDATE, 'SS'))"		-- 초 출력
FROM dual;

-- 날짜형 데이터 연산
SELECT
	  SYSDATE AS "SYSDATE"											-- 현재 년월일 시분초
	, SYSDATE - 1 AS "SYSDATE - 1"									-- 1일을 뺀 년월일 시분초
	, SYSDATE - (1/24) AS "SYSDATE - (1/24)"						-- 1시간을 뺀 년월일 시분초
	, SYSDATE - (1/24) * 7 AS "SYSDATE - (1/24) * 7"				-- 7시간을 뺀 년월일 시분초
	, SYSDATE - (1/24/60) AS "SYSDATE - (1/24/60)"					-- 1분을 뺀 년월일 시분초
	, SYSDATE - (1/24/60/60) AS "SYSDATE - (1/24/60/60)"			-- 1초를 뺀 년월일 시분초
	, SYSDATE - (1/24/60/60) * 10 AS "SYSDATE - (1/24/60/60) * 10"	-- 1O초를 뺀 년월일 시분초
	, SYSDATE - (1/24/60/60) * 30 AS "SYSDATE - (1/24/60/60) * 30"	-- 3O초를 뺀 년월일 시분초
FROM dual;