# Waste Management SQL Project

This project demonstrates my proficiency in SQL through a simple but structured relational database for a Waste Management System. The goal is to simulate real-world use cases like user registration, waste tracking, and payment transactions.

---

## 📌 Features

- **Database Creation:** Complete schema design with normalization and indexing.
- **Entity Relationships:** Demonstrates the use of `FOREIGN KEY` and data integrity.
- **Sample Data Insertion:** Insert realistic entries for testing and demonstration.
- **Useful Queries:** Shows real-world reporting scenarios (see below).

---

## 📂 Tables

- `Users`: Stores user details.
- `WasteTypes`: Defines various categories of waste.
- `WasteEntries`: Tracks individual waste submissions by users.
- `Transactions`: Logs payments for waste collection.

---

## 🔍 Sample Queries

```sql
-- 1. Show total waste submitted by each user
SELECT u.name, SUM(w.weight_kg) AS total_kg
FROM Users u
JOIN WasteEntries w ON u.user_id = w.user_id
GROUP BY u.name;

-- 2. Monthly transaction summary
SELECT MONTH(transaction_date) AS Month, SUM(amount_paid) AS Total_Income
FROM Transactions
GROUP BY MONTH(transaction_date);

-- 3. Most common waste type
SELECT wt.type_name, COUNT(*) AS Frequency
FROM WasteEntries we
JOIN WasteTypes wt ON we.waste_type_id = wt.waste_type_id
GROUP BY wt.type_name
ORDER BY Frequency DESC
LIMIT 1;
