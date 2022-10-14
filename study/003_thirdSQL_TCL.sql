
-- 1. 트랜잭션은 데이터베이스의 논리적 연산단위이다.
-- 2. 하나의 트랜잭션에는 하나 이상의 SQL문장이 포함 된다. 트랜잭션을 분할할 수 없는 최소의 단위이다.
--    그렇기 때문에 전부 적용하거나 전부 취소한다. 즉, TRANSACTION은 ALL OR NOTHIN의 개념.

-- 특성 - 원자성(atomicity), 일관성(consistency), 고립성(isolation), 지속성(durability)
--       원자성(atomicity) : 트랜잭션이 정의된 연산들은 모두 성공적으로 끝나거나 모두 실패 해야함.
--       일관성(consistency) : 트랜잭션이 실행되기 전의 데이터베이스의 내용이 잘못되어있지 않다면 실행된 이후 데이터베이스의 내용에 잘못이 있으면 안된다.
--       고립성(isolation) : 트랜잭션이 실행되는 도중 다른 트랜젝션의 영향을 받아 잘못된 결과를 만들어서는 안된다.
--       지속성(durability) : 트랜잭션이 성공적으로 수행되면 그 트랜잭션이 갱신한 데이터베이스의 내용은 영구적으로 저장된다.

-- COMMIT명령어를 통해 트랜잭션을 완료 할 수 있다.
-- ROLLBACK 커밋 이전상황으로 돌아갈 수 있다.

-- 1. 
-- SAVEPOINT(저장점) : 저장점을 정의하면 롤백 할 때 트랜잭션에 포함된 전체 작업을 롤백하는것이 아니라 현 시점에서
--                   SAVEPOINT까지 트랜잭션을 일부만 롤백 할 수 있다.
-- 2. 
-- 복잡한 대규모 트랜잭션에서 에러가 발생 했을 때, SAVEPOINT까지의 트랜잭션만 롤백하고 실패한 부분에 대해서만 다시 실행


-- TCL(TRANSACTION CONTROL LANGUAGE)

INSERT INTO sqld.TB_CERTI T (T.CERTI_CD, T.CERTI_NM, T.ISSUE_INSTI_NM)
VALUES ('100022', 'Have sql skill', 'Fast Campas');
COMMIT;

SELECT  * FROM sqld.TB_CERTI a WHERE a.CERTI_CD = '100022';

UPDATE sqld.TB_CERTI SET CERTI_NM = 'sql exp'
WHERE CERTI_CD = '100022';

COMMIT;

DELETE FROM SQLD.TB_CERTI WHERE CERTI_CD = '100022';
COMMIT;


-- savepoint설정
SAVEPOINT svpt1;

INSERT INTO sqld.TB_CERTI t (t.CERTI_CD, t.CERTI_NM, t.ISSUE_INSTI_NM)
VALUES ('100023', 'good sql skill', 'fast campas');

UPDATE SQLD.TB_CERTI SET CERTI_NM = 'bad sql skill'
WHERE CERTI_CD = '100023';

ROLLBACK TO svpt1;

SELECT * FROM SQLD.TB_CERTI WHERE CERTI_CD = '100023';

DELETE FROM sqld.TB_CERTI tc WHERE tc.CERTI_CD = '100023';

SELECT * FROM SQLD.TB_CERTI WHERE CERTI_CD = '100023';

COMMIT;

------------------------------------------------------------------------------------------------

SELECT * FROM sqld.TB_CERTI;

SAVEPOINT sp1;

INSERT INTO sqld.TB_CERTI a (a.CERTI_CD, a.CERTI_NM, a.ISSUE_INSTI_NM)
values('100024', 'KKK', 'Fast Campas');

SAVEPOINT sp2;

UPDATE SQLD.TB_CERTI SET CERTI_NM = 'ZZZ'
WHERE CERTI_CD = '100024';

SAVEPOINT sp3;

DELETE FROM sqld.TB_CERTI WHERE CERTI_CD = '100024';

ROLLBACK TO sp3;
SELECT * FROM SQLD.TB_CERTI WHERE CERTI_CD = '100024';

ROLLBACK to sp2;
SELECT * FROM sqld.TB_CERTI WHERE CERTI_CD ='100024';

ROLLBACK TO sp1;
SELECT * FROM sqld.TB_CERTI WHERE CERTI_CD = '100024'; 