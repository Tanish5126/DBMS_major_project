Last login: Mon Oct  5 20:43:25 on ttys000
tanishtushargawade@Tanishs-MacBook-Air-2 ~ % psql postgres
psql (18.4 (Homebrew))
Type "help" for help.

postgres=# \c security_roster 
You are now connected to database "security_roster" as user "tanishtushargawade".
security_roster=# \dt
                  List of tables
 Schema |    Name     | Type  |       Owner        
--------+-------------+-------+--------------------
 public | attendance  | table | tanishtushargawade
 public | client      | table | tanishtushargawade
 public | deployment  | table | tanishtushargawade
 public | guard       | table | tanishtushargawade
 public | post        | table | tanishtushargawade
 public | replacement | table | tanishtushargawade
 public | shift       | table | tanishtushargawade
(7 rows)

security_roster=# INSERT INTO client VALUES
(1, 'Phoenix Mall', 'Neha Kulkarni', '9876500011', 'neha@phoenix.example'),
(2, 'Sunrise Hospital', 'Dr. Meera Shah', '9876500012', 'meera@sunrise.example'),
(3, 'Metro Logistics', 'Arjun Mehta', '9876500013', 'arjun@metro.example'),
(4, 'TechPark Business Centre', 'Riya Desai', '9876500014', 'riya@techpark.example'),
(5, 'Westside Residency', 'Karan Joshi', NULL, 'karan@westside.example');
INSERT 0 5
security_roster=# INSERT INTO post VALUES
(101, 1, 'Main Gate', 'Andheri West', 2, TRUE),
(102, 1, 'Parking Entrance', 'Andheri West', 1, TRUE),
(103, 2, 'Emergency Gate', 'Powai', 2, TRUE),
(104, 2, 'Reception', 'Powai', 1, TRUE),
(105, 3, 'Warehouse Gate', 'Bhiwandi', 2, TRUE),
(106, 3, 'Loading Bay', 'Bhiwandi', 1, TRUE),
(107, 4, 'Lobby', 'Vikhroli', 1, TRUE),
(108, 4, 'Service Entrance', 'Vikhroli', 1, TRUE),
(109, 5, 'Main Gate', 'Borivali', 2, TRUE),
(110, 5, 'Parking Gate', 'Borivali', 1, TRUE);
INSERT 0 10
security_roster=# INSERT INTO guard VALUES
(1, 'Amit Sharma', '9000000001', 'Andheri', '2025-01-15', 'ACTIVE'),
(2, 'Rahul Patil', '9000000002', 'Powai', '2025-02-10', 'ACTIVE'),
(3, 'Vikram Singh', NULL, 'Bandra', '2025-03-05', 'ACTIVE'),
(4, 'Suresh Yadav', '9000000004', 'Bhandup', '2025-03-18', 'ACTIVE'),
(5, 'Rohan Deshmukh', '9000000005', 'Vikhroli', '2025-04-01', 'ACTIVE'),
(6, 'Prakash More', NULL, 'Thane', '2025-04-20', 'ACTIVE'),
(7, 'Nitin Jadhav', '9000000007', 'Dadar', '2025-05-12', 'ON_LEAVE'),
(8, 'Sameer Khan', '9000000008', 'Kurla', '2025-05-25', 'ACTIVE'),
(9, 'Manoj Pawar', '9000000009', 'Borivali', '2025-06-03', 'ACTIVE'),
(10, 'Kunal Shah', '9000000010', 'Ghatkopar', '2025-06-15', 'ACTIVE'),
(11, 'Deepak Verma', NULL, 'Mulund', '2025-07-02', 'ACTIVE'),
(12, 'Arvind Rao', '9000000012', 'Powai', '2025-07-19', 'ACTIVE'),
(13, 'Sanjay Gupta', '9000000013', 'Andheri', '2025-08-01', 'INACTIVE'),
(14, 'Yash Kulkarni', '9000000014', 'Bandra', '2025-08-14', 'ACTIVE'),
(15, 'Vivek Joshi', NULL, 'Borivali', '2025-09-01', 'ACTIVE');
INSERT 0 15
security_roster=# INSERT INTO shift VALUES
(1, 'Morning', '06:00', '14:00'),
(2, 'Evening', '14:00', '22:00'),
(3, 'Night', '22:00', '06:00');
INSERT 0 3
security_roster=# INSERT INTO deployment VALUES
(1,101,1,1,'2026-10-01','ASSIGNED'),
(2,101,2,2,'2026-10-01','ASSIGNED'),
(3,102,3,1,'2026-10-01','ASSIGNED'),
(4,103,4,1,'2026-10-01','ASSIGNED'),
(5,103,5,2,'2026-10-01','ASSIGNED'),
(6,104,6,1,'2026-10-01','VACANT'),
(7,105,8,1,'2026-10-01','ASSIGNED'),
(8,105,9,2,'2026-10-01','ASSIGNED'),
(9,106,10,1,'2026-10-01','ASSIGNED'),

