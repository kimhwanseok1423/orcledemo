/*------------------------------
문제
------------------------------*/
--1) 모든사원에게는 상관(Manager)이 있다. 하지만 employees테이블에 유일하게 상관이
--   없는 로우가 있는데 그 사원(CEO)의 manager_id컬럼값이 NULL이다. 상관이 없는 사원을
--   출력하되 manager_id컬럼값 NULL 대신 CEO로 출력하시오.
    select first_name,manager_id,nvl(to_char(manager_id,'999'),'CEO')
    from employees;

--2) 가장최근에 입사한 사원의 입사일과 가장오래된 사원의 입사일을 구하시오.
   select max(hire_date),min(hire_date) 
   from employees;
   
 
--3) 부서별로 커미션을 받는 사원의 수를 구하시오.
   select department_id,count(commission_pct)
   from employees
   where commission_pct IS NOT NULL
   group by department_id;
   
--4) 부서별 최대급여가 10000이상인 부서만 출력하시오.   
select department_id,max(salary)
from employees
GROUP BY department_id
HAVING max(salary)>=10000
ORDER BY department_id;  

--5) employees 테이블에서 직종이 'IT_PROG'인 사원들의 급여평균을 구하는 SELECT문장을 기술하시오.
  select avg(salary)
  from employees
  where job_id='IT_PROG'
  
select job_id,avg(salary)
from employees
Group by job_id
Having job_id='IT_PROG'; --having은 Group by 설정뒤에 쓸수있고 where대신에서 씀
--6) employees 테이블에서 직종이 'FI_ACCOUNT' 또는 'AC_ACCOUNT' 인 사원들 중 최대급여를  구하는    SELECT문장을 기술하시오.   
   SELECT job_id,max(salary)
   from employees
   Group by job_id
   Having job_id IN('FI_ACCOUNT','AC_ACCOUNT');
   
   SELECT max(salary) AS "최대급여"
   from employees
   where job_id In('FI_ACCOUNT','AC_ACCOUNT');
  
  

--7) employees 테이블에서 50부서의 최소급여를 출력하는 SELECT문장을 기술하시오.
    SELECT min(salary)
    from employees
    where department_id=50;
    
    select department_id, min(salary)
    from employees
    group by department_id
    HAVING department_id=50;
    
--8) employees 테이블에서 아래의 결과처럼 입사인원을 출력하는 SELECT문장을 기술하시오.
--   <출력:  2001		   2002		       2003
 --  	     1          7                6   >
   --decode(컬럼 ,값1,처리1,값2,처리2,그밖의 처리)		   
   select sum(decode(to_char(hire_date,'yyyy'),'2001',1,0)) AS "2001",
          sum(decode(to_char(hire_date,'yyyy'),'2002',1,0)) AS "2002",
          sum(decode(to_char(hire_date,'yyyy'),'2003',1,0)) AS "2003"
   from employees;
    
--9) employees 테이블에서 각 부서별 인원이 10명 이상인 부서의 부서코드,
--  인원수,급여의 합을 구하는  SELECT문장을 기술하시오.
   select department_id,count(*),sum(salary)
   from employees
  group by department_id
  having count(*)>=10;
  
--10) employees 테이블에서 이름(first_name)의 세번째 자리가 'e'인 직원을 검색하시오.
     --instr(데이터,찾을 문자, 시작위치 ,순서)
     select first_name 
     from employees
     where instr(first_name,'e',3,1)=3;
     
    select first_name
    from employees
    where substr(first_name,3,1)='e';
    
    select first_name
    from employees
    where first_name LIKE '__e%';
    
   
    