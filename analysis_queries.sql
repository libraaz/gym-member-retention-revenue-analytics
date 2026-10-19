
-- GYM MEMBER RETENTION & REVENUE ANALYTICS
-- Business Analysis Queries

-- QUERY 1: Total Revenue Collected
-- Exclude pending and failed payments.

SELECT
    SUM(amount) AS total_revenue
FROM payments
WHERE payment_status = 'Paid';


-- QUERY 2: Revenue by Membership Plan
-- Identify which plans generate the most collected revenue.

SELECT
    mp.plan_name,
    SUM(p.amount) AS total_revenue
FROM payments AS p
JOIN memberships AS m
    ON p.membership_id = m.membership_id
JOIN membership_plans AS mp
    ON m.plan_id = mp.plan_id
WHERE p.payment_status = 'Paid'
GROUP BY mp.plan_name
ORDER BY total_revenue DESC;


-- QUERY 3: Membership Count by Status
-- Count membership records in each status.

SELECT
    membership_status,
    COUNT(*) AS total_memberships
FROM memberships
GROUP BY membership_status
ORDER BY total_memberships DESC;


-- QUERY 4: Members Who Have Not Visited Recently
-- Analysis date: October 19, 2026.
-- Flag members whose last recorded visit was before October 5,
-- or who have no attendance records.

SELECT
    m.member_id,
    m.member_name,
    MAX(a.check_in_date) AS last_visit
FROM members AS m
LEFT JOIN attendance AS a
    ON m.member_id = a.member_id
GROUP BY
    m.member_id,
    m.member_name
HAVING
    MAX(a.check_in_date) IS NULL
    OR MAX(a.check_in_date) < '2026-10-05'
ORDER BY last_visit;


-- QUERY 5: Membership Renewals
-- Find memberships followed by a later membership
-- for the same member.

SELECT
    m.member_name,
    old_membership.membership_id AS previous_membership_id,
    new_membership.membership_id AS renewed_membership_id
FROM memberships AS old_membership
JOIN memberships AS new_membership
    ON old_membership.member_id = new_membership.member_id
   AND new_membership.start_date > old_membership.end_date
JOIN members AS m
    ON old_membership.member_id = m.member_id
ORDER BY
    m.member_name,
    old_membership.end_date;


-- QUERY 6: Payment Status Breakdown
-- Compare payment counts and amounts by status.

SELECT
    payment_status,
    COUNT(*) AS payment_count,
    SUM(amount) AS total_amount
FROM payments
GROUP BY payment_status
ORDER BY total_amount DESC;
