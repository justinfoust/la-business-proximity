
--Create table for Income_LA data set that includes city information and household median for a
-- 6 year time spand. We will find the average household income for each city 

--Create a table for income_la
CREATE TABLE income_la (
	policy VARCHAR,
	dataset VARCHAR,
	variable VARCHAR,
	year VARCHAR,
	amount Int, 
	tract VARCHAR,
	tractnumber VARCHAR,
	city VARCHAR,
	geoid VARCHAR,
	location VARCHAR,  
	row VARCHAR,
	date DATE
);


--Check to see if data is pulling in 
SELECT  *
From income;

--Drop all Rows that are not needed. 
ALTER TABLE income DROP policy;
ALTER TABLE income DROP Dataset;
ALTER TABLE income DROP variable;
ALTER TABLE income DROP tract;
ALTER TABLE income DROP tractnumber;
ALTER TABLE income DROP geoid;
ALTER TABLE income DROP location;
ALTER TABLE income DROP row;
ALTER TABLE income DROP date;


---Determine what the start and end "year" is for the median income
SELECT * 
FROM income
ORDER BY "year" ASC; 
--ORDER BY "year" DESC; check parameters - Conclusion 2010 to 2016 

---Group by Neighborhood and find the average
--1. ALTER TABLE TO HAVE AVG_INCOME
ALTER TABLE income
ADD COLUMN AVG_income integer default 0;

SELECT * FROM income  ORDER BY city 

SELECT *
FROM income
WHERE city = 'Acton';

--FInding the average from each group 
SELECT AVG(amount)
from income
where city = 'Acton';

--Create new Row of values with city and avg income 
INSERT INTO income(year, amount, city, avg_income)
Values ('2010 - 2016', 0, 'Acton', 86475.92);

--Delete all rows that do not belong. 
DELETE FROM income
WHERE avg_income = 0 AND city = 'Acton'; 
--------------------------------------------------
--Continue on to next city 
-- the items on the side of each function are the average income for the cities
--Adams - Normandie
SELECT *
FROM income
WHERE city = 'Adams-Normandie'; 

--"28663.028571428571"
SELECT AVG(amount)  
from income
where city = 'Adams-Normandie';

SELECT AVG(amount)  --"113797.619047619048"
from income
where city = 'Agoura Hills';

--"99569.857142857143"
SELECT AVG(amount)  
from income
where city = 'Agua Dulce';

--"54605.20"
SELECT AVG(amount)  
from income
where city = 'Alhambra';

--"75665.85"
SELECT AVG(amount)  
from income
where city = 'Alondra Park';

--"86211.62"
SELECT AVG(amount)  
from income
where city = 'Altadena';

--"82719.28
SELECT AVG(amount)  
from income
where city = 'Angeles Crest';

--"80414.61
SELECT AVG(amount)  
from income
where city = 'Arcadia';

--"63393.00
SELECT AVG(amount)  
from income
where city = 'Arleta';

--"35631.50
SELECT AVG(amount)  
from income
where city = 'Arlington Heights';

--59220.90
SELECT AVG(amount)  
from income
where city = 'Artesia';

--"39929.21
SELECT AVG(amount)  
from income
where city = 'Athens';

--"61670.95
SELECT AVG(amount)  
from income
where city = 'Atwater Village';

--"56259.42
SELECT AVG(amount)  
from income
where city = 'Avalon';

--"71982.64
SELECT AVG(amount)  
from income
where city = 'Avocado Heights';

--"56585.27
SELECT AVG(amount)  
from income
where city = 'Azusa';


