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