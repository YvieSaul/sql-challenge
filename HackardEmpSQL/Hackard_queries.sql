--1. List the employee number, last name, first name, sex, and salary of each employee.

SELECT empl.emp_no, empl.last_name, empl.first_name, empl.sex, sal.salary
FROM employees empl
JOIN salaries sal
ON empl.emp_no = sal.emp_no



--2. List the first name, last name, and hire date for the employees who were hired in 1986

SELECT first_name, last_name, hire_date
FROM employees
WHERE hire_date::TEXT LIKE '%1986%'
ORDER BY hire_date ASC;



--3. List the manager of each department along with their department number, 
--department name, employee number, last name, and first name

SELECT dept.dept_no, dept.dept_name, mgr.emp_no, empl.last_name, empl.first_name
FROM departments dept
JOIN dept_manager mgr
ON dept.dept_no = mgr.dept_no
JOIN employees empl
ON mgr.emp_no = empl.emp_no



--4. List the department number for each employee along with that employee’s employee number, 
--last name, first name, and department name

SELECT dept.dept_no, dempl.emp_no, empl.last_name, empl.first_name, dept.dept_name
FROM departments dept
JOIN dept_emp dempl
ON dept.dept_no = dempl.dept_no
JOIN employees empl
ON dempl.emp_no = empl.emp_no



--5. List first name, last name, and sex of each employee whose first name is Hercules and 
--whose last name begins with the letter B

SELECT first_name, last_name, sex
FROM employees
WHERE first_name LIKE '%Hercules%' 
AND last_name LIKE 'B%'
ORDER BY last_name ASC



--6. List each employee in the Sales department, including their employee number, 
--last name, and first name

SELECT empl.emp_no, empl.last_name, empl.first_name
FROM employees empl
WHERE empl.emp_no IN (
	SELECT demp.emp_no
	FROM dept_emp demp
	WHERE demp.dept_no IN (
		SELECT dept.dept_no
		FROM departments dept
		WHERE dept.dept_name = 'Sales'
	)
)



--7. List each employee in the Sales and Development departments, including their 
--employee number, last name, first name, and department name

SELECT empl.emp_no, empl.last_name, empl.first_name, dept.dept_name
FROM employees empl
JOIN dept_emp demp ON empl.emp_no = demp.emp_no
JOIN departments dept ON demp.dept_no = dept.dept_no
WHERE dept.dept_name = 'Sales' OR dept.dept_name = 'Development'
ORDER BY dept_name ASC	




--8. List the frequency counts, in descending order, of all the employee last names 
--(that is, how many employees share each last name)

SELECT last_name, COUNT(*) AS frequency
FROM employees
GROUP BY last_name
ORDER BY frequency DESC

