# Data Dictionary

Generated directly from `04_Database_Construction/01_ddl_schema.sql` (table/column names, types, nullability, keys, and constraints are parsed from the live DDL, not hand-transcribed) so this document cannot drift out of sync with the schema the way the previous version had. Descriptions for constrained/enumerated columns are derived from their `CHECK` constraints; other descriptions are short structural summaries.

## Vehicle.Vehicle

_Core fleet inventory record._

| Attribute Name | Data Type | Null? | Default | PK/FK | FK Reference | Description |
|---|---|---|---|---|---|---|
| vehicle_id | INT | NOT NULL | Auto Increment | PK |  | Unique identifier for each vehicle. |
| vehicle_vin | VARCHAR(17) | NOT NULL |  |  |  | Vehicle Identification Number; unique per BR-51. |
| vehicle_class_id | INT | NOT NULL |  | FK | Vehicle.Vehicle_Class | References `Vehicle.Vehicle_Class(vehicle_class_id)`. |
| vehicle_type_id | INT | NOT NULL |  | FK | Vehicle.Vehicle_Type | References `Vehicle.Vehicle_Type(vehicle_type_id)`. |
| fuel_type_id | INT | NOT NULL |  | FK | Vehicle.Fuel_Type | References `Vehicle.Fuel_Type(fuel_type_id)`. |
| purchase_id | INT | NOT NULL |  | FK | Vehicle.Vehicle_Purchase | References `Vehicle.Vehicle_Purchase(purchase_id)`. |
| branch_id | INT | NOT NULL |  | FK | Operation.Branch | References `Operation.Branch(branch_id)`. |
| make | VARCHAR(30) | NOT NULL |  |  |  | Vehicle manufacturer. |
| model | VARCHAR(30) | NOT NULL |  |  |  | Vehicle model name. |
| year | INT | NOT NULL |  |  |  | Model year. |
| color | VARCHAR(30) | NULL |  |  |  | Exterior color. |
| status | VARCHAR(30) | NOT NULL |  |  |  | Allowed values: Available, Reserved, Rented, Maintenance, Retired. |
| mileage | DECIMAL(10,2) | NOT NULL |  |  |  | Odometer reading at the time of this record. |
| created_at | DATETIME | NOT NULL | GETDATE() |  |  | Record creation timestamp. |
| updated_at | DATETIME | NULL |  |  |  | Last-updated timestamp. |

## Vehicle.Vehicle_Warranty

_Manufacturer/extended warranty coverage for a vehicle._

| Attribute Name | Data Type | Null? | Default | PK/FK | FK Reference | Description |
|---|---|---|---|---|---|---|
| warranty_id | INT | NOT NULL | Auto Increment | PK |  | Unique identifier for each warranty record. |
| vehicle_id | INT | NOT NULL |  | FK | Vehicle.Vehicle | References `Vehicle.Vehicle(vehicle_id)`. |
| warranty_provider | VARCHAR(50) | NOT NULL |  |  |  | Warranty-issuing organization. |
| warranty_type | VARCHAR(30) | NOT NULL |  |  |  | Type of warranty coverage (e.g. Powertrain). |
| start_date | DATE | NOT NULL |  |  |  | Coverage start date. |
| end_date | DATE | NOT NULL |  |  |  | Coverage end date. |
| coverage_mileage | INT | NOT NULL |  |  |  | Maximum mileage covered under the warranty. |
| status | VARCHAR(20) | NOT NULL |  |  |  | Allowed values: Active, Expired. |

## Vehicle.Vehicle_Class

_Pricing/marketing class (Economy, SUV, Luxury, etc.)._

| Attribute Name | Data Type | Null? | Default | PK/FK | FK Reference | Description |
|---|---|---|---|---|---|---|
| vehicle_class_id | INT | NOT NULL | Auto Increment | PK |  | Unique identifier for each vehicle class. |
| class_name | VARCHAR(30) | NOT NULL |  |  |  | Display name of the vehicle class. |

## Vehicle.Vehicle_Type

_Body style lookup (Sedan, SUV, Truck, etc.)._

| Attribute Name | Data Type | Null? | Default | PK/FK | FK Reference | Description |
|---|---|---|---|---|---|---|
| vehicle_type_id | INT | NOT NULL | Auto Increment | PK |  | Unique identifier for each vehicle type. |
| vehicle_type_name | VARCHAR(30) | NOT NULL |  |  |  | Display name of the vehicle type. |

## Vehicle.Fuel_Type

_Fuel type lookup with average efficiency._

| Attribute Name | Data Type | Null? | Default | PK/FK | FK Reference | Description |
|---|---|---|---|---|---|---|
| fuel_type_id | INT | NOT NULL | Auto Increment | PK |  | Unique identifier for each fuel type. |
| fuel_type_name | VARCHAR(30) | NOT NULL |  |  |  | Display name of the fuel type. |
| fuel_efficiency | DECIMAL(5,2) | NOT NULL |  |  |  | Average fuel efficiency for this fuel type. |

## Vehicle.Vehicle_Purchase

_Acquisition record for a vehicle (how/when/for how much it was bought)._

| Attribute Name | Data Type | Null? | Default | PK/FK | FK Reference | Description |
|---|---|---|---|---|---|---|
| purchase_id | INT | NOT NULL | Auto Increment | PK |  | Unique identifier for each purchase record. |
| purchase_date | DATE | NOT NULL |  |  |  | Date the vehicle was acquired. |
| purchase_type | VARCHAR(30) | NOT NULL |  |  |  | How the vehicle was acquired (e.g. Outright, Lease, Auction). |
| purchase_from | VARCHAR(100) | NOT NULL |  |  |  | Seller/source of the acquisition. |
| purchase_price | DECIMAL(10,2) | NOT NULL |  |  |  | Total acquisition cost. |

## Vehicle.Vehicle_Registration

_State registration/plate record for a vehicle. Enforces BR-49._

