DROP TABLE IF EXISTS employee CASCADE;
DROP TABLE IF EXISTS department CASCADE;
DROP TABLE IF EXISTS dept_emp;
DROP TABLE IF EXISTS dept_manager;
DROP TABLE IF EXISTS salary;
DROP TABLE IF EXISTS title;

-- Create Employee table
CREATE TABLE employee(
	emp_no INTEGER PRIMARY KEY NOT NULL,
	birth_date DATE,
	first_name VARCHAR(30) NOT NULL,
	last_name VARCHAR(30) NOT NULL,
	gender VARCHAR(1) NOT NULL,
	hire_date DATE
);

-- Create Department table
CREATE TABLE department(
	dept_no VARCHAR(5) PRIMARY KEY NOT NULL,
	dept_name VARCHAR(30) NOT NULL
);

-- Create Department Employee table
CREATE TABLE dept_emp(
	emp_no INTEGER NOT NULL,
	FOREIGN KEY (emp_no) REFERENCES employee(emp_no),
	dept_no VARCHAR(5) NOT NULL,
	FOREIGN KEY (dept_no) REFERENCES department(dept_no),
	from_date DATE,
	to_date DATE,
	PRIMARY KEY (emp_no,dept_no)
);

-- Create Department Manager table
CREATE TABLE dept_manager(
	dept_no VARCHAR(5) NOT NULL,
	FOREIGN KEY (dept_no) REFERENCES department(dept_no),
	emp_no INTEGER NOT NULL,
	FOREIGN KEY (emp_no) REFERENCES employee(emp_no),
	from_date DATE,
	to_date DATE,
	PRIMARY KEY (emp_no,dept_no)
);

-- Create Salary table
CREATE TABLE salary (
	emp_no INTEGER NOT NULL PRIMARY KEY,
	FOREIGN KEY (emp_no) REFERENCES employee(emp_no),
	salary INTEGER,
	from_date DATE,
	to_date DATE
);

-- Create Title table
CREATE TABLE title(
	emp_no INTEGER NOT NULL,
	FOREIGN KEY (emp_no) REFERENCES employee(emp_no),
	title VARCHAR(30) NOT NULL,
	from_date DATE,
	to_date DATE
);