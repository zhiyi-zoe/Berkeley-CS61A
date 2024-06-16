CREATE TABLE parents AS
  SELECT "abraham" AS parent, "barack" AS child UNION
  SELECT "abraham"          , "clinton"         UNION
  SELECT "delano"           , "herbert"         UNION
  SELECT "fillmore"         , "abraham"         UNION
  SELECT "fillmore"         , "delano"          UNION
  SELECT "fillmore"         , "grover"          UNION
  SELECT "eisenhower"       , "fillmore";

CREATE TABLE dogs AS
  SELECT "abraham" AS name, "long" AS fur, 26 AS height UNION
  SELECT "barack"         , "short"      , 52           UNION
  SELECT "clinton"        , "long"       , 47           UNION
  SELECT "delano"         , "long"       , 46           UNION
  SELECT "eisenhower"     , "short"      , 35           UNION
  SELECT "fillmore"       , "curly"      , 32           UNION
  SELECT "grover"         , "short"      , 28           UNION
  SELECT "herbert"        , "curly"      , 31;

CREATE TABLE sizes AS
  SELECT "toy" AS size, 24 AS min, 28 AS max UNION
  SELECT "mini"       , 28       , 35        UNION
  SELECT "medium"     , 35       , 45        UNION
  SELECT "standard"   , 45       , 60;


-- All dogs with parents ordered by decreasing height of their parent
CREATE TABLE pa AS
  SELECT A.parent, A.child, B.height FROM parents AS A, dogs AS B WHERE A.parent = B.name;

CREATE TABLE by_parent_height AS
  SELECT A.name FROM dogs AS A, pa AS B WHERE A.name = B.child ORDER BY B.height DESC;


-- The size of each dog
CREATE TABLE size_of_dogs AS
  SELECT A.name, B.size FROM dogs AS A, sizes AS B WHERE A.height > B.min AND A.height <= B.max;


-- Filling out this helper table is optional
CREATE TABLE siblings AS
  SELECT A.child AS sibling1, B.child AS sibling2, C.size AS sibling1_size, D.size AS sibling2_size FROM parents AS A, parents AS B, size_of_dogs AS C, size_of_dogs AS D WHERE A.parent = B.parent AND A.child < B.child AND A.child = C.name AND B.child = D.name;

-- Sentences about siblings that are the same size
CREATE TABLE sentences AS
  SELECT "The two siblings, " || sibling1 || " plus " || sibling2 || " have the same size: " || sibling1_size FROM siblings WHERE sibling1_size = sibling2_size;


-- Height range for each fur type where all of the heights differ by no more than 30% from the average height
CREATE TABLE low_variance_helper AS
  SELECT fur, height, AVG(height) AS average_height, MAX(height) AS max_height, MIN(height) AS min_height FROM dogs GROUP BY fur;
CREATE TABLE low_variance AS
  SELECT fur, max_height - min_height FROM low_variance_helper WHERE max_height <= average_height * 1.3 AND min_height >= average_height * 0.7;

