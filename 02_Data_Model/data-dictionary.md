

## Tables and Columns

# Data Dictionary

---

## Vehicle.Vehicle

| Attribute Name | Data Type | Example | Null? | Default | PK/FK | FK Reference | Description |
|---|---|---|---|---|---|---|---|
| vehicle_id | INT | 1001 | NOT NULL | Auto Increment | PK | | Unique identifier for each vehicle |
| vehicle_vin | VARCHAR(17) | 1HGCM82633A123456 | NOT NULL | | | | Vehicle Identification Number, must be unique |
| vehicle_class_id | INT | 3 | NOT NULL | None | FK | Vehicle.Vehicle_Class | Vehicle class (Economy, SUV, Luxury, etc.) |
| vehicle_type_id | INT | 2 | NOT NULL | None | FK | Vehicle.Vehicle_Type | Vehicle type (Sedan, SUV, Truck, etc.) |
| fuel_type_id | INT | 1 | NOT NULL | None | FK | Vehicle.Fuel_Type | Fuel type (Gasoline, Electric, Hybrid, etc.) |
| purchase_id | INT | 15 | NOT NULL | None | FK | Vehicle.Vehicle_Purchase | Links to vehicle purchase record |
| branch_id | INT | 5 | NOT NULL | None | FK | Operation.Branch | Branch where the vehicle is assigned |
| make | VARCHAR(30) | Toyota | NOT NULL | None | | | Manufacturer of the vehicle |
| model | VARCHAR(30) | Camry | NOT NULL | None | | | Model name |
| year | INT | 2021 | NOT NULL | None | | | Manufacturing year |
| color | VARCHAR(30) | Black | NULL | None | | | Exterior color |
| status | VARCHAR(30) | Available | NOT NULL | None | | | Available, Reserved, Rented, Maintenance, Retired |
| mileage | DECIMAL(10,2) | 32500.5 | NOT NULL | None | | | Current mileage |
| created_at | DATETIME | 2025-02-11 14:23 | NOT NULL | GETDATE() | | | Record creation timestamp |
| updated_at | DATETIME | 2025-05-22 09:10 | NULL | None | | | Last update timestamp |

---

## Vehicle.Vehicle_Warranty

| Attribute Name | Data Type | Example | Null? | Default | PK/FK | FK Reference | Description |
|---|---|---|---|---|---|---|---|
| warranty_id | INT | 6001 | NOT NULL | Auto Increment | PK | | Unique identifier for warranty |
| vehicle_id | INT | 501 | NOT NULL | None | FK | Vehicle.Vehicle | Vehicle covered under warranty |
| warranty_provider | VARCHAR(50) | Toyota Financial Services | NOT NULL | None | | | Warranty provider |
| warranty_type | VARCHAR(30) | Powertrain | NOT NULL | None | | | Warranty type |
| start_date | DATE | 2023-01-01 | NOT NULL | None | | | Warranty start date |
| end_date | DATE | 2028-01-01 | NOT NULL | None | | | Warranty end date |
| coverage_mileage | INT | 60000 | NOT NULL | None | | | Maximum covered mileage |
| status | VARCHAR(20) | Active | NOT NULL | None | | | Active or Expired |

---

## Vehicle.Vehicle_Class

| Attribute Name | Data Type | Example | Null? | Default | PK/FK | FK Reference | Description |
|---|---|---|---|---|---|---|---|
| vehicle_class_id | INT | 1 | NOT NULL | Auto Increment | PK | | Unique class identifier |
| class_name | VARCHAR(30) | Economy | NOT NULL | None | | | Vehicle class name |

---

## Vehicle.Vehicle_Type

| Attribute Name | Data Type | Example | Null? | Default | PK/FK | FK Reference | Description |
|---|---|---|---|---|---|---|---|
| vehicle_type_id | INT | 1 | NOT NULL | Auto Increment | PK | | Unique identifier for vehicle type |
| vehicle_type_name | VARCHAR(30) | SUV | NOT NULL | None | | | Vehicle type name |

---

## Vehicle.Fuel_Type

| Attribute Name | Data Type | Example | Null? | Default | PK/FK | FK Reference | Description |
|---|---|---|---|---|---|---|---|
| fuel_type_id | INT | 1 | NOT NULL | Auto Increment | PK | | Unique identifier for fuel type |
| fuel_type_name | VARCHAR(30) | Gasoline | NOT NULL | None | | | Fuel type |
| fuel_efficiency | DECIMAL(5,2) | 28.5 | NOT NULL | None | | | Average fuel efficiency |

---

## Vehicle.Vehicle_Purchase

| Attribute Name | Data Type | Example | Null? | Default | PK/FK | FK Reference | Description |
|---|---|---|---|---|---|---|---|
| purchase_id | INT | 501 | NOT NULL | Auto Increment | PK | | Unique purchase identifier |
| purchase_date | DATE | 2023-05-12 | NOT NULL | None | | | Date vehicle was purchased |
| purchase_type | VARCHAR(30) | Auction | NOT NULL | None | | | Method of purchase |
| purchase_from | VARCHAR(100) | AutoNation Minneapolis | NOT NULL | None | | | Seller/source |
| purchase_price | DECIMAL(10,2) | 18500 | NOT NULL | None | | | Total purchase cost |

---

## Vehicle.Vehicle_Registration

