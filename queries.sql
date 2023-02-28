/*Queries that provide answers to the questions from all projects.*/


-- Query for Find all animals whose name ends in "mon".
SELECT * FROM animals WHERE name LIKE '%mon';

-- Query for List the name of all animals born between 2016 and 2019.
SELECT name FROM animals
WHERE date_of_birth BETWEEN '2016-1-1'AND '2019-12-31';

-- Query for List the name of all animals that are neutered and have less than 3 escape attempts.
SELECT name FROM animals
WHERE neutered = true  AND escape_attempts < 3;

-- Query for List the date of birth of all animals named either "Agumon" or "Pikachu".
SELECT date_of_birth FROM animals
WHERE name = 'Agumon' OR name ='Pikachu' ;

-- Query for List name and escape attempts of animals that weigh more than 10.5kg
SELECT name,escape_attempts FROM animals
WHERE weight_kg > 10.5 ;


-- Query for Find all animals that are neutered.
SELECT * FROM animals
WHERE neutered = true ;

-- Query for Find all animals not named Gabumon.
SELECT * FROM animals
WHERE name <> 'Gabumon' ;

-- Query for Find all animals with a weight between 10.4kg and 17.3kg
SELECT * FROM animals
WHERE weight_kg BETWEEN 10.4 AND 17.3;

--Query for transaction to set species ->digimon to animals ending in mon and species->pokemon to animals with no species
BEGIN;
UPDATE animals
SET species ='digimon'
WHERE name LIKE '%mon';

UPDATE animals
SET species ='pokemon'
WHERE species IS NULL;
COMMIT;

--Query for transaction to delete all data and rollback
BEGIN;
DELETE FROM animals;
ROLLBACK;
SELECT * FROM animals;

--Query for transacton to delete animals with dob> 2022 making savepoint and update weight of animal with negative weight
BEGIN;
DELETE FROM animals
WHERE date_of_birth >'2022-01-01';
SAVEPOINT born_before;
UPDATE animals
SET weight_kg = weight_kg * (-1);
ROLLBACK TO born_before;
UPDATE animals
SET weight_kg = weight_kg * (-1)
WHERE weight_kg < -1;
SELECT * FROM animals;
COMMIT;

-- Query to find How many animals are there
SELECT COUNT (id)
FROM animals;

-- Query to find How many animals have never tried to escape
SELECT COUNT (id)
FROM animals
WHERE escape_attempts < 1;

-- Query to find What is the average weight of animals
SELECT AVG (weight_kg)
FROM animals;

-- Query to find Who escapes the most, neutered or not neutered animals
SELECT name 
FROM animals
GROUP BY name
HAVING  COUNT(escape_attempts )= MAX(escape_attempts);

-- Query to find  is the minimum and maximum weight of each type of animal
SELECT species,MAX(weight_kg) AS maximum_weight,MIN(weight_kg) AS manimum_weight
FROM animals
GROUP BY species

-- Query to find What is the average number of escape attempts per animal type of those born between 1990 and 2000
SELECT species,AVG(escape_attempts) AS average_escape_attempts_number
FROM animals
WHERE date_of_birth BETWEEN'1990-01-01' AND'2000-12-31'
GROUP BY species


