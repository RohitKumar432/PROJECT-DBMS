USE hr;
#1
SELECT l.location_id, l.street_address, l.city, l.state_province, c.country_name
FROM locations l
JOIN countries c ON l.country_id = c.country_id;
#2
SELECT e.first_name, e.last_name, e.department_id, d.department_name
FROM employees e
JOIN departments d ON e.department_id = d.department_id;
#3
SELECT e.first_name, e.last_name, j.job_title, e.department_id, d.department_name
FROM employees e
JOIN departments d ON e.department_id = d.department_id
JOIN jobs j ON e.job_id = j.job_id
JOIN locations l ON d.location_id = l.location_id
WHERE l.city = 'London';

#4
SELECT e.employee_id, e.last_name, e.manager_id, m.last_name AS manager_name
FROM employees e
JOIN employees m ON e.manager_id = m.employee_id;

#5
SELECT first_name, last_name, hire_date
FROM employees
WHERE hire_date > (
  SELECT hire_date
  FROM employees
  WHERE last_name = 'Jones'
);

#6
SELECT d.department_name, COUNT(e.employee_id) AS num_employees
FROM departments d
JOIN employees e ON d.department_id = e.department_id
GROUP BY d.department_name;
#7
SELECT d.department_name, CONCAT(e.first_name, ' ', e.last_name) AS manager_name, e.hire_date, e.salary
FROM employees e
JOIN departments d ON e.department_id = d.department_id
WHERE e.job_id LIKE '%MAN%' AND DATEDIFF(CURDATE(), e.hire_date) > 15 * 365;
#8
SELECT first_name, last_name, salary
FROM employees
WHERE salary > (
  SELECT salary
  FROM employees
  WHERE last_name = 'Bull'
);
#9
SELECT first_name, last_name
FROM employees
WHERE department_id = (
  SELECT department_id
  FROM departments
  WHERE department_name = 'IT'
);
#10
SELECT e.first_name, e.last_name
FROM employees e
JOIN departments d ON e.department_id = d.department_id
WHERE e.manager_id IS NOT NULL AND d.location_id IN (
  SELECT location_id
  FROM locations
  WHERE country_id = (
    SELECT country_id
    FROM countries
    WHERE country_name = 'United States of America'
  )
);
#11
SELECT first_name, last_name, salary
FROM employees
WHERE salary > (
  SELECT AVG(salary)
  FROM employees
);
#12
SELECT e.first_name, e.last_name, e.salary
FROM employees e
JOIN jobs j ON e.job_id = j.job_id
WHERE e.salary = (
  SELECT MIN(salary)
  FROM employees
  WHERE job_id = e.job_id
);
#13
SELECT e.first_name, e.last_name, e.salary
FROM employees e
JOIN departments d ON e.department_id = d.department_id
WHERE e.salary > (
  SELECT AVG(salary)
  FROM employees
) AND d.department_name LIKE '%IT%';
#14
SELECT e.first_name, e.last_name, e.salary
FROM employees e
WHERE e.salary = (
  SELECT MIN(salary)
  FROM employees
);
#15
SELECT e.first_name, e.last_name, e.salary
FROM employees e
WHERE e.salary > (
  SELECT MAX(salary)
  FROM employees
  WHERE job_id = 'SH_CLERK'
)
ORDER BY e.salary;



