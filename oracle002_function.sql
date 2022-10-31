/*

단일행 함수: 행 하나당 하나의 결과를 출력한다.
            (문자함수 ,숫자함수 ,날짜함수 변환함수 ,일반함수)
복수행함수  행 여러개당 하나의 결과를 출력한다.
           (합계,평균,최대 최소 갯수)

===========================================================

SELECT문에서는 반드시 테이블명을 명시해야한다.
그래서 SELECT절에 식이나 특정함수를 이용해서 결과값을 가져올때
사용할수있는 dual 테이블을 제공하고있다.


*/
SELECT 1+1 
from  dual;

SELECT sysdate
from dual;

--------------------

--문자함수

----------------------------
--단어의 첫글자만 대문자로 변경해주는 함수이다.
SELECT initcap('korea')
from dual;

--모든 문자를 대문자로 변경해주는 함수이다.
SELECT upper('korea')
from dual;

--
Select first_name,upper(first_name),last_name,upper(last_name)
from employees;


--모든 문자를 소문자로 변경해 주는 함수이다.
select first_name,lower(first_name),last_name,lower(last_name)
from employees;

--employees 테이블 first_name에서 대소문자 구별없이
--'Ja"가 포함된 first_name,salary을 출력하라.
SELECT first_name,salary
from employees
where upper(first_name) LIKE upper('%Ja%');

--문자의 길이를 리턴해 주는 함수이다.
SELECT length('korea')
from dual;

SELECT length('한글')
from dual;

create TABLE user1(
data varchar2(5)
);

DESC user1;

SELECT * from user1;

Insert into user1(data)
values('korea');

select*from user1;

insert into user1(data)
values('south korea');

insert into user1(data)
values('한글');

--특정범위의 문자를 추출해 주는 함수이다.
--substr('문자'ㅡ시작위치,갯수)
SELECT substr('oracle test',3,4)
from dual;

SELECT substr('oracle test',-3,4)
from dual;

select substr('오라클 테스트',3,4)
from dual;

--특정문자의 인덱스를 추출해주는 함수이다.
SELECT instr('korea','or')
from dual;

--주어진 문자열에서 왼쪽으로 특정문자를 채우는 함수이다.
SELECT rpad('korea',8,'*')
from dual;

--주어진 문자열에서 왼쪽의 특정문자를 삭제하는 함수이다.
select ltrim('***korea','*')
from dual;

--주어진 문자열에서 오른쪽의 특정문자를 삭제하는 함수이다.
SELECT rtrim('korea***','*')
from dual;

--주어진 문자열에서 양쪽 특정문자를 삭제하는 함수이다.
SELECT trim('*' from '***korea***')
from dual;

--주어진 문자열에서 왼쪽의 공백제거 
SELECT ltrim('     korea')
from  dual;

--주어진 문자열에서 왼쪽 공백제거
select '   korea', length('   korea'), ltrim('   korea'),length(ltrim('   korea'))
from dual;

--주어진 문자열에서 오른쪽의 공백제거
select '   korea', length('korea   '), rtrim('korea   '),length(rtrim('korea   '))
from dual;

--주어진 문자열에서 양쪽의 공백제거
Select trim(' ' from '   korea   '),length(trim(' ' from '   korea   '))
from dual;

--주어진 문자의 아스키 코드값을 구하는 함수이다.
SELECT ascii('A')
from dual;

--주어진 아스키 코드값의 문자를 구하는 함수이다.
SELECT chr(65)
from dual;

--주어진 문자를 연결하는 함수이다.
select concat('java','jsp')
from dual;

select 'java' || 'jsp'
from dual;

/*------------------
숫자함수
---------------------*/

--3.55을 소수점 1의 자리까지 구하시오(반올림)

SELECT round(3.55,1)
from dual;

--42523을 십의 자리까지 구하시오(반올림)
select round(42523.55,-1)
from dual;

--256.78을 무조건 올림한다.(올림)
SELECT ceil(256.78) --자리 지정이안됨
from dual;

--258.78에서 소수이하는 무조건 버린다.
SELECT floor(258.78)
from dual;
--2의 3승
select power(2,3)
from dual;

select sqrt(25)
from dual;

--나머지
select mod(10,3)
from dual;


/*----------------
날짜함수
--------------------*/

--현재 시스템에서 제공해주는 오늘의 날짜 구하는 함수
SELECT sysdate
from dual;

select sysdate +1
from dual;

select sysdate -1
from dual;

--오늘을 기준으로 10개월후의 날짜
select add_months(sysdate,10)
from dual;