| Attribute Name | Data Type | Null? | Default | PK/FK | FK Reference | Description |
|---|---|---|---|---|---|---|
| registration_id | INT | NOT NULL | Auto Increment | PK |  | Unique identifier for each registration record. |
| vehicle_id | INT | NOT NULL |  | FK | Vehicle.Vehicle | References `Vehicle.Vehicle(vehicle_id)`. |
| registration_number | VARCHAR(20) | NOT NULL |  |  |  | Official registration number issued by the state DMV. |
| license_plate | VARCHAR(20) | NOT NULL |  |  |  | License plate number. |
| registration_state | VARCHAR(30) | NOT NULL |  |  |  | State that issued the registration. |
| registration_issue_date | DATE | NOT NULL |  |  |  | Constrained by: `registration_expiry_date > registration_issue_date`. |
| registration_expiry_date | DATE | NOT NULL |  |  |  | Constrained by: `registration_expiry_date > registration_issue_date`. |
| registration_status | VARCHAR(20) | NOT NULL | 'Active' |  |  | Allowed values: Active, Suspended, Expired. |
| created_at | DATETIME | NOT NULL | GETDATE() |  |  | Record creation timestamp. |
| updated_at | DATETIME | NULL |  |  |  | Last-updated timestamp. |

## Vehicle.Vehicle_Insurance

_Insurance policy coverage for a vehicle. Enforces BR-48._

| Attribute Name | Data Type | Null? | Default | PK/FK | FK Reference | Description |
|---|---|---|---|---|---|---|
| insurance_id | INT | NOT NULL | Auto Increment | PK |  | Unique identifier for each insurance policy record. |
| vehicle_id | INT | NOT NULL |  | FK | Vehicle.Vehicle | References `Vehicle.Vehicle(vehicle_id)`. |
| policy_number | VARCHAR(20) | NOT NULL |  |  |  | Insurance policy number. |
| provider_name | VARCHAR(50) | NOT NULL |  |  |  | Insurance provider name. |
| coverage_type | VARCHAR(30) | NOT NULL |  |  |  | Allowed values: Comprehensive, Collision, Liability, Personal Injury, Full Coverage. |
| policy_start_date | DATE | NOT NULL |  |  |  | Constrained by: `policy_expiry_date > policy_start_date`. |
| policy_expiry_date | DATE | NOT NULL |  |  |  | Constrained by: `policy_expiry_date > policy_start_date`. |
| policy_status | VARCHAR(20) | NOT NULL | 'Active' |  |  | Allowed values: Active, Expired, Pending Renewal, Cancelled. |
| created_at | DATETIME | NOT NULL | GETDATE() |  |  | Record creation timestamp. |
| updated_at | DATETIME | NULL |  |  |  | Last-updated timestamp. |

## Vehicle.Inspection

_Pre/post rental inspection record (mileage, fuel, media, signoff)._

| Attribute Name | Data Type | Null? | Default | PK/FK | FK Reference | Description |
|---|---|---|---|---|---|---|
| inspection_id | INT | NOT NULL | Auto Increment | PK |  | Unique identifier for each inspection. |
| employee_id | INT | NOT NULL |  | FK | Operation.Employee | References `Operation.Employee(employee_id)`. |
| vehicle_id | INT | NOT NULL |  | FK | Vehicle.Vehicle | References `Vehicle.Vehicle(vehicle_id)`. |
| rental_id | INT | NULL |  | FK | Rental.Rental | References `Rental.Rental(rental_id)`. |
| inspection_date | DATETIME | NOT NULL |  |  |  | Date/time the inspection was performed. |
| inspection_type | VARCHAR(4) | NOT NULL |  |  |  | Allowed values: Pre, Post. |
| inspection_mileage | DECIMAL(10,2) | NOT NULL |  |  |  | Odometer reading recorded at inspection time. |
| fuel_level | DECIMAL(5,2) | NULL |  |  |  | Fuel level recorded at inspection time, as a percentage (0-100). |
| inspection_media_path | VARCHAR(200) | NULL |  |  |  | Path to photo/video evidence for the inspection (required for damage claims, BR-31). |
| inspection_status | VARCHAR(30) | NOT NULL |  |  |  | Allowed values: Passed, Failed, Needs Review. |
| inspection_signoff | BIT | NOT NULL | 0 |  |  | Whether the inspector has signed off (0 = no, 1 = yes); gates status changes (BR-27). |
| created_at | DATETIME | NOT NULL | GETDATE() |  |  | Record creation timestamp. |
| updated_at | DATETIME | NULL |  |  |  | Last-updated timestamp. |

## Vehicle.Damage

_Damage found during an inspection, with severity and repair cost._

| Attribute Name | Data Type | Null? | Default | PK/FK | FK Reference | Description |
|---|---|---|---|---|---|---|
| damage_id | INT | NOT NULL | Auto Increment | PK |  | Unique identifier for each damage report. |
| inspection_id | INT | NOT NULL |  | FK | Vehicle.Inspection | References `Vehicle.Inspection(inspection_id)`. |
| damage_description | VARCHAR(200) | NOT NULL |  |  |  | Free-text description of the damage found. |
| estimated_repair_cost | DECIMAL(10,2) | NULL |  |  |  | Estimated cost to repair the damage; drives the maintenance hold in BR-34. |
| damage_severity | VARCHAR(20) | NULL |  |  |  | Allowed values: Minor, Moderate, Severe. |
| damage_status | VARCHAR(20) | NOT NULL | 'Unresolved' |  |  | Allowed values: Unresolved, Under Repair, Resolved. |
| reported_date | DATETIME | NOT NULL | GETDATE() |  |  | Date/time the damage was reported. |

## Vehicle.Maintenance_Record

_A service/repair event for a vehicle._

