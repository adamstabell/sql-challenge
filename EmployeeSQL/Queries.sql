-- Data Analysis
-- 1. List the following details of each employee: employee number, last name, first name, sex, and salary.
Select e.emp_no, e.last_name, e.first_name, e.gender, s.salary 
From employees e
Join salaries s
On e.emp_no = s.emp_no;

-- 2. List first name, last name, and hire date for employees who were hired in 1986.
Select first_name, last_name, hire_date 
From employees e
Where Extract(Year from hire_date) = '1986';

-- 3. List the manager of each department with the following information: department number, department name, the manager's employee number, last name, first name.
Select dm.dept_no, d.dept_name, dm.emp_no, e.last_name, e.first_name
From dept_manager dm
Join departments d
on dm.dept_no = d.dept_no
Join employees e
on dm.emp_no = e.emp_no
-- The wording implies that they want the current managers,but this data was from the 80's/90's and
-- does not include the current year unless we are in the year 2000 in this scenario. I included the
-- code below in case this was what they wanted.

--Where Extract(Year from to_date) = '9999'
;

-- 4. List the department of each employee with the following information: employee number, last name, first name, and department name.
Select de.emp_no, e.last_name, e.first_name, d.dept_name
From dept_emp de
Join departments d
On de.dept_no = d.dept_no
Join employees e
On de.emp_no = e.emp_no;

-- 5. List first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B."
Select first_name, last_name, gender
From employees
Where first_name = 'Hercules' and last_name Like 'B%';

-- 6. List all employees in the Sales department, including their employee number, last name, first name, and department name.
Select de.emp_no, e.last_name, e.first_name, d.dept_name
From dept_emp de
Join departments d
On de.dept_no = d.dept_no
Join employees e
On de.emp_no = e.emp_no
Where d.dept_name = 'Sales';

-- 7. List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.
Select de.emp_no, e.last_name, e.first_name, d.dept_name
From dept_emp de
Join departments d
On de.dept_no = d.dept_no
Join employees e
On de.emp_no = e.emp_no
Where d.dept_name = 'Sales' or d.dept_name ='Development';

-- 8. In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.
Select last_name, count(last_name)
From employees
group by last_name
order by count(last_name) desc;
