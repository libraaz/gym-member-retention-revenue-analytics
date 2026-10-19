# Gym Member Retention & Revenue Analytics

## Project Overview

This SQL portfolio project analyses fictional gym membership data to explore revenue performance, membership renewals, member attendance, and payment status.

The goal is to demonstrate how SQL can turn raw relational data into actionable business insights for gym management.

## Business Objectives

- Calculate revenue collected from successful payments.
- Compare revenue across membership plans.
- Analyse membership counts by status.
- Identify members with low or outdated attendance.
- Identify members who purchased a subsequent membership.
- Summarise paid, pending, and failed payments.

## Database Schema

The project uses five relational tables:

| Table | Purpose |
|---|---|
| `members` | Member details and join dates |
| `membership_plans` | Plan names, durations, and prices |
| `memberships` | Membership history and status |
| `attendance` | Recorded gym visits |
| `payments` | Payment amounts, dates, and statuses |

### Table Relationships

- One member can have multiple memberships.
- One member can have multiple attendance records.
- One membership plan can be associated with multiple memberships.
- One membership can have multiple payment records, if the business process requires them.

## SQL Concepts Demonstrated

- Data definition using `CREATE TABLE`
- Data insertion using `INSERT INTO`
- Primary keys and foreign keys
- Filtering using `WHERE`
- Aggregation using `SUM`, `COUNT`, and `MAX`
- Grouping using `GROUP BY`
- Aggregate filtering using `HAVING`
- Sorting using `ORDER BY`
- Table joins, including `LEFT JOIN`
- Self-joins for membership renewal analysis
- Views for reusable reporting queries

## Business Questions

### 1. How much revenue has been collected?

Sums payments marked `Paid`, excluding pending and failed payments.

### 2. Which membership plans generate the most revenue?

Joins payments to memberships and plans to compare collected revenue by plan.

### 3. What is the membership status breakdown?

Counts membership records by status. This is a count of membership records, not necessarily unique members.

### 4. Which members have not visited recently?

Identifies members whose latest recorded visit is before the selected cutoff date, including members with no attendance records.

### 5. Which members have renewed?

Uses a self-join to identify a later membership belonging to the same member.

### 6. What is the payment status breakdown?

Summarises payment counts and associated amounts by payment status.

## Reusable SQL View

The `member_activity_summary` view provides one row per member, including:

- Member ID and name
- Join date
- Last recorded visit
- Total recorded visits

This view can be queried repeatedly without rewriting the underlying aggregation.

## Project Files

- `schema.sql` — creates the database tables.
- `insert_data.sql` — inserts fictional sample records.
- `analysis_queries.sql` — contains six business analysis queries.
- `views.sql` — creates the reusable member activity view.

## How to Run

1. Open a MySQL-compatible SQL environment.
2. Execute `schema.sql` to create the tables.
3. Execute `insert_data.sql` to populate the tables.
4. Execute the queries in `analysis_queries.sql`.
5. Execute `views.sql` to create the view.
6. Query `member_activity_summary` to inspect member activity.

Run the schema only in a fresh database, or reset the existing tables appropriately before recreating them.

## Assumptions and Limitations

- All sample data is fictional.
- Only payments marked `Paid` are counted as collected revenue.
- The attendance cutoff date is fixed in the analysis query for reproducibility.
- A later membership is treated as a potential renewal when it starts after a previous membership ends. This does not prove that the member renewed without interruption.
- Low attendance is a follow-up signal, not a proven prediction of churn.
- The dataset is small and intended to demonstrate SQL analysis, not to support statistically reliable business forecasts.

## Future Improvements

- Calculate a clearly defined membership renewal rate.
- Add monthly revenue trends.
- Analyse attendance frequency by membership plan.
- Add a dedicated churn definition and evaluate it against historical outcomes.
- Build a dashboard in Power BI or Tableau.

## Tools

- SQL
- MySQL-compatible database environment
- GitHub for version control and project documentation
