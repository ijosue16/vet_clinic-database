/* Populate database with sample data. */

-- inserting data in table
INSERT INTO animals (name,date_of_birth,escape_attempts,neutered,weight_kg)
VALUES('Agumon','2020-02-03',0,true,10.23),
('Gabumon','2018-11-15',2,true,8),
('Pikachu','2021-1-15',1,false,15.04),
('Devimon','2017-5-12',5,true,11);

-- inserting data in  updated table 
INSERT INTO animals (name,date_of_birth,escape_attempts,neutered,weight_kg)
VALUES
('Charmander','2020-02-08',0,false,-11),
('Plantmon','2021-11-15',2,true,-5.7),
('Squirtle','1993-04-02',3,false,-12.13),
('Angemon','2005-06-12',1,true,-45),
('Boarmon','2005-06-07',7,true,20.4),
('Blossom','1998-08-13',3,true,17),
('Ditto','2022-05-14',4,true,22);

-- Insert the following data into the owners table
INSERT INTO owners(full_name,age)
VALUES('Sam Smith',34),
('Jennifer Orwell',19),
('Bob',45),
('Melody',77),
('Dean winchester',14),
('Jodie Whittaker',38);
SELECT * FROM owners;

-- Insert the following data into the species table

INSERT INTO species(name)
VALUES('Pokemon'),
('Digimon');
SELECT * FROM species;


-- Modify your inserted animals so it includes the species_id value
UPDATE animals
SET species_id = 2
WHERE name LIKE '%mon';
UPDATE animals
SET species_id = 1
WHERE name NOT LIKE '%mon';
SELECT * FROM animals;

-- Modify your inserted animals to include owner information (owner_id)
UPDATE animals
SET owner_id= 1 WHERE name ='Agumon';
UPDATE animals
SET owner_id= 2 WHERE name IN ('Gabumon','Pikachu');
UPDATE animals
SET owner_id= 3 WHERE name IN ('Devimon','Plantmon');
UPDATE animals
SET owner_id= 4 WHERE name IN ('Charmander','Squirtle','Blossom');
UPDATE animals
SET owner_id= 5 WHERE name IN ('Angemon','Boarmon');
SELECT * FROM animals;

-- Insert the following data for vets
INSERT INTO vets(name,age,date_of_graduation)
VALUES(' William Tatcher ',45,'2000-04-23'),
('Maisy Smith',26,'2019-01-17'),
('Stephanie Mendez',64,'1981-05-04'),
('Jack Harkness',38,'2008-06-08');

-- Insert the following data for specialties

-- Insert the following data for visits