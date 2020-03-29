-- 1. Employee Details
SELECT emp.emp_no "employee number",emp.last_name "last name",emp.first_name "first name",emp.gender,sal.salary 
FROM employee emp
LEFT JOIN salary sal ON
emp.emp_no = sal.emp_no
ORDER BY emp.emp_no;

-- 2.Employees hired in 1986
SELECT emp.emp_no "employee number",emp.last_name "last name",emp.first_name "first name",emp.gender,emp.hire_date "hire date" 
FROM employee emp
WHERE EXTRACT(YEAR FROM hire_date) = 1986
ORDER BY emp.emp_no;

-- 3.Manager of each department
SELECT dm.dept_no "department number",d.dept_name "department name",dm.emp_no "employee number",e.last_name "last name",e.first_name "first name",dm.from_date "start date",dm.to_date "end date"
FROM dept_manager dm
INNER JOIN department d ON
dm.dept_no = d.dept_no
INNER JOIN employee e ON
e.emp_no = dm.emp_no;

-- 4. Department of each employee
SELECT emp.emp_no "employee number",emp.last_name "last name",emp.first_name "first name",d.dept_name "department name" 
FROM employee emp
INNER JOIN dept_emp de ON
emp.emp_no = de.emp_no
INNER JOIN department d ON
d.dept_no = de.dept_no
order by emp.emp_no;

-- 5. Employees whose first name is Hercules and last names begin with "B."
SELECT emp.emp_no "employee number",emp.last_name "last name",emp.first_name "first name",emp.gender,emp.hire_date "hire date" 
FROM employee emp
WHERE emp.first_name = 'Hercules'
and emp.last_name like 'B%'
ORDER BY emp.emp_no;

-- 6. Employees in the sales department
SELECT e.emp_no "employee number",e.last_name "last name",e.first_name "first name",d.dept_name "department name"
FROM department d
INNER JOIN dept_emp de ON
de.dept_no = d.dept_no
INNER JOIN employee e ON
e.emp_no = de.emp_no
WHERE d.dept_name = 'Sales'
AND de.emp_no = e.emp_no
ORDER BY e.emp_no;

-- 7. Employees in the sales and development departments
SELECT e.emp_no "employee number",e.last_name "last name",e.first_name "first name",d.dept_name "department name"
FROM department d
INNER JOIN dept_emp de ON
de.dept_no = d.dept_no
INNER JOIN employee e ON
e.emp_no = de.emp_no
WHERE d.dept_name in ('Sales','Development')
AND de.emp_no = e.emp_no
ORDER BY d.dept_name,e.emp_no;

-- 8. Frequency count of employee last names
SELECT last_name,count(1) "Frequency" FROM employee
GROUP BY last_name
ORDER BY "Frequency" DESC
;