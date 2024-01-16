-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.


CREATE TABLE "Departments" (
    "dept_no" varchar(4)   NOT NULL,
    "dept_name" varchar(30)   NOT NULL,
    CONSTRAINT "pk_Departments" PRIMARY KEY (
        "dept_no"
     )
);

CREATE TABLE "Department_Employees" (
    "emp_no" varchar(6)   NOT NULL,
    "dept_no" varchar(4)   NOT NULL,
    CONSTRAINT "pk_Department_Employees" PRIMARY KEY (
        "emp_no"
     )
);

CREATE TABLE "Department_Managers" (
    "dept_no" varchar(4)   NOT NULL,
    "emp_no" varchar(6)   NOT NULL
);

CREATE TABLE "Employees" (
    "emp_no" varchar(6)   NOT NULL,
    "emp_title_id" varchar(5)   NOT NULL,
    "birth_date" date   NOT NULL,
    "first_name" varchar(20)   NOT NULL,
    "last_name" varchar(20)   NOT NULL,
    "sex" varchar(1)   NOT NULL,
    "hire_date" date   NOT NULL,
    CONSTRAINT "pk_Employees" PRIMARY KEY (
        "emp_no"
     )
);

CREATE TABLE "Salaries" (
    "emp_no" varchar(6)   NOT NULL,
    "salary" int   NOT NULL
);

CREATE TABLE "Titles" (
    "title_id" varchar(5)   NOT NULL,
    "title" varchar(20)   NOT NULL,
    CONSTRAINT "pk_Titles" PRIMARY KEY (
        "title_id"
     )
);

ALTER TABLE "Department_Employees" ADD CONSTRAINT "fk_Department_Employees_dept_no" FOREIGN KEY("dept_no")
REFERENCES "Departments";

ALTER TABLE "Department_Managers" ADD CONSTRAINT "fk_Department_Managers_dept_no" FOREIGN KEY("dept_no")
REFERENCES "Departments";

ALTER TABLE "Department_Managers" ADD CONSTRAINT "fk_Department_Managers_emp_no" FOREIGN KEY("emp_no")
REFERENCES "Employees";

ALTER TABLE "Salaries" ADD CONSTRAINT "fk_Salaries_emp_no" FOREIGN KEY("emp_no")
REFERENCES "Employees";

SELECT emp_no, last_name, first_name,sex, salary from Employees, Salaries;

SELECT first_name, last_name, hire_date from Employess WHERE hire_date = 1986; 

SELECT dept_name, dept_no, emp_no, last_name, first_name from Departments, Employees;

SELECT dept_no,emp_no,last_name, first_name, dept_name from Departments, Employees;

SELECT first_name, last_name, sex FROM Employees WHERE first_name = "Hercules";

SELECT emp_no, last_name, first_name FROM Employess WHERE dept_name = "Sales";

SELECT emp_no, last_name, first_name, dept_name FROM Employess WHERE dept_name = "Sales" OR "Development";