| Attribute Name | Data Type | Example | Null? | Default | PK/FK | FK Reference | Description |
|---|---|---|---|---|---|---|---|
| registration_id | INT | 7001 | NOT NULL | Auto Increment | PK | | Unique registration identifier |
| vehicle_id | INT | 501 | NOT NULL | None | FK | Vehicle.Vehicle | Vehicle being registered |
| registration_number | VARCHAR(20) | REG-2025-12345 | NOT NULL | None | | | Official DMV registration |
| license_plate | VARCHAR(20) | MN-7DK294 | NOT NULL | None | | | License plate number |
| registration_state | VARCHAR(30) | Minnesota | NOT NULL | None | | | Registration state |
| registration_issue_date | DATE | 2025-01-10 | NOT NULL | None | | | Issue date |
| registration_expiry_date | DATE | 2026-01-10 | NOT NULL | None | | | Expiration date |
| registration_status | VARCHAR(20) | Active | NOT NULL | Active | | | Status |
| created_at | DATETIME | 2025-02-21 13:30 | NOT NULL | GETDATE() | | | Record creation timestamp |
| updated_at | DATETIME | 2025-02-22 10:20 | NULL | None | | | Last update timestamp |

---

## Vehicle.Vehicle_Insurance

| Attribute Name | Data Type | Example | Null? | Default | PK/FK | FK Reference | Description |
|---|---|---|---|---|---|---|---|
| insurance_id | INT | 610 | NOT NULL | Auto Increment | PK | | Unique identifier for each insurance policy record |
| vehicle_id | INT | 501 | NOT NULL | None | FK | Vehicle.Vehicle | Vehicle that this insurance policy covers |
| policy_number | VARCHAR(30) | INS-2025-44031 | NOT NULL | None | | | Policy number assigned by insurance provider |
| provider_name | VARCHAR(50) | | NOT NULL | None | | | Name of the insurance provider |
| coverage_type | VARCHAR(50) | Comprehensive, Collision, Liability, Full Coverage, etc. | NOT NULL | None | | | Type of coverage: Comprehensive, Collision, Liability, Full Coverage, etc. |
| policy_start_date | DATE | 1/1/25 | NOT NULL | None | | | Start date of insurance coverage |
| policy_expiry_date | DATE | 1/1/26 | NOT NULL | None | | | Expiry date of coverage; must be after start date |
| policy_status | VARCHAR(20) | Active | NOT NULL | Active | | | Status: Active, Expired, Pending Renewal, Cancelled |
| created_at | DATETIME | 2/25/25 11:20 | NOT NULL | GETDATE() | | | Timestamp when the policy record was created |
| updated_at | DATETIME | 2/23/25 8:15 | NULL | None | | | Timestamp when policy information was last updated |

---

## Vehicle.Vehicle_Inspection

| Attribute Name | Data Type | Example | Null? | Default | PK/FK | FK Reference | Description |
|---|---|---|---|---|---|---|---|
| inspection_id | INT | 400 | NOT NULL | Auto Increment | PK | | Unique identifier for each inspection |
| employee_id | INT | 300 | NOT NULL | None | FK | Operation.Employee | Employees who performed the inspection |
| vehicle_id | INT | 501 | NOT NULL | None | FK | Vehicle.Vehicle | Vehicle being inspected |
| rental_id | INT | 900 | NULL | None | FK | Rental.Rental | Links rental session (NULL if not part of a rental) |
| inspection_date | DATETIME | 4/1/25 8:40 | NOT NULL | None | | | Date and time when inspection was conducted |
| inspection_type | VARCHAR(50) | Pre | NOT NULL | None | | | Must be "Pre" or "Post" inspection |
| vehicle_mileage | DECIMAL(10,2) | 32500.75 | NOT NULL | None | | | Vehicle mileage recorded during inspection |
| inspection_notes | VARCHAR(200) | | NULL | None | | | inspection notes or observations |
| inspection_media_path | VARCHAR(200) | /media/inspections/4001.jpg | NULL | None | | | Path to inspection images/videos |
| inspection_status | VARCHAR(30) | Passed | NOT NULL | None | | | Passed, Failed, Pending |
| inspection_signoff | BIT | 1 | NOT NULL | 0 | | | Indicates Inspector approval (0 = no, 1 = yes) |
| created_at | DATETIME | 2/21/25 14:15 | NOT NULL | GETDATE() | | | Timestamp when inspection was recorded |
| updated_at | DATETIME | 2/22/25 10:10 | NULL | None | | | Timestamp of last update |

---

## Vehicle.Damage

| Attribute Name | Data Type | Example | Null? | Default | PK/FK | FK Reference | Description |
|---|---|---|---|---|---|---|---|
| damage_id | INT | 800 | NOT NULL | Auto Increment | PK | | Unique identifier for each damage report |
| inspection_id | INT | 400 | NOT NULL | None | FK | Vehicle.Inspection | Damage reported during this specific inspection |
| damage_description | VARCHAR(200) | Scratch on left rear bumper | NULL | None | | | Detailed description of the vehicle damage |
| estimated_repair_cost | DECIMAL(10,2) | 250 | NULL | None | | | Estimated cost to repair (may be null initially) |
| damage_severity | VARCHAR(20) | Minor | NULL | None | | | Severity category: Minor, Moderate, Severe |
| damage_status | VARCHAR(20) | Unresolvedl | NULL | Unresolvedl | | | Current damage status: Unresolvedl, Under Repair, Resolved |
| reported_date | DATE | 2/21/25 15:10 | NOT NULL | GETDATE() | | | When the damage was reported |

---

## Vehicle.Maintenance_Record