(10,107,11,1,'2026-10-02','ASSIGNED'),
(11,108,12,2,'2026-10-02','ASSIGNED'),
(12,109,14,1,'2026-10-02','ASSIGNED'),
(13,109,15,2,'2026-10-02','ASSIGNED'),
(14,110,1,3,'2026-10-02','ASSIGNED'),
(15,101,2,1,'2026-10-02','ASSIGNED'),
(16,102,3,2,'2026-10-02','ASSIGNED'),
(17,103,4,3,'2026-10-02','ASSIGNED'),
(18,104,5,1,'2026-10-02','ASSIGNED'),

(19,105,6,1,'2026-10-03','ASSIGNED'),
(20,106,8,2,'2026-10-03','ASSIGNED'),
(21,107,9,1,'2026-10-03','ASSIGNED'),
(22,108,10,2,'2026-10-03','ASSIGNED'),
(23,109,11,1,'2026-10-03','ASSIGNED'),
(24,110,12,3,'2026-10-03','ASSIGNED'),
(25,101,14,1,'2026-10-03','ASSIGNED'),
(26,102,15,2,'2026-10-03','ASSIGNED'),
(27,103,NULL,3,'2026-10-03','VACANT'),

(28,104,1,1,'2026-10-04','ASSIGNED'),
(29,105,2,2,'2026-10-04','ASSIGNED'),
(30,106,3,1,'2026-10-04','ASSIGNED'),
(31,107,4,2,'2026-10-04','ASSIGNED'),
(32,108,5,1,'2026-10-04','ASSIGNED'),
(33,109,6,2,'2026-10-04','ASSIGNED'),
(34,110,8,3,'2026-10-04','ASSIGNED'),
(35,101,9,1,'2026-10-04','ASSIGNED'),
(36,102,10,2,'2026-10-04','ASSIGNED'),

(37,101,11,1,'2026-10-05','ASSIGNED'),
(38,101,12,2,'2026-10-05','ASSIGNED'),
(39,102,14,1,'2026-10-05','ASSIGNED'),
(40,103,15,1,'2026-10-05','ASSIGNED'),
(41,103,NULL,2,'2026-10-05','VACANT'),
(42,104,1,3,'2026-10-05','ASSIGNED'),
(43,105,2,1,'2026-10-05','ASSIGNED'),
(44,106,3,2,'2026-10-05','ASSIGNED'),
(45,107,4,1,'2026-10-05','ASSIGNED');
INSERT 0 45
security_roster=# INSERT INTO attendance VALUES
(1,1,'PRESENT','06:03','14:02'),
(2,2,'PRESENT','14:01','22:00'),
(3,3,'ABSENT',NULL,NULL),
(4,4,'PRESENT','06:05','14:00'),
(5,5,'LATE','14:25','22:02'),
(6,7,'PRESENT','06:00','14:00'),
(7,8,'PRESENT','14:03','22:01'),
(8,9,'ABSENT',NULL,NULL),
(9,10,'PRESENT','06:04','14:00'),
(10,11,'PRESENT','14:02','22:00'),
(11,12,'PRESENT','06:00','14:00'),
(12,13,'ABSENT',NULL,NULL),
(13,14,'PRESENT','22:02','06:00'),
(14,15,'PRESENT','06:01','14:00'),
(15,16,'LATE','14:18','22:00'),
(16,17,'PRESENT','22:00','06:01'),
(17,18,'PRESENT','06:02','14:00'),
(18,19,'PRESENT','06:01','14:00'),
(19,20,'ABSENT',NULL,NULL),
(20,21,'PRESENT','06:00','14:00'),
(21,22,'PRESENT','14:01','22:00'),
(22,23,'ABSENT',NULL,NULL),
(23,24,'PRESENT','22:05','06:00'),
(24,25,'PRESENT','06:03','14:00'),
(25,26,'PRESENT','14:02','22:00'),
(26,28,'PRESENT','06:00','14:00'),
(27,29,'LATE','14:20','22:00'),
(28,30,'PRESENT','06:02','14:00'),
(29,31,'PRESENT','14:01','22:00'),
(30,32,'ABSENT',NULL,NULL),
(31,33,'PRESENT','14:03','22:00'),
(32,34,'PRESENT','22:01','06:00'),
(33,35,'PRESENT','06:00','14:00'),
(34,36,'PRESENT','14:02','22:00'),
(35,37,'PRESENT','06:01','14:00'),
(36,38,'ABSENT',NULL,NULL),
(37,39,'PRESENT','06:02','14:00'),
(38,40,'PRESENT','06:04','14:00'),
(39,42,'PRESENT','22:00','06:00'),
(40,43,'PRESENT','06:01','14:00'),
(41,44,'LATE','14:17','22:00'),
(42,45,'ABSENT',NULL,NULL);
INSERT 0 42
security_roster=# INSERT INTO replacement VALUES
(1,3,3,14,'2026-10-01','Personal emergency'),
(2,8,9,15,'2026-10-01','Medical leave'),
(3,13,15,8,'2026-10-02','Personal leave'),
(4,20,8,12,'2026-10-03','Family emergency'),
(5,29,2,10,'2026-10-04','Scheduled leave'),
(6,38,12,5,'2026-10-05','Medical leave');
INSERT 0 6
security_roster=# 
