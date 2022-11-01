/*
join(조인)
1.여러개의 테이블에서 원하는 데이터를 추출해주는 쿼리문이다.
2.join은 oracle 제품에서 사용되는 oracle용 join이 있고
모든 제품에서 공ㅇ통적으로 사용하는 표준(ANSI) join이 있다.
/*-------------------------
1. equi join
가장 많이 사용되는 조인방법으로 조인 대상이 되는 두 테이블에서 ㄱ공통적으로 존재하는 컬럼의 값이
일치되는 행을 연결하여 결과를 생성하는 방법이다.

*/
--(1) oracle용 equi join
select dept.department_id,emp.first_name,emp.job_id,dept.department_name
from employees emp,departments dept
where emp.department_id=dept.department_id;

2) ansi용 inner join
select dept.department_id,emp.first_name,emp.job_id,dept.department_name
from employees emp inner join departments dept
ON emp.department_id=dept.department_id;

--employees와 departments테이블에서 사원번호,부서번호,부서명을검색하시오.
select emp.employee_id,dept.department_id,dept.department_name
from employees emp,departments dept
where emp.department_id=dept.department_id
order by emp.employee_id;

select emp.employee_id,dept.department_id,dept.department_name
from employees emp,departments dept
on emp.department_id=dept.department_id
order by emp.employee_id;

--employees와 jobs테이클에서 사원번호 (employee_id),
--업무번호(job_id) ,업무명(jon_title)을 검색하시오
select e.employee_id,j.job_id,j.job_title
from employees e,jobs j
where e.job_id=j.job_id
ORDER BY e.employee_id;

select e.employee_id,j.job_id,j.job_title
from employees e,jobs j
on e.job_id=j.job_id
ORDER BY e.employee_id;

--job_id가 'FI_MGR'인 사원이 속한
--급여(salary)의 최소값(min_salary),최대값(max_salary)을 출력하시오.
select e.first_name,e.job_id,j.min_salary,j.max_salary
from employees e,jobs j
where e.job_id=j.job_id
And e.job_id='FI_MGR';

/*
선행테이블(Driving) - 후행테이블(Driven)
*/

select e.first_name,e.job_id,j.min_salary,j.max_salary
from employees e INNER JOIN jobs j
ON e.job_id=j.job_id
WHERE e.job_id='FI_MGR';


SELECT e.first_name, e.hire_date,d.department_name,l.city
from employees e INNER JOIN departments d
on e.department_id=d.department_id
INNER JOIN locations l
on d.location_id=l.location_id
where l.city='Seattle';

--20번 부서의 이름과 그 부서에 근무하는 사원으 ㅣ이름을 출력하시오

select d.department_id,d.department_name,e.first_name
from employees e ,departments d 
where e.department_id=d.department_id
and d.department_id=20;

select d.department_id,d.department_name,e.first_name
from employees e INNER JOIN departments d 
on e.department_id=d.department_id
where d.department_id=20;
-- inner join으로 할시  inner join 추가 , on ,where  추가

--1400, 1500번 위치의 도시이름과 그곳에 있는 부서으 ㅣ이름을 출력하시오

select l.location_id,l.city,d.department_name
from locations l, departments d
where l.location_id=d.location_id
and l.location_id IN(1400,1500);

select l.location_id,l.city,d.department_name
from locations l inner join departments d
on l.location_id=d.location_id
where l.location_id IN(1400,1500);

/*-------------------------------------
2.carteian product(카티션 곱) 조인:
테이블 행의 갯수만큼 출력해주는 조인이다.
-------------------------------------------

--1) oracle용 certeian product    */
select e.department_id, e.first_name,e.job_id,j.job_title
from employees e ,jobs j; -2033

select count(*) from employees; --107
select count(*) from jobs; --19

--2) ANSI용 cross join
select e.department_id, e.first_name,e.job_id,j.job_title
from employees e cross join jobs j;


/*
3.  natural join
    natural join은 두 테이블 간의 동일한 이름을 갖는 모든 컬럼들에 대해 EQUI(=) JOIN을 수행한다.
    그리고, SQL SERVER에서는 지원않는 기느이다.
*/
select first_name,salary,department_id,department_name
from employees NATURAL JOIN departments;


select e.first_name,salary,d.department_id,department_name
from employees e INNER JOIN  departments d
on e.department_id=d.department_id;

/*
4. non-equi join
(=)동등비교연산자를 제외한 >=,<=,>,<등의 연산자를 이용해서 조건을 지정하는 방법이다.
*/

--1) oracle용 NON-EQUI JOIN
select e.first_name,e.salary,j.min_salary,j.max_salary,j.job_title
from employees e ,jobs j
where e.job_id=j.job_id
AND e.salary>j.min_salary
AND e.salary<j.max_salary;

--2) ANSI용 NON_EQUI JOIN
select e.first_name,e.salary,j.min_salary,j.max_salary,j.job_title
from employees e JOIN jobs j
on e.job_id=j.job_id
where e.salary>j.min_salary
AND e.salary<j.max_salary;

/*
5. outer JOIN
한 테이블는 데이터가 있고 다른 반대쪽에는 데이터가 없는 경우에
데이터가 있는 테이블의 내용을 모두 가져오는 조건이다.
*/

select e.first_name,e.employee_id,e.department_id,d.department_id,d.department_name
from employees e , departments d
where e.department_id=d.department_id(+); /* LEFT OUTER JOIN */

select e.first_name,e.employee_id,e.department_id,d.department_id,d.department_name
from employees e , departments d
where e.department_id(+)=d.department_id; /* RIGHT  OUTER JOIN */


select e.first_name,e.employee_id,e.department_id,d.department_id,d.department_name
from employees e RIGHT OUTER join departments d
on e.department_id=d.department_id; /* RIGHT  OUTER JOIN */

/*
6.self join : 
하나의 테이블을 두개의 테이블로 설정해서 사용하는 조인방법이다.
하나의 테이블에 같은 데이터가 두개의 컬럼에 다른 목적으로 저장되어 있는 경우
employees,employee_id,manager_id
*/
select employee_id,first_name,manager_id
from employees;

--1)oracle self join

select w.employee_id AS "사원번호",
       w.first_name AS "사원이름",
       w.manager_id AS "매니저번호",
       m.first_name AS "매니저이름"
from employees w ,employees m
where w.manager_id=m.employee_id
ORDER BY w.employee_id;

--2)ansi self join
select w.employee_id AS "사원번호",
       w.first_name AS "사원이름",
       w.manager_id AS "매니저번호",
       m.first_name AS "매니저이름"
from employees w JOIN employees m
ON w.manager_id=m.employee_id
ORDER BY w.employee_id;          --JOIN 추가 ON 추가

/*
USING
*/

select department_id,first_name,job_id,department_name
from employees  inner join departments  using(department_id)
--ON emp.department_id=dept.department_id;
WHERE department_id=30;