| Attribute Name | Data Type | Example | Null? | Default | PK/FK | FK Reference | Description |
|---|---|---|---|---|---|---|---|
| maintenance_id | INT | 900 | NOT NULL | Auto Increment | PK | | Unique identifier for each maintenance record |
| vehicle_id | INT | 501 | NOT NULL | None | FK | Vehicle.Vehicle | Vehicle undergoing maintenance |
| service_provider | VARCHAR(50) | Firestone Auto Center | NULL | None | | | Name of the maintenance service provider |
| maintenance_date | DATE | 2/21/25 | NOT NULL | None | | | Date maintenance was performed |
| maintenance_type | VARCHAR(50) | Oil Change | NULL | None | | | Type of service (Oil Change, Brake Service, etc.) |
| maintenance_cost | DECIMAL(10,2) | 89.99 | NOT NULL | None | | | Cost of the maintenance, must be > 0 |
| mileage_at_maintenance | DECIMAL(10,2) | 32500.5 | NOT NULL | None | | | Vehicle mileage when maintenance occurred |
| next_due_date | DATE | 6/21/25 | NULL | None | | | Date of next scheduled maintenance; must be after maintenance_date |
| maintenance_status | VARCHAR(30) | Completed | NULL | Completed | | | Maintenance status: Completed, Scheduled, or Pending |
| created_at | DATETIME | 2/21/25 15:40 | NOT NULL | GETDATE() | | | Record creation timestamp |
| updated_at | DATETIME | 2/22/25 9:20 | NULL | None | | | Record when the record was last updated |

---

## Vehicle.Maintenance_Inspection

| Attribute Name | Data Type | Example | Null? | Default | PK/FK | FK Reference | Description |
|---|---|---|---|---|---|---|---|
| maintenance_id | INT | 900 | NOT NULL | None | PK/FK | Vehicle.Maintenance_Record | Links to the maintenance job-this inspection is associated with |
| inspection_id | INT | 400 | NOT NULL | None | PK/FK | Vehicle.Inspection | Links to the inspection record involved |
| request_date | DATE | 2/21/25 | NOT NULL | GETDATE() | | | Data when the maintenance-inspection request was logged |
| request_type | VARCHAR(50) | Repair Request | NULL | None | | | Type of request (Repair, Preventive, Damage Follow-up, etc.) |
| description | VARCHAR(200) | Damage noted during pre-inspection | NULL | None | | | Detailed details description of the request |
| priority_level | VARCHAR(20) | High | NULL | None | | | Priority: Low, Medium, High or Critical |
| status | VARCHAR(30) | Pending | NULL | Pending | | | Workflow status: Pending, In Progress, Completed, Cancelled |

---

## Customer.Customer

| Attribute Name | Data Type | Example | Null? | Default | PK/FK | FK Reference | Description |
|---|---|---|---|---|---|---|---|
| customer_id | INT | 101 | NOT NULL | Auto Increment | PK | | Unique identifier for each customer |
| first_name | VARCHAR(50) | Michael | NOT NULL | None | | | Customer's first name |
| middle_name | VARCHAR(50) | James | NULL | None | | | Optional middle name |
| last_name | VARCHAR(50) | Thompson | NOT NULL | None | | | Customer's last name |
| phone_number | VARCHAR(15) | 507-555-2001 | NOT NULL | None | | | Customer's primary phone number |
| email | VARCHAR(100) | michael.thompson@example.com | NOT NULL | None | | | Customer's email address |
| date_of_birth | DATE | 4/21/85 | NOT NULL | None | | | Customer's date of birth |
| gender | VARCHAR(10) | Male | NULL | None | | | Gender: Male, Female, or Other |

---

## Customer.License

| Attribute Name | Data Type | Example | Null? | Default | PK/FK | FK Reference | Description |
|---|---|---|---|---|---|---|---|
| license_id | INT | 2101 | NOT NULL | Auto Increment | PK | | Unique identifier for each customer license record |
| customer_id | INT | 101 | NOT NULL | None | FK | Customer.Customer | Customer who owns the license |
| license_number | VARCHAR(25) | A123456789012 | NOT NULL | None | | | Unique driver license number |
| license_state | VARCHAR(30) | Minnesota | NOT NULL | None | | | State of issuing region |
| license_type | VARCHAR(20) | Class D | NOT NULL | None | | | License type (Class A, B, Commercial, Motorcycle, International) |
| issue_date | DATE | 6/15/20 | NOT NULL | None | | | Date license was issued |
| expiry_date | DATE | 6/15/28 | NOT NULL | None | | | Expiry date; must be after issue_date |
| license_status | VARCHAR(20) | Active | NOT NULL | Active | | | Status: Active, Suspended, Expired, Revoked |
| is_verified | BIT | 1 | NOT NULL | 0 | | | Indicates whether license has been verified |
| age_verified | BIT | 1 | NOT NULL | 0 | | | Confirms age eligibility (e.g., 25+ for premium cars) |
| verified_date | DATE | 2/23/25 | NULL | 1900-01-01 | | | Date license was verified (optional) |
| created_at | DATETIME | 2/23/25 12:30 | NOT NULL | GETDATE() | | | Timestamp when license record was created |

---

## Customer.Customer_Address

| Attribute Name | Data Type | Example | Null? | Default | PK/FK | FK Reference | Description |
|---|---|---|---|---|---|---|---|
| customer_address_id | INT | 3201 | NOT NULL | Auto Increment | PK | | Unique identifier for each customer address record |
| customer_id | INT | 101 | NOT NULL | None | FK | Customer.Customer | Customer to which this address belongs |
| street_address | VARCHAR(150) | 742 Evergreen Terrace | NOT NULL | None | | | Primary street address |
| address_line2 | VARCHAR(150) | Apt 4B | NULL | None | | | Secondary address line (optional) |
| city | VARCHAR(50) | Minneapolis | NOT NULL | None | | | City of residence |
| state | VARCHAR(50) | Minnesota | NOT NULL | None | | | State or province |
| zip_code | VARCHAR(15) | 55408 | NOT NULL | None | | | ZIP or postal code |

---

## Finance.Customer_Payment_Method