---Insert values from cities listed above. 
INSERT INTO income(year, amount, city, avg_income)
Values ('2010 - 2016', 0, 'Adams-Normandie', 28663), 
('2010 - 2016', 0, 'Agoura Hills', 113797.61),
('2010 - 2016', 0, 'Agua Dulce', 99569.85),
('2010 - 2016', 0, 'Alhambra', 54605.20),
('2010 - 2016', 0, 'Alondra Park', 75665.85),
('2010 - 2016', 0, 'Altadena', 86211.62),
('2010 - 2016', 0, 'Angeles Crest', 82719.28),
('2010 - 2016', 0, 'Arcadia', 80414.61),
('2010 - 2016', 0, 'Arleta', 63393.00),
('2010 - 2016', 0, 'Arlington Heights', 35631.50),
('2010 - 2016', 0, 'Artesia', 59220.90),
('2010 - 2016', 0, 'Athens', 39929.21),
('2010 - 2016', 0, 'Atwater Village', 61670.95),
('2010 - 2016', 0, 'Avalon', 56259.42),
('2010 - 2016', 0, 'Avocado Heights', 71982.64),
('2010 - 2016', 0, 'Azusa', 56585.27);

SELECT * FROM income  ORDER BY city 

DELETE FROM income
WHERE avg_income = 0 AND city = 'Acton'; 

--Delete cities that do not have any number under avg_income 
--getting rid of city information. 
SELECT * FROM income  ORDER BY city 

DELETE FROM income
WHERE avg_income = 0 AND city = 'Adams-Normandie'; 
DELETE FROM income
WHERE avg_income = 0 AND city = 'Agoura Hills';
DELETE FROM income
WHERE avg_income = 0 AND city = 'Agua Dulce'; 
DELETE FROM income
WHERE avg_income = 0 AND city = 'Alhambra'; 
DELETE FROM income
WHERE avg_income = 0 AND city = 'Alondra Park'; 
DELETE FROM income
WHERE avg_income = 0 AND city = 'Altadena'; 
DELETE FROM income
WHERE avg_income = 0 AND city = 'Angeles Crest'; 
DELETE FROM income
WHERE avg_income = 0 AND city = 'Arcadia'; 
DELETE FROM income
WHERE avg_income = 0 AND city = 'Arleta'; 
DELETE FROM income
WHERE avg_income = 0 AND city = 'Arlington Heights';
DELETE FROM income
WHERE avg_income = 0 AND city = 'Artesia';
DELETE FROM income
WHERE avg_income = 0 AND city = 'Athens'; 
DELETE FROM income
WHERE avg_income = 0 AND city = 'Atwater Village'; 
DELETE FROM income
WHERE avg_income = 0 AND city = 'Avalon'; 
DELETE FROM income
WHERE avg_income = 0 AND city = 'Avocado Heights';
DELETE FROM income
WHERE avg_income = 0 AND city = 'Azusa'; 


SELECT * FROM income  ORDER BY city 


---Cities that start with B 
SELECT AVG(amount)
from income
where city = 'Baldwin Hills/Crenshaw'; --"35786.

SELECT AVG(amount)
from income
where city = 'Baldwin Park'; --"53352.30

SELECT AVG(amount)
from income
where city = 'Bel-Air'; --"206112.85

SELECT AVG(amount)
from income
where city = 'Bell'; --"37446.28

SELECT AVG(amount)
from income
where city = 'Bell Gardens';  --"38498.95

SELECT AVG(amount)
from income
where city = 'Bellflower';  --"52011.38

SELECT AVG(amount)
from income
where city = 'Beverly Crest';  --"169834.23

SELECT AVG(amount)
from income
where city = 'Beverly Grove'; --"77703.58

SELECT AVG(amount)
from income
where city = 'Beverly Hills';  -- "126310.00

SELECT AVG(amount)
from income
where city = 'Beverlywood';  --"155602.71

SELECT AVG(amount)
from income
where city = 'Boyle Heights'; --"33310.88

SELECT AVG(amount)
from income
where city = 'Bradbury';  --"94779.85

SELECT AVG(amount)
from income
where city = 'Brentwood'; --"140763.12

SELECT AVG(amount)
from income
where city = 'Broadway-Manchester';  --"29079.20
SELECT AVG(amount)
from income
where city = 'Burbank';  --"67878.51

