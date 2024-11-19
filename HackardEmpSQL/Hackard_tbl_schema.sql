-- create tables
CREATE TABLE departments (
dept_no VARCHAR(10) PRIMARY KEY,
dept_name VARCHAR(100)
);

CREATE TABLE titles (
title_id VARCHAR(10) PRIMARY KEY,
title VARCHAR(100)
);

CREATE TABLE employees (
emp_no int PRIMARY KEY,
emp_title_id VARCHAR(10) REFERENCES titles(title_id) NOT NULL,
birth_date DATE NOT NULL,
first_name VARCHAR(50) NOT NULL,
last_name VARCHAR(50) NOT NULL,
sex VARCHAR(1) NOT NULL,
hire_date DATE NOT NULL
);

CREATE TABLE dept_manager (
dept_no VARCHAR(10) REFERENCES departments(dept_no),
emp_no int REFERENCES employees(emp_no)
);

CREATE TABLE dept_emp (
emp_no int REFERENCES employees(emp_no),
dept_no VARCHAR(10) REFERENCES departments(dept_no) NOT NULL
);

CREATE TABLE salaries (
emp_no int REFERENCES employees(emp_no),
salaries int NOT NULL
);