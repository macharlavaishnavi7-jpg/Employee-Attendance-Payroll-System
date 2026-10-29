-- Employee Attendance and Payroll System
-- Fictional sample data for testing
-- MySQL 8.0
-- Import only after creating the database schema.

USE EmployeePayrollDBProject;

-- 1. Departments
INSERT INTO Department
    (Department_ID, Department_Name, Department_Description, Manager_ID)
VALUES
    (901, 'Sample IT', 'Sample IT department', NULL),
    (902, 'Sample Finance', 'Sample Finance department', NULL);

-- 2. Employees
INSERT INTO Employee
    (Employee_ID, First_Name, Last_Name, Gender, Date_of_Birth,
     Email, Phone_Number, Address, Department_ID, Designation,
     Date_of_Joining, Employment_Status)
VALUES
    (9001, 'Alex', 'Morgan', 'Male', '1998-04-12',
     'alex.morgan@example.com', '9000000001', 'Sample City',
     901, 'Software Developer', '2023-06-01', 'Active'),
    (9002, 'Jamie', 'Taylor', 'Female', '1999-08-20',
     'jamie.taylor@example.com', '9000000002', 'Sample Town',
     902, 'Finance Executive', '2024-01-15', 'Active');

-- 3. Salary details
INSERT INTO Salary
    (Salary_ID, Employee_ID, Basic_Salary, House_Rent_Allowance,
     Other_Allowances, Deductions, Effective_From, Effective_To)
VALUES
    (9001, 9001, 40000.00, 8000.00, 2000.00, 3000.00,
     '2026-01-01', NULL),
    (9002, 9002, 35000.00, 7000.00, 1500.00, 2500.00,
     '2026-01-01', NULL);

-- 4. Attendance records
INSERT INTO Attendance
    (Attendance_ID, Employee_ID, Attendance_Date, Check_In_Time,
     Check_Out_Time, Working_Hours, Attendance_Status)
VALUES
    (9001, 9001, '2026-10-01', '09:00:00', '17:00:00',
     8.00, 'Present'),
    (9002, 9002, '2026-10-01', '09:00:00', '17:00:00',
     8.00, 'Present');

-- 5. Leave requests
INSERT INTO Leave_Request
    (Leave_ID, Employee_ID, Leave_Type, Start_Date, End_Date,
     Number_of_Days, Reason, Request_Date, Approval_Status, Approved_By)
VALUES
    (9001, 9001, 'Casual', '2026-10-10', '2026-10-10',
     1, 'Personal work', '2026-10-05', 'Approved', NULL),
    (9002, 9002, 'Sick', '2026-10-15', '2026-10-16',
     2, 'Rest and recovery', '2026-10-14', 'Pending', NULL);

-- 6. Payroll records
INSERT INTO Payroll
    (Payroll_ID, Employee_ID, Salary_ID, Payroll_Month, Payroll_Year,
     Total_Working_Days, Days_Present, Days_Absent, Overtime_Hours,
     Gross_Salary, Total_Deductions, Net_Salary, Payment_Date, Payment_Status)
VALUES
    (9001, 9001, 9001, 9, 2026, 22, 21, 1, 2.00,
     50000.00, 3000.00, 47000.00, '2026-10-01', 'Paid'),
    (9002, 9002, 9002, 9, 2026, 22, 20, 2, 0.00,
     43500.00, 2500.00, 41000.00, '2026-10-01', 'Paid');

-- Sample data inserted successfully when all inserts complete.
