CREATE DATABASE chess;

use chess;



CREATE TABLE address (address_id varchar(12) NOT NULL,
	city varchar(12) NOT NULL,
  street_number int NOT NULL,
  house_number int NOT NULL
);


INSERT INTO address (address_id, city, street_number, house_number) VALUES
("1", "lahore", 1, 11),
("10", "mirpurkhas", 7, 4),
("11", "islamabad", 6, 7),
("12", "islamabad", 12, 9),
("13", "islamabad", 3, 9),
("14", "karachi", 4, 8),
("15", "lahore", 8, 9),
("16", "lahore", 22, 9),
("17", "karachi", 6, 20),
("2",  "faisalabad", 2, 3),
("3", "multan", 3, 12),
("4", "quetta", 4, 2),
("5", "pishawar", 5, 1),
("6", "sibi", 6, 7),
("7", "karachi", 7, 9),
("8", "karachi", 8, 3),
("9", "hyderabad", 9, 7);


CREATE TABLE  chessclub(
   club_id  int NOT NULL,
   club_name varchar(12) NOT NULL,
  club_owner varchar(12) NOT NULL,
  adress_id varchar(30) DEFAULT NULL
);


INSERT INTO chessclub (club_id, club_name, club_owner, adress_id) 
VALUES
(1, "ucp chess", "sharif broth", '5'),
(2, "ned chess", "moeed hassan", '3'),
(3, "pims chess", "rashid munir", '6'),
(4, "sindh chess", "altaf bhuto", '4'),
(5, "punjab chess", "nawaz shahba", '17');



CREATE TABLE IF NOT EXISTS matches(
  tornaments_id int NOT NULL,
  player_id_1 int NOT NULL,
  player_id_2 int NOT NULL,
  result_code  int DEFAULT NULL,
  start_date  date DEFAULT NULL,
  end_date date DEFAULT NULL
);




INSERT INTO matches ( tornaments_id, player_id_1, player_id_2, result_code, start_date, end_date) 
VALUES
(1, 5, 4, 1, "2002-06-22", "2002-06-22"),
(1, 2, 7, 2, "2002-07-23", "2002-07-25"),
(1, 4, 7, 3, "2002-08-02", "2002-08-02"),
(2, 1, 5, 3, "2004-08-01", "2004-08-01"),
(2, 4, 7, 4, "2004-08-12", "2004-08-12"),
(2, 2, 1, 5, "2004-08-25", "2004-08-25"),
(2, 7, 2, 1, "2004-09-05", "2004-09-06"),
(3, 5, 7, 2, "2006-05-06", "2006-05-06"),
(3, 2, 8, 3, "2006-06-07", "2006-06-07"),
(3, 1, 9, 5, "2006-06-20", "2006-06-20"),
(3, 3, 7, 1, "2006-06-29", "2006-06-29"),
(3, 5, 2, 4, "2006-07-05", "2006-07-05"),
(3, 9, 3, 3, "2006-07-26", "2006-07-28"),
(3, 5, 9, 5, "2006-08-06", "2006-08-06"),
(4, 10, 11, 2, "2007-07-08", "2007-07-08");


CREATE TABLE players (
  player_id int NOT NULL,
  fname varchar(12) NOT NULL,
  lname varchar(12) DEFAULT NULL,
  adress_id varchar(12) DEFAULT NULL,
  phone_number varchar(11) DEFAULT NULL,
  email varchar(12) DEFAULT NULL,
  club_id int NOT NULL,
  rank_code int NOT NULL
);


INSERT INTO players (player_id, fname, lname, adress_id, phone_number, email, club_id, rank_code) 
VALUES
(1, 'Raj', 'Kumar', '1', '01234567892', 'raj@gmail.co', 1, 6),
(2, 'Hannan', 'Ejaz', '2', '87954612378', 'hannan@gmail', 2, 5),
(3, 'Gazanfar', 'Ali', '3', '45678912352', 'ali@gmail.co', 3, 4),
(4, 'Suneel', 'Kothari', '4', '78945675312', 'suneel@gmail', 3, 2),
(5, 'Abde', 'Muneeb', '9', '78951357789', 'muneeb@gmail', 4, 3),
(6, 'Usman', 'Bhinder', '8', '75395185245', 'usman@gmail.', 5, 3),
(7, 'Jaiky', 'Sharma', '7', '84625789512', 'jaiky@gmail.', 1, 3),
(8, 'Rashid', 'Panwar', '5', '2987654321', 'rashid@gmail', 2, 2),
(9, 'Chanchal', 'Raj', '11', '87321645978', 'chanchal@gma', 3, 2),
(10, 'Ahsan', 'Rehman', '6', '25321987654', 'rehman@gmail', 5, 2),
(11, 'Aziz', 'Abdul', '12', '2195872548', 'aziz@gmail.c', 1, 5),
(12, 'Sagar', 'Suneel', '10', '0258789456', 'sagar@gmail.', 2, 5);







CREATE TABLE  player_participated (
  player_id int NOT NULL,
  tornaments_id int NOT NULL
);



INSERT INTO player_participated (player_id, tornaments_id) VALUES
(1, 2),
(2, 1),
(3, 3),
(7, 1),
(8, 2),
(9, 3),
(11, 4),
(1, 3),
(2, 2),
(4, 1),
(7, 2),
(8, 3),
(10, 4),
(2, 3),
(4, 2),
(5, 1),
(7, 3),
(5, 3),
(5, 2);



CREATE TABLE rank_code (
  rank_code int NOT NULL,
  rank_description varchar(12) NOT NULL
);


INSERT INTO rank_code (rank_code, rank_description) VALUES
(1, 'national mas'),
(2, 'grand master'),
(3, 'internationa'),
(4, 'FIDE master'),
(5, 'candidate ma'),
(6, 'club level');




CREATE TABLE result_codes(
  result_code int NOT NULL,
  result_description  varchar(12) DEFAULT NULL
);



INSERT INTO result_codes(result_code, result_description) VALUES
(1, 'Win'),
(2, 'Loss'),
(3, 'Draw'),
(4, 'Draw'),
(5, 'Win'),
(6, 'Loss'),
(7, 'Draw');




CREATE TABLE sponsors(
  sponsor_id int  NOT NULL,
  sponsor_name varchar(12) NOT NULL,
  sponsor_phone int DEFAULT NULL,
  address_id int DEFAULT NULL
);


INSERT INTO sponsors ( sponsor_id, sponsor_name, sponsor_phone, address_id) VALUES
(1, 'azhar', 1247548584, 15),
(2, 'kamran shabi', 2147483647, 13),
(3, 'sahid', 2147483647, 14),
(4, 'galib', 2147483647, 16);


CREATE TABLE  tornaments(
  tornaments_id int NOT NULL,
  organizer_id int NOT NULL,
  tornament_start_date date DEFAULT NULL,
  tornament_end_date date DEFAULT NULL,
  tornament_name varchar(12) NOT NULL,
  winer_id int DEFAULT NULL
);



INSERT INTO tornaments(tornaments_id, organizer_id, tornament_start_date, tornament_end_date, tornament_name, winer_id) VALUES
(1, 1, '2002-06-22', '2002-08-02', 'awami', 7),
(2, 2, '2004-08-01', '2004-09-05', 'grand master', 7),
(3, 4, '2006-05-06', '2006-08-06', 'litter maste', 9),
(4, 7, '2007-07-08', '2007-07-08', 'chess idol', 11);




CREATE TABLE tornament_organizer (
  organizer_id int NOT NULL,
  club_id int DEFAULT NULL,
  organizer_name varchar(12) NOT NULL,
  organizer_phone_number int DEFAULT NULL,
  organizer_address varchar(15) DEFAULT NULL
);



INSERT INTO tornament_organizer (organizer_id, club_id, organizer_name, organizer_phone_number, organizer_address) VALUES
(1, 1, 'saleem akhte', 1230456000, '1'),
(2, 2, 'hafiz asif', 369852147, '2'),
(3, 3, 'ali nawaz', 147896321, '3'),
(4, 4, 'shabana azmi', 123698741, '4'),
(5, 5, 'rahat fateh ', 159951357, '17'),
(6, 3, 'omer khalid', 258852357, '7'),
(7, 5, 'omer farooq', 456654852, '7');



CREATE TABLE tornament_sponsors (
  tornaments_id int NOT NULL,
  sponsor_id int NOT NULL
);



INSERT INTO tornament_sponsors (tornaments_id, sponsor_id) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(2, 1),
(1, 4),
(2, 1),
(3, 2),
(4, 3),
(3, 4);




ALTER TABLE address
 ADD PRIMARY KEY (address_id);


ALTER TABLE chessclub
 ADD PRIMARY KEY (club_id);


ALTER TABLE matches
 ADD KEY tornaments_id (tornaments_id), ADD KEY player_id_1 (player_id_1), ADD KEY player_id_2 (player_id_2), ADD KEY result_code (result_code);


ALTER TABLE players
 ADD PRIMARY KEY (player_id), ADD KEY club_id (club_id), ADD KEY rank_code (rank_code);


ALTER TABLE player_participated
 ADD KEY player_id (player_id), ADD KEY tornaments_id (tornaments_id);


ALTER TABLE rank_code
 ADD PRIMARY KEY (rank_code);


ALTER TABLE result_codes
 ADD PRIMARY KEY (result_code);


ALTER TABLE sponsors
 ADD PRIMARY KEY (sponsor_id);


ALTER TABLE tornaments
 ADD PRIMARY KEY (tornaments_id), ADD KEY organizer_id (organizer_id);


ALTER TABLE tornament_organizer
 ADD PRIMARY KEY (organizer_id), ADD KEY club_id (club_id);


ALTER TABLE tornament_sponsors
 ADD KEY tornaments_id (tornaments_id), ADD KEY sponsor_id (sponsor_id);


ALTER TABLE matches
ADD CONSTRAINT matches_ibfk_1 FOREIGN KEY (tornaments_id) REFERENCES tornaments (tornaments_id),
ADD CONSTRAINT matches_ibfk_2 FOREIGN KEY (player_id_1) REFERENCES players (player_id),
ADD CONSTRAINT matches_ibfk_3 FOREIGN KEY (player_id_2) REFERENCES players (player_id),
ADD CONSTRAINT result_code FOREIGN KEY (result_code) REFERENCES result_codes (result_code);


ALTER TABLE players
ADD CONSTRAINT club_id FOREIGN KEY (club_id) REFERENCES chessclub (club_id),
ADD CONSTRAINT rank_code FOREIGN KEY (rank_code) REFERENCES rank_code (rank_code);


ALTER TABLE player_participated
ADD CONSTRAINT player_participated_ibfk_1 FOREIGN KEY (player_id) REFERENCES players (player_id),
ADD CONSTRAINT player_participated_ibfk_2 FOREIGN KEY (tornaments_id) REFERENCES tornaments (tornaments_id);


ALTER TABLE tornaments
ADD CONSTRAINT organizer_id FOREIGN KEY (organizer_id) REFERENCES tornament_organizer (organizer_id);


ALTER TABLE tornament_organizer
ADD CONSTRAINT tornament_organizer_ibfk_1 FOREIGN KEY (club_id) REFERENCES chessclub (club_id);


ALTER TABLE tornament_sponsors
ADD CONSTRAINT sponsor_id FOREIGN KEY (sponsor_id) REFERENCES sponsors (sponsor_id),
ADD CONSTRAINT tornaments_id FOREIGN KEY (tornaments_id) REFERENCES tornaments (tornaments_id);

ALTER TABLE chessclub
ADD CONSTRAINT adress_id FOREIGN KEY (adress_id) REFERENCES address(address_id);


