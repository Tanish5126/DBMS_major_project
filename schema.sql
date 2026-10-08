Last login: Mon Oct  5 20:39:25 on ttys000
tanishtushargawade@Tanishs-MacBook-Air-2 ~ % psql postgres
psql (18.4 (Homebrew))
Type "help" for help.

postgres=# \l
                                                                          List of databases
         Name         |       Owner        | Encoding | Locale Provider |   Collate   |    Ctype    | Locale | ICU Rules |             Access privileges             
----------------------+--------------------+----------+-----------------+-------------+-------------+--------+-----------+-------------------------------------------
 assignment1          | tanishtushargawade | UTF8     | libc            | en_US.UTF-8 | en_US.UTF-8 |        |           | 
 assignment2          | tanishtushargawade | UTF8     | libc            | en_US.UTF-8 | en_US.UTF-8 |        |           | 
 library_mini_project | tanishtushargawade | UTF8     | libc            | en_US.UTF-8 | en_US.UTF-8 |        |           | 
 mydb                 | tanishtushargawade | UTF8     | libc            | en_US.UTF-8 | en_US.UTF-8 |        |           | 
 orderdb              | tanishtushargawade | UTF8     | libc            | en_US.UTF-8 | en_US.UTF-8 |        |           | 
 postgres             | tanishtushargawade | UTF8     | libc            | en_US.UTF-8 | en_US.UTF-8 |        |           | 
 revisiondb           | tanishtushargawade | UTF8     | libc            | en_US.UTF-8 | en_US.UTF-8 |        |           | 
 security_roster      | tanishtushargawade | UTF8     | libc            | en_US.UTF-8 | en_US.UTF-8 |        |           | 
 template0            | tanishtushargawade | UTF8     | libc            | en_US.UTF-8 | en_US.UTF-8 |        |           | =c/tanishtushargawade                    +
                      |                    |          |                 |             |             |        |           | tanishtushargawade=CTc/tanishtushargawade
 template1            | tanishtushargawade | UTF8     | libc            | en_US.UTF-8 | en_US.UTF-8 |        |           | =c/tanishtushargawade                    +
                      |                    |          |                 |             |             |        |           | tanishtushargawade=CTc/tanishtushargawade
(10 rows)

postgres=# \c security_roster;
You are now connected to database "security_roster" as user "tanishtushargawade".
security_roster=# CREATE TABLE client (
    client_id INTEGER PRIMARY KEY,
    client_name VARCHAR(100) NOT NULL,
    contact_person VARCHAR(100) NOT NULL,
    contact_phone VARCHAR(15),
    email VARCHAR(120) UNIQUE
);
CREATE TABLE
security_roster=# CREATE TABLE post (
    post_id INTEGER PRIMARY KEY,
    client_id INTEGER NOT NULL REFERENCES client(client_id),
    post_name VARCHAR(100) NOT NULL,
    location VARCHAR(150) NOT NULL,
    required_guards INTEGER NOT NULL DEFAULT 1 CHECK (required_guards > 0),
    active BOOLEAN NOT NULL DEFAULT TRUE
);
CREATE TABLE
security_roster=# CREATE TABLE guard (
    guard_id INTEGER PRIMARY KEY,
    guard_name VARCHAR(100) NOT NULL,
    phone VARCHAR(15),
    address VARCHAR(200),
    joining_date DATE NOT NULL,
    status VARCHAR(20) NOT NULL DEFAULT 'ACTIVE'
        CHECK (status IN ('ACTIVE', 'INACTIVE', 'ON_LEAVE'))
);
CREATE TABLE
security_roster=# CREATE TABLE shift (
    shift_id INTEGER PRIMARY KEY,
    shift_name VARCHAR(50) NOT NULL UNIQUE,
    start_time TIME NOT NULL,
    end_time TIME NOT NULL
);
CREATE TABLE
security_roster=# CREATE TABLE deployment (
    deployment_id INTEGER PRIMARY KEY,
    post_id INTEGER NOT NULL REFERENCES post(post_id),
    guard_id INTEGER REFERENCES guard(guard_id),
    shift_id INTEGER NOT NULL REFERENCES shift(shift_id),
    deployment_date DATE NOT NULL,
    roster_status VARCHAR(20) NOT NULL DEFAULT 'ASSIGNED'
        CHECK (roster_status IN ('ASSIGNED', 'VACANT', 'CANCELLED')),
    UNIQUE (post_id, shift_id, deployment_date)
);
CREATE TABLE
security_roster=# CREATE TABLE attendance (
    attendance_id INTEGER PRIMARY KEY,
    deployment_id INTEGER NOT NULL UNIQUE REFERENCES deployment(deployment_id),
    attendance_status VARCHAR(20) NOT NULL
        CHECK (attendance_status IN ('PRESENT', 'ABSENT', 'LATE', 'ON_LEAVE')),
    check_in TIME,
    check_out TIME
);
CREATE TABLE
security_roster=# CREATE TABLE replacement (
    replacement_id INTEGER PRIMARY KEY,
    deployment_id INTEGER NOT NULL REFERENCES deployment(deployment_id),
    old_guard_id INTEGER NOT NULL REFERENCES guard(guard_id),
    new_guard_id INTEGER NOT NULL REFERENCES guard(guard_id),
    replacement_date DATE NOT NULL,
    reason VARCHAR(200) NOT NULL,
    CHECK (old_guard_id <> new_guard_id)
);
CREATE TABLE
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

security_roster=# 