--insert B values into the database
INSERT INTO income(year, amount, city, avg_income)
Values ('2010 - 2016', 0, 'Baldwin Hills/Crenshaw', 35786), 
('2010 - 2016', 0, 'Baldwin Park', 53352.30),
('2010 - 2016', 0, 'Bel-Air', 206112.85),
('2010 - 2016', 0, 'Bell', 37446.28),
('2010 - 2016', 0, 'Bell Gardens', 38498.95),
('2010 - 2016', 0, 'Bellflower', 52011.38),
('2010 - 2016', 0, 'Beverly Crest', 169834.23),
('2010 - 2016', 0, 'Beverly Grove', 77703.58),
('2010 - 2016', 0, 'Beverly Hills', 126310.00),
('2010 - 2016', 0, 'Beverlywood', 155602.71),
('2010 - 2016', 0, 'Boyle Heights', 33310.88),
('2010 - 2016', 0, 'Bradbury', 94779.85),
('2010 - 2016', 0, 'Brentwood', 140763.12),
('2010 - 2016', 0, 'Broadway-Manchester', 29079.20),
('2010 - 2016', 0, 'Burbank', 67878.51);

--DELETE all city duplicates that do not have average.
DELETE FROM income
WHERE avg_income = 0 AND city = 'Baldwin Hills/Crenshaw'; 
DELETE FROM income
WHERE avg_income = 0 AND city = 'Baldwin Park';
DELETE FROM income
WHERE avg_income = 0 AND city = 'Bel-Air'; 
DELETE FROM income
WHERE avg_income = 0 AND city = 'Bell'; 
DELETE FROM income
WHERE avg_income = 0 AND city = 'Bell Gardens'; 
DELETE FROM income
WHERE avg_income = 0 AND city = 'Beverly'; 
DELETE FROM income
WHERE avg_income = 0 AND city = 'Beverly Hills'; 
DELETE FROM income
WHERE avg_income = 0 AND city = 'Boyle Heights'; 
DELETE FROM income
WHERE avg_income = 0 AND city = 'Bradbury'; 
DELETE FROM income
WHERE avg_income = 0 AND city = 'Brentwood'; 
DELETE FROM income
WHERE avg_income = 0 AND city = 'Burbank'; 

SELECT * FROM income  ORDER BY city 
------------------------------------------Continue on with C's 
SELECT AVG(amount)
from income
where city = 'Calabasas'; --"119282.23
SELECT AVG(amount)
from income
where city = 'Canoga Park'; --""52341.75
SELECT AVG(amount)
from income
where city = 'Carson'; --"71191.88
INSERT INTO income(year, amount, city, avg_income)
Values ('2010 - 2016', 0, 'Calabasas', 119282.23), 
('2010 - 2016', 0, 'Canoga Park', 52341.75),
('2010 - 2016', 0, 'Carson', 71191.88);


DELETE FROM income
WHERE avg_income = 0 AND city = 'Calabasas'; 
DELETE FROM income
WHERE avg_income = 0 AND city = 'Canoga Park';
DELETE FROM income
WHERE avg_income = 0 AND city = 'Carson';
---------------------------------------------------------- EEEEEEE
SELECT * FROM income  ORDER BY city 

SELECT AVG(amount)
from income
where city = 'El Monte'; --""41289.72

SELECT AVG(amount)
from income
where city = 'El Segundo'; --"86838.14

SELECT AVG(amount)
from income
where city = 'Encino';  ---"86891.97

INSERT INTO income(year, amount, city, avg_income)
Values ('2010 - 2016', 0, 'El Monte', 41289.72), 
('2010 - 2016', 0, 'El Segundo', 86838.14),
('2010 - 2016', 0, 'Encino', 86891.97);


DELETE FROM income
WHERE avg_income = 0 AND city = 'El Monte'; 
DELETE FROM income
WHERE avg_income = 0 AND city = 'El Segundo';
DELETE FROM income
WHERE avg_income = 0 AND city = 'Encino';
------------------------------------------------------------__F
SELECT AVG(amount)
from income
where city = 'Fairfax'; --"75483.39

SELECT AVG(amount)
from income
where city = 'Florence'; --"31380.60

SELECT AVG(amount)
from income
where city = 'Gardena';  ---"50537.22

