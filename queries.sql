Last login: Mon Oct  5 20:48:21 on ttys000
tanishtushargawade@Tanishs-MacBook-Air-2 ~ % psql postgres
psql (18.4 (Homebrew))
Type "help" for help.

postgres=# \c security_roster 
You are now connected to database "security_roster" as user "tanishtushargawade".
security_roster=# -- QUESTION 1:
-- Which guards do not have a phone number recorded?
SELECT guard_id, guard_name
FROM guard
WHERE phone IS NULL
ORDER BY guard_id;
 guard_id |  guard_name  
----------+--------------
        3 | Vikram Singh
        6 | Prakash More
       11 | Deepak Verma
       15 | Vivek Joshi
(4 rows)

security_roster=# -- QUESTION 2:
-- Which guards joined between March 1, 2025 and July 31, 2025?
SELECT guard_id, guard_name, joining_date
FROM guard
WHERE joining_date BETWEEN '2025-03-01' AND '2025-07-31'
ORDER BY joining_date;
 guard_id |   guard_name   | joining_date 
----------+----------------+--------------
        3 | Vikram Singh   | 2025-03-05
        4 | Suresh Yadav   | 2025-03-18
        5 | Rohan Deshmukh | 2025-04-01
        6 | Prakash More   | 2025-04-20
        7 | Nitin Jadhav   | 2025-05-12
        8 | Sameer Khan    | 2025-05-25
        9 | Manoj Pawar    | 2025-06-03
       10 | Kunal Shah     | 2025-06-15
       11 | Deepak Verma   | 2025-07-02
       12 | Arvind Rao     | 2025-07-19
(10 rows)

security_roster=# -- QUESTION 3:
-- Which guards are currently ACTIVE or ON_LEAVE?
SELECT guard_id, guard_name, status
FROM guard
WHERE status IN ('ACTIVE', 'ON_LEAVE')
ORDER BY guard_name;
 guard_id |   guard_name   |  status  
----------+----------------+----------
        1 | Amit Sharma    | ACTIVE
       12 | Arvind Rao     | ACTIVE
       11 | Deepak Verma   | ACTIVE
       10 | Kunal Shah     | ACTIVE
        9 | Manoj Pawar    | ACTIVE
        7 | Nitin Jadhav   | ON_LEAVE
        6 | Prakash More   | ACTIVE
        2 | Rahul Patil    | ACTIVE
        5 | Rohan Deshmukh | ACTIVE
        8 | Sameer Khan    | ACTIVE
        4 | Suresh Yadav   | ACTIVE
        3 | Vikram Singh   | ACTIVE
       15 | Vivek Joshi    | ACTIVE
       14 | Yash Kulkarni  | ACTIVE
(14 rows)

security_roster=# -- QUESTION 4:
-- Which guards have names starting with the letter 'A'?
SELECT guard_id, guard_name
FROM guard
WHERE guard_name LIKE 'A%'
ORDER BY guard_name;
 guard_id | guard_name  
----------+-------------
        1 | Amit Sharma
       12 | Arvind Rao
(2 rows)

security_roster=# -- QUESTION 5:
-- Which deployment slots are vacant on October 5, 2026?
SELECT d.deployment_id, p.post_name, p.location, s.shift_name
FROM deployment d
JOIN post p ON d.post_id = p.post_id
JOIN shift s ON d.shift_id = s.shift_id
WHERE d.deployment_date = '2026-10-05'
  AND d.roster_status = 'VACANT'
  AND d.guard_id IS NULL
ORDER BY s.start_time;
 deployment_id |   post_name    | location | shift_name 
---------------+----------------+----------+------------
            41 | Emergency Gate | Powai    | Evening
(1 row)

security_roster=# -- QUESTION 6:
-- Which guards were absent between October 1 and October 5, 2026?
SELECT DISTINCT g.guard_id, g.guard_name
FROM guard g
JOIN deployment d ON g.guard_id = d.guard_id
JOIN attendance a ON d.deployment_id = a.deployment_id
WHERE a.attendance_status = 'ABSENT'
  AND d.deployment_date BETWEEN '2026-10-01' AND '2026-10-05'
ORDER BY g.guard_name;
 guard_id |   guard_name   
----------+----------------
       12 | Arvind Rao
       11 | Deepak Verma
       10 | Kunal Shah
        5 | Rohan Deshmukh
        8 | Sameer Khan
        4 | Suresh Yadav
        3 | Vikram Singh
       15 | Vivek Joshi
(8 rows)

security_roster=# -- QUESTION 7:
-- Which guards were deployed at Phoenix Mall, and in which shifts?
SELECT d.deployment_date,
       p.post_name,
       g.guard_name,
       s.shift_name
FROM deployment d
JOIN post p ON d.post_id = p.post_id
JOIN client c ON p.client_id = c.client_id
JOIN guard g ON d.guard_id = g.guard_id
JOIN shift s ON d.shift_id = s.shift_id
WHERE c.client_name = 'Phoenix Mall'
ORDER BY d.deployment_date, s.start_time, g.guard_name;
 deployment_date |    post_name     |  guard_name   | shift_name 
