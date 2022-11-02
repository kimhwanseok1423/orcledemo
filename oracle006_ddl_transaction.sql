/*==========================================================
오라클에서 제공되는 명령어
1 DQL(Data Query Language 데이터 질의어) : 
  데이터를 검색해서 추출할때 사용된다.(select)
2 DML(Data Manipulation Language 데이터 조작어) : 
  데이터는 추가, 수정, 삭제,병합해주는 명령어들이다.
  (insert, update, delete,merge)
3 DDL(Data Definition Language 데이터 정의어 ) : 
  테이블의 구조를 정의, 변경해주는 명령어들이다.
  (create, drop, alter, truncate)
4 DCL(Data Control Language 데이터 제어어) : 
  사용자의 권한을 부여,제거해주는 명령어들이다.(grant ,revoke)
5 TCL(Transaction Control Language 트랜잭션 처리어) : 
  트랜잭션 설정,취소을 처리해주는 명령어들이다
  (commit, rollback, savepoint)
==========================================================*/
drop table emp01;

--테이블 구조를 복사
CREATE TABLE emp01
AS
SELECT first_name,salary
from employees
where 1=0;

--테이블의 구조
DESC emp01;

select*from emp01;

/*
테이블 삽입
Insert into table_name(column_nm
*/


INSERT INTO emp01(first_name,salary)
values('candy',5000);

select*from emp01;
--테이블 모든 컬럼에 데이터를 삽입할떄는 컬럼명을 생략할수 있다.
INSERT INTO emp01
values('Steven',4000);

select *from emp01;

--묵시적 NULL 삽입방법
Insert into emp01(first_name)
values('Lex');

select*from emp01;

--명시적 NULL 삽입방법
INSERT INTO emp01
values('Paran',null);

select*from emp01;

/*
테이블의 내용을 수정
update 테이블명
set 컬럼이름 column_name=value,column_name=value
where column_name=value;
*/

-- emp01 테이블에서 first_name컬럼의 값이 'candy'일때 
-- salary 컬럼의 값을 8000으로 업데이트 하세요
Update emp01
SET salary=8000
where first_name='candy';

select * from emp01;

/*
테이블의 내용을 삭제
delete from table_name
where column_name=value;
*/

--emp01테이블에서 first_name컬럼의 값이 'candy'일때 삭제하세요
DELETE FROM emp01
where first_name='candy';

select *from emp01;

/*======================================
트랜잭션(Transaction)
1 트랜잭션 정의
  -한번에 수행되어야 할 데이터베이스의 일련의 Read와
   Write 연산을 수행하는 단위
  -하나의 논리적 기능을 수행하기 위한 작업의 단위로서
  데이터베이스의 일관된 상태를 또 다른 일관된 상태로
  변환시킴
  
  트랜잭션시작-> 수정->삭제->삽입 -> 트랜잭션종료
  하나의 작업이 시작해서 정상적으로 종료될때까지의 과정을 말한다.
  (논리적인 작업단위)
  
  은행(ATM)->기계 카드삽입-> 기계가 카드를 읽음->
  인출금액 입력-> 비밀번호 입력-> 기계에서 출금액 처리
  -> 출금금액 제공-> 카드제공
  
  <트랜잭션 시작>
  -데이터베이스에 처음 접속했을 때
  -하나 또는 여러 개의 DML문이 실행된후 commit 또는 rollback
   문이 실행된 직후
  
   <트랜잭션 종료>
  - commit 또는 rollback문이 실행될때
  - DDL 또는 DCL문이 실행될 때
  - 정상적으로 데이터베이스를 종료할때
  - 비정상적으로 데이터베이스를 종료할때
  
2 트랜잭션 안전성 확보를 위한 ACID  *외워야 하는것*
  1) ACID정의 
     -데이터베이스에서 논리적인 작업단위인 트랜잭션이
       안전하게 수행되는 것을 보장하는 특성집합
  2) ACID의 필요성
     -다중 사용자 환경 대응 :동일데이터-다중작업환경에서의
          데이터 처리 정확성 보장
     -안전한 트랜잭션 수행을 통한 데이터베이스 무결성 유지
  3) 트랜잭성 구성요소   
    Atomicity(원자성):
     -트랜잭션은 한 개 이상의 동작을 논리적으로 한 개의
      작업단위(single unit of work)로서 분해가
      불가능한 최소의 단위
     -연산 전체가 성공적으로 처리되거나 또는 한 가지라도
      실패할 경우 전체가 취소되어 무결성을 보장
      (All or Nothing)
    Consistency(일관성):
    -트랜잭션이 실행을 성공적으로 완료하면 언제나 모순 없이
     일관성 있는 데이터베이스 상태를 보존함
    - 테이블의 데이타는 갱신되고 그에 따른 인덱스는 갱신되지 않는 등의 부정합이 있어선 않된다.
    Isolation(고립성,독립성):
    -트랜잭션이 실행 중에 생성하는 연산의 중간 결과를
     다른 트랜잭션이 접근할 수 없음
   -커밋된 트랜잭션은 장애가 발생해도 데이타가 복구되여야 한다는 특성.
   Durability(영속성,지속성,내구성):
    -성공이 완료된 트랜잭션의 결과를 영구적으로 데이터베이스에
     저장됨
========================================================================================*/
/*자동커밋 설정 확인(SQL Developer)
도구>환경설정>데이터베이스>객체뷰어> 행변경시 사후편집, 자동커밋 설정 체크 해제 */
select * from emp01;
select * from hr.emp01;
SELECT *FROM user_tables;
select table_name from user_tables;
select table_name from user_tables
where table_name='EMP01';

commit;

INsert Into emp01
values('Beata',7000);
commit;


select* from emp01;

INsert into emp01
values('John',2000);

Savepoint sp;

delete from emp01
where first_name='Beata';

select*from emp01;

rollback to sp;

select *from emp01;

CREATE TABLE emp02(
emp_id number primary key, /* NOT NULL+ unique */
first_name varchar2(50),
salary number
); --ddl에 있는 명령어를 쓰면 자동 커밋이 됨

commit;
select *from emp02;
-- A세션
INSERT INTO emp02
VALUES(1,'park',9000);

select * from emp02;
--B세션
INSERT INTO emp02
VALUES(1,'park',9000);
/* waiting상태가 됨 (Lock 상태 발생)                    */
select *from emp02;

--A세션
commit;

--B세션
--A세션이 commit이 되면 b세션은 해당 행에 대한 Lock상태가 해제가 되면서 오류메세지 출력
--ORA-00001: unique constraint (HR.SYS_C006999) violated

select*from emp02;

delete from emp02
where emp_id=2;

Insert into emp02
values(2,'dong',8000);
commit;


--a세션
--1 행이 삽업되었습니다
commit;

--B세션
SELECT *FROM emp02; /* 2 dong 8000확인 */