| Attribute Name | Data Type | Example | Null? | Default | PK/FK | FK Reference | Description |
|---|---|---|---|---|---|---|---|
| payment_method_id | INT | 2001 | NOT NULL | Auto Increment | PK | | Unique identifier for each distinct payment method |
| customer_id | INT | 101 | NOT NULL | None | FK | Customer.Customer | Links payment method to the customer |
| payment_type | VARCHAR(30) | Credit Card | NOT NULL | None | | | Type of payment method (Credit Card, Debit Card, etc.) |
| card_brand | VARCHAR(20) | Visa | NULL | None | | | Card issuer or network brand (Visa, Mastercard, Amex) |
| payment_token | VARCHAR(100) | | NOT NULL | None | | | Tokenized card identifier (no card data stored) |
| card_last_four | VARCHAR(20) | 4342 | NOT NULL | None | | | Last 4 digits of the card for identification |
| cardholder_first_name | VARCHAR(50) | Michael | NOT NULL | None | | | First name of the person on the card |
| cardholder_last_name | VARCHAR(50) | Thompson | NOT NULL | None | | | Last name of the person on the card |
| expiry_month | INT | 12 | NOT NULL | None | | | Expiration month of the card (1-12) |
| expiry_year | INT | 2025 | NOT NULL | None | | | Expiration year of the card |
| created_at | DATETIME | 2/21/25 10:15 | NOT NULL | GETDATE() | | | Timestamp when payment method was created |
| updated_at | DATETIME | 2/21/25 10:15 | NOT NULL | GETDATE() | | | Timestamp when payment method was last updated |

---

## Rental.Rental

| Attribute Name | Data Type | Example | Null? | Default | PK/FK | FK Reference | Description |
|---|---|---|---|---|---|---|---|
| rental_id | INT | 9001 | NOT NULL | Auto Increment | PK | | Unique identifier for the rental session |
| reservation_id | INT | 15001 | NOT NULL | None | FK | Rental.Reservation | Links rental to the original reservation |
| customer_id | INT | 205 | NOT NULL | None | FK | Customer.Customer | Customer who is renting the vehicle |
| vehicle_id | INT | 601 | NOT NULL | None | FK | Vehicle.Vehicle | Vehicle assigned to the rental |
| rental_start | DATETIME | 4/1/25 9:00 | NOT NULL | None | | | Date and time when the rental officially begins |
| rental_end | DATETIME | 4/5/25 10:30 | NULL | None | | | Final return date and time (null until completion) |
| security_deposit | DECIMAL(10,2) | 300 | NOT NULL | 300 | | | Deposit charged at start of rental; default is $300 |
| rental_total | DECIMAL(10,2) | 425.75 | NULL | None | | | Final rental charge after vehicle return |
| rental_status | VARCHAR(20) | Active | NOT NULL | None | | | Must be one of: Active, Completed, Cancelled |
| created_at | DATETIME | 3/28/25 15:20 | NOT NULL | GETDATE() | | | Timestamp when rental record was created |
| updated_at | DATETIME | 4/6/25 11:00 | NULL | None | | | Last updated timestamp |

---

## Rental.Reservation

| Attribute Name | Data Type | Example | Null? | Default | PK/FK | FK Reference | Description |
|---|---|---|---|---|---|---|---|
| reservation_id | INT | 10001 | NOT NULL | Auto Increment | PK | | Unique identifier for each reservation |
| customer_id | INT | 206 | NOT NULL | None | FK | Customer.Customer | References the customer making the reservation |
| vehicle_id | INT | 501 | NOT NULL | None | FK | Vehicle.Vehicle | Vehicle assigned to this reservation |
| pickup_branch_id | INT | 1 | NOT NULL | None | FK | Operation.Branch | Branch where pickup occurs |
| dropoff_branch_id | INT | 3 | NULL | None | FK | Operation.Branch | Branch where vehicle will be returned (NULL = same as pickup) |
| reservation_date | DATETIME | 3/21/25 10:15 | NOT NULL | GETDATE() | | | Date and time when the reservation was created |
| pickup_datetime | DATETIME | 4/1/25 9:00 | NOT NULL | None | | | Scheduled pickup date and time |
| return_datetime | DATETIME | 4/5/25 9:00 | NOT NULL | None | | | Scheduled return date and time; must be after pickup |
| rental_duration_type | VARCHAR(10) | Daily | NOT NULL | None | | | One of: Hourly, Daily, Weekly, Monthly |
| reservation_status | VARCHAR(20) | Confirmed | NOT NULL | None | | | Status of reservation: Pending, Confirmed, Cancelled, Completed |
| confirmation_number | VARCHAR(20) | CNF-A02011 | NOT NULL | None | | | Unique confirmation number assigned to customer |
| created_at | DATETIME | 3/21/25 10:15 | NOT NULL | GETDATE() | | | Timestamp when record was created |
| updated_at | DATETIME | 3/21/25 12:30 | NULL | None | | | Timestamp when reservation was last updated |

---

## Rental.Reservation_Charge

| Attribute Name | Data Type | Example | Null? | Default | PK/FK | FK Reference | Description |
|---|---|---|---|---|---|---|---|
| reservation_charge_id | INT | 501 | NOT NULL | Auto Increment | PK | | Unique identifier for each reservation charge record |
| reservation_id | INT | 15001 | NOT NULL | None | FK | Rental.Reservation | Links the charge to a specific reservation |
| charge_rate_id | INT | 110 | NOT NULL | None | FK | Finance.Charge_Rate | Identifies which add-on or fee is being applied |
| quantity | INT | 2 | NOT NULL | None | | | Quantity of the charge applied (e.g., 1 GPS, 2 extra drivers) |

---

## Finance.Rental_Charge_Detail

