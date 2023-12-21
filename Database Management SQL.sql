--- Database Management
--- Name: Ling Lin

--- Part A: Create the following tables using SQL Developer, based on the given data types and constraints. Please note that you must study the structure of the tables/columns thoroughly and create the tables using SQL queries. 

--- Table ARTIST

CREATE TABLE ARTIST1
(ArtistID NUMBER(12) NOT NULL,
LastName VARCHAR2(25) NOT NULL,
FirstName VARCHAR2(25) NOT NULL,
Gender CHAR(1),
YearOfBirth NUMBER(4),
PhoneNumber CHAR(10) NOT NULL,
Email VARCHAR2(50) NOT NULL,
ArtistType CHAR(1) NOT NULL,
CONSTRAINT ARTIST1_ArtistID_pk PRIMARY KEY (ArtistID),
CONSTRAINT ARTIST1_gender_ck CHECK (Gender IN('M', 'F', 'N')),
CONSTRAINT ARTIST1_YearOfBirth_ck CHECK (YearOfBirth IN(2023)),
CONSTRAINT ARTIST1_artisttype_ck CHECK (ArtistType IN('C', 'P')));

---DROP TABLE ARTIST1;


---DELETE FROM AGREEMENT;
---DELETE FROM ADMIN;
---DELETE FROM CONTRACT;
---DELETE FROM ARTISTMANAGER;
---DELETE FROM ARTIST;

--SELECT *
--FROM ARTIST

--- Table ARTISTMANAGER

CREATE TABLE ARTISTMANAGER1
(AManagerID NUMBER(12) NOT NULL,
LastName VARCHAR2(25) NOT NULL,
FirstName VARCHAR2(25) NOT NULL,
ArtistID NUMBER(12),
CONSTRAINT ARTISTMANAGER1_AManagerID_pk PRIMARY KEY(AManagerID),
CONSTRAINT ARTISTMANAGER1_ArtistID_fk FOREIGN KEY(ArtistID)
  REFERENCES ARTIST1 (ArtistID));
  
---DROP TABLE ARTISTMANAGER1;


--- Table ADMIN

CREATE TABLE ADMIN1
(AdminID NUMBER(12) NOT NULL,
LastName VARCHAR2(25) NOT NULL,
FirstName VARCHAR2(25) NOT NULL,
AManagerID NUMBER(12) NOT NULL,
CONSTRAINT ADMIN1_AdminID_pk PRIMARY KEY (AdminID),
CONSTRAINT ADMIN1_AManagerID_fk FOREIGN KEY (AManagerID)
 REFERENCES ARTISTMANAGER1 (AManagerID));
 
---DROP TABLE ADMIN1;

--- TABLE CONTRACT
CREATE TABLE CONTRACT1
(ContractID NUMBER(12) NOT NULL,
StartDate DATE NOT NULL,
EndDate DATE NOT NULL,
RoyaltyPercentage NUMBER(3,2) NOT NULL,
ArtistID NUMBER(12) NOT NULL,
CONSTRAINT contract1_ContractID_pk PRIMARY KEY(ContractID),
CONSTRAINT contract1_ArtistID_fk FOREIGN KEY (ArtistID)
  REFERENCES ARTIST1 (ArtistID));
  
---DROP TABLE CONTRACT1;


--- Table AGREEMENT

CREATE TABLE AGREEMENT1
(AgreementNbr NUMBER(12) NOT NULL,
GrossAmount NUMBER(12,2) NOT NULL,
AtSourceTaxWithheld NUMBER(12,2),
EventID NUMBER(12) NOT NULL,
ContractID NUMBER(12) NOT NULL,
CONSTRAINT AGREEMENT1_AgreementNbr_pk PRIMARY KEY (AgreementNbr),
CONSTRAINT AGREEMENT1_ContractID_fk FOREIGN KEY (ContractID)
REFERENCES CONTRACT1 (ContractID));

--DROP TABLE AGREEMENT1;


---Part B:  Write SQL queries of each of the following questions:

---1.	Write SQL query to show all the tables you have created. You need to use a single query to show all the table names in a single column.

SELECT TABLE_NAME FROM USER_TABLES
WHERE TABLE_NAME IN ('ADMIN1','AGREEMENT1','ARTIST1','ARTISTMANAGER1','CONTRACT1');

---2.	Write SQL query to show all the constraints for the tables you have created above

SELECT * FROM USER_CONSTRAINTS
WHERE TABLE_NAME IN ('ADMIN1','AGREEMENT1','ARTIST1','ARTISTMANAGER1','CONTRACT1');

---3.	Insert one row in each of the tables. You can assume the values of your choice. Please keep in mind to consider referential integrity while inserting the values.

SELECT * FROM ADMIN1;
SELECT * FROM ARTIST1;
SELECT * FROM CONTRACT1;
DESC CONTRACT1;

INSERT INTO ARTIST1
 VALUES (111,'IDA','LIN','F',2023,1234567890,'11@qq.com','C');
 
INSERT INTO ARTISTMANAGER1
VALUES (211,'BELL','CHEN',111);

 
INSERT INTO CONTRACT1
VALUES (31,'22-JUL-09','24-JUL-08',3.00,111);

 
INSERT INTO ADMIN1
VALUES (311,'LING','LIN',211);

INSERT INTO AGREEMENT1
VALUES (411,12.99,6.99,3889,31);

---4.	Add a column named salary with a datatype of NUMBER(9,2) to the ARTISTMANAGER table. Ensure that the amount entered should not be less than 0.

ALTER TABLE ARTISTMANAGER1
ADD (salary NUMBER(9,2)
    CONSTRAINT artistmanager1_salary_ck CHECK(salary>0);

SELECT * FROM ARTISTMANAGER1;

---5.	There can be a change in the width of the mail on Artists. Write SQL query to change the datatype of all the Artists�s email to VARCHAR2(55). 

ALTER TABLE Artist1
MODIFY (email VARCHAR2(55));
DESC artist1;

---6.	Change the CONTRACT table so that only less than 100 can be entered in the column �RoyaltyPercentage�. 

ALTER TABLE CONTRACT1
ADD CONSTRAINT contract1_royaltypercentage_ck CHECK(RoyaltyPercentage<100);
SELECT * FROM USER_CONSTRAINTS
WHERE TABLE_NAME='CONTRACT1';

---7.	Change the ARTIST table so that NULL values can�t be entered in the name columns (First and Last).

ALTER TABLE ARTIST1
MODIFY (lastname CONSTRAINT artist1_lastname_nn NOT NULL, firstname CONSTRAINT artist1_firstname_nn NOT NULL);
SELECT * FROM USER_CONSTRAINTS
WHERE TABLE_NAME='ARTIST1';

---8.	Write SQL query to remove the column ArtistType from the ARTIST table.

ALTER TABLE ARTIST1
DROP COLUMN ArtistType;
DESC ARTIST1;


---9.	Write SQL queries to delete the data from all the tables.

DELETE FROM AGREEMENT1;
DELETE FROM ADMIN1;
DELETE FROM CONTRACT1;
DELETE FROM ARTISTMANAGER1;
DELETE FROM ARTIST1;


--SELECT * FROM AGREEMENT1;

---10.	Write SQL queries to remove all the tables from one by one. You need to keep the sequence of the removal in mind to remove the tables successfully. You are not allowed to use CASCADE option. 

DROP TABLE AGREEMENT1;
DROP TABLE ADMIN1;
DROP TABLE CONTRACT1;
DROP TABLE ARTISTMANAGER1;
DROP TABLE ARTIST1;

