-----------------+------------------+---------------+------------
 2026-10-01      | Main Gate        | Amit Sharma   | Morning
 2026-10-01      | Parking Entrance | Vikram Singh  | Morning
 2026-10-01      | Main Gate        | Rahul Patil   | Evening
 2026-10-02      | Main Gate        | Rahul Patil   | Morning
 2026-10-02      | Parking Entrance | Vikram Singh  | Evening
 2026-10-03      | Main Gate        | Yash Kulkarni | Morning
 2026-10-03      | Parking Entrance | Vivek Joshi   | Evening
 2026-10-04      | Main Gate        | Manoj Pawar   | Morning
 2026-10-04      | Parking Entrance | Kunal Shah    | Evening
 2026-10-05      | Main Gate        | Deepak Verma  | Morning
 2026-10-05      | Parking Entrance | Yash Kulkarni | Morning
 2026-10-05      | Main Gate        | Arvind Rao    | Evening
(12 rows)

security_roster=# -- QUESTION 8:
-- What are the different locations where security posts are located?
SELECT DISTINCT location
FROM post
ORDER BY location;
   location   
--------------
 Andheri West
 Bhiwandi
 Borivali
 Powai
 Vikhroli
(5 rows)

security_roster=# -- QUESTION 9:
-- What are the first 5 guards when the guards are sorted alphabetically?
SELECT guard_id, guard_name
FROM guard
ORDER BY guard_name
LIMIT 5;
 guard_id |  guard_name  
----------+--------------
        1 | Amit Sharma
       12 | Arvind Rao
       11 | Deepak Verma
       10 | Kunal Shah
        9 | Manoj Pawar
(5 rows)

security_roster=# -- QUESTION 10:
-- What are the next 5 guards after the first 5 guards alphabetically?
SELECT guard_id, guard_name
FROM guard
ORDER BY guard_name
LIMIT 5 OFFSET 5;
 guard_id |   guard_name   
----------+----------------
        7 | Nitin Jadhav
        6 | Prakash More
        2 | Rahul Patil
        5 | Rohan Deshmukh
        8 | Sameer Khan
(5 rows)

security_roster=# -- QUESTION 11:
-- How many active security posts does each client have?
SELECT c.client_name,
       COUNT(p.post_id) AS active_post_count
FROM client c
LEFT JOIN post p
  ON c.client_id = p.client_id
 AND p.active = TRUE
GROUP BY c.client_id, c.client_name
ORDER BY active_post_count DESC;
       client_name        | active_post_count 
--------------------------+-------------------
 TechPark Business Centre |                 2
 Sunrise Hospital         |                 2
 Metro Logistics          |                 2
 Phoenix Mall             |                 2
 Westside Residency       |                 2
(5 rows)

security_roster=# -- QUESTION 12:
-- Which clients have at least 5 deployments?
SELECT c.client_name,
       COUNT(d.deployment_id) AS deployment_count
FROM client c
JOIN post p ON c.client_id = p.client_id
JOIN deployment d ON p.post_id = d.post_id
GROUP BY c.client_id, c.client_name
HAVING COUNT(d.deployment_id) >= 5
ORDER BY deployment_count DESC;
       client_name        | deployment_count 
--------------------------+------------------
 Phoenix Mall             |               12
 Sunrise Hospital         |               10
 Metro Logistics          |                9
 TechPark Business Centre |                7
 Westside Residency       |                7
(5 rows)

security_roster=# -- QUESTION 13:
-- How many attendance records are there for each attendance status?
SELECT attendance_status,
       COUNT(*) AS total_records
FROM attendance
GROUP BY attendance_status
ORDER BY total_records DESC;
 attendance_status | total_records 
-------------------+---------------
 PRESENT           |            30
 ABSENT            |             8
 LATE              |             4
(3 rows)

security_roster=# -- QUESTION 14:
-- Which guards have never been assigned to any deployment?
SELECT g.guard_id, g.guard_name
FROM guard g
WHERE NOT EXISTS (
    SELECT 1
    FROM deployment d
    WHERE d.guard_id = g.guard_id
)
ORDER BY g.guard_id;
 guard_id |  guard_name  
----------+--------------
        7 | Nitin Jadhav
       13 | Sanjay Gupta
(2 rows)

security_roster=# -- QUESTION 15:
-- Which posts had no guard assigned on October 5, 2026?
SELECT p.post_id,
       p.post_name,
       p.location
FROM post p
WHERE p.post_id IN (
    SELECT d.post_id
    FROM deployment d
    WHERE d.deployment_date = '2026-10-05'
      AND d.guard_id IS NULL
)
ORDER BY p.post_id;
 post_id |   post_name    | location 
---------+----------------+----------
     103 | Emergency Gate | Powai
(1 row)

security_roster=# 
