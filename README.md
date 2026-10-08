# Security Guard Deployment Roster Database

## 1. Project overview

This DBMS project models a security agency that assigns guards to security posts for different clients and shifts. It also records attendance and replacement history.

The database is intentionally compact so that the complete dataset can be inspected manually while still demonstrating the required SQL concepts.

## 2. Main entities

- Client: organizations receiving security services.
- Post: a security location/post belonging to a client.
- Guard: security personnel.
- Shift: defined working periods such as Morning, Evening and Night.
- Deployment: a roster assignment connecting a post, guard and shift for a particular date.
- Attendance: attendance for a deployment.
- Replacement: historical record showing when one assigned guard was replaced by another.

## 3. Relationship design

Client 1:N Post
Post 1:N Deployment
Guard 1:N Deployment
Shift 1:N Deployment
Deployment 1:0..1 Attendance
Deployment 1:N Replacement
Guard 1:N Replacement as old guard
Guard 1:N Replacement as new guard

## 4. Important design decisions

### Why is Deployment a separate table?

A post can have different guards on different dates and shifts. Putting guard_id directly into Post would lose roster history and would not represent daily assignments correctly.

### Why is guard_id nullable in Deployment?

A roster slot can exist even when no guard has been assigned. A NULL guard_id together with roster_status = 'VACANT' lets the system identify unfilled posts.

### Why is Attendance separate?

Deployment answers "who was scheduled", while Attendance answers "who actually attended". Keeping them separate preserves both planned and actual information.

### Why is Replacement separate?

When a guard is replaced, overwriting guard_id would destroy the original assignment history. Replacement preserves old guard, new guard, date and reason.

## 5. Constraints

Primary keys uniquely identify records. Foreign keys maintain relationships. NOT NULL is used where a value is required. CHECK constraints restrict status values and prevent invalid replacement records. UNIQUE constraints prevent duplicate shift names and duplicate attendance records for one deployment.

## 6. Compact data volume

The seed contains:
- 5 clients
- 10 posts
- 15 guards
- 3 shifts
- 45 deployment records
- 42 attendance records
- 6 replacement records

This is enough to produce meaningful joins, grouping, filtering and pagination without creating an unnecessarily large submission.

## 7. SQL concepts demonstrated

The query file demonstrates:
- WHERE
- BETWEEN
- IN
- LIKE
- IS NULL
- DISTINCT
- ORDER BY
- LIMIT
- OFFSET
- COUNT
- AVG
- GROUP BY
- HAVING
- INNER/LEFT JOIN
- Subqueries
- NOT EXISTS
- NULL handling
- Pagination

## 8. Important NULL note

`NULL` means the value is unknown or not recorded. It should not be tested with `= NULL`.

Correct:
```sql
WHERE phone IS NULL;
```

Incorrect:
```sql
WHERE phone = NULL;
```

## 9. Pagination

The project uses:
```sql
LIMIT 5 OFFSET 0;
LIMIT 5 OFFSET 5;
```

The first returns the first five rows and the second returns the next five rows after skipping five rows.

## 10. Files

- schema.sql — table definitions and constraints
- seed.sql — compact sample data
- queries.sql — 18 retrieval queries
- README.md — design decisions and project explanation
- ER_Diagram.svg — entity relationship diagram