| Attribute Name | Data Type | Example | Null? | Default | PK/FK | FK Reference | Description |
|---|---|---|---|---|---|---|---|
| rental_id | INT | 9001 | NOT NULL | None | PK/FK | Rental.Rental | Rental session to which the charge applies |
| charge_rate_id | INT | 120 | NOT NULL | None | PK/FK | Finance.Charge_Rate | Charge rate used during the rental (late fee, add-on, etc.) |
| charge_quantity | DECIMAL(10,2) | 3 | NOT NULL | None | | | Quantity applied (e.g., hours late, units of add-on) |
| created_at | DATETIME | 4/5/25 10:45 | NOT NULL | GETDATE() | | | Timestamp when charge detail was created |

---

## Rental.Estimate

| Attribute Name | Data Type | Example | Null? | Default | PK/FK | FK Reference | Description |
|---|---|---|---|---|---|---|---|
| estimate_id | INT | 1501 | NOT NULL | Auto Increment | PK | | Unique identifier for each rental estimate |
| reservation_id | INT | 10001 | NOT NULL | None | FK | Rental.Reservation | Reservation for which cost estimate is generated |
| vehicle_rate_id | INT | 301 | NOT NULL | None | FK | Finance.Vehicle_Rate | Rate plan used for calculating base rental cost |
| base_rate | DECIMAL(10,2) | 250 | NOT NULL | None | | | Base rental cost (rate × duration) |
| surcharge_total | DECIMAL(10,2) | 30 | NULL | 0 | | | Sum of add-ons, service fees, etc. |
| discount_total | DECIMAL(10,2) | 15 | NULL | 0 | | | Any promotional or loyalty discounts applied |
| tax_total | DECIMAL(10,2) | 20 | NULL | 0 | | | Total taxes applied on the estimate |
| total_estimate | DECIMAL(10,2) | 285 | NOT NULL | (base + surcharges - discounts + tax) | | | Final computed amount customer sees during reservation |
| created_at | DATETIME | 2/18/25 14:10 | NOT NULL | GETDATE() | | | Timestamp when estimate record was created |

---

## Finance.Vehicle_Rate

| Attribute Name | Data Type | Example | Null? | Default | PK/FK | FK Reference | Description |
|---|---|---|---|---|---|---|---|
| vehicle_rate_id | INT | 301 | NOT NULL | Auto Increment | PK | | Unique identifier for each vehicle rate |
| vehicle_class_id | INT | 3 | NOT NULL | None | FK | Vehicle.Vehicle_Class | Vehicle class used for rate structure |
| branch_id | INT | 1 | NOT NULL | None | FK | Operation.Branch | Branch where pricing applies |
| vehicle_hourly_rate | DECIMAL(10,2) | 12.5 | NULL | None | | | Hourly rate |
| vehicle_daily_rate | DECIMAL(10,2) | 75 | NULL | None | | | Daily rental rate |
| vehicle_weekly_rate | DECIMAL(10,2) | 420 | NULL | None | | | Weekly rental rate |
| vehicle_monthly_rate | DECIMAL(10,2) | 1600 | NULL | None | | | Monthly rental rate |

---

## Finance.Charge_Rate

| Attribute Name | Data Type | Example | Null? | Default | PK/FK | FK Reference | Description |
|---|---|---|---|---|---|---|---|
| charge_rate_id | INT | 101 | NOT NULL | Auto Increment | PK | | Unique identifier for each charge rate entry |
| charge_type_id | INT | 5 | NOT NULL | None | FK | Finance.Charge_Type | Links to the type of charge this rate applies to |
| charge_unit_rate | DECIMAL(10,2) | 9.99 | NOT NULL | None | | | Price applied per unit based on charge basis; must be > 0 |
| effective_start_date | DATE | 1/1/24 | NOT NULL | GETDATE() | | | Date when this rate becomes effective |
| effective_end_date | DATE | 1/1/25 | NULL | None | | | Null = still active; used for historical rate tracking |
| created_at | DATETIME | 2/15/25 12:30 | NOT NULL | GETDATE() | | | Timestamp when the record was created |
| updated_at | DATETIME | 2/20/25 9:10 | NULL | None | | | Timestamp when the record was last updated |

---

## Finance.Estimate_Charge

| Attribute Name | Data Type | Example | Null? | Default | PK/FK | FK Reference | Description |
|---|---|---|---|---|---|---|---|
| charge_rate_id | INT | 105 | NOT NULL | None | PK/FK | Finance.Charge_Rate | Identifies which charge rate is applied to the estimate |
| estimate_id | INT | 1901 | NOT NULL | None | PK/FK | Rental.Estimate | Links this charge to a specific rental estimate |
| charge_quantity | DECIMAL(10,2) | 2 | NOT NULL | None | | | Quantity of the charge (e.g., days, units, hours) |

---

## Finance.Estimate_Tax

| Attribute Name | Data Type | Example | Null? | Default | PK/FK | FK Reference | Description |
|---|---|---|---|---|---|---|---|
| estimate_id | INT | 1501 | NOT NULL | None | PK/FK | Rental.Estimate | Estimate for which the tax is applied |
| tax_rate_id | INT | 1 | NOT NULL | None | PK/FK | Finance.Tax_Rate | Tax rate used to calculate tax amount |
| tax_amount | DECIMAL(10,2) | 18.75 | NOT NULL | None | | | Total tax amount for this estimate and tax type |
| created_at | DATETIME | 2/21/25 10:45 | NOT NULL | GETDATE() | | | Timestamp when tax record was created |

---

## Finance.Estimate_Promotion

| Attribute Name | Data Type | Example | Null? | Default | PK/FK | FK Reference | Description |
|---|---|---|---|---|---|---|---|
| estimate_id | INT | 1501 | NOT NULL | None | PK/FK | Rental.Estimate | Rental estimate to which the promotion is applied |
| promotion_id | INT | 101 | NOT NULL | None | PK/FK | Finance.Promotion | Promotion applied to the estimate |
| discount_amount | DECIMAL(10,2) | 25 | NULL | None | | | Discount amount calculated from this promotion |
| applied | BIT | 1 | NOT NULL | 1 | | | Indicates whether the promotion was applied (1 = yes) |
| created_at | DATETIME | 2/21/25 11:15 | NOT NULL | GETDATE() | | | Timestamp when record was created |

