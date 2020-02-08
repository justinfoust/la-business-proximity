CREATE TABLE Active (
  business_name character varying(100),
  dba_name character varying(200),
  street_address character varying(100),
  city character varying(100),
  zip_code character varying(50),
  naics character varying(100),
  description character varying(200),
  district character varying(50),
  start_date character varying(50),
  location character varying(100)
);



--PROJECT 2 

--CLEAN UP P2 THAT HAS ALL OF THE BUSINESS INFORMATION
SELECT * 
FROM p2

--Drop tables that will not be useful in this project for 
ALTER TABLE p2 DROP "LOCATION_ACCOUNT";
ALTER TABLE p2 DROP "END_DATE";


--INCOME HAS ALL OF THE CITY AND AVGERAGE INCOME INFORMATION
SELECT * 
FROM income
--Drop column that will not be used. 
ALTER TABLE income DROP Amount;


----------------------
--Create common font for city between the 2 datasets, Lowercase city in Income
UPDATE income SET city=LOWER(city);

UPDATE p2 SET "CITY"=LOWER("CITY");

--change Income column for city into text 
ALTER TABLE income
ALTER COLUMN city SET DATA TYPE text;

-----------------FILES MATCH UP 

------------P2 TEXT 
SELECT * 
FROM p2

--------JOIN TABLES (INNER JOIN)
--INNER JOIN to match city with two data sets 
SELECT *
FROM p2
INNER JOIN income
ON p2."CITY" = income.city
ORDER BY "CITY";