SELECT AVG(amount)
from income
where city = 'Glassell Park'; --"52044.03

SELECT AVG(amount)
from income
where city = 'Glendale'; --""62707.84

SELECT AVG(amount)
from income
where city = 'Granada Hills';  ---"84000.41

INSERT INTO income(year, amount, city, avg_income)
Values ('2010 - 2016', 0, 'Fairfax', 75483.39),
('2010 - 2016', 0, 'Florence', 31380.60),
('2010 - 2016', 0, 'Gardena', 50537.22),
('2010 - 2016', 0, 'Glassell Park', 52044.03),
('2010 - 2016', 0, 'Glendale', 62707.84),
('2010 - 2016', 0, 'Granada Hills', 84000.41);

DELETE FROM income
WHERE avg_income = 0 AND city = 'Fairfax'; 
DELETE FROM income
WHERE avg_income = 0 AND city = 'Florence';
DELETE FROM income
WHERE avg_income = 0 AND city = 'Gardena';
DELETE FROM income
WHERE avg_income = 0 AND city = 'Glassell Park';
DELETE FROM income
WHERE avg_income = 0 AND city = 'Glendale';
DELETE FROM income
WHERE avg_income = 0 AND city = 'Granada Hills';

-----------------------H I J K 

SELECT AVG(amount)
from income
where city = 'Hacienda Heights'; --""75703.72
SELECT AVG(amount)
from income
where city = 'Harbor City'; --"31380.60

SELECT AVG(amount)
from income
where city = 'Hawthorne';  ---""50142.18

SELECT AVG(amount)
from income
where city = 'Hermosa Beach'; --""107173.65

SELECT AVG(amount)
from income
where city = 'Hidden Hills'; --"133138.14

SELECT AVG(amount)
from income
where city = 'Highland Park';  --"50272.64

SELECT AVG(amount)
from income
where city = 'Hollywood';  --"38151.76

SELECT AVG(amount)
from income
where city = 'Huntington Park';  --""37163.79203"

INSERT INTO income(year, amount, city, avg_income)
Values ('2010 - 2016', 0, 'Hacienda Heights', 75703.72),
('2010 - 2016', 0, 'Harbor City', 31380.60),
('2010 - 2016', 0, 'Hawthorne', 50142.18),
('2010 - 2016', 0, 'Hermosa Beach', 107173.65),
('2010 - 2016', 0, 'Hidden Hills', 133138.14),
('2010 - 2016', 0, 'Highland Park', 50272.64),
('2010 - 2016', 0, 'Hollywood', 38151.76),
('2010 - 2016', 0, 'Huntington Park', 38151.76);

DELETE FROM income
WHERE avg_income = 0 AND city = 'Hacienda Heights'; 
DELETE FROM income
WHERE avg_income = 0 AND city = 'Harbor City';
DELETE FROM income
WHERE avg_income = 0 AND city = 'Hawthorne';
DELETE FROM income
WHERE avg_income = 0 AND city = 'Hermosa Beach';
DELETE FROM income
WHERE avg_income = 0 AND city = 'Hidden Hills';
DELETE FROM income
WHERE avg_income = 0 AND city = 'Highland Park';
DELETE FROM income
WHERE avg_income = 0 AND city = 'Hollywood';
DELETE FROM income
WHERE avg_income = 0 AND city = 'Huntington Park';

---------------------------------------------------------
----- IIIII LLLLL 
SELECT AVG(amount)
from income
where city = 'Inglewood'; --"47040.29
SELECT AVG(amount)
from income
where city = 'Irwindale'; --"58774.00
SELECT AVG(amount)
from income
where city = 'La Canada Flintridge';  ---"160215

SELECT AVG(amount)
from income
where city = 'La Habra Heights'; --""116027.71

SELECT AVG(amount)
from income
where city = 'La Puente'; --"54274.46

SELECT AVG(amount)
from income
where city = 'La Verne';  --"78394.61

