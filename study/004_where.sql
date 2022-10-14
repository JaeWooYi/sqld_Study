-- 2022/09/11 SUNDAY

SELECT * FROM tb_emp;

SELECT * FROM TB_EMP A
WHERE A.BIRTH_DE BETWEEN '19900101' AND '19991231'
AND A.DEPT_CD IN ('100004','100006')	-- 디자인팀, 데이터팀
AND a.addr LIKE '%수원시%';

SELECT * FROM TB_EMP A
WHERE A.BIRTH_DE BETWEEN '19900101' AND '19991231'
AND A.DEPT_CD IN ('100004','100006')	-- 디자인팀, 데이터팀
AND (a.addr LIKE '%수원시%' OR a.addr LIKE '%성남시%');

SELECT * FROM TB_EMP A
WHERE A.BIRTH_DE BETWEEN '19900101' AND '19991231'
AND A.DEPT_CD IN ('100004','100006')	-- 디자인팀, 데이터팀
AND NOT (a.addr LIKE '%수원시%' OR a.addr LIKE '%성남시%');

SELECT * FROM TB_EMP A
WHERE A.BIRTH_DE not BETWEEN '19900101' AND '19991231'
AND A.DEPT_CD NOT IN ('100004','100006')	-- 디자인팀, 데이터팀
AND a.sex_cd <> '1'	-- 성별이 남자가 아니고 인데.... <> 이게 뭘 말하는 거지 --> 같지 않음을 표현하는 것이구나....
and DIRECT_MANAGER_EMP_NO IS NOT null;

-- 박씨만 보자
SELECT * FROM tb_emp a
WHERE a.EMP_NM LIKE '박__';

-- null인거 보기
SELECT a.EMP_NO
	, a.EMP_NM 
	, a.BIRTH_DE 
	, a.LUNAR_YN 
	, a.SEX_CD 
	, a.ADDR 
	, a.TEL_NO 
	, a.FINAL_EDU_SE_CD 
	, a.SAL_TRANS_BANK_CD 
	, a.SAL_TRANS_ACCNT_NO 
	, nvl(a.DIRECT_MANAGER_EMP_NO, '상사 없음') DIRECT_MANAGER_EMP_NO 
	, a.DEPT_CD 
FROM TB_EMP a
WHERE a.DIRECT_MANAGER_EMP_NO IS null;	-- null은 '='로 비교 할 수 없다.

SELECT * FROM sqld.TB_SAL_HIS;

SELECT * FROM sqld.TB_SAL_HIS z
WHERE z.PAY_DE >= '20200501'
AND z.PAY_DE  <= '20200531'
AND z.PAY_AMT >= 5500000;

SELECT * FROM sqld.TB_SAL_HIS z
WHERE z.PAY_DE >= '20200501'
AND z.PAY_DE  <= '20200531'
AND NOT z.PAY_AMT >= 5500000;

SELECT * FROM TB_EMP;
SELECT * FROM TB_EMP z
WHERE z.BIRTH_DE BETWEEN '19900101' AND '19991231'
AND z.DEPT_CD IN ('100004', '100006')
AND z.SEX_CD <> '1';

------------------------------------------------------------------------------------

DROP TABLE sqld.char_compare;

CREATE TABLE sqld.char_compare
	(
	sn char(10)
	, char_compare_4 char(4)
	, char_compare_6 char(6)
	);

INSERT INTO SQLD.char_compare (sn, char_compare_4, char_compare_6) VALUES ('1000000001', 'sqld', 'sqld');
INSERT INTO SQLD.char_compare (sn, char_compare_4, char_compare_6) VALUES ('1000000002', 'sqld', 'sqld');

SELECT * FROM SQLD.char_compare;
SELECT 
	REPLACE(char_compare_4, ' ', '_') AS char_compare_4
	, REPLACE(char_compare_6, ' ', '_') AS char_compare_6  
FROM sqld.char_compare;

SELECT 
	REPLACE(char_compare_4, ' ', '_') AS char_compare_4
	, REPLACE(char_compare_6, ' ', '_') AS char_compare_6  
FROM sqld.char_compare
WHERE sn = '1000000002'
AND char_compare_4 > char_compare_6;

------------------------------------------------------------------------------------

DROP TABLE sqld.varchar_compare;

CREATE TABLE sqld.varchar_compare
	(
	sn char(10)
	, char_compare_4 char(4)
	, varchar_compare_6 varchar(6)
	);

INSERT INTO sqld.varchar_compare (sn, char_compare_4, varchar_compare_6) VALUES ('1000000001', 'sqld', 'sqld');
INSERT INTO sqld.varchar_compare (sn, char_compare_4, varchar_compare_6) VALUES ('1000000002', 'sqld', 'sqld');

UPDATE sqld.varchar_compare set varchar_compare_6 ='sqld  ' WHERE sn = '1000000001' AND sn = '1000000002';

SELECT
	REPLACE (char_compare_4 ,' ','_') AS varchar_compare_4
	, REPLACE (varchar_compare_6, ' ', '_') AS varchar_compare_6
FROM SQLD.varchar_compare;

SELECT
	REPLACE (char_compare_4, ' ', '_') AS varchar_compare_4 
	, REPLACE (varchar_compare_6, ' ', '_') AS varchar_compare_6
FROM sqld.varchar_compare
WHERE sn = '1000000001'
AND char_compare_4 = varchar_compare_6;

------------------------------------------------------------------------------------

SELECT
	REPLACE (char_compare_4, ' ', '_') AS varchar_compare_4,
	REPLACE (varchar_compare_6, ' ', '_') AS varchar_compare_6
FROM sqld.varchar_compare
WHERE sn = '1000000001'
AND char_compare_4  = 'sqld';

SELECT
	REPLACE (char_compare_4, ' ', '_') AS varchar_compare_4,
	REPLACE (varchar_compare_6, ' ', '_') AS varchar_compare_6
FROM sqld.varchar_compare
WHERE sn = '1000000001'
AND varchar_compare_6  = 'sqld  ';

SELECT
	REPLACE (char_compare_4, ' ', '_') AS varchar_compare_4,
	REPLACE (varchar_compare_6, ' ', '_') AS varchar_compare_6
FROM sqld.varchar_compare
WHERE sn = '1000000001'
AND trim(varchar_compare_6)  = 'sqld  ';	-- trim : 공백 제거

------------------------------------------------------------------------------------

-- 집합의 일부분만 출력
SELECT * FROM sqld.TB_SAL_HIS z
WHERE z.PAY_DE >= '20200501'
AND z.PAY_de <= '20200531'
AND rownum <= 10	-- 먼저나온 10건
ORDER BY z.PAY_AMT DESC;

-- 집합의 일부분만 출력
SELECT * FROM
(
	SELECT * FROM sqld.TB_SAL_HIS z
	WHERE z.pay_de >= '20200501'
	AND z.pay_de <= '20200531'
	ORDER BY z.pay_amt desc
) A 
WHERE rownum <=10;