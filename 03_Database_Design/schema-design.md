# Database Schema Design

## Overview
The Car Rental Analytics & Management System is designed using a relational database model across multiple schemas including Vehicle, Customer, Rental, Finance, Operation, and Employee.

The design supports both operational workflows and analytical reporting.

---

## Core Business Flow

1. Customer creates a reservation
2. Reservation is converted into a rental
3. Rental is linked to a specific vehicle and branch
4. Charges, taxes, and promotions are calculated
5. Invoice is generated
6. Payment and refunds are processed

---

## Key Entity Relationships

- Vehicle → Branch (Many-to-One)
- Vehicle → Vehicle_Class (Many-to-One)
- Vehicle → Vehicle_Type (Many-to-One)
- Vehicle → Fuel_Type (Many-to-One)

- Reservation → Customer (Many-to-One)
- Rental → Vehicle (Many-to-One)
- Rental → Branch (Many-to-One)

- Rental → Invoice (One-to-Many)
- Invoice → Payment (One-to-Many)

---

## Design Highlights

- Normalized relational schema (BCNF)
- Strong use of primary and foreign keys
- Separation of concerns across schemas
- Supports pricing, promotions, taxes, and financial transactions
- Designed for both OLTP and analytics use cases

---

## ER Diagram

See `er-diagram.pdf` for full system design.