SELECT AVG(amount)
from income
where city = 'Lake Balboa';  --"66200.18
SELECT AVG(amount)
from income
where city = 'Lake View Terrace';  --"61301.42
SELECT AVG(amount)
from income
where city = 'Lakewood';  --"78127.50
SELECT AVG(amount)
from income
where city = 'Lancaster';  --"48977.89
SELECT AVG(amount)
from income
where city = 'Lennox';  --"35962.31
SELECT AVG(amount)
from income
where city = 'Lincoln Heights';  --"30269.97
SELECT AVG(amount)
from income
where city = 'Lomita';  --"61560.85
SELECT AVG(amount)
from income
where city = 'Long Beach';  --"56677.39
SELECT AVG(amount)
from income
where city = 'Lynwood'; --"44532.31

INSERT INTO income(year, amount, city, avg_income)
Values ('2010 - 2016', 0, 'Inglewood', 47040.29),
('2010 - 2016', 0, 'Irwindale', 58774.00),
('2010 - 2016', 0, 'La Canada Flintridge', 160215),
('2010 - 2016', 0, 'La Habra Heights', 116027.71),
('2010 - 2016', 0, 'La Puente', 54274.46),
('2010 - 2016', 0, 'La Verne', 78394.61),
('2010 - 2016', 0, 'Lake View Terrace', 66200.18),
('2010 - 2016', 0, 'Lakewood', 78127.50),
('2010 - 2016', 0, 'Lancaster', 48977.89),
('2010 - 2016', 0, 'Lincoln Heights', 30269.97),
('2010 - 2016', 0, 'Lomita', 61560.85),
('2010 - 2016', 0, 'Long Beach', 38151.76),
('2010 - 2016', 0, 'Lynwood', 44532.31);


DELETE FROM income
WHERE avg_income = 0 AND city = 'Inglewood'; 
DELETE FROM income
WHERE avg_income = 0 AND city = 'Irwindale';
DELETE FROM income
WHERE avg_income = 0 AND city = 'La Canada Flintridge';
DELETE FROM income
WHERE avg_income = 0 AND city = 'La Habra Heights';
DELETE FROM income
WHERE avg_income = 0 AND city = 'La Puente';
DELETE FROM income
WHERE avg_income = 0 AND city = 'La Verne';
DELETE FROM income
WHERE avg_income = 0 AND city = 'Lake View Terrace';
DELETE FROM income
WHERE avg_income = 0 AND city = 'Lakewood';
DELETE FROM income
WHERE avg_income = 0 AND city = 'Lancaster';
DELETE FROM income
WHERE avg_income = 0 AND city = 'Lincoln Heights';
DELETE FROM income
WHERE avg_income = 0 AND city = 'Lomita';
DELETE FROM income
WHERE avg_income = 0 AND city = 'Long Beach';
DELETE FROM income
WHERE avg_income = 0 AND city = 'Lynwood';
-------------------------------------------------

--M and N 

SELECT AVG(amount)
from income
where city = 'Malibu'; --"124910.71
SELECT AVG(amount)
from income
where city = 'Manhattan Beach'; --"142293.30
SELECT AVG(amount)
from income
where city = 'Marina del Rey';  ---"94994.57

SELECT AVG(amount)
from income
where city = 'Maywood'; --"37328.65

SELECT AVG(amount)
from income
where city = 'Monrovia'; --"77147.53

SELECT AVG(amount)
from income
where city = 'Montebello';  --""50147.46

SELECT AVG(amount)
from income
where city = 'Monterey Park';  --"54959.49
SELECT AVG(amount)
from income
where city = 'North Hills';  --"55125.92
SELECT AVG(amount)
from income
where city = 'North Hollywood';  --"44299.89
SELECT AVG(amount)
from income
where city = 'Northridge';  --"64251.19
SELECT AVG(amount)
from income
where city = 'Norwalk';  --"61917.89
SELECT AVG(amount)
from income
where city = 'Lincoln Heights';  --"30269.97
SELECT AVG(amount)
from income
where city = 'Lomita';  --"61560.85
SELECT AVG(amount)
from income
where city = 'Long Beach';  --"56677.39
SELECT AVG(amount)
from income
where city = 'Lynwood'; --"44532.31

