SELECT * FROM retirement_info;
SELECT * FROM retiring_titles;
SELECT * FROM mentorship_eligibility;

SELECT SUM (rt.count)
FROM retiring_titles as rt;

SELECT COUNT (me.emp_no)
FROM mentorship_eligibility as me;


SELECT DISTINCT ON (emp_no) e.emp_no,
			e.first_name,
			e.last_name,
			e.birth_date,
			de.from_date,
			de.to_date,
			ti.title
INTO extended_mentors
FROM employees as e
INNER JOIN dept_emp as de
ON (e.emp_no = de.emp_no)
INNER JOIN titles as ti
ON (e.emp_no = ti.emp_no)
WHERE (de.to_date = '9999-01-01')
AND (e.birth_date BETWEEN '1964-01-01' AND '1965-12-31')
ORDER BY e.emp_no;

SELECT * FROM extended_mentors;

SELECT COUNT (emp_no)
FROM extended_mentors;