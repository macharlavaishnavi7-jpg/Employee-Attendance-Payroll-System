# Employee Attendance and Payroll System

## Project Description
The Employee Attendance and Payroll System is a MySQL database project designed to manage employee information, departments, attendance, leave requests, salary details, payroll processing, and user accounts.

## Database
- **Database Management System:** MySQL 8.0
- **Database Name:** EmployeePayrollDBProject

## Database Components

### Main Tables
- Employee
- Department
- Attendance
- Leave_Request
- Salary
- Payroll
- User_Admin

### Additional Tables
- Attendance_Log
- Attendance_Delete_Log
- Leave_Delete_Log
- Payroll_Status_Log

### Views
- Department_Employee_View
- High_Salary_Employees

### Triggers
The database includes triggers for attendance validation, attendance logging, employee email checks, leave deletion logging, payroll status logging, and salary validation.

## Project Structure

```text
Employee-Attendance-Payroll-System/
├── README.md
├── .gitignore
├── documentation/
└── database/
    ├── full_database_backup.sql
    ├── schema.sql
    ├── sample_data.sql
    └── queries.sql
```

## Files

- `full_database_backup.sql`: Complete database backup, including data and database objects.
- `schema.sql`: Database structure without table data.
- `sample_data.sql`: Sample records for setting up a demonstration database.
- `queries.sql`: SQL queries used to demonstrate database operations.
- `documentation/`: Project report and related documentation.

## Requirements
- MySQL Server 8.0 or compatible version.
- A terminal or MySQL client.
- Git for version control.

## Importing the Database

To restore the complete backup, use an account with the required MySQL privileges:

```bash
mysql -u YOUR_MYSQL_USER -p < database/full_database_backup.sql
```

Replace `YOUR_MYSQL_USER` with your MySQL username. The backup contains a database creation statement, so ensure you have permission to create the database.

## Security
Use a private GitHub repository for backups containing employee-related information. Replace sensitive or personal information with fictional sample data before making the project public. Never commit database passwords, access tokens, or real credentials.