INSERT INTO income(year, amount, city, avg_income)
Values ('2010 - 2016', 0, 'Malibu', 124910.71),
('2010 - 2016', 0, 'Manhattan Beach', 142293.30),
('2010 - 2016', 0, 'Marina del Rey', 94994.57),
('2010 - 2016', 0, 'Maywood', 37328.65),
('2010 - 2016', 0, 'Monrovia', 77147.53),
('2010 - 2016', 0, 'Montebello', 50147.46),
('2010 - 2016', 0, 'Monterey Park', 54959.49),
('2010 - 2016', 0, 'North Hills', 55125.92),
('2010 - 2016', 0, 'North Hollywood', 44299.89),
('2010 - 2016', 0, 'Northridge', 64251.19),
('2010 - 2016', 0, 'Norwalk', 61917.89),
('2010 - 2016', 0, 'Long Beach', 38151.76),
('2010 - 2016', 0, 'Lynwood', 44532.31);


DELETE FROM income
WHERE avg_income = 0 AND city = 'Malibu'; 
DELETE FROM income
WHERE avg_income = 0 AND city = 'Manhattan Beach';
DELETE FROM income
WHERE avg_income = 0 AND city = 'Marina del Rey';
DELETE FROM income
WHERE avg_income = 0 AND city = 'Maywood';
DELETE FROM income
WHERE avg_income = 0 AND city = 'Monrovia';
DELETE FROM income
WHERE avg_income = 0 AND city = 'Montebello';
DELETE FROM income
WHERE avg_income = 0 AND city = 'Monterey Park';
DELETE FROM income
WHERE avg_income = 0 AND city = 'North Hills';
DELETE FROM income
WHERE avg_income = 0 AND city = 'North Hollywood';
DELETE FROM income
WHERE avg_income = 0 AND city = 'Northridge';
DELETE FROM income
WHERE avg_income = 0 AND city = 'Norwalk';
DELETE FROM income
WHERE avg_income = 0 AND city = 'Long Beach';
DELETE FROM income
WHERE avg_income = 0 AND city = 'Lynwood';

-------------------------------------------  continue on. 
SELECT AVG(amount)
from income
where city = 'Pacific Palisades'; --"152454.08
SELECT AVG(amount)
from income
where city = 'Pacoima'; --"45873.98
SELECT AVG(amount)
from income
where city = 'Palmdale';  ---"52953.96
SELECT AVG(amount)
from income
where city = 'Palos Verdes Estates'; --"172335.28
SELECT AVG(amount)
from income
where city = 'Panorama City'; --""41695.15
SELECT AVG(amount)
from income
where city = 'Paramount';  --"44642.04
SELECT AVG(amount)
from income
where city = 'Pasadena';  --"77405.34
SELECT AVG(amount)
from income
where city = 'Pico Rivera';  --""56442.34
SELECT AVG(amount)
from income
where city = 'Playa del Rey';  --"100938.00
SELECT AVG(amount)
from income
where city = 'Playa Vista';  --"72714.64
SELECT AVG(amount)
from income
where city = 'Pomona';  --""51403.91
SELECT AVG(amount)
from income
where city = 'Porter Ranch';  --"111909.02
SELECT AVG(amount)
from income
where city = 'Rancho Dominguez';  --"51960.57
SELECT AVG(amount)
from income
where city = 'Rancho Palos Verdes';  --"121082.33
SELECT AVG(amount)
from income
where city = 'Redondo Beach'; --"98485.08
SELECT AVG(amount)
from income
where city = 'Rolling Hills'; --"217168.57
SELECT AVG(amount)
from income
where city = 'Rolling Hills Estates';  --"119639.17
SELECT AVG(amount)
from income
where city = 'Rosemead'; --"47546.54

