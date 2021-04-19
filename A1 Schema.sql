CREATE DATABASE LibraryManagementSystem;
USE LibraryManagementSystem;

CREATE TABLE Book(
	Book_Id INT PRIMARY KEY NOT NULL AUTO_INCREMENT UNIQUE,
    Title VARCHAR(50) NOT NULL,
    Publisher_Name VARCHAR(50) NOT NULL
);

CREATE TABLE Publisher(
	Publisher_Name VARCHAR(50) PRIMARY KEY NOT NULL, 
    Address VARCHAR(50) DEFAULT 'NA',
    Phone VARCHAR(20) NULL
);

ALTER TABLE Book ADD FOREIGN KEY(Publisher_Name) REFERENCES Publisher(Publisher_Name) ON DELETE RESTRICT;

CREATE TABLE Book_Authors(
	Author_Name VARCHAR(50) PRIMARY KEY NOT NULL, 
    Book_Id INT NOT NULL,
    FOREIGN KEY (Book_Id) REFERENCES Book(Book_Id) ON DELETE CASCADE
);

CREATE TABLE Borrower(
	Card_Number VARCHAR(50) PRIMARY KEY NOT NULL,
	Borrower_Name VARCHAR(50) NOT NULL,
	Address VARCHAR(50) DEFAULT 'NA',
    Phone VARCHAR(20) NOT NULL
 );

CREATE TABLE Library_Branch(
	Branch_Id INT PRIMARY KEY AUTO_INCREMENT UNIQUE,
	Branch_Name VARCHAR(50) NOT NULL,
	Address VARCHAR(50) DEFAULT 'NA'
 );

CREATE TABLE Book_Copies(
	Book_Id INT NOT NULL,
    FOREIGN KEY(Book_Id) REFERENCES Book(Book_Id) ON DELETE CASCADE,
    Branch_Id INT NOT NULL,
    FOREIGN KEY(Branch_Id) REFERENCES Library_Branch(Branch_Id) ON DELETE CASCADE,
    No_of_Copies INT NOT NULL
);

CREATE TABLE Book_Loans(
	Branch_Id INT NOT NULL, FOREIGN KEY(Branch_Id) REFERENCES Library_Branch(Branch_Id) ON DELETE CASCADE,
    Book_Id INT NOT NULL, FOREIGN KEY(Book_Id) REFERENCES Book(Book_Id) ON DELETE CASCADE,
    Card_Number VARCHAR(50) NOT NULL, FOREIGN KEY(Card_Number) REFERENCES Borrower(Card_Number),
    Date_Out DATE, Due_Date DATE
);

INSERT INTO Publisher VALUES('Al Khair', 'Lahore', '0323121545748');
INSERT INTO Publisher VALUES('Ali & Co.', 'Gujranwala', '03231215748');
INSERT INTO Publisher VALUES('Fahad Book Depot', 'Fasilabad', '0345545748');
INSERT INTO Publisher VALUES('Akbar Book Depot', 'Karachi', '0355545748');
INSERT INTO Publisher VALUES('Saba Book Depot', 'Islamabad', '0321536248');
INSERT INTO Publisher (Publisher_Name, Address) VALUES('Ahmed Book Depot', 'Islamabad');
INSERT INTO Publisher (Publisher_Name, Address) VALUES('Rehman Publishers', 'Sialkot');

INSERT INTO Book VALUES(1, 'Book 1', 'Saba Book Depot');
INSERT INTO Book VALUES(2, 'Book 2', 'Ali & Co.');
INSERT INTO Book VALUES(3, 'Book 3', 'Al Khair');
INSERT INTO Book VALUES(4, 'Book 4', 'Akbar Book Depot');
INSERT INTO Book VALUES(5, 'Book 5', 'Fahad Book Depot');
INSERT INTO Book VALUES(6, 'Book 6', 'Saba Book Depot');
INSERT INTO Book VALUES(7, 'Book 7', 'Saba Book Depot');
INSERT INTO Book (Title, Publisher_Name) VALUES('The Kite Runner', 'Saba Book Depot');
INSERT INTO Book (Title, Publisher_Name) VALUES('Alchemist', 'Saba Book Depot');
INSERT INTO Book (Title, Publisher_Name) VALUES('Alchemist', 'Ahmed Book Depot');
INSERT INTO Book (Title, Publisher_Name) VALUES('Alchemist', 'Rehman Publishers');

INSERT INTO Book_Authors VALUES('Ahmed', 1);
INSERT INTO Book_Authors VALUES('Faran', 2);
INSERT INTO Book_Authors VALUES('Faizan', 3);
INSERT INTO Book_Authors VALUES('Shazib', 4);
INSERT INTO Book_Authors VALUES('Ahsan', 5);
INSERT INTO Book_Authors VALUES('Amer Ali', 6);
INSERT INTO Book_Authors VALUES('Hassan Ahmad', 7);
INSERT INTO Book_Authors VALUES('Ahmad', 11);

INSERT INTO Borrower VALUES('231215457485', 'Asad Ali', 'Lahore', '773231610644');
INSERT INTO Borrower VALUES('231215748555', 'Ali Hasan', 'Gujranwala', '83231610644');
INSERT INTO Borrower VALUES('550345545748', 'Fahad Ijaz', 'Fasilabad', '43231610644');
INSERT INTO Borrower VALUES('880355545748', 'Akbar Ali', 'Karachi', '553231610644');
INSERT INTO Borrower VALUES('450321536248', 'Ayesha', 'Islamabad', '553231610644');
INSERT INTO Borrower VALUES('220321536248', 'Ali Ahsan Khan', 'Islamabad', '123458787845');