| Attribute Name | Data Type | Null? | Default | PK/FK | FK Reference | Description |
|---|---|---|---|---|---|---|
| maintenance_id | INT | NOT NULL | Auto Increment | PK |  | Unique identifier for each maintenance record. |
| vehicle_id | INT | NOT NULL |  | FK | Vehicle.Vehicle | References `Vehicle.Vehicle(vehicle_id)`. |
| service_provider | VARCHAR(50) | NOT NULL |  |  |  | External vendor that performed the maintenance (BR-47). |
| maintenance_date | DATE | NOT NULL |  |  |  | Constrained by: `next_due_date IS NULL OR next_due_date > maintenance_date`. |
| maintenance_type | VARCHAR(30) | NOT NULL |  |  |  | Allowed values: Oil Change, Tire Rotation, Brake Service, Battery Replacement, General Inspection, Transmission Service, Detailing, Other. |
| maintenance_cost | DECIMAL(10,2) | NOT NULL |  |  |  | Constrained by: `maintenance_cost >= 0`. |
| mileage_at_maintenance | DECIMAL(10,2) | NULL |  |  |  | Constrained by: `mileage_at_maintenance >= 0`. |
| next_due_date | DATE | NULL |  |  |  | Constrained by: `next_due_date IS NULL OR next_due_date > maintenance_date`. |
| maintenance_status | VARCHAR(20) | NOT NULL | 'Completed' |  |  | Allowed values: Completed, Scheduled, Pending. |
| created_at | DATETIME | NOT NULL | GETDATE() |  |  | Record creation timestamp. |
| updated_at | DATETIME | NULL |  |  |  | Last-updated timestamp. |

## Vehicle.Maintenance_Inspection

_Bridge linking a maintenance job to the inspection that triggered it._

| Attribute Name | Data Type | Null? | Default | PK/FK | FK Reference | Description |
|---|---|---|---|---|---|---|
| maintenance_id | INT | NOT NULL |  | PK/FK | Vehicle.Maintenance_Record | References `Vehicle.Maintenance_Record(maintenance_id)`. |
| inspection_id | INT | NOT NULL |  | PK/FK | Vehicle.Inspection | References `Vehicle.Inspection(inspection_id)`. |
| request_date | DATE | NOT NULL | GETDATE() |  |  | Date the request was logged. |
| request_type | VARCHAR(30) | NOT NULL |  |  |  | Allowed values: Repair Request, Preventive Check, Damage Follow-up, Routine Service. |
| description | VARCHAR(200) | NULL |  |  |  | Free-text detail for this record. |
| priority_level | VARCHAR(20) | NULL |  |  |  | Allowed values: Low, Medium, High, Critical. |
| status | VARCHAR(20) | NOT NULL | 'Pending' |  |  | Allowed values: Pending, In Progress, Completed, Cancelled. |

## Vehicle.Vehicle_Transfer

_Inter-branch vehicle relocation record._

| Attribute Name | Data Type | Null? | Default | PK/FK | FK Reference | Description |
|---|---|---|---|---|---|---|
| transfer_id | INT | NOT NULL | Auto Increment | PK |  | Unique identifier for each vehicle transfer. |
| vehicle_id | INT | NOT NULL |  | FK | Vehicle.Vehicle | References `Vehicle.Vehicle(vehicle_id)`. |
| from_branch_id | INT | NOT NULL |  | FK | Operation.Branch | References `Operation.Branch(branch_id)`. Constrained by: `from_branch_id <> to_branch_id`. |
| to_branch_id | INT | NOT NULL |  | FK | Operation.Branch | References `Operation.Branch(branch_id)`. Constrained by: `from_branch_id <> to_branch_id`. |
| transfer_date | DATETIME | NOT NULL | GETDATE() |  |  | Date/time the transfer was initiated. |
| transfer_reason | VARCHAR(50) | NOT NULL |  |  |  | Business reason for relocating the vehicle. |
| transfer_status | VARCHAR(20) | NOT NULL | 'Pending' |  |  | Allowed values: Pending, In Transit, Completed, Cancelled. |
| completed_date | DATETIME | NULL |  |  |  | Date/time the transfer was completed. |

## Customer.Customer

_Renter profile._

| Attribute Name | Data Type | Null? | Default | PK/FK | FK Reference | Description |
|---|---|---|---|---|---|---|
| customer_id | INT | NOT NULL | Auto Increment | PK |  | Unique identifier for each customer. |
| first_name | VARCHAR(50) | NOT NULL |  |  |  | First name. |
| middle_name | VARCHAR(50) | NULL |  |  |  | Middle name (optional). |
| last_name | VARCHAR(50) | NOT NULL |  |  |  | Last name. |
| phone_number | VARCHAR(15) | NOT NULL |  |  |  | Contact phone number. |
| email | VARCHAR(100) | NOT NULL |  |  |  | Contact email address. |
| date_of_birth | DATE | NOT NULL |  |  |  | Date of birth; used to compute age for eligibility/surcharge rules (BR-01, BR-02). |
| gender | VARCHAR(10) | NULL |  |  |  | Allowed values: Male, Female, Other. |

## Customer.License

_Driver's license on file for a customer. Enforces BR-03/BR-04._

| Attribute Name | Data Type | Null? | Default | PK/FK | FK Reference | Description |
|---|---|---|---|---|---|---|
| license_id | INT | NOT NULL | Auto Increment | PK |  | Unique identifier for each customer license record. |
| customer_id | INT | NOT NULL |  | FK | Customer.Customer | References `Customer.Customer(customer_id)`. |
| license_number | VARCHAR(20) | NOT NULL |  |  |  | Driver's license number. |
| license_state | VARCHAR(30) | NOT NULL |  |  |  | State that issued the license. |
| license_type | VARCHAR(20) | NOT NULL |  |  |  | Allowed values: Class D, Commercial, Motorcycle, International. |
| issue_date | DATE | NOT NULL |  |  |  | Constrained by: `expiry_date > issue_date`. |
| expiry_date | DATE | NOT NULL |  |  |  | Constrained by: `expiry_date > issue_date`. |
| license_status | VARCHAR(20) | NOT NULL | 'Active' |  |  | Allowed values: Active, Suspended, Expired, Revoked. |
| is_verified | BIT | NOT NULL | 0 |  |  | Whether an employee has verified this license on file (BR-04). |
| age_verified | BIT | NOT NULL | 0 |  |  | Whether the customer's age has been confirmed as meeting eligibility (e.g. premium vehicle minimums). |
| verified_date | DATE | NOT NULL | '1900-01-01' |  |  | Date the license was verified. |
| created_at | DATETIME | NOT NULL | GETDATE() |  |  | Record creation timestamp. |