INSERT INTO income(year, amount, city, avg_income)
Values ('2010 - 2016', 0, 'Pacific Palisades', 152454.08),
('2010 - 2016', 0, 'Pacoima', 45873.98),
('2010 - 2016', 0, 'Palmdale', 52953.96),
('2010 - 2016', 0, 'Palos Verdes Estates', 172335.28),
('2010 - 2016', 0, 'Panorama City', 41695.15),
('2010 - 2016', 0, 'Paramount', 44642.04),
('2010 - 2016', 0, 'Pasadena', 77405.34),
('2010 - 2016', 0, 'Pico Rivera', 56442.34),
('2010 - 2016', 0, 'Playa del Rey', 100938.00),
('2010 - 2016', 0, 'Playa Vista', 72714.64),
('2010 - 2016', 0, 'Pomona', 51403.91),
('2010 - 2016', 0, 'Porter Ranch', 111909.02),
('2010 - 2016', 0, 'Rancho Dominguez', 51960.57),
('2010 - 2016', 0, 'Rancho Palos Verdes', 121082.33),
('2010 - 2016', 0, 'Redondo Beach', 98485.08),
('2010 - 2016', 0, 'Rolling Hills', 217168.57),
('2010 - 2016', 0, 'Rolling Hills Estates', 2119639.17),
('2010 - 2016', 0, 'Rosemead', 47546.54);


DELETE FROM income
WHERE avg_income = 0 AND city = 'Pacific Palisades'; 
DELETE FROM income
WHERE avg_income = 0 AND city = 'Pacoima';
DELETE FROM income
WHERE avg_income = 0 AND city = 'Palmdale';
DELETE FROM income
WHERE avg_income = 0 AND city = 'Palos Verdes Estates';
DELETE FROM income
WHERE avg_income = 0 AND city = 'Panorama City';
DELETE FROM income
WHERE avg_income = 0 AND city = 'Paramount';
DELETE FROM income
WHERE avg_income = 0 AND city = 'Pasadena';
DELETE FROM income
WHERE avg_income = 0 AND city = 'Pico Rivera';
DELETE FROM income
WHERE avg_income = 0 AND city = 'Playa del Rey';
DELETE FROM income
WHERE avg_income = 0 AND city = 'Playa Vista';
DELETE FROM income
WHERE avg_income = 0 AND city = 'Pomona';
DELETE FROM income
WHERE avg_income = 0 AND city = 'Porter Ranch';
DELETE FROM income
WHERE avg_income = 0 AND city = 'Rancho Dominguez';
DELETE FROM income
WHERE avg_income = 0 AND city = 'Rancho Palos Verdes';
DELETE FROM income
WHERE avg_income = 0 AND city = 'Redondo Beach';
DELETE FROM income
WHERE avg_income = 0 AND city = 'Rolling Hills';
DELETE FROM income
WHERE avg_income = 0 AND city = 'Rolling Hills Estate';
DELETE FROM income
WHERE avg_income = 0 AND city = 'Rosemead';

------------------------------SSSSSS
SELECT AVG(amount)
from income
where city = 'San Fernando'; --"51287.60
SELECT AVG(amount)
from income
where city = 'San Gabriel';  --"62154.85
SELECT AVG(amount)
from income
where city = 'San Pedro';  --61668.19
SELECT AVG(amount)
from income
where city = 'Santa Clarita';  --"111909.02
SELECT AVG(amount)
from income
where city = 'Santa Fe Springs';  --"52887.95
SELECT AVG(amount)
from income
where city = 'Santa Monica';  --"79236.54
SELECT AVG(amount)
from income
where city = 'Sherman Oaks'; --""79495.35
SELECT AVG(amount)
from income
where city = 'Signal Hill'; --"56111.42
SELECT AVG(amount)
from income
where city = 'South Gate';  --"42080.47
SELECT AVG(amount)
from income
where city = 'Studio City'; --"86571.26
SELECT AVG(amount)
from income
where city = 'Tarzana'; --"87208.68
SELECT AVG(amount)
from income
where city = 'Topanga';  --"128877.92
SELECT AVG(amount)
from income
where city = 'Torrance'; --"79279.39
SELECT AVG(amount)
from income
where city = 'Tujunga'; --"63443.84
SELECT AVG(amount)
from income
where city = 'Valley Glen';  --"45560.35
SELECT AVG(amount)
from income
where city = 'Van Nuys'; --"38599.27
SELECT AVG(amount)
from income
where city = 'Venice'; --"85555.68
SELECT AVG(amount)
from income
where city = 'Vernon'; --""39173.83
SELECT AVG(amount)
from income
where city = 'West Hollywood'; --"55154.26
SELECT AVG(amount)
from income
where city = 'Westchester'; --"84306.79
SELECT AVG(amount)
from income
where city = 'Westwood'; --"76171.47

