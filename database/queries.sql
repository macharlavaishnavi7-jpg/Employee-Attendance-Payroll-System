-- Employee Attendance and Payroll System
-- SQL queries for MySQL 8.0
-- Database: EmployeePayrollDBProject

-- 1. Display all employees
SELECT * FROM Employee;

-- 2. Display employees with their department names
SELECT e.Employee_ID, e.First_Name, e.Last_Name,
       d.Department_Name
FROM Employee e
INNER JOIN Department d
    ON e.Department_ID = d.Department_ID;

-- 3. Count all employees
SELECT COUNT(*) AS Total_Employees
FROM Employee;

-- 4. Count active employees
SELECT COUNT(*) AS Active_Employees
FROM Employee
WHERE Employment_Status = 'Active';

-- 5. Find the highest and lowest basic salaries
SELECT MAX(Basic_Salary) AS Highest_Salary,
       MIN(Basic_Salary) AS Lowest_Salary
FROM Salary;

-- 6. Calculate the average basic salary
SELECT AVG(Basic_Salary) AS Average_Salary
FROM Salary;

-- 7. Calculate the total basic salary
SELECT SUM(Basic_Salary) AS Total_Basic_Salary
FROM Salary;

-- 8. Count employees in each department
SELECT d.Department_ID, d.Department_Name,
       COUNT(e.Employee_ID) AS Total_Employees
FROM Department d
LEFT JOIN Employee e
    ON d.Department_ID = e.Department_ID
GROUP BY d.Department_ID, d.Department_Name;

-- 9. Find departments whose average basic salary exceeds 35000
SELECT d.Department_ID, d.Department_Name,
       AVG(s.Basic_Salary) AS Average_Salary
FROM Department d
JOIN Employee e
    ON d.Department_ID = e.Department_ID
JOIN Salary s
    ON e.Employee_ID = s.Employee_ID
GROUP BY d.Department_ID, d.Department_Name
HAVING AVG(s.Basic_Salary) > 35000;

-- 10. Display employees earning above the overall average salary
SELECT e.Employee_ID, e.First_Name, e.Last_Name,
       s.Basic_Salary
FROM Employee e
JOIN Salary s
    ON e.Employee_ID = s.Employee_ID
WHERE s.Basic_Salary > (
    SELECT AVG(Basic_Salary)
    FROM Salary
);

-- 11. Display employees who have submitted a leave request
SELECT e.Employee_ID, e.First_Name, e.Last_Name
FROM Employee e
WHERE EXISTS (
    SELECT 1
    FROM Leave_Request l
    WHERE l.Employee_ID = e.Employee_ID
);

-- 12. Display employees who have never submitted a leave request
SELECT e.Employee_ID, e.First_Name, e.Last_Name
FROM Employee e
WHERE NOT EXISTS (
    SELECT 1
    FROM Leave_Request l
    WHERE l.Employee_ID = e.Employee_ID
);

-- 13. Display employee attendance records
SELECT e.Employee_ID, e.First_Name, e.Last_Name,
       a.Attendance_Date, a.Attendance_Status,
       a.Working_Hours
FROM Employee e
JOIN Attendance a
    ON e.Employee_ID = a.Employee_ID
ORDER BY a.Attendance_Date, e.Employee_ID;

-- 14. Calculate total recorded working hours for each employee
SELECT e.Employee_ID, e.First_Name, e.Last_Name,
       SUM(a.Working_Hours) AS Total_Working_Hours
FROM Employee e
LEFT JOIN Attendance a
    ON e.Employee_ID = a.Employee_ID
GROUP BY e.Employee_ID, e.First_Name, e.Last_Name;

-- 15. Display leave requests and their approval status
SELECT Leave_ID, Employee_ID, Leave_Type,
       Start_Date, End_Date, Number_of_Days,
       Approval_Status
FROM Leave_Request;

-- 16. Display payroll details with employee names
SELECT e.Employee_ID, e.First_Name, e.Last_Name,
       p.Payroll_Month, p.Payroll_Year,
       p.Gross_Salary, p.Total_Deductions,
       p.Net_Salary, p.Payment_Status
FROM Employee e
JOIN Payroll p
    ON e.Employee_ID = p.Employee_ID
ORDER BY p.Payroll_Year, p.Payroll_Month, e.Employee_ID;

-- 17. Summarize payroll by payment status
SELECT Payment_Status,
       COUNT(*) AS Payroll_Records,
       SUM(Net_Salary) AS Total_Net_Salary
FROM Payroll
GROUP BY Payment_Status;

-- 18. Display the existing department-employee view
SELECT * FROM Department_Employee_View;

-- 19. Display the existing high-salary employee view
SELECT * FROM High_Salary_Employees;