## Customer.Customer_Address

_Mailing address for a customer._

| Attribute Name | Data Type | Null? | Default | PK/FK | FK Reference | Description |
|---|---|---|---|---|---|---|
| customer_address_id | INT | NOT NULL | Auto Increment | PK |  | Unique identifier for each customer address record. |
| customer_id | INT | NOT NULL |  | FK | Customer.Customer | References `Customer.Customer(customer_id)`. |
| street_address | VARCHAR(100) | NOT NULL |  |  |  | Street address line 1. |
| address_line2 | VARCHAR(100) | NULL |  |  |  | Street address line 2 (suite/apartment, optional). |
| city | VARCHAR(50) | NOT NULL |  |  |  | City. |
| state | VARCHAR(30) | NOT NULL |  |  |  | State/province. |
| zip_code | VARCHAR(10) | NOT NULL |  |  |  | ZIP/postal code. |
| country | VARCHAR(50) | NOT NULL | 'USA' |  |  | Country. |
| created_at | DATETIME | NOT NULL | GETDATE() |  |  | Record creation timestamp. |
| updated_at | DATETIME | NULL |  |  |  | Last-updated timestamp. |

## Customer.Customer_Payment_Method

_Tokenized payment method on file for a customer (no raw card data stored)._

| Attribute Name | Data Type | Null? | Default | PK/FK | FK Reference | Description |
|---|---|---|---|---|---|---|
| payment_method_id | INT | NOT NULL | Auto Increment | PK |  | Unique identifier for each payment method. |
| customer_id | INT | NOT NULL |  | FK | Customer.Customer | References `Customer.Customer(customer_id)`. |
| payment_type | VARCHAR(20) | NOT NULL |  |  |  | Payment method category (e.g. Credit, Debit). |
| card_brand | VARCHAR(20) | NOT NULL |  |  |  | Card network (Visa, Mastercard, etc.). |
| payment_token | VARCHAR(100) | NOT NULL |  |  |  | Tokenized reference to the stored card; the raw card number is never stored. |
| card_last_four | CHAR(4) | NOT NULL |  |  |  | Last four digits of the card, for customer-facing identification only. |
| cardholder_first_name | VARCHAR(50) | NOT NULL |  |  |  | First name as printed on the card. |
| cardholder_last_name | VARCHAR(50) | NULL |  |  |  | Last name as printed on the card. |
| expiry_month | INT | NOT NULL |  |  |  | Card expiration month (1-12); checked against BR-39 before a payment can be charged. |
| expiry_year | INT | NOT NULL |  |  |  | Card expiration year; checked against BR-39 before a payment can be charged. |
| created_at | DATETIME | NOT NULL | GETDATE() |  |  | Record creation timestamp. |
| updated_at | DATETIME | NOT NULL | GETDATE() |  |  | Last-updated timestamp. |

## Rental.Reservation

_A booking request before pickup._

| Attribute Name | Data Type | Null? | Default | PK/FK | FK Reference | Description |
|---|---|---|---|---|---|---|
| reservation_id | INT | NOT NULL | Auto Increment | PK |  | Unique identifier for each reservation. |
| customer_id | INT | NOT NULL |  | FK | Customer.Customer | References `Customer.Customer(customer_id)`. |
| vehicle_id | INT | NOT NULL |  | FK | Vehicle.Vehicle | References `Vehicle.Vehicle(vehicle_id)`. |
| pickup_branch_id | INT | NOT NULL |  | FK | Operation.Branch | References `Operation.Branch(branch_id)`. |
| dropoff_branch_id | INT | NULL |  | FK | Operation.Branch | References `Operation.Branch(branch_id)`. |
| reservation_date | DATETIME | NOT NULL | GETDATE() |  |  | Date/time the reservation was created. |
| pickup_datetime | DATETIME | NOT NULL |  |  |  | Constrained by: `return_datetime > pickup_datetime`. |
| return_datetime | DATETIME | NOT NULL |  |  |  | Constrained by: `return_datetime > pickup_datetime`. |
| rental_duration_type | VARCHAR(10) | NOT NULL |  |  |  | Allowed values: Hourly, Daily, Weekly, Monthly. |
| reservation_status | VARCHAR(20) | NOT NULL |  |  |  | Allowed values: Pending, Confirmed, Cancelled, Completed. |
| confirmation_number | VARCHAR(20) | NOT NULL |  |  |  | Customer-facing confirmation code, generated once payment is authorized (BR-06). |
| created_at | DATETIME | NOT NULL | GETDATE() |  |  | Record creation timestamp. |
| updated_at | DATETIME | NULL |  |  |  | Last-updated timestamp. |

## Rental.Reservation_Charge

_Add-ons selected at reservation time (bridge to Finance.Charge_Rate)._

| Attribute Name | Data Type | Null? | Default | PK/FK | FK Reference | Description |
|---|---|---|---|---|---|---|
| reservation_charge_id | INT | NOT NULL | Auto Increment | PK |  | Unique identifier for each reservation charge record. |
| reservation_id | INT | NOT NULL |  | FK | Rental.Reservation | References `Rental.Reservation(reservation_id)`. |
| charge_rate_id | INT | NOT NULL |  | FK | Finance.Charge_Rate | References `Finance.Charge_Rate(charge_rate_id)`. |
| quantity | INT | NOT NULL | 0 |  |  | Number of units of this add-on/charge applied. |

## Rental.Rental

_The actual in-progress or completed rental session, created once a reservation is fulfilled._