---

## Finance.Charge_Type

| Attribute Name | Data Type | Example | Null? | Default | PK/FK | FK Reference | Description |
|---|---|---|---|---|---|---|---|
| charge_type_id | INT | 1 | NOT NULL | Auto Increment | PK | | Unique identifier for each charge type |
| charge_code | VARCHAR(10) | GPS | NOT NULL | None | | | Short unique code identifying the charge (e.g., BASE, GPS, INS) |
| charge_name | VARCHAR(50) | GPS Navigation System | NOT NULL | None | | | Descriptive name of the charge |
| charge_category | VARCHAR(30) | Add-On | NULL | None | | | Category of charge (Rental, Insurance, Fee, Add-On, etc.) |
| charge_basis | VARCHAR(30) | Per Day | NOT NULL | None | | | Defines how the charge is applied (Per Day, Flat Rate, Per Hour, Per Week, Per Month) |
| CK_ChargeType_Basis | CHECK | | NOT NULL | N/A | | | Ensures charge_basis matches allowed values |

---

## Finance.Tax_Type

| Attribute Name | Data Type | Example | Null? | Default | PK/FK | FK Reference | Description |
|---|---|---|---|---|---|---|---|
| tax_type_id | INT | 1 | NOT NULL | Auto Increment | PK | | Unique identifier for each tax type |
| tax_code | VARCHAR(10) | STATE | NOT NULL | None | | | Short code for the tax (STATE, CITY, ENV, TOUR, etc.) |
| tax_name | VARCHAR(50) | State Tax | NOT NULL | None | | | Full descriptive name of the tax |
| tax_description | VARCHAR(150) | Tax applied by the state government | NULL | None | | | Additional notes or official description |

---

## Finance.Rental_Payment

| Attribute Name | Data Type | Example | Null? | Default | PK/FK | FK Reference | Description |
|---|---|---|---|---|---|---|---|
| payment_id | INT | 7001 | NOT NULL | Auto Increment | PK | | Unique identifier for each rental payment |
| payment_method_id | INT | 2001 | NOT NULL | None | FK | Customer.Customer_Payment | Payment method used for this transaction |
| rental_id | INT | 9001 | NOT NULL | None | FK | Rental.Rental | Rental session being paid for |
| payment_date | DATETIME | 4/5/25 12:45 | NOT NULL | None | | | Timestamp when payment was made |
| payment_amount | DECIMAL(10,2) | 425.75 | NOT NULL | None | | | Amount paid by the customer |
| payment_status | VARCHAR(20) | Completed | NOT NULL | None | | | Status (Completed, Pending, Failed, Refunded) |
| reference_number | VARCHAR(30) | TXN-2294ABD29 | NOT NULL | None | | | Unique transaction reference code |
| reference_number | VARCHAR(30) | 389429272928 | NOT NULL | None | | | Unique transaction reference code |

---

## Finance.Refund

| Attribute Name | Data Type | Example | Null? | Default | PK/FK | FK Reference | Description |
|---|---|---|---|---|---|---|---|
| refund_id | INT | 6001 | NOT NULL | Auto Increment | PK | | Unique identifier for each refund transaction |
| payment_id | INT | 701 | NOT NULL | None | FK | Finance.Rental.Payment | Identifies the payment that is being refunded |
| refund_date | DATETIME | 4/6/25 9:15 | NOT NULL | None | | | Date and time when refund was issued |
| refunded_amount | DECIMAL(10,2) | 50 | NOT NULL | None | | | Amount refunded to the customer |
| refund_reason | VARCHAR(30) | Overcharge adjustment | NOT NULL | None | | | Original reason for the refund issue |

---

## Finance.Promotion

| Attribute Name | Data Type | Example | Null? | Default | PK/FK | FK Reference | Description |
|---|---|---|---|---|---|---|---|
| promotion_id | INT | 101 | NOT NULL | Auto Increment | PK | | Unique identifier for each promotion |
| promotion_code | VARCHAR(50) | SUMMER25 | NOT NULL | None | | | Unique code entered by customer; must be unique |
| promotion_name | VARCHAR(60) | Summer Discount | NOT NULL | None | | | Title/name of the promotion |
| promotion_description | VARCHAR(150) | 25% off on weekly rentals | NULL | None | | | Optional description for internal or customer reference |
| promotion_value | DECIMAL(10,2) | 25 | NOT NULL | None | | | Value of the promotion: percentage or amount based on logic |
| promotion_type | VARCHAR(30) | Seasonal | NOT NULL | None | | | Type: Public, Seasonal, Referral, Referral, Corporate, Loyalty |
| promotion_start_date | DATETIME | 6/1/25 0:00 | NOT NULL | None | | | Start date/time when promotion becomes active |
| promotion_end_date | DATETIME | 8/31/25 23:59 | NOT NULL | None | | | End date/time; must be after start date |
| is_active | BIT | 1 | NOT NULL | None | | | Indicates if a promotion is currently active |
| created_at | DATETIME | 2/15/25 10:30 | NOT NULL | GETDATE() | | | Timestamp when promotion record was created |

---

## Finance.Tax_Rate