INSERT INTO income(year, amount, city, avg_income)
Values ('2010 - 2016', 0, 'San Fernando', 51287.60),
('2010 - 2016', 0, 'San Gabriel', 62154.85),
('2010 - 2016', 0, 'San Pedro', 61668.19),
('2010 - 2016', 0, 'Santa Clarita', 172335.28),
('2010 - 2016', 0, 'Santa Fe Springs', 52887.95),
('2010 - 2016', 0, 'Santa Monica', 79236.54),
('2010 - 2016', 0, 'Sherman Oaks', 79495.35),
('2010 - 2016', 0, 'Signal Hill', 56111.42),
('2010 - 2016', 0, 'South Gate', 42080.47),
('2010 - 2016', 0, 'Studio City', 86571.26),
('2010 - 2016', 0, 'Tarzana', 87208.68),
('2010 - 2016', 0, 'Topanga', 128877.92),
('2010 - 2016', 0, 'Torrance', 79279.39),
('2010 - 2016', 0, 'Tujunga', 63443.84),
('2010 - 2016', 0, 'Valley Glen', 45560.35),
('2010 - 2016', 0, 'Van Nuys', 38599.27),
('2010 - 2016', 0, 'Venice', 85555.68),
('2010 - 2016', 0, 'Vernon', 47546.54),
('2010 - 2016', 0, 'West Hollywood', 55154.26),
('2010 - 2016', 0, 'Westchester', 84306.79),
('2010 - 2016', 0, 'Westwood', 76171.47);


DELETE FROM income
WHERE avg_income = 0 AND city = 'San Fernando'; 
DELETE FROM income
WHERE avg_income = 0 AND city = 'San Gabriel';
DELETE FROM income
WHERE avg_income = 0 AND city = 'San Pedro';
DELETE FROM income
WHERE avg_income = 0 AND city = 'Santa Clarita';
DELETE FROM income
WHERE avg_income = 0 AND city = 'Santa Fe Springs';
DELETE FROM income
WHERE avg_income = 0 AND city = 'Santa Monica';
DELETE FROM income
WHERE avg_income = 0 AND city = 'Sherman Oaks';
DELETE FROM income
WHERE avg_income = 0 AND city = 'Signal Hill';
DELETE FROM income
WHERE avg_income = 0 AND city = 'South Gate';
DELETE FROM income
WHERE avg_income = 0 AND city = 'Studio City';
DELETE FROM income
WHERE avg_income = 0 AND city = 'Tarzana';
DELETE FROM income
WHERE avg_income = 0 AND city = 'Topanga';
DELETE FROM income
WHERE avg_income = 0 AND city = 'Torrance';
DELETE FROM income
WHERE avg_income = 0 AND city = 'Tujunga';
DELETE FROM income
WHERE avg_income = 0 AND city = 'Valley Glen';
DELETE FROM income
WHERE avg_income = 0 AND city = 'Van Nuys';
DELETE FROM income
WHERE avg_income = 0 AND city = 'Venice';
DELETE FROM income
WHERE avg_income = 0 AND city = 'Vernon';
DELETE FROM income
WHERE avg_income = 0 AND city = 'West Hollywood';
DELETE FROM income
WHERE avg_income = 0 AND city = 'Westchester';
DELETE FROM income
WHERE avg_income = 0 AND city = 'Westwood';

DELETE FROM income
WHERE avg_income = 0;

--Double check your work to make sure all the cities are there. 

SELECT * FROM income  ORDER BY city


--RESULT you should only see the avg_income and the city name. 
