# 🚗 Car Rental Analytics & Management System

## 📌 Project Overview
This project is an end-to-end SQL and Power BI analytics solution designed to analyze car rental operations, revenue performance, and fleet utilization. The goal was to design a structured relational database and transform raw rental data into actionable business insights.

This project demonstrates my ability to bridge business and technology as a Management Information Systems student.

---

## 🎯 Business Problem
Car rental companies need better visibility into:
- Fleet utilization rates
- Revenue performance by vehicle and location
- Late return patterns
- Customer rental behavior

Without structured data modeling and KPI tracking, operational decision-making becomes inefficient and reactive.

---

## 🛠 Tools & Technologies Used
- SQL Server (DDL, DML, CTEs, Stored Procedures, Triggers)
- Power BI (Dashboard & KPI Visualization)
- ER Modeling & Database Normalization (BCNF)
- Excel (Data Structuring & Validation)

---

## 🗂 Database Design
- Multi-schema relational structure (`Vehicle`, `Customer`, `Rental`, `Finance`, `Operation`) — 43 tables total
- Fully normalized tables with primary/foreign key constraints and `CHECK` constraints on every enum-style column
- Stored procedures and triggers automate rental pricing, invoice generation, and payment creation (e.g. `usp_CreateRentalEstimate`, `usp_FinalizeRental`, `trg_GenerateInvoice_AfterRentalCompletion`)
- See [`03_Database_Design/schema-design.md`](./03_Database_Design/schema-design.md) for the full entity design and [`02_Data_Model/data-dictionary.md`](./02_Data_Model/data-dictionary.md) for column-level documentation (generated directly from the DDL, so it stays in sync with the schema)

---

## 📁 Repository Structure
| Folder | Contents |
|---|---|
| [`01_Business_Context`](./01_Business_Context) | Project charter and the canonical business rules document (BR-01–BR-52) |
| [`02_Data_Model`](./02_Data_Model) | Data dictionary, generated from the live DDL |
| [`03_Database_Design`](./03_Database_Design) | Schema design write-up and ER diagram |
| [`04_Database_Construction`](./04_Database_Construction) | The actual DDL (schema) and DML (sample data) that build and populate the database, plus an optional gap-closing constraints script |
| [`05_SQL_Analytics`](./05_SQL_Analytics) | Revenue, fleet utilization, and customer insight queries run against the schema above |

---

## 📊 Key KPIs Developed
- Revenue per vehicle
- Fleet utilization rate
- Average rental duration
- Late return percentage
- Monthly revenue trend analysis

---

## 📈 Business Impact
- Improved visibility into underutilized vehicles
- Identified revenue concentration across customer segments
- Enabled performance comparison across rental locations
- Provided structured foundation for future predictive modeling

---

## 🧠 What I Learned
- Designing scalable relational databases
- Translating business requirements into data models
- Developing KPI-driven dashboards
- Structuring analytics projects using a project lifecycle approach

---

## 🔄 Future Enhancements
- Demand forecasting model
- Dynamic pricing strategy
- Customer churn prediction
