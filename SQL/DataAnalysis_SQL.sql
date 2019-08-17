--List the following details of each employee: employee number, last name, first name, gender, and salary.
select employees.emp_no, employees.last_name, employees.first_name, employees.gender, salaries.salary
from employees
inner join salaries
on employees.emp_no = salaries.emp_no;

--List employees who were hired in 1986.
select * from employees
where hire_date::text like '1986-_____';

--List the manager of each department with the following information: department number, department name, the manager's employee number, last name, first name, and start and end employment dates.
select departments.dept_no, departments.dept_name, dept_manager.emp_no, employees.last_name, employees.first_name, dept_manager.from_date, dept_manager.to_date
from dept_manager
inner join departments on dept_manager.dept_no = departments.dept_no
inner join employees on dept_manager.emp_no = employees.emp_no
order by departments.dept_name ASC;

--List the department of each employee with the following information: employee number, last name, first name, and department name.
select departments.dept_name, dept_emp.emp_no, employees.last_name, employees.first_name
from dept_emp
inner join departments on dept_emp.dept_no = departments.dept_no
inner join employees on dept_emp.emp_no = employees.emp_no
order by departments.dept_name ASC;

--List all employees whose first name is "Hercules" and last names begin with "B."
select * from employees
where last_name LIKE 'B%' AND first_name = 'Hercules';

--List all employees in the Sales department, including their employee number, last name, first name, and department name.
select departments.dept_name, dept_emp.emp_no, employees.last_name, employees.first_name
from dept_emp
inner join departments on dept_emp.dept_no = departments.dept_no
inner join employees on dept_emp.emp_no = employees.emp_no
where dept_name = 'Sales';

--List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.
select departments.dept_name, dept_emp.emp_no, employees.last_name, employees.first_name
from dept_emp
inner join departments on dept_emp.dept_no = departments.dept_no
inner join employees on dept_emp.emp_no = employees.emp_no
where dept_name = 'Sales' OR dept_name = 'Development'
order by dept_name ASC;

--In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.
select last_name, count(*)
from employees
group by last_name 
order by last_name DESC;

--Search my employee ID: 499942
select * from employees
where emp_no = '499942';
