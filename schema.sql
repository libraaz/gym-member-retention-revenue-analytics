
-- GYM MEMBER RETENTION & REVENUE ANALYTICS
-- Database schema

CREATE TABLE members (
    member_id INT PRIMARY KEY,
    member_name VARCHAR(100) NOT NULL,
    gender VARCHAR(20),
    join_date DATE NOT NULL
);

CREATE TABLE membership_plans (
    plan_id INT PRIMARY KEY,
    plan_name VARCHAR(50) NOT NULL,
    duration_months INT NOT NULL,
    plan_price DECIMAL(10, 2) NOT NULL
);

CREATE TABLE memberships (
    membership_id INT PRIMARY KEY,
    member_id INT NOT NULL,
    plan_id INT NOT NULL,
    start_date DATE NOT NULL,
    end_date DATE NOT NULL,
    membership_status VARCHAR(20) NOT NULL,
    FOREIGN KEY (member_id) REFERENCES members(member_id),
    FOREIGN KEY (plan_id) REFERENCES membership_plans(plan_id)
);

CREATE TABLE attendance (
    attendance_id INT PRIMARY KEY,
    member_id INT NOT NULL,
    check_in_date DATE NOT NULL,
    FOREIGN KEY (member_id) REFERENCES members(member_id)
);

CREATE TABLE payments (
    payment_id INT PRIMARY KEY,
    membership_id INT NOT NULL,
    payment_date DATE NOT NULL,
    amount DECIMAL(10, 2) NOT NULL,
    payment_status VARCHAR(20) NOT NULL,
    FOREIGN KEY (membership_id) REFERENCES memberships(membership_id)
);
