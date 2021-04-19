drop database Hotel_Reservation_System;
create database Hotel_Reservation_System;
use Hotel_Reservation_System;

create table Payment 
(
	PID int(20) primary key, PaymentDate date, Type varchar(10), Tot_Amount int(20), Net_Amount int(20)  
	
);

create table Guest
(	
   GID int(20) primary key,NIC int(20), Gender varchar(6),GuestName varchar(20),Country varchar(20), Address varchar(25)
);

create table Invoice
(	
    InvoiceId int(20) primary key,	net_amount int(20), VAT int(20), TAX int(20), Total int(20), Date date, PID int(20), Foreign key (PID) references Payment(PID), GID int(20), Foreign key (GID) references Guest(GID)
);

create table Room
(
	RID int(20) primary key, Status varchar(10), Charge int(20), Type varchar(20)  
);

create table Reservation
(	
	ReId int(20) primary key, RType varchar(20), NoOfNights int(20), RegDate date,NoOfRooms int(20), RID int(20), Foreign key (RID) references Room(RID)
);


desc Invoice;
desc Payment;
desc Guest;
desc Room;
desc Reservation;

alter table Payment Change Date PaymentDate date; 
Insert Into Payment(PID, PaymentDate, Type, Tot_Amount, Net_Amount) Values (1,2021/4/5,'Cash',1000,25000);
Insert Into Payment(PID, PaymentDate, Type, Tot_Amount, Net_Amount) Values (2,2021/4/6,'Card',4000,45000);
Insert Into Guest(GID ,NIC , Gender, GuestName, Country, Address) Values (1,5655555548,'Male','Fahad Butt','Pakistan','ABC XYZ');
Insert Into Guest(GID ,NIC , Gender, GuestName, Country, Address) Values (2,56455555548,'Male','Ali Butt','Pakistan','ABC XYZ');
Insert Into Invoice(InvoiceId,net_amount,VAT,TAX,Total,PID,GID)
Values (1,55224, 521, 528, 56000, 1, 1);
Insert Into Invoice(InvoiceId,net_amount,VAT,TAX,Total,PID,GID)
Values (2,55224, 521, 528, 56000, 2, 2);