INSERT INTO Library_Branch (Branch_Name, Address)  VALUES('UCP Branch', 'Lahore');
INSERT INTO Library_Branch (Branch_Name, Address) VALUES('UMT Branch', 'Lahore');
INSERT INTO Library_Branch (Branch_Name, Address) VALUES('UOL Branch', 'Lahore');
INSERT INTO Library_Branch (Branch_Name, Address) VALUES('UET Branch', 'Lahore');
INSERT INTO Library_Branch (Branch_Name, Address) VALUES('PUCIT Branch', 'Lahore');
INSERT INTO Library_Branch (Branch_Name, Address) VALUES('NED Branch', 'Karachi');

INSERT INTO Book_Copies VALUES(1,3,50);
INSERT INTO Book_Copies VALUES(2,4,15);
INSERT INTO Book_Copies VALUES(3,1,25);
INSERT INTO Book_Copies VALUES(4,2,30);
INSERT INTO Book_Copies VALUES(5,3,18);
INSERT INTO Book_Copies VALUES(6,4,80);
INSERT INTO Book_Copies VALUES(7,5,11);
INSERT INTO Book_Copies VALUES(7,4,9);
INSERT INTO Book_Copies VALUES(5,1,5);
INSERT INTO Book_Copies VALUES(8,6,15);

INSERT INTO Book_Loans VALUES(2,2,'231215457485','2021/05/5', '2021/05/27');
INSERT INTO Book_Loans VALUES(3,3,'231215748555','2021/01/28', '2021/02/02');
INSERT INTO Book_Loans VALUES(4,4,'550345545748','2021/02/03', '2021/02/10');
INSERT INTO Book_Loans VALUES(4,5,'880355545748','2021/03/13', '2021/03/18');
INSERT INTO Book_Loans VALUES(3,5,'450321536248','2021/03/13', '2021/03/18');
INSERT INTO Book_Loans VALUES(3,8,'450321536248','2021/03/13', '2021/03/18');
INSERT INTO Book_Loans VALUES(6,8,'450321536248','2021/03/13', '2021/03/18');
INSERT INTO Book_Loans VALUES(6,8,'450321536248','2021/03/13', '2021/03/18');
INSERT INTO Book_Loans VALUES(1,8,'450321536248','2021/03/13', '2021/09/18');
INSERT INTO Book_Loans VALUES(4,5,'450321536248','2021/03/13', '2021/09/18');
INSERT INTO Book_Loans VALUES(1,5,'220321536248','2021/03/13', '2021/03/18');

SELECT * FROM Borrower WHERE Address LIKE '%lahore%' AND Phone IS NOT NULL;

SELECT B.Title 
FROM Book B 
JOIN Book_Copies C on B.Book_Id = C.Book_Id 
WHERE C.No_of_Copies < 10;

SELECT LB.Branch_Name, B.Title, C.No_of_Copies 
FROM (Book B JOIN Book_Copies C on B.Book_Id = C.Book_Id) 
JOIN Library_Branch LB on LB.Branch_Id = C.Branch_Id;

SELECT BR.Borrower_Name 
FROM Book_Loans BL 
JOIN Book B ON B.Book_Id = BL.Book_Id
JOIN Borrower BR ON BR.Card_Number = BL.Card_Number 
WHERE B.Title = 'The Kite Runner';

SELECT BR.Borrower_Name 
FROM (Library_Branch LB JOIN Book_Loans BL on LB.Branch_Id = BL.Branch_Id) 
JOIN Borrower BR ON BR.Card_Number = BL.Card_Number where LB.Address LIKE '%karachi%';

SELECT B.Title, A.Author_Name FROM Publisher P
Join Book B On B.Publisher_Name = P.Publisher_Name
Join Book_Authors A On A.Book_Id = B.Book_Id
Where P.Publisher_Name = 'Rehman Publishers';

SELECT P.Publisher_Name 
FROM BOOK B 
JOIN Publisher P ON B.Publisher_Name = P.Publisher_Name 
WHERE B.Title = 'Alchemist' AND P.Phone IS NOT NULL;

SELECT BR.Borrower_Name, BR.Address, B.Title
FROM Book_Loans BL 
JOIN Book B ON B.Book_Id = BL.Book_Id 
JOIN Borrower BR ON BR.Card_Number = BL.Card_Number
JOIN Library_Branch LB ON LB.Branch_Id = BL.Branch_Id  
WHERE BL.Due_Date = current_date() and LB.Branch_Name = 'Iqbal Town branch';

SELECT B.Title
FROM Book_Loans BL 
JOIN Book B ON B.Book_Id = BL.Book_Id 
WHERE monthname(BL.Due_Date) = 'September';

SELECT LB.Branch_Name
FROM Book_Loans BL 
JOIN Borrower BR ON BR.Card_Number = BL.Card_Number
JOIN Library_Branch LB ON LB.Branch_Id = BL.Branch_Id  
WHERE BR.Borrower_Name = 'Ali Ahsan Khan';