| Attribute Name | Data Type | Null? | Default | PK/FK | FK Reference | Description |
|---|---|---|---|---|---|---|
| rental_id | INT | NOT NULL | Auto Increment | PK |  | Unique identifier for each rental session. |
| reservation_id | INT | NOT NULL |  | FK | Rental.Reservation | References `Rental.Reservation(reservation_id)`. |
| customer_id | INT | NOT NULL |  | FK | Customer.Customer | References `Customer.Customer(customer_id)`. |
| vehicle_id | INT | NOT NULL |  | FK | Vehicle.Vehicle | References `Vehicle.Vehicle(vehicle_id)`. |
| rental_start | DATETIME | NOT NULL |  |  |  | Actual pickup date/time (check-out). |
| rental_end | DATETIME | NULL |  |  |  | Actual return date/time (check-in); null until the rental completes. |
| security_deposit | DECIMAL(10,2) | NOT NULL | 300.00 |  |  | Refundable hold taken at pickup; released or applied to outstanding charges at BR-35. |
| rental_total | DECIMAL(10,2) | NULL |  |  |  | Final rental charge, computed by Rental.usp_FinalizeRental once the rental completes. |
| rental_status | VARCHAR(20) | NOT NULL |  |  |  | Allowed values: Active, Completed, Cancelled. |
| created_at | DATETIME | NOT NULL | GETDATE() |  |  | Record creation timestamp. |
| updated_at | DATETIME | NULL |  |  |  | Last-updated timestamp. |

## Finance.Vehicle_Rate

_Hourly/daily/weekly/monthly rate for a (vehicle class, branch) pair._

| Attribute Name | Data Type | Null? | Default | PK/FK | FK Reference | Description |
|---|---|---|---|---|---|---|
| vehicle_rate_id | INT | NOT NULL | Auto Increment | PK |  | Unique identifier for each vehicle rate. |
| vehicle_class_id | INT | NOT NULL |  | FK | Vehicle.Vehicle_Class | References `Vehicle.Vehicle_Class(vehicle_class_id)`. |
| branch_id | INT | NOT NULL |  | FK | Operation.Branch | References `Operation.Branch(branch_id)`. |
| vehicle_hourly_rate | DECIMAL(10,2) | NULL |  |  |  | Hourly rental rate for this (vehicle class, branch) pair. |
| vehicle_daily_rate | DECIMAL(10,2) | NULL |  |  |  | Daily rental rate for this (vehicle class, branch) pair. |
| vehicle_weekly_rate | DECIMAL(10,2) | NULL |  |  |  | Weekly rental rate for this (vehicle class, branch) pair. |
| vehicle_monthly_rate | DECIMAL(10,2) | NULL |  |  |  | Monthly rental rate for this (vehicle class, branch) pair. |

## Finance.Charge_Type

_Lookup of billable charge categories (GPS, insurance, late fee, etc.)._

| Attribute Name | Data Type | Null? | Default | PK/FK | FK Reference | Description |
|---|---|---|---|---|---|---|
| charge_type_id | INT | NOT NULL | Auto Increment | PK |  | Unique identifier for each charge type. |
| charge_code | VARCHAR(10) | NOT NULL |  |  |  | Short unique code identifying the charge (e.g. GPS, INS). |
| charge_name | VARCHAR(50) | NOT NULL |  |  |  | Display name of the charge. |
| charge_category | VARCHAR(30) | NULL |  |  |  | Grouping for the charge (e.g. Add-On, Fee, Insurance). |
| charge_basis | VARCHAR(30) | NULL |  |  |  | How the charge is billed (Per Day, Per Hour, Flat Rate, etc.). |

## Finance.Charge_Rate

_A specific priced, time-bounded rate for a charge type._

| Attribute Name | Data Type | Null? | Default | PK/FK | FK Reference | Description |
|---|---|---|---|---|---|---|
| charge_rate_id | INT | NOT NULL | Auto Increment | PK |  | Unique identifier for each charge rate entry. |
| charge_type_id | INT | NOT NULL |  | FK | Finance.Charge_Type | References `Finance.Charge_Type(charge_type_id)`. |
| charge_unit_rate | DECIMAL(10,2) | NOT NULL |  |  |  | Constrained by: `charge_unit_rate >= 0`. |
| effective_start_date | DATE | NOT NULL | GETDATE() |  |  | Date this rate becomes effective (BR-19/BR-20). |
| effective_end_date | DATE | NULL |  |  |  | Date this rate stops being effective; null means still active (BR-19/BR-20). |
| created_at | DATETIME | NOT NULL | GETDATE() |  |  | Record creation timestamp. |
| updated_at | DATETIME | NULL |  |  |  | Last-updated timestamp. |

## Finance.Tax_Type

_Lookup of tax categories (state, city, environmental, etc.)._

| Attribute Name | Data Type | Null? | Default | PK/FK | FK Reference | Description |
|---|---|---|---|---|---|---|
| tax_type_id | INT | NOT NULL | Auto Increment | PK |  | Unique identifier for each tax type. |
| tax_code | VARCHAR(10) | NOT NULL |  |  |  | Short code for the tax (STATE, CITY, ENV, etc.). |
| tax_name | VARCHAR(50) | NOT NULL |  |  |  | Display name of the tax. |
| tax_description | VARCHAR(150) | NULL |  |  |  | Additional notes about the tax. |

## Finance.Tax_Rate

_A specific tax percentage for a (tax type, branch), effective over a date range._

| Attribute Name | Data Type | Null? | Default | PK/FK | FK Reference | Description |
|---|---|---|---|---|---|---|
| tax_rate_id | INT | NOT NULL | Auto Increment | PK |  | Unique identifier for each tax rate record. |
| tax_type_id | INT | NOT NULL |  | FK | Finance.Tax_Type | References `Finance.Tax_Type(tax_type_id)`. |
| branch_id | INT | NOT NULL |  | FK | Operation.Branch | References `Operation.Branch(branch_id)`. |
| tax_rate | DECIMAL(5,2) | NULL |  |  |  | Constrained by: `tax_rate >= 0`. |
| effective_start_date | DATE | NOT NULL |  |  |  | Date this rate becomes effective (BR-19/BR-20). |
| effective_end_date | DATE | NULL |  |  |  | Date this rate stops being effective; null means still active (BR-19/BR-20). |

## Finance.Promotion

_A promotional discount code and its terms._

