
-- DDL!(create, alter, drop, truncate)
-- DATA DEFINITION LANGUAGE

-- 테이블 지우기
DROP TABLE SQLD.TB_DEPT_TEMP PURGE;	-- PURGE -> 그냥 지우면 휴지통으로 가는데 퍼지 쓰면 완전 삭제 가능!
DROP TABLE SQLD.TB_EMP_TEMP PURGE;

-- 테이블 만들기
CREATE TABLE SQLD.TB_DEPT_TEMP
(
DEPT_CD char(6) NOT NULL,
DEPT_NM varchar(150) NOT NULL,
UPPER_DETP_CD char(6)
);

-- 조회
SELECT * FROM SQLD.TB_DEPT_TEMP;

-- TB_DEPT_TEMP테이블의 기본키 생성
ALTER TABLE SQLD.TB_DEPT_TEMP ADD CONSTRAINT PK_TB_DEPT_TEMP PRIMARY KEY (DEPT_CD);

-- 지우고 다시 SQLD.TB_DEPT_TEMP를 만들어 보자
CREATE TABLE SQLD.TB_EMP_TEMP
(
EMP_NO CHAR(10) NOT NULL
, EMP_NAME VARCHAR(150) NOT NULL
, BIRTH_DE CHAR(8) NOT NULL
, LUNAR_YN CHAR(1) NOT NULL
, SEX_CD CHAR(3) NOT NULL
, ADDR VARCHAR(1000) NOT NULL
, TEL_NO VARCHAR(150) NOT NULL
, FINAL_EDU_SE_CD CHAR(3) NOT NULL
, SAL_TRANS_BANK_CD CHAR(3) NOT NULL
, SAL_TRANS_ACCNT_NO VARCHAR(20) NOT NULL
, DIRECT_MANAGER_EMP_NO CHAR(10)
, DEPT_CD CHAR(6) NOT NULL
);
-- PK를 지정해보자
ALTER TABLE SQLD.TB_EMP_TEMP ADD CONSTRAINT PK_TB_EMP_TEMP PRIMARY KEY (EMP_NO);
-- 참조 무결성 제약 조건을 걸어보자
ALTER TABLE SQLD.TB_EMP_TEMP ADD CONSTRAINT FK_TB_EMP_TEMP_01 FOREIGN KEY (DEPT_CD) REFERENCES SQLD.TB_DEPT_TEMP (DEPT_CD);

-- 컬럼 추가
ALTER TABLE SQLD.TB_EMP_TEMP ADD (MARRIED_YN CHAR(1));
SELECT MARRIED_YN FROM SQLD.TB_EMP_TEMP;

-- 컬럼 삭제
ALTER TABLE SQLD.TB_EMP_TEMP DROP COLUMN MARRIED_YN;

-- 다시 컬럼 추가해보고 수정 까지 완료 해보자.
ALTER TABLE SQLD.TB_EMP_TEMP ADD(MARRIED_YN CHAR(1));
ALTER TABLE SQLD.TB_EMP_TEMP MODIFY(MARRIED_YN CHAR(1) DEFAULT 'N' NOT NULL NOVALIDATE);
SELECT * FROM SQLD.TB_EMP_TEMP;
ALTER TABLE SQLD.TB_EMP_TEMP DROP COLUMN MARRIED_YN;

-- RENAME COLUMN을 해보자
CREATE TABLE SQLD.TB_EMP_TEMP_2 AS SELECT *FROM SQLD.TB_EMP_TEMP;	---> 테이블 백업할때 아주 유용할 것 같아.
ALTER TABLE SQLD.TB_EMP_TEMP_2 RENAME COLUMN TEL_NO TO PHONE_NO;
SELECT * FROM SQLD.TB_EMP_TEMP_2;
ALTER TABLE SQLD.TB_EMP_TEMP_2 RENAME COLUMN PHONE_NO TO TEL_NO;

-- DOP CONSTRAINT
ALTER TABLE SQLD.TB_EMP_TEMP DROP CONSTRAINT FK_TB_EMP_TEMP_01;

-- ADD CONSTRAINT
ALTER TABLE SQLD.TB_EMP_TEMP ADD CONSTRAINT FK_TB_EMP_TEMP_01 FOREIGN KEY (DEPT_CD) REFERENCES SQLD.TB_DEPT_TEMP (DEPT_CD);

-- RENAME TABLE을 해보자. 왜 안되냐 ... 실습을 위해 마우스로 클릭해서 바꿔보자....
SELECT * FROM SQLD.TB_EMP_TEMP_2;
--RENAME TB_EMP_TEMP_2 TO TB_EMP_TEMP_3;
--ALTER TABLE TB_EMP_TEMP_2 TO TB_EMP_TEMP_3;
-- 요거로 해야하네..
ALTER TABLE SQLD.TB_EMP_TEMP_2 RENAME TO TB_EMP_TEMP_3;
ALTER TABLE SQLD.TB_EMP_TEMP_3 RENAME TO TB_EMP_TEMP_2;
SELECT * FROM SQLD.TB_EMP_TEMP_3;

-- 테이블의 데이터를 비워보자.	-- rollback 불가능하니까 조심해(truncate사용할 시) --> DELETE 사용하면 복구 할 수 있데.
TRUNCATE TABLE SQLD.TB_EMP_TEMP_3;

-- 테이블을 제거 해보자.
DROP TABLE SQLD.TB_EMP_TEMP_3;