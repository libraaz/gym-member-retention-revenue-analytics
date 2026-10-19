
-- GYM MEMBER RETENTION & REVENUE ANALYTICS
-- Reusable View: Member Activity Summary

CREATE VIEW member_activity_summary AS
SELECT
    m.member_id,
    m.member_name,
    m.join_date,
    MAX(a.check_in_date) AS last_visit,
    COUNT(a.attendance_id) AS total_visits
FROM members AS m
LEFT JOIN attendance AS a
    ON m.member_id = a.member_id
GROUP BY
    m.member_id,
    m.member_name,
    m.join_date;


SELECT *
FROM member_activity_summary
ORDER BY total_visits DESC;