| Attribute Name | Data Type | Null? | Default | PK/FK | FK Reference | Description |
|---|---|---|---|---|---|---|
| promotion_id | INT | NOT NULL | Auto Increment | PK |  | Unique identifier for each promotion. |
| promotion_code | VARCHAR(20) | NOT NULL |  |  |  | Customer-facing code entered to apply the promotion (BR-16). |
| promotion_name | VARCHAR(50) | NOT NULL |  |  |  | Display name of the promotion. |
| promotion_description | VARCHAR(150) | NULL |  |  |  | Additional notes about the promotion. |
| promotion_value | DECIMAL(10,2) | NOT NULL |  |  |  | Constrained by: `promotion_value >= 0`. |
| promotion_type | VARCHAR(30) | NOT NULL |  |  |  | Allowed values: Public, Seasonal, Referral, Corporate, Loyalty. |
| promotion_start_date | DATETIME | NOT NULL |  |  |  | Constrained by: `promotion_end_date > promotion_start_date`. |
| promotion_end_date | DATETIME | NOT NULL |  |  |  | Constrained by: `promotion_end_date > promotion_start_date`. |
| is_active | BIT | NOT NULL | 1 |  |  | Whether the promotion is currently enabled. |
| created_at | DATETIME | NOT NULL | GETDATE() |  |  | Record creation timestamp. |

## Finance.Rental_Estimate

_The priced estimate generated for a reservation (base + surcharges + tax - discount)._

| Attribute Name | Data Type | Null? | Default | PK/FK | FK Reference | Description |
|---|---|---|---|---|---|---|
| estimate_id | INT | NOT NULL | Auto Increment | PK |  | Unique identifier for each rental estimate. |
| reservation_id | INT | NOT NULL |  | FK | Rental.Reservation | References `Rental.Reservation(reservation_id)`. |
| vehicle_rate_id | INT | NOT NULL |  | FK | Finance.Vehicle_Rate | References `Finance.Vehicle_Rate(vehicle_rate_id)`. |
| base_rate | DECIMAL(10,2) | NOT NULL |  |  |  | Base rental cost before surcharges, tax, or discounts (rate x duration). |
| surcharge_total | DECIMAL(10,2) | NULL | 0.00 |  |  | Sum of add-on/surcharge charges applied to this estimate (BR-18). |
| discount_total | DECIMAL(10,2) | NULL | 0.00 |  |  | Sum of promotional discounts applied to this estimate (BR-16). |
| tax_total | DECIMAL(10,2) | NULL | 0.00 |  |  | Sum of taxes applied to this estimate (BR-18, BR-20). |
| total_estimate |  | NULL |  |  |  | Computed column: base_rate + surcharge_total - discount_total + tax_total. |
| created_at | DATETIME | NOT NULL | GETDATE() |  |  | Record creation timestamp. |
| updated_at | DATETIME | NULL |  |  |  | Last-updated timestamp. |

## Finance.Estimate_Charge

_Bridge: which charge rates were applied to a given estimate, and at what quantity._

| Attribute Name | Data Type | Null? | Default | PK/FK | FK Reference | Description |
|---|---|---|---|---|---|---|
| charge_rate_id | INT | NOT NULL |  | PK/FK | Finance.Charge_Rate | References `Finance.Charge_Rate(charge_rate_id)`. |
| estimate_id | INT | NOT NULL |  | PK/FK | Finance.Rental_Estimate | References `Finance.Rental_Estimate(estimate_id)`. |
| charge_quantity | DECIMAL(10,2) | NOT NULL |  |  |  | Constrained by: `charge_quantity >= 0`. |

## Finance.Estimate_Tax

_Bridge: which tax rates were applied to a given estimate, and the computed amount._

| Attribute Name | Data Type | Null? | Default | PK/FK | FK Reference | Description |
|---|---|---|---|---|---|---|
| estimate_id | INT | NOT NULL |  | PK/FK | Finance.Rental_Estimate | References `Finance.Rental_Estimate(estimate_id)`. |
| tax_rate_id | INT | NOT NULL |  | PK/FK | Finance.Tax_Rate | References `Finance.Tax_Rate(tax_rate_id)`. |
| tax_amount | DECIMAL(10,2) | NOT NULL |  |  |  | Computed tax amount for this line/estimate. |
| created_at | DATETIME | NOT NULL | GETDATE() |  |  | Record creation timestamp. |

## Finance.Estimate_Promotion

_Bridge: which promotion(s) were applied to a given estimate, and the discount amount._

| Attribute Name | Data Type | Null? | Default | PK/FK | FK Reference | Description |
|---|---|---|---|---|---|---|
| estimate_id | INT | NOT NULL |  | PK/FK | Finance.Rental_Estimate | References `Finance.Rental_Estimate(estimate_id)`. |
| promotion_id | INT | NOT NULL |  | PK/FK | Finance.Promotion | References `Finance.Promotion(promotion_id)`. |
| discount_amount | DECIMAL(10,2) | NULL |  |  |  | Computed discount amount for this line/invoice. |
| applied | BIT | NOT NULL | 1 |  |  | Whether the promotion was actually applied (1 = yes). |
| created_at | DATETIME | NOT NULL | GETDATE() |  |  | Record creation timestamp. |

## Finance.Rental_Charge_Detail

_Actual rental-time charges (late fee, cleaning, damage, etc.) billed against a completed rental._

| Attribute Name | Data Type | Null? | Default | PK/FK | FK Reference | Description |
|---|---|---|---|---|---|---|
| rental_id | INT | NOT NULL |  | PK/FK | Rental.Rental | References `Rental.Rental(rental_id)`. |
| charge_rate_id | INT | NOT NULL |  | PK/FK | Finance.Charge_Rate | References `Finance.Charge_Rate(charge_rate_id)`. |
| charge_quantity | DECIMAL(10,2) | NOT NULL |  |  |  | Constrained by: `charge_quantity >= 0`. |
| created_at | DATETIME | NOT NULL | GETDATE() |  |  | Record creation timestamp. |

## Finance.Rental_Payment

_A payment transaction against a rental._

