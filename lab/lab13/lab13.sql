.read data.sql


CREATE TABLE bluedog AS
  SELECT color, pet FROM students WHERE color = "blue" AND pet = "dog";

CREATE TABLE bluedog_songs AS
  SELECT color, pet, song FROM students WHERE color = "blue" AND pet = "dog";


CREATE TABLE smallest_int_having AS
  SELECT time, smallest FROM students GROUP BY smallest HAVING count(smallest) == 1;


CREATE TABLE matchmaker AS
  SELECT A.pet, A.song, A.color, B.color FROM students AS A, students AS B WHERE A.pet = B.pet AND A.song = B.song AND A.time < B.time;


CREATE TABLE sevens AS
  SELECT A.seven FROM students AS A, numbers AS B WHERE A.number = 7 AND A.time = B.time AND B.'7' = 'True';


CREATE TABLE average_prices AS
  SELECT "REPLACE THIS LINE WITH YOUR SOLUTION";


CREATE TABLE lowest_prices AS
  SELECT "REPLACE THIS LINE WITH YOUR SOLUTION";


CREATE TABLE shopping_list AS
  SELECT "REPLACE THIS LINE WITH YOUR SOLUTION";


CREATE TABLE total_bandwidth AS
  SELECT "REPLACE THIS LINE WITH YOUR SOLUTION";