| Attribute Name | Data Type | Example | Null? | Default | PK/FK | FK Reference | Description |
|---|---|---|---|---|---|---|---|
| tax_rate_id | INT | 10 | NOT NULL | Auto Increment | PK | | Unique identifier for each tax rate record |
| tax_type_id | INT | 1 | NOT NULL | None | FK | Finance.Tax_Type | Identifies which tax type this rate belongs to (STATE, CITY, ENV, etc.) |
| branch_id | INT | 3 | NOT NULL | None | FK | Operation.Branch | Branch where this tax rate applies |
| tax_rate | DECIMAL(5,2) | 7.6 | NOT NULL | None | | | Percentage tax rate; must be > 0 |
| effective_start_date | DATE | 1/1/25 | NOT NULL | None | | | Start date when this tax rate becomes valid |
| effective_end_date | DATE | 1/1/26 | NOT NULL | None | | | Null means tax rate is still active |

---

## Finance.Invoice

| Attribute Name | Data Type | Example | Null? | Default | PK/FK | FK Reference | Description |
|---|---|---|---|---|---|---|---|
| invoice_id | INT | 6001 | NOT NULL | Auto Increment | PK | | Unique identifier for each invoice |
| branch_id | INT | 2 | NOT NULL | None | FK | Operation.Branch | Branch issuing the invoice |
| rental_id | INT | 5001 | NOT NULL | None | FK | Rental.Rental | Rental session associated with this invoice |
| customer_id | INT | 205 | NOT NULL | None | FK | Customer.Customer | Customer being invoiced |
| invoice_date | DATETIME | 4/6/25 10:30 | NOT NULL | GETDATE() | | | Date the invoice was generated |
| subtotal_amount | DECIMAL(10,2) | 350 | NOT NULL | None | | | Total before taxes and discounts |
| tax_amount | DECIMAL(10,2) | 28.5 | NOT NULL | None | | | Total tax applied |
| discount_amount | DECIMAL(10,2) | 15 | NULL | 0 | | | Discount applied (promotions, loyalty, etc.) |
| total_amount | DECIMAL(10,2) | 363.5 | NOT NULL | None | | | Final amount customer pays after all calculations |
| created_at | DATETIME | 4/6/25 10:30 | NOT NULL | GETDATE() | | | Timestamp when invoice record was created |

---

## Finance.Invoice_Line

| Attribute Name | Data Type | Example | Null? | Default | PK/FK | FK Reference | Description |
|---|---|---|---|---|---|---|---|
| invoice_line_id | INT | 86001 | NOT NULL | Auto Increment | PK | | Unique identifier for each invoice line item |
| invoice_id | INT | 6001 | NOT NULL | None | FK | Finance.Invoice | Identifies which invoice this line belongs to |
| rental_id | INT | 9001 | NOT NULL | None | FK | Rental.Rental | Optional reference to rental session (for rental-related charges) |
| line_description | VARCHAR(200) | GPS Add-On (Per Day) | NOT NULL | None | | | Description of the charge or service |
| quantity | INT | 3 | NOT NULL | None | | | Quantity of the item or units |
| unit_price | DECIMAL(10,2) | 12.5 | NOT NULL | None | | | Price per unit |
| line_amount | COMPUTED PERSISTED | 26 | NOT NULL | quantity * unit_price | | | Automatically calculated line total |
| tax_rate | DECIMAL(10,2) | 7.5 | NULL | None | | | Tax rate (%) applied to this line |
| tax_amount | DECIMAL(10,2) | 1.88 | NULL | None | | | The dollar amount for tax calculated line total |
| created_at | DATETIME | 4/6/25 11:00 | NULL | GETDATE() | | | Timestamp when the line item was created |

---

## Operation.Branch

| Attribute Name | Data Type | Example | Null? | Default | PK/FK | FK Reference | Description |
|---|---|---|---|---|---|---|---|
| branch_id | INT | 1 | NOT NULL | Auto Increment | PK | | Unique identifier for each branch |
| branch_name | VARCHAR(50) | Minneapolis Airport | NOT NULL | None | | | Name of the branch |
| branch_type | VARCHAR(50) | Airport | NOT NULL | None | | | Type of branch (Airport, City, Suburban) |
| phone_number | VARCHAR(15) | 507-555-1000 | NOT NULL | None | | | Primary phone number of the branch |
| email | VARCHAR(50) | msp@avis.com | NOT NULL | None | | | Official branch email address |
| branch_status | VARCHAR(20) | Active | NOT NULL | Active | | | Current status of branch (Active, Inactive, Closed) |

---

## Operation.Branch_Address

| Attribute Name | Data Type | Example | Null? | Default | PK/FK | FK Reference | Description |
|---|---|---|---|---|---|---|---|
| branch_address_id | INT | 6101 | NOT NULL | Auto Increment | PK | | Unique identifier for a branch address |
| branch_id | INT | 1 | NOT NULL | None | FK | Operation.Branch | Branch to which this address belongs |
| street_address | VARCHAR(100) | 2500 Hennepin Ave | NOT NULL | None | | | Primary street address of the branch |
| address_line2 | VARCHAR(100) | Suite 200 | NULL | None | | | Secondary address information (optional) |
| city | VARCHAR(50) | Minneapolis | NOT NULL | None | | | City where the branch is located |
| state | VARCHAR(30) | Minnesota | NOT NULL | None | | | State or province |
| zip_code | VARCHAR(15) | 55408 | NOT NULL | None | | | ZIP or postal code |

---

## Operation.Operating_Hours

| Attribute Name | Data Type | Example | Null? | Default | PK/FK | FK Reference | Description |
|---|---|---|---|---|---|---|---|
| operating_hours_id | INT | 5101 | NOT NULL | Auto Increment | PK | | Unique identifier for the operating hours record |
| branch_id | INT | 1 | NOT NULL | None | FK | Operation.Branch | Branch associated with these hours |
| day_of_week | VARCHAR(10) | Monday | NOT NULL | None | | | Day of the week; must be a valid weekday name |
| open_time | TIME | 8:00:00 | NOT NULL | None | | | Opening time for the branch |
| close_time | TIME | 20:00:00 | NOT NULL | None | | | Closing time for the branch; must be later than open_time |
| after_hours_dropoff | BIT | 1 | NOT NULL | 0 | | | Indicates if after-hours dropoff is allowed (1 = yes) |
| created_at | DATETIME | 2/23/25 9:20 | NOT NULL | GETDATE() | | | Timestamp when the record was created |

