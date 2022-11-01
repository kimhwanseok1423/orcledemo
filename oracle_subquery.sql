--90번 부서에 근무하는 Lex 사원의 근무하는 부서명을 출력하시오
SELECT department_name
FROM departments
where department_id=90;

--'Lex'가 근무하는 부서명을 출력하시오
SELECT department_id
FROM employees
where first_name='Lex';

SELECT department_name
FROM departments
where department_id=90;

select d.department_name
from employees e ,departments d
where e.department_id=d.department_id
AND e.first_name='Lex';

SELECT department_name
FROM departments
where department_id= (
                        SELECT distinct department_id
                        FROM employees
                        where first_name='Lex'
                       );

--'Lex'와 동일한 업무(job_id)를 가진 사원의 이름(first_name),업무명(job_title)
--입사일(hire_date) 출력
select e.first_name,j.job_title,e.hire_date
from employees e , jobs j
where e.job_id=j.job_id
and e.job_id=(

select job_id
From employees
where first_name='Lex'
);

--'IT'에 근무하는 사원이름(first_name),부서번호를 출력하시오.
select first_name,department_id
from employees
where department_id=(
                       select department_Id
                       from departments
                       where department_name='IT'
                       );

--Bruce보다 급여를 많이 받은 사원이름(first_name),부서명,급여를 출력하시오
select e.first_name,d.department_name,e.salary
from employees e , departments d
where e.department_id=d.department_id
and e.salary>(
                select salary
                from employees
                where first_name='Bruce')
order by e.salary;


--steven와 같은부서에서 근무하는ㄴ 사람의 이름 급여 입사일ㅊ ㅜㄹ력
select e.first,e.salary,e.hire_date
from employees
where department_id in (
                         select department_id
                         from employees
                         where first_name='Stevne';




--부서별로 가장 급여를 많이 받는 사원이름,부서번호, 급여를 출력
select e.first_name ,e.department_id , e.salary
from employees e
where (e.department_id,e.salary) in ( 
                                      select department_id,max(salary)
                                      from employees
                                      Group by  department_id)
order by e.department_id;                                      

--30소속된 사원들 중에서 급여를 보다 더 많은 급여를 받는
--사원이름, 급여,입사일을 출력하시오.
select salary
from employees
where department_id=30;

select first_name,salary,hire_date
from employees
where salary> all(
                    select salary
                    from employees
                    where department_id=30
);

--30부서 사원들이 받는 최저급여보다 높은 급여를 받는 사원이름,급혀,입겨일을 출력하시오(any)

select salary
from employees
where department_id=30;

select first_name,salary,hire_date
from employees
where salary > any(
                    select salary
                    from employees
                    where department_id=30
)
order by salary;

--20부서에 사원이 있으면 사원들의 사원명,입사일 ,급여 부서번호를 출력하시오
Select first_name,hire_date,salary,department_id
from employees

where exists (
               select department_id
               from employees
               where department_id=20
               );
               
               
--사원이 있는 부서만 출력하시오
select count(*)
from departments;

select department_id,department_name
from departments
where department_id in (
                         select distinct department_id
                         from employees
                         where department_id is not null
                         group by department_id);
                         
select department_id, department_name
from departments d
where exists (
                 select 1 
                 from   employees e
                 where e.department_id =d.department_id
                 );
--사원이 없는 부서만 출력                 
select department_id, department_name
from departments d
where not exists (
                 select 1 
                 from   employees e
                 where e.department_id =d.department_id
                 );

--부서가 있는 사원의 정보를 출력하시오
select e.employee_id, e.first_name, e.department_id
from employees e
where exists (
                select 1
                from departments d
                where d.department_id=e.department_id);
--부서가없는 사원으 ㅣ정보를 출력         
select e.employee_id, e.first_name, e.department_id
from employees e
where not exists (
                select 1
                from departments d
                where d.department_id=e.department_id);
                
                
--관리가가 있는 사원의 정보를 출력하시오
select count(*)
from employees 
where manager_id is not null;

select w.employee_id,w.first_name,w.manager_id
from employees w 
where exists(
                 select 1
                 from employees m
                 where m.employee_id=w.manager_id);
                 
--관리자가 없는 사원의 정보를 출력하시오.
select w.employee_id,w.first_name,w.manager_id
from employees w 
where not exists(
                 select 1
                 from employees m
                 where m.employee_id=w.manager_id);

/*
Top_N 서브쿼리
상위의 값을 추출할떄 사용한다.
<,<=연산자를 사용할 수 있다. 단 비교되는 값이 1일때는 =도 가능하다
order by절을 사용할 수 있다.
*/
--급여가 가장 높은 상위 3명을 검색하시오.
select rownum,emp.first_name,emp.salary
from(
          select first_name,salary
           from employees
           order by salary desc
        ) emp
where rownum<=3;

--급여가 가장 높은 상위 4위부터 8우ㅢ까지 검색하시오
select emp2.*
from(
          select rownum AS rm,emp.*
           from(
                 select first_name,salary
                 from employees
                 order by salary desc
                 )emp
                 )emp2
    where emp2.rm>=4 And emp2.rm<=8;
    
--월별 입사자 수를 조회하되 입사자수가 가장 많은 상위 3개만 출력되도록 하시오.
-- 출력: 월   입사자수
select *
from(
select to_char(hire_date,'mm') AS "월",count(*) AS "입사자수"
from employees
group by to_char(hire_date,'mm')
order by 입사자수 desc)
where rownum <=3;
/*
서브쿼리
1.스칼라 쿼리:SELECT
2. 인라인 뷰:From
3.
*/