/*-----------------------------0000000000000000000000000000000000
변환형 함수


숫자                      문자                  날짜
to_number( )  <->       to_char()  <->         to_date()


--------------------------------------------------------------*/
select to_char(2532,'9,999.99')
from dual;
select to_char(2532,'999,999.99')
from dual;

select to_char(2532,'000,000.00')
from dual;

--r각 나라의 통화를 표현 줄 때 L기호를 사용한다.
SELECT to_char(2532,'L999,999.99')
from dual;

--날짜 ->문자
SELECT to_char(sysdate,'yyyy-mm-dd hh:mi:ss day') /*12시간, day"월요일*/
from dual;

SELECT to_char(sysdate,'yyyy-mm-dd hh:mi:ss dy') /*12시간, day"월*/
from dual;
SELECT to_char(sysdate,'yyyy-mm-dd hh24:mi:ss day') /*24시간, dy"월*/
from dual;

/*----------------------
to_number()
문자 ->숫자

-------------------------*/
SELECT '253' || '12'
FROM dual;

SELECT concat('253','12')
from dual;

select '253'+'12'
from dual;  --265

SELECT to_number('253')+to_number('12')
from dual;  --265
/*----------------------
to_number()
문자 ->날짜
-------------------------*/
SELECT to_date('2022-10-14')
from dual;
---------------------------------------

select first_name,hire_date
from employees;

--hire_date입사일을 이용해서 홍길동님은 2003년 1월 3일에 입사했습니다.로 출력하는 
--query을 작성하시오


SELECT first_name || '님은' || to_char(hire_date,'yyyy')|| '년' || ltrim(to_char(hire_date,'mm'),'0')
||'월' || ltrim(to_char(hire_date,'dd'),'0') || '일에 입사했습니다.'
from employees;

/*-----------------------------------------------
일반함수(NULL)
1.nvl(컬럼,대채값):첫번째 인자값이 null이면 0으로 대채해서 출력한다.
-대채할 값이 숫자이면 두번째 인자값에 숫자를 지정한다.
-대채할 값이 문자이면 두번째 인자값에 문자를 지정한다.
-대채할 값이 날짜이면 두번째 인자값에 날짜를 지정한다.
------------------------------------------------*/

SELECT commission_pct,nvl(commission_pct,0)
from employees;

Select first_name,manager_id,nvl(to_char(manager_id),'CEO')
from employees;

/*-----------------------------------------------
일반함수(NULL)
2.nv12(컬럼,대채값1,대체값2):컬럼의 값이 null아니면  대채값1,null이면 대채값2로 출력한다.
------------------------------------------------*/
SELECT commission_pct,nvl2(commission_pct,1,0)
from employees;

SELECT count(*) AS 전체사원수,sum(nvl2(commission_pct,1,0)) AS "커미션지급 사원수",count(*)-sum(nvl2(commission_pct,1,0)) AS "커미션미지급 사원수"
from employees;

/*-----------------------------------------------
일반함수(NULL)
3.NULLIF(컬럼,대체값)

------------------------------------------------*/
SELECT commision_pct,NullIF(commission_pct,0.4)
from employees;

---------------------------------------------------------------
일반함수 (NULL)
4.coalesce(컬럼1,컬럼2)
-----------------------------------------------------------
SELECT first_name,commission_pct,salary,coalesce(commission_pct,salary)
from employees;

SELECT first_name,commission_pct,commission_pct,coalesce(commission_pct,commission_pct)
from employees;

/*-----------------------------------------------------------------------
decode(컬럼 ,값1,처리1,값2,처리2,그밖의 처리)
java의 switch~case문과 비슷
---------------------------------------------------------------------
--department_id이 10이면 'ACCOUNTTING',20이면 'RESEARCH',30이면 'SALES',40이면 'operatons','others' */

SELECT first_name,department_id,
decode(department_id,10,'ACCOUNTING',
                     20,'RESEARCH',
                     30,'SALES',
                     40,'OPERATIONS','OTHERS')AS department_name
From employees;                     

-- 직급이 'PR_REP'인 사원은 5% , 'SA_MAN'인 사원은 10%, AC_MEG인 사원은 15%, PU_CLERK 인 사원은 20%을 인상
SELECT job_id,salary,decode(job_id,'PR_PER',salary*1.05,
                                    'SA_MAN',salary*1.1,
                                    'AC_MEG',salary*1.15,
                                    'PU_CLERK',salary*1.2,salary) AS newsal
from employees;                                    

/*-------------------------------------------------------------------------------------------
case when 조건식1 then 처리1,
     when 조건식2 then 처리2
     when 조건식3 then 처리3
     else 처리n
end AS alias;

java 다중 if-else문과 비슷
====----------------------------------*/
입사일(hire_date) 1-3이면 1사분기 4-6이면 2사분기
7-9이면 3사분기     10-12이면 4사분기
로 처리를 하고 사원명 입사일 분기로 출력하시오

