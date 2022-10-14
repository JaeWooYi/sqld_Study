
-- DML!(select, insert, update, delete)
-- DATA MULTIPULATION LANGUAGE

INSERT INTO SQLD.TB_CERTI T(T.CERTI_CD, T.CERTI_NM, T.ISSUE_INSTI_NM)
VALUES ('100021', 'SQLD PASS', 'FAST CAMPAS');

SELECT * FROM SQLD.TB_CERTI A WHERE A.CERTI_CD = '100021';

UPDATE SQLD.TB_CERTI A SET A.ISSUE_INSTI_NM = 'FAST CAMPAS ONLINE'
WHERE A.CERTI_CD = '100021';

DELETE FROM SQLD.TB_CERTI A WHERE A.CERTI_CD = '100021';

SELECT * FROM SQLD.TB_CERTI tc;

-- DISTINCT : ISSUE_INSTI_NM 칼럼값 기준으로 중복을 제거한 유일한 값만을 출력한다.
SELECT DISTINCT A.ISSUE_INSTI_NM FROM SQLD.TB_CERTI A;
SELECT DISTINCT ISSUE_INSTI_NM FROM SQLD.TB_CERTI;

-- alias 지정 : as를 이용해 컬럼의 이름을 지정할 수 있다.
SELECT a.certi_cd AS 자격증코드
, a.certi_nm AS 자격증명
, a.issue_insti_nm AS 발급기관명
FROM SQLD.TB_CERTI A;

-- 합성 연산자를 이용한 문자열 연결
-- || 를 통해 문자열을 연결 할 수 있구나.
SELECT a.certi_nm || '(' || a.certi_cd || ')' || '-' || a.issue_insti_nm AS certi_info
FROM sqld.TB_CERTI a;

-- DUAL테이블을 이용한 연산 수행
-- DUAL테이블 -> 더미 테이블 : 오라클에서 기본적으로 만들어져 있는 테이블
SELECT ((1+1) * 3) / 6 AS calc_result FROM dual;