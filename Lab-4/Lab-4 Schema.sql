use students;
create table NotificationDetails(NotificationID  varchar(15), CampaignID varchar(15), DonorID varchar(15), NotificationMsg varchar(15), ReplyMsg varchar(15), NoticationSentTime date);
SHOW COLUMNS FROM NotificationDetails;

alter table NotificationDetails add(NotificationReceiveTime time);
SHOW COLUMNS FROM NotificationDetails;

alter table NotificationDetails modify NoticationSentTime time;
SHOW COLUMNS FROM NotificationDetails;