---

## Operation.Employee

| Attribute Name | Data Type | Example | Null? | Default | PK/FK | FK Reference | Description |
|---|---|---|---|---|---|---|---|
| employee_id | INT | 3001 | NOT NULL | Auto Increment | PK | | Unique identifier for each employee |
| branch_id | INT | 1 | NOT NULL | None | FK | Operation.Branch | Branch where the employee works |
| employee_role_id | INT | 5 | NOT NULL | None | FK | Operation.Employee_Role | Role defining permissions and position |
| first_name | VARCHAR(30) | Michael | NOT NULL | None | | | Employee's first name |
| middle_name | VARCHAR(30) | A | NULL | None | | | Employee's middle name (optional) |
| last_name | VARCHAR(30) | Thompson | NOT NULL | None | | | Employee's last name |
| email | VARCHAR(50) | michael.thompson@carrental.com | NOT NULL | None | | | Unique company email |
| phone_number | VARCHAR(15) | 507-555-2001 | NOT NULL | None | | | Employee's contact number |
| date_of_birth | DATE | 5/14/88 | NOT NULL | None | | | Employee's birthdate |
| gender | VARCHAR(15) | Male | NULL | None | | | Must be Male, Female, or Other |
| hire_date | DATE | 3/1/20 | NOT NULL | None | | | Date employee was hired |
| status | VARCHAR(20) | Active | NOT NULL | None | | | Employment status (Active, On Leave, Terminated, Retired) |

---

## Operation.Employee_Address

| Attribute Name | Data Type | Example | Null? | Default | PK/FK | FK Reference | Description |
|---|---|---|---|---|---|---|---|
| employee_address_id | INT | 4101 | NOT NULL | Auto Increment | PK | | Unique identifier for each employee address |
| employee_id | INT | 3001 | NOT NULL | None | FK | Operation.Employee | Employee to whom the address belongs |
| street_address | VARCHAR(100) | 123 Oakwood Ave | NOT NULL | None | | | Primary street address |
| address_line2 | VARCHAR(100) | Apt 12B | NULL | None | | | Secondary address information (optional) |
| city | VARCHAR(50) | Minneapolis | NOT NULL | None | | | City of residence |
| state | VARCHAR(30) | Minnesota | NOT NULL | None | | | State/province of residence |
| zip_code | VARCHAR(10) | 55408 | NOT NULL | None | | | ZIP or postal code |
| created_at | DATETIME | 2/22/25 15:30 | NOT NULL | GETDATE() | | | Timestamp when the address record was created |
| updated_at | DATETIME | 2/23/25 11:10 | NULL | None | | | Timestamp when the record was last updated |

---

## Operation.Expense_Category

| Attribute Name | Data Type | Example | Null? | Default | PK/FK | FK Reference | Description |
|---|---|---|---|---|---|---|---|
| expense_category_id | INT | 101 | NOT NULL | Auto Increment | PK | | Unique identifier for each expense category |
| category_name | VARCHAR(50) | Fuel Expense | NOT NULL | None | | | Unique name of the expense category |
| category_description | VARCHAR(150) | Expenses related to fuel purchases | NULL | None | | | Optional detailed explanation of the category |
| created_at | DATETIME | 2/22/25 12:30 | NOT NULL | GETDATE() | | | Timestamp when the category was created |
| updated_at | DATETIME | 2/23/25 8:45 | NULL | None | | | Timestamp of last update |

---

## Operation.Branch_Expenses

| Attribute Name | Data Type | Example | Null? | Default | PK/FK | FK Reference | Description |
|---|---|---|---|---|---|---|---|
| expense_id | INT | 501 | NOT NULL | Auto Increment | PK | | Unique identifier for each branch expense entry |
| branch_id | INT | 3 | NOT NULL | None | FK | Operation.Branch | Branch where the expense occurred |
| expense_category_id | INT | 101 | NOT NULL | None | FK | Operation.Expense_Category | Category of expense (Utilities, Repairs, etc.) |
| vendor_name | VARCHAR(50) | Firestone Auto Center | NOT NULL | None | | | Vendor or company paid for the expense |
| expense_description | VARCHAR(150) | Oil and filter change for fleet vehicles | NULL | None | | | Optional additional details about the expense |
| amount | DECIMAL(10,2) | 189.99 | NOT NULL | None | | | Total cost incurred for this expense |
| expense_date | DATETIME | 2/22/25 14:10 | NOT NULL | GETDATE() | | | Date the expense was recorded |

---

## Operation.User

| Attribute Name | Data Type | Example | Null? | Default | PK/FK | FK Reference | Description |
|---|---|---|---|---|---|---|---|
| user_id | INT | 1 | NOT NULL | Auto Increment | PK | | Unique identifier for each system user account |
| employee_id | INT | 3001 | NOT NULL | None | FK | Operation.Employee | Employee linked to this user account; must be unique |
| username | VARCHAR(50) | mthompson01 | NOT NULL | None | | | Unique username used for login |
| password | VARCHAR(255) | hashed_password_string | NOT NULL | None | | | Encrypted or hashed password for the account |
| account_status | VARCHAR(20) | Active | NOT NULL | None | | | Account status: Active, Suspended, or Disabled |
| created_at | DATETIME | 2025-02-25 10:30 | NOT NULL | GETDATE() | | | Timestamp when the user account was created |

---