| Attribute Name | Data Type | Null? | Default | PK/FK | FK Reference | Description |
|---|---|---|---|---|---|---|
| payment_id | INT | NOT NULL | Auto Increment | PK |  | Unique identifier for each rental payment. |
| payment_method_id | INT | NOT NULL |  | FK | Customer.Customer_Payment_Method | References `Customer.Customer_Payment_Method(payment_method_id)`. |
| rental_id | INT | NOT NULL |  | FK | Rental.Rental | References `Rental.Rental(rental_id)`. |
| payment_date | DATETIME | NOT NULL |  |  |  | Date/time the payment was made. |
| payment_amount | DECIMAL(10,2) | NOT NULL |  |  |  | Amount charged in this payment transaction. |
| payment_status | VARCHAR(20) | NOT NULL |  |  |  | Allowed values: Pending, Completed, Failed, Refunded. |
| reference_number | VARCHAR(30) | NOT NULL |  |  |  | External transaction reference code from the payment processor. |

## Finance.Refund

_A refund issued against a prior payment. Enforces BR-40._

| Attribute Name | Data Type | Null? | Default | PK/FK | FK Reference | Description |
|---|---|---|---|---|---|---|
| refund_id | INT | NOT NULL | Auto Increment | PK |  | Unique identifier for each refund transaction. |
| payment_id | INT | NOT NULL |  | FK | Finance.Rental_Payment | References `Finance.Rental_Payment(payment_id)`. |
| refund_date | DATETIME | NOT NULL |  |  |  | Date/time the refund was issued. |
| refund_amount | DECIMAL(10,2) | NOT NULL |  |  |  | Amount refunded; the running total per payment cannot exceed the original payment (BR-40). |
| refund_reason | VARCHAR(100) | NULL |  |  |  | Reason the refund was issued. |
| refund_status | VARCHAR(20) | NOT NULL |  |  |  | Allowed values: Pending, Processed, Denied. |

## Finance.Invoice

_The customer-facing bill generated once a rental completes._

| Attribute Name | Data Type | Null? | Default | PK/FK | FK Reference | Description |
|---|---|---|---|---|---|---|
| invoice_id | INT | NOT NULL | Auto Increment | PK |  | Unique identifier for each invoice. |
| branch_id | INT | NOT NULL |  | FK | Operation.Branch | References `Operation.Branch(branch_id)`. |
| rental_id | INT | NOT NULL |  | FK | Rental.Rental | References `Rental.Rental(rental_id)`. |
| customer_id | INT | NOT NULL |  | FK | Customer.Customer | References `Customer.Customer(customer_id)`. |
| invoice_date | DATETIME | NOT NULL | GETDATE() |  |  | Date the invoice was generated. |
| subtotal_amount | DECIMAL(10,2) | NOT NULL |  |  |  | Sum of charges before tax and discount. |
| tax_amount | DECIMAL(10,2) | NOT NULL |  |  |  | Computed tax amount for this line/estimate. |
| discount_amount | DECIMAL(10,2) | NOT NULL | 0 |  |  | Computed discount amount for this line/invoice. |
| total_amount | DECIMAL(10,2) | NOT NULL |  |  |  | Final amount owed: subtotal - discount + tax (BR-36). |
| created_at | DATETIME | NULL | GETDATE() |  |  | Record creation timestamp. |

## Finance.Invoice_Line

_Individual line items making up an invoice._

| Attribute Name | Data Type | Null? | Default | PK/FK | FK Reference | Description |
|---|---|---|---|---|---|---|
| invoice_line_id | INT | NOT NULL | Auto Increment | PK |  | Unique identifier for each invoice line item. |
| invoice_id | INT | NOT NULL |  | FK | Finance.Invoice | References `Finance.Invoice(invoice_id)`. |
| rental_id | INT | NULL |  | FK | Rental.Rental | References `Rental.Rental(rental_id)`. |
| line_description | VARCHAR(200) | NOT NULL |  |  |  | Description of this invoice line item. |
| quantity | DECIMAL(10,2) | NOT NULL | 1 |  |  | Number of units of this add-on/charge applied. |
| unit_price | DECIMAL(10,2) | NOT NULL |  |  |  | Price per unit for this invoice line. |
| line_amount |  | NULL |  |  |  | Computed column: quantity x unit_price. |
| tax_rate | DECIMAL(10,2) | NULL |  |  |  | Tax percentage applied. |
| tax_amount | DECIMAL(10,2) | NULL |  |  |  | Computed tax amount for this line/estimate. |
| created_at | DATETIME | NULL | GETDATE() |  |  | Record creation timestamp. |

## Operation.Branch

_A rental location._

| Attribute Name | Data Type | Null? | Default | PK/FK | FK Reference | Description |
|---|---|---|---|---|---|---|
| branch_id | INT | NOT NULL | Auto Increment | PK |  | Unique identifier for each branch. |
| branch_name | VARCHAR(50) | NOT NULL |  |  |  | Display name of the branch. |
| branch_type | VARCHAR(50) | NOT NULL |  |  |  | Branch category: Airport, City, or Suburban. |
| phone_number | VARCHAR(15) | NOT NULL |  |  |  | Contact phone number. |
| email | VARCHAR(50) | NOT NULL |  |  |  | Contact email address. |
| branch_status | VARCHAR(20) | NOT NULL | 'Active' |  |  | Allowed values: Active, Inactive, Closed. |

## Operation.Branch_Address

_Physical address of a branch._

| Attribute Name | Data Type | Null? | Default | PK/FK | FK Reference | Description |
|---|---|---|---|---|---|---|
| branch_address_id | INT | NOT NULL | Auto Increment | PK |  | Unique identifier for each branch address. |
| branch_id | INT | NOT NULL |  | FK | Operation.Branch | References `Operation.Branch(branch_id)`. |
| street_address | VARCHAR(100) | NOT NULL |  |  |  | Street address line 1. |
| address_line2 | VARCHAR(100) | NULL |  |  |  | Street address line 2 (suite/apartment, optional). |
| city | VARCHAR(50) | NOT NULL |  |  |  | City. |
| state | VARCHAR(30) | NOT NULL |  |  |  | State/province. |
| zip_code | VARCHAR(10) | NOT NULL |  |  |  | ZIP/postal code. |
| created_at | DATETIME | NOT NULL | GETDATE() |  |  | Record creation timestamp. |
| updated_at | DATETIME | NULL |  |  |  | Last-updated timestamp. |

## Operation.Operating_Hours