select first_name,hire_date,
case when to_char(hire_date,'mm')<=3 then '1사분기'
      when to_char(hire_date,'mm')<=6 then '2사분기'
       when to_char(hire_date,'mm')<=9 then '3사분기'
        when to_char(hire_date,'mm')<=12 then '4사분기'
        end as "분기"
   from employees;     

--salary 값이 만 미만이면 하 10000~20000이면 중,20000이상이면 상
SELECT first_name,salary,
          case when salary<10000 then '하'
               when salary<20000 then '중'
               else '상'
               end as "구분"          
from employees;

/*-----------------------------------------------
집계함수 ,그룹함수
max([DISTINCT | [ALL] 컬럽):최대
min([DISTINCT | [ALL] 컬럽):
최소
count([DISTINCT | [ALL] 컬럽): 갯수
sum([DISTINCT | [ALL] 컬럽) :합계
avg([DISTINCT | [ALL] 컬럽) :평균
stddev([DISTINCT | [ALL] 컬럽) :표준편차
varian([DISTINCT | [ALL] 컬럽) :분산
------------------------------------------------*/
select max(salary),min(salary),count(salary),sum(salary),avg(salary),stddv(salary),var(salary)
from employees;

--null값이 아닌 레코드 수를 리턴
SELECT count(commission_pct)
from employees;

SELECT count(employee_id)
from employees;

select count(*)
from employees;

select DISTINCT count (commission_pct)
from employees;

select count(ALL commission_pct)
from employees

-- 집계함수와 단순칼럽은 함께 사용할 수없ㅂ다.  출력되는 레코드의 수가 틀리기 떄문
select first_name,count(*)
from employees;
--그룹함수와 단순컬럼을 사용하귀 이해서는 단순컬럼을 그룹화 해야 한다.
select department_id, count(*)
from employees;
group by department_id
order by department_id;
--50이하인 부서번호에 대해서 null이 아닌 부서별의 직원수를 출력
select department_id,count(*)
from employees
where department_id<=50
And department_id is not null
group by department_id;

select department_id,count(*)
from employees
where department_id is not null
group by department_id
having department_id<=50;

--부서별으 ㅣ직원수가 5이하인  경우만 출력
select department_id,count(*)
from employees
group by department_id
having count(*)<=5;

--업무별 급여합계를 출력하시오
select job_id,sum(salary)
from employees
group by job_id;


--부서별 최소급여 최대급여
select department_id,min(salary),max(salary)
from employees
group by department_id
having min(salary) !=max(salary)
order by department_id;

--내림차순으로 정렬하면 null이 최상위에 출력된다.
select department_id
from employees
order by department_id desc;

 /*
    ROWNUM
    1.oracle의 select문 결과에 대해서 논리적인 일련번호를 부여한다.
    2.ROWNUM은 조회되는 행수를 제한할 때 많이 사용한다.
    3. rownum=1,rownum<=3 (가능)
       rownum=3,rownum>=3 (불가능)
    */
    
    select rownum,first_name,salary
    from employees;

select rownum,first_name,salary
from employees
where rownum <=3; --O

select rownum,first_name,salary
from employees
where rownum =1 ; --O

select rownum,first_name,salary
from employees
where rownum =3 ; --X

select rownum,first_name,salary
from employees
where rownum >=3 ; --X


/*
ROWID
1.oracle 에서 데이터를 구분할 수있는 유일한 값이다.
2.select문에서 rowid를 사용할수있따.
3.rowid을 통해서 데이터가 어떤 데이터파일,어느 블록에 저장되어 있는지 알수 있다.
4,rowid 구조 (총18자리)
오브젝트 번호 (1~6): 오브젝트 별로 유일한 값을 가지고 있으며 해당 오브젝트가 속해 있는 값이다.

파일 번호(7~9):테이블스페이스(tablespace)에 속해 있는 데이터 파일에 대한 상대 파일번호이다.
블록번호(10~15): 데이터 파일 내부에서 어느 블록에 데이터가 있는지 알려준다.
데이터번호(16~18) 데이터 블록에 데이터가 저장되어 있는 순서를 의미한다.

block size 확인하는방법 -8kbyte저장
SQL> conn sys/a1234 as sysdba
Connected.
SQL> show user
USER is "SYS"
SQL> show parameter db_block_size

NAME                                 TYPE                                     VALUE
------------------------------------ ----------------------       ------------------------------
db_block_size                        integer                                  8192
------------------------------------ ----------------------       ------------------------------
*/
SELECT rowid, first_name,salary
from employees;