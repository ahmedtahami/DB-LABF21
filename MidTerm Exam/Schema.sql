use test;

create table Person(
	CNIC int(13) primary key not null unique,
    PFname varchar(15),
    PLname varchar(15) not null,
    PAddress text,
    DOB date not null
);
create table PersonOfficeDetails(
	POID int(11) primary key auto_increment not null unique,
    CNIC int(13) not null,    
    POfficeName varchar(35) not null,
	POfficeAddress int not null,
    PDesignation varchar(20) not null,
    PSalary int not null,
    PCabinNumber int not null,
    POfficeHours time,
    PJoiningDate date,
    foreign key (CNIC) references Person(CNIC)
);
alter table Person drop column PAddress;
alter table PersonOfficeDetails modify PDesignation varchar(30) not null;
alter table PersonOfficeDetails modify POfficeAddress text not null;
alter table Person rename Person_AlterTable;

insert into Person_AlterTable (CNIC, PFname, PLname, DOB)
values (123456789, 'Ahmed', 'Naeem', '2000/10/15');
insert into PersonOfficeDetails (POID, CNIC, POfficeName, POfficeAddress, PDesignation, PSalary, PCabinNumber)
values(1, 123456789, 'MyOffice', 'Lahore', 'DBA', 25000, 5);

use chess;

#task1
select fname, lname from players
where player_id in
(select player_id from player_participated join tornaments on player_participated.tornaments_id = tornaments.tornaments_id
join tornament_organizer on tornaments.organizer_id = tornament_organizer.organizer_id where organizer_name = 'hafiz asif');

#task2
select sponsor_name, tornaments.tornament_name from sponsors
inner join tornament_sponsors on sponsors.sponsor_id = tornament_sponsors.sponsor_id
inner join tornaments on tornaments.tornaments_id = tornament_sponsors.tornaments_id
WHERE sponsors.sponsor_name like "a%";

#task3
select players.rank_code from players
join player_participated on players.player_id = player_participated.player_id
join tornaments on player_participated.tornaments_id = tornaments.tornaments_id
where tornaments.tornament_name = 'grand master';

#task4
select * from players
join player_participated on players.player_id = player_participated.player_id
join tornaments on player_participated.tornaments_id = tornaments.tornaments_id
join tornament_organizer on tornaments.organizer_id = tornament_organizer.organizer_id
where tornament_organizer.organizer_name = 'omer khalid';

select rank_code.rank_description from rank_code
inner join players on players.rank_code=rank_code.rank_code
inner join player_participated on players.player_id=player_participated.player_id
inner join tornaments on tornaments.tornaments_id=player_participated.tornaments_id
inner join tornament_organizer on tornament_organizer.organizer_id=tornaments.organizer_id
where tornament_organizer.organizer_name="omer khalid";

#task5
SELECT fname, lname, email
FROM players
Where exists (SELECT start_date FROM matches WHERE 
YEAR(matches.start_date) = 2002
OR YEAR(matches.start_date) = 2003
OR YEAR(matches.start_date) = 2004 and (matches.player_id_1 = players.player_id or matches.player_id_2 = players.player_id)
);