_Open/close time for a branch, per day of week. Enforces BR-43._

| Attribute Name | Data Type | Null? | Default | PK/FK | FK Reference | Description |
|---|---|---|---|---|---|---|
| operating_hours_id | INT | NOT NULL | Auto Increment | PK |  | Unique identifier for each operating hours record. |
| branch_id | INT | NOT NULL |  | FK | Operation.Branch | References `Operation.Branch(branch_id)`. |
| day_of_week | VARCHAR(10) | NOT NULL |  |  |  | Allowed values: Monday, Tuesday, Wednesday, Thursday, Friday, Saturday, Sunday. |
| open_time | TIME | NOT NULL |  |  |  | Constrained by: `close_time > open_time`. |
| close_time | TIME | NOT NULL |  |  |  | Constrained by: `close_time > open_time`. |
| after_hours_dropoff | BIT | NOT NULL | 0 |  |  | Whether returns are accepted outside normal operating hours (BR-43). |
| created_at | DATETIME | NOT NULL | GETDATE() |  |  | Record creation timestamp. |

## Operation.Employee_Role

_Job role and access level lookup (Admin, Manager, Staff, Limited)._

| Attribute Name | Data Type | Null? | Default | PK/FK | FK Reference | Description |
|---|---|---|---|---|---|---|
| employee_role_id | INT | NOT NULL | Auto Increment | PK |  | Unique identifier for each employee role. |
| role | VARCHAR(30) | NOT NULL |  |  |  | Job title/role name. |
| access_level | VARCHAR(20) | NULL |  |  |  | Allowed values: Admin, Manager, Staff, Limited. |

## Operation.Employee

_Staff record._

| Attribute Name | Data Type | Null? | Default | PK/FK | FK Reference | Description |
|---|---|---|---|---|---|---|
| employee_id | INT | NOT NULL | Auto Increment | PK |  | Unique identifier for each employee. |
| branch_id | INT | NOT NULL |  | FK | Operation.Branch | References `Operation.Branch(branch_id)`. |
| employee_role_id | INT | NOT NULL |  | FK | Operation.Employee_Role | References `Operation.Employee_Role(employee_role_id)`. |
| first_name | VARCHAR(30) | NOT NULL |  |  |  | First name. |
| middle_name | VARCHAR(30) | NULL |  |  |  | Middle name (optional). |
| last_name | VARCHAR(30) | NOT NULL |  |  |  | Last name. |
| email | VARCHAR(50) | NOT NULL |  |  |  | Contact email address. |
| phone_number | VARCHAR(15) | NOT NULL |  |  |  | Contact phone number. |
| date_of_birth | DATE | NOT NULL |  |  |  | Date of birth; used to compute age for eligibility/surcharge rules (BR-01, BR-02). |
| gender | VARCHAR(10) | NOT NULL |  |  |  | Allowed values: Male, Female, Other. |
| hire_date | DATE | NOT NULL |  |  |  | Date the employee was hired. |
| status | VARCHAR(20) | NOT NULL |  |  |  | Allowed values: Active, On Leave, Terminated, Retired. |
| created_at | DATETIME | NOT NULL | GETDATE() |  |  | Record creation timestamp. |

## Operation.Employee_Address

_Mailing address of an employee._

| Attribute Name | Data Type | Null? | Default | PK/FK | FK Reference | Description |
|---|---|---|---|---|---|---|
| employee_address_id | INT | NOT NULL | Auto Increment | PK |  | Unique identifier for each employee address. |
| employee_id | INT | NOT NULL |  | FK | Operation.Employee | References `Operation.Employee(employee_id)`. |
| street_address | VARCHAR(100) | NOT NULL |  |  |  | Street address line 1. |
| address_line2 | VARCHAR(100) | NULL |  |  |  | Street address line 2 (suite/apartment, optional). |
| city | VARCHAR(50) | NOT NULL |  |  |  | City. |
| state | VARCHAR(30) | NOT NULL |  |  |  | State/province. |
| zip_code | VARCHAR(10) | NOT NULL |  |  |  | ZIP/postal code. |
| created_at | DATETIME | NOT NULL | GETDATE() |  |  | Record creation timestamp. |
| updated_at | DATETIME | NULL |  |  |  | Last-updated timestamp. |

## Operation.Expense_Category

_Lookup of operating expense categories (fuel, utilities, repairs, etc.)._

| Attribute Name | Data Type | Null? | Default | PK/FK | FK Reference | Description |
|---|---|---|---|---|---|---|
| expense_category_id | INT | NOT NULL | Auto Increment | PK |  | Unique identifier for each expense category. |
| category_name | VARCHAR(50) | NOT NULL |  |  |  | Display name of the expense category. |
| category_description | VARCHAR(150) | NULL |  |  |  | Additional notes about the expense category. |
| created_at | DATETIME | NOT NULL | GETDATE() |  |  | Record creation timestamp. |
| updated_at | DATETIME | NULL |  |  |  | Last-updated timestamp. |

## Operation.Branch_Expenses

_An operating expense incurred at a branch._

| Attribute Name | Data Type | Null? | Default | PK/FK | FK Reference | Description |
|---|---|---|---|---|---|---|
| expense_id | INT | NOT NULL | Auto Increment | PK |  | Unique identifier for each branch expense entry. |
| branch_id | INT | NOT NULL |  | FK | Operation.Branch | References `Operation.Branch(branch_id)`. |
| expense_category_id | INT | NOT NULL |  | FK | Operation.Expense_Category | References `Operation.Expense_Category(expense_category_id)`. |
| vendor_name | VARCHAR(50) | NOT NULL |  |  |  | Vendor paid for this expense. |
| expense_description | VARCHAR(150) | NULL |  |  |  | Additional notes about the expense. |
| amount | DECIMAL(10,2) | NOT NULL |  |  |  | Constrained by: `amount >= 0`. |
| expense_date | DATETIME | NOT NULL | GETDATE() |  |  | Date the expense was recorded. |
| payment_status | VARCHAR(20) | NOT NULL | 'Paid' |  |  | Allowed values: Paid, Pending, Overdue. |
