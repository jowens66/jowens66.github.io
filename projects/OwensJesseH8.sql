-- Jesse Owens Database Homework 8 --

-- 1 --
CREATE DATABASE IF NOT EXISTS Painters;

-- 2 --  
DROP VIEW IF EXISTS Painters.JobInfo;
DROP VIEW IF EXISTS Painters.EmployeeTotalPay;

-- 3 --
use Painters;

DROP INDEX  idx_CustomerName ON Customer;
DROP INDEX  idx_Jobcustphone ON Job;
DROP INDEX  idx_EmpJobjobnum ON EmpJob;
DROP INDEX  idx_EmpJobssn ON EmpJob;

-- 4 --
DROP TABLE IF EXISTS Painters.EmpJob;
DROP TABLE IF EXISTS Painters.Employee;
DROP TABLE IF EXISTS Painters.Job;
DROP TABLE IF EXISTS Painters.Customer;
 
DROP USER tonynash@localhost;
DROP USER duncancurtis@localhost;
DROP USER andreweubanks@localhost;
 
-- 5 --
CREATE TABLE Painters.Customer
(
custphone 	Char(12)        UNIQUE			NOT NULL	,
ctype		ENUM('C','R')	DEFAULT 'C'		NULL	    ,
clname		VARCHAR(35)						NOT NULL	,
cfName		VARCHAR(15)						NOT NULL	, 
caddr		VARCHAR(40)						NULL		,
ccity		VARCHAR(20)						NULL		, 
cstate		CHAR(2)			DEFAULT 'SC'	NULL		,
PRIMARY KEY(custphone)									,
CHECK(custphone LIKE '%[0-9]{3}-[0-9]{3}-[0-9]{4}%')
);

CREATE TABLE Painters.Job
(
jobnum		SMALLINT		UNSIGNED		NOT NULL	,
custphone 	Char(12)        UNIQUE			NOT NULL	,
jobDate		DATE							NOT NULL	,
description VARCHAR(2000)					NULL		,
amoBilled	DECIMAL(7,2)					NULL		,
PRIMARY KEY	(jobnum)									,
FOREIGN KEY	(custphone)	REFERENCES	Customer (custphone),	
CHECK(custphone LIKE '%[0-9]{3}-[0-9]{3}-[0-9]{4}%')
);



CREATE TABLE Painters.Employee
(
ssn 		Char(9) 		UNIQUE			NOT NULL	,
elname 		varChar(35)						NOT NULL 	,
efname		varChar(15) 					NOT NULL	,
ephone		Char(12)		UNIQUE 			NULL		,
hrrate		Decimal(5.2)	DEFAULT 15.75  	NOT NULL	,
PRIMARY KEY(ssn)										,
CHECK(custphone LIKE '%[0-9]{3}-[0-9]{3}-[0-9]{4}%')	
);


CREATE TABLE Painters.EmpJob

(
ssn 		Char(9) 		UNIQUE			NOT NULL	,
jobnum		SMALLINT		UNSIGNED		NOT NULL	,
hrsperjob 	Decimal(5.2)					NULL		,
PRIMARY KEY(ssn, jobnum)								,
FOREIGN KEY (ssn)	REFERENCES Employee(ssn)			,
FOREIGN KEY (jobnum)	REFERENCES Job(jobnum)			,
CHECK(hrsperjob <= 500.00)	
);


-- 6 --
CREATE INDEX idx_CustomerName 
ON Customer (clname, cfname);

-- 7 --
CREATE INDEX idx_Jobcustphone 
ON Job (custPhone);
CREATE INDEX idx_EmpJobssn 
ON EmpJob (ssn);
CREATE INDEX idx_EmpJobjobnum 
ON EmpJob(jobnum);


-- 8 --
CREATE USER tonynash@localhost
IDENTIFIED BY 'mullis2005';

CREATE USER duncancurtis@localhost
IDENTIFIED BY 'bonestoncrusher';

CREATE USER andreweubanks@localhost
IDENTIFIED BY 'sterben865';

GRANT ALL 
ON *.*
TO tonynash@localhost;

GRANT SELECT
ON painters.*
TO duncancurtis@localhost;

GRANT ALL
ON Painters.Customer
TO andreweubanks@localhost;

GRANT ALL
ON Painters.JobInfo
TO andreweubanks@localhost;

GRANT SELECT 
ON Painters.Employee
TO andreweubanks@localhost;

GRANT SELECT 
ON Painters.EmpJob
TO andreweubanks@localhost;

-- Exercise 9
INSERT INTO Painters.Customer
(custPhone, cType, clname, cfname, caddr, ccity, cstate)
VALUES
('834 555-3468', 'C', 'Myers', 'Michael', '212 Cedar Lane', 'Haddonfield', 'IL'),
('689 555-8891', 'R', 'Vorhees', 'Jason', '568 Tree Lane', 'Crystal Lake', 'NJ'),
('295 555-5569', 'C', 'Krueger', 'Freddy', '105 Elm St.', 'Springwood', 'OH');

INSERT INTO Painters.Job
(jobNum, custphone, jobDate, description, amoBilled)
VALUES
(69250, '814 555-2291','2018-04-06', 'Paint Camp.', 120.99),
(33498, '834 555-3468','2018-02-11', 'Paint House.', 261.88), 
(67649, '295 555-5569','2018-05-17', 'Paint School', 358.35);

INSERT INTO Painters.Employee
(ssn, elname, efname, ePhone, hrrate)
VALUES
(298453609, 'Leeroy', 'Bruce', '990 555-8240', 25.65),
(478354671, 'Theman', 'Stan', '202 555-0430', 40.70),
(554671280, 'Carpenter', 'John', '716 555-3976', 85.45);

INSERT INTO Painters.EmpJob
(ssn, jobNum, hrsperjob)
VALUES
(554671280, 33498, 18.95),
(478354671, 67649, 28.57),
(298453609, 69250, 110.75);

-- Exercise 10
UPDATE Customer
SET cfname = 'Michael'
WHERE cfname = 'Myers';

UPDATE Job
SET amoBilled = 95.00
WHERE amoBilled = 120.99;

UPDATE Employee
SET elname = 'Linda'
WHERE elname = 'Myers';

UPDATE EmpJob
SET hrsperjob = 20.00
WHERE hrsperjob = 18.05;

-- Exercise 11
DELETE FROM EmpJob
WHERE ssn = 554671280
AND jobnum =  33498;

DELETE FROM Employee
WHERE ssn = 554671280;

DELETE FROM Job
WHERE Job.jobnum = 33498;

DELETE FROM Job
WHERE Job.custPhone = '834 555-3468';

DELETE FROM Customer
WHERE Customer.custphone = '834 555-3468';

-- 12 --
CREATE VIEW Painters.JobInfo AS
	SELECT Customer.custPhone, Job.jobnum, jobDate, Employee.ssn
	FROM Customer, Job, Employee, EmpJob
	WHERE Customer.custPhone = Job.custPhone
	AND Job.jobnum = EmpJob.jobnum
	AND EmpJob.ssn = Employee.ssn;

-- 13 --
CREATE VIEW Painters.EmployeeTotalPay AS
	SELECT Employee.elname as 'LastName', Employee.efname as 'FirstName', (COUNT(EmpJob.jobnum)*(hrsperjob*hrrate)) AS EmpTotalPay
	FROM EmpJob, Employee
	WHERE EmpJob.ssn = Employee.ssn
	GROUP BY Employee.elname, Employee.efname 
	ORDER BY EmpTotalPay;


SELECT *
FROM Painters.EmployeeTotalPay;

