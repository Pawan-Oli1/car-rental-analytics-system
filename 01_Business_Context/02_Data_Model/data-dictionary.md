

## Tables and Columns

### Vehicle.vehicle

| Attribute Name   | Data Type     | Allow Null?   | Default Value   | PK or FK?   | FK Reference Table       | Attribute Example   | Description / Business Rule                                       |
|:-----------------|:--------------|:--------------|:----------------|:------------|:-------------------------|:--------------------|:------------------------------------------------------------------|
| vehicle_id       | INT           | not_null      | Auto Increment  | PK          |                          | 1001                | Unique identifier for each vehicle                                |
| vehicle_vin      | VARCHAR(17)   | not_null      |                 |             |                          | 1HGCM82633A123456   | Vehicle Identification Number; must be unique                     |
| vehicle_class_id | INT           | not_null      |                 | FK          | Vehicle.Vehicle_Class    | 3                   | References the vehicle’s class (Economy, SUV, Luxury, etc.)       |
| vehicle_type_id  | INT           | not_null      |                 | FK          | Vehicle.Vehicle_Type     | 2                   | References the vehicle’s type (Sedan, SUV, Truck, etc.)           |
| fuel_type_id     | INT           | not_null      |                 | FK          | Vehicle.Fuel_Type        | 1                   | References the fuel type (Gasoline, Electric, Hybrid, etc.)       |
| purchase_id      | INT           | not_null      |                 | FK          | Vehicle.Vehicle_Purchase | 15                  | Links to vehicle purchase record                                  |
| branch_id        | INT           | not_null      |                 | FK          | Operation.Branch         | 5                   | Branch where the vehicle is currently assigned                    |
| make             | VARCHAR(30)   | not_null      |                 |             |                          | Toyota              | Manufacturer of the vehicle                                       |
| model            | VARCHAR(30)   | not_null      |                 |             |                          | Camry               | Model name of the vehicle                                         |
| year             | INT           | not_null      |                 |             |                          | 2021                | Manufacturing year of the vehicle                                 |
| color            | VARCHAR(30)   |               |                 |             |                          | Black               | Exterior color of the vehicle                                     |
| status           | VARCHAR(30)   | not_null      |                 |             |                          | Available           | Must be one of: Available, Reserved, Rented, Maintenance, Retired |
| mileage          | DECIMAL(10,2) | not_null      |                 |             |                          | 32500.5             | Current mileage recorded for the vehicle                          |
| created_at       | DATETIME      | not_null      | GETDATE()       |             |                          | 2025-02-11 14:23:00 | Record creation timestamp                                         |
| updated_at       | DATETIME      |               |                 |             |                          | 2025-05-22 09:10:00 | Timestamp of last update                                          |


### Schema.Entity Name

| Attribute Name   | Data Type   | Allow Null?   | Default Value   | PK or FK?   | FK Reference Table   | Attribute Example   | Description / Business Rule   |
|:-----------------|:------------|:--------------|:----------------|:------------|:---------------------|:--------------------|:------------------------------|
| Attribute Name   | Data Type   | Allow Null?   | Default Value   | PK or FK?   | FK Reference Table   | Attribute Example   | Description / Business Rule   |
| Attribute Name   | Data Type   | Allow Null?   | Default Value   | PK or FK?   | FK Reference Table   | Attribute Example   | Description / Business Rule   |
| Attribute Name   | Data Type   | Allow Null?   | Default Value   | PK or FK?   | FK Reference Table   | Attribute Example   | Description / Business Rule   |
| Attribute Name   | Data Type   | Allow Null?   | Default Value   | PK or FK?   | FK Reference Table   | Attribute Example   | Description / Business Rule   |
| Attribute Name   | Data Type   | Allow Null?   | Default Value   | PK or FK?   | FK Reference Table   | Attribute Example   | Description / Business Rule   |
| Attribute Name   | Data Type   | Allow Null?   | Default Value   | PK or FK?   | FK Reference Table   | Attribute Example   | Description / Business Rule   |
| Attribute Name   | Data Type   | Allow Null?   | Default Value   | PK or FK?   | FK Reference Table   | Attribute Example   | Description / Business Rule   |
| Attribute Name   | Data Type   | Allow Null?   | Default Value   | PK or FK?   | FK Reference Table   | Attribute Example   | Description / Business Rule   |
| Attribute Name   | Data Type   | Allow Null?   | Default Value   | PK or FK?   | FK Reference Table   | Attribute Example   | Description / Business Rule   |
| Attribute Name   | Data Type   | Allow Null?   | Default Value   | PK or FK?   | FK Reference Table   | Attribute Example   | Description / Business Rule   |
| Attribute Name   | Data Type   | Allow Null?   | Default Value   | PK or FK?   | FK Reference Table   | Attribute Example   | Description / Business Rule   |
| Attribute Name   | Data Type   | Allow Null?   | Default Value   | PK or FK?   | FK Reference Table   | Attribute Example   | Description / Business Rule   |
| Attribute Name   | Data Type   | Allow Null?   | Default Value   | PK or FK?   | FK Reference Table   | Attribute Example   | Description / Business Rule   |
| Attribute Name   | Data Type   | Allow Null?   | Default Value   | PK or FK?   | FK Reference Table   | Attribute Example   | Description / Business Rule   |
| Attribute Name   | Data Type   | Allow Null?   | Default Value   | PK or FK?   | FK Reference Table   | Attribute Example   | Description / Business Rule   |
| Attribute Name   | Data Type   | Allow Null?   | Default Value   | PK or FK?   | FK Reference Table   | Attribute Example   | Description / Business Rule   |
| Attribute Name   | Data Type   | Allow Null?   | Default Value   | PK or FK?   | FK Reference Table   | Attribute Example   | Description / Business Rule   |
| Attribute Name   | Data Type   | Allow Null?   | Default Value   | PK or FK?   | FK Reference Table   | Attribute Example   | Description / Business Rule   |
| Attribute Name   | Data Type   | Allow Null?   | Default Value   | PK or FK?   | FK Reference Table   | Attribute Example   | Description / Business Rule   |
| Attribute Name   | Data Type   | Allow Null?   | Default Value   | PK or FK?   | FK Reference Table   | Attribute Example   | Description / Business Rule   |
| Attribute Name   | Data Type   | Allow Null?   | Default Value   | PK or FK?   | FK Reference Table   | Attribute Example   | Description / Business Rule   |
| Attribute Name   | Data Type   | Allow Null?   | Default Value   | PK or FK?   | FK Reference Table   | Attribute Example   | Description / Business Rule   |
| Attribute Name   | Data Type   | Allow Null?   | Default Value   | PK or FK?   | FK Reference Table   | Attribute Example   | Description / Business Rule   |
| Attribute Name   | Data Type   | Allow Null?   | Default Value   | PK or FK?   | FK Reference Table   | Attribute Example   | Description / Business Rule   |
| Attribute Name   | Data Type   | Allow Null?   | Default Value   | PK or FK?   | FK Reference Table   | Attribute Example   | Description / Business Rule   |


### Finance.vehicle_rate

| Attribute Name       | Data Type     | Allow Null?   | Default Value   | PK or FK?   | FK Reference Table    |   Attribute Example | Description / Business Rule                             |
|:---------------------|:--------------|:--------------|:----------------|:------------|:----------------------|--------------------:|:--------------------------------------------------------|
| vehicle_rate_id      | INT           | not_null      | Auto Increment  | PK          |                       |               301   | Unique identifier for each vehicle rate record          |
| vehicle_class_id     | INT           | not_null      |                 | FK          | Vehicle.Vehicle_Class |                 3   | Vehicle class this rate applies to (Economy, SUV, etc.) |
| branch_id            | INT           | not_null      |                 | FK          | Operation.Branch      |                 1   | Branch that uses this specific rate structure           |
| vehicle_hourly_rate  | DECIMAL(10,2) |               |                 |             |                       |                12.5 | Hourly rental rate for this class and branch            |
| vehicle_daily_rate   | DECIMAL(10,2) |               |                 |             |                       |                75   | Daily rental rate for this class and branch             |
| vehicle_weekly_rate  | DECIMAL(10,2) |               |                 |             |                       |               420   | Weekly rental rate for this class and branch            |
| vehicle_monthly_rate | DECIMAL(10,2) |               |                 |             |                       |              1600   | Monthly rental rate for this class and branch           |


### Vehicle.vehicle_warranty

| Attribute Name    | Data Type   | Allow Null?   | Default Value   | PK or FK?   | FK Reference Table   | Attribute Example         | Description / Business Rule                           |
|:------------------|:------------|:--------------|:----------------|:------------|:---------------------|:--------------------------|:------------------------------------------------------|
| warranty_id       | INT         | not_null      | Auto Increment  | PK          |                      | 6001                      | Unique identifier for each vehicle warranty record    |
| vehicle_id        | INT         | not_null      |                 | FK          | Vehicle.Vehicle      | 501                       | Vehicle covered under this warranty                   |
| warranty_provider | VARCHAR(50) | not_null      |                 |             |                      | Toyota Financial Services | Company providing the warranty coverage               |
| warranty_type     | VARCHAR(30) | not_null      |                 |             |                      | Powertrain                | Type of warranty (Powertrain, Bumper-to-Bumper, etc.) |
| start_date        | DATE        | not_null      |                 |             |                      | 2023-01-01 00:00:00       | Warranty coverage start date                          |
| end_date          | DATE        | not_null      |                 |             |                      | 2028-01-01 00:00:00       | Warranty coverage end date                            |
| coverage_mileage  | INT         | not_null      |                 |             |                      | 60000                     | Maximum mileage covered under the warranty            |
| status            | VARCHAR(20) | not_null      |                 |             |                      | Active                    | Must be Active or Expired                             |


### 6.Entity Name

| Attribute Name   | Data Type   | Allow Null?   | Default Value   | PK or FK?   | FK Reference Table   | Attribute Example   | Description / Business Rule   |
|:-----------------|:------------|:--------------|:----------------|:------------|:---------------------|:--------------------|:------------------------------|
| Attribute Name   | Data Type   | Allow Null?   | Default Value   | PK or FK?   | FK Reference Table   | Attribute Example   | Description / Business Rule   |


### Vehicle.vehicle_class

| Attribute Name   | Data Type   | Allow Null?   | Default Value   | PK or FK?   | FK Reference Table   | Attribute Example   | Description / Business Rule                                              |
|:-----------------|:------------|:--------------|:----------------|:------------|:---------------------|:--------------------|:-------------------------------------------------------------------------|
| vehicle_class_id | INT         | not_null      | Auto Increment  | PK          |                      | 1                   | Unique identifier for each vehicle class                                 |
| class_name       | VARCHAR(30) | not_null      |                 |             |                      | Economy             | Name of the vehicle class (Economy, Compact, Midsize, SUV, Luxury, etc.) |


### Vehicle.Entity Name

| Attribute Name   | Data Type   | Allow Null?   | Default Value   | PK or FK?   | FK Reference Table   | Attribute Example   | Description / Business Rule   |
|:-----------------|:------------|:--------------|:----------------|:------------|:---------------------|:--------------------|:------------------------------|
| Attribute Name   | Data Type   | Allow Null?   | Default Value   | PK or FK?   | FK Reference Table   | Attribute Example   | Description / Business Rule   |
| Attribute Name   | Data Type   | Allow Null?   | Default Value   | PK or FK?   | FK Reference Table   | Attribute Example   | Description / Business Rule   |
| Attribute Name   | Data Type   | Allow Null?   | Default Value   | PK or FK?   | FK Reference Table   | Attribute Example   | Description / Business Rule   |
| Attribute Name   | Data Type   | Allow Null?   | Default Value   | PK or FK?   | FK Reference Table   | Attribute Example   | Description / Business Rule   |


### Vehicle.vehicle_type

| Attribute Name    | Data Type   | Allow Null?   | Default Value   | PK or FK?   | FK Reference Table   | Attribute Example   | Description / Business Rule                                          |
|:------------------|:------------|:--------------|:----------------|:------------|:---------------------|:--------------------|:---------------------------------------------------------------------|
| vehicle_type_id   | INT         | not_null      | Auto Increment  | PK          |                      | 1                   | Unique identifier for each vehicle type                              |
| vehicle_type_name | VARCHAR(30) | not_null      |                 |             |                      | SUV                 | Name of the vehicle type (SUV, Sedan, Truck, Van, Convertible, etc.) |


### Vehicle.fuel_type

| Attribute Name   | Data Type    | Allow Null?   | Default Value   | PK or FK?   | FK Reference Table   | Attribute Example   | Description / Business Rule                                      |
|:-----------------|:-------------|:--------------|:----------------|:------------|:---------------------|:--------------------|:-----------------------------------------------------------------|
| fuel_type_id     | INT          | not_null      | Auto Increment  | PK          |                      | 1                   | Unique identifier for each fuel type                             |
| fuel_type_name   | VARCHAR(30)  | not_null      |                 |             |                      | Gasoline            | Name of the fuel type (Gasoline, Diesel, Electric, Hybrid, etc.) |
| fuel_efficiency  | DECIMAL(5,2) | not_null      |                 |             |                      | 28.5                | Average fuel efficiency (e.g., MPG or kWh equivalent)            |


### Vehicle.vehicle_purchase

| Attribute Name   | Data Type     | Allow Null?   | Default Value   | PK or FK?   | FK Reference Table   | Attribute Example      | Description / Business Rule                                        |
|:-----------------|:--------------|:--------------|:----------------|:------------|:---------------------|:-----------------------|:-------------------------------------------------------------------|
| purchase_id      | INT           | not_null      | Auto Increment  | PK          |                      | 501                    | Unique identifier for each vehicle purchase record                 |
| purchase_date    | DATE          | not_null      |                 |             |                      | 2023-05-12 00:00:00    | Date on which the vehicle was purchased                            |
| purchase_type    | VARCHAR(30)   | not_null      |                 |             |                      | Auction                | Method of purchase (Auction, Dealer, Manufacturer, Trade-in, etc.) |
| purchase_from    | VARCHAR(100)  | not_null      |                 |             |                      | AutoNation Minneapolis | Seller or source from whom the vehicle was purchased               |
| purchase_price   | DECIMAL(10,2) | not_null      |                 |             |                      | 18500                  | Total amount paid for the vehicle                                  |


### Vehicle.vehicle_registration

| Attribute Name           | Data Type   | Allow Null?   | Default Value   | PK or FK?   | FK Reference Table   | Attribute Example   | Description / Business Rule                               |
|:-------------------------|:------------|:--------------|:----------------|:------------|:---------------------|:--------------------|:----------------------------------------------------------|
| registration_id          | INT         | not_null      | Auto Increment  | PK          |                      | 7001                | Unique identifier for each vehicle registration           |
| vehicle_id               | INT         | not_null      |                 | FK          | Vehicle.Vehicle      | 501                 | Vehicle that this registration belongs to                 |
| registration_number      | VARCHAR(20) | not_null      |                 |             |                      | REG-2025-12345      | Official DMV registration number; must be unique          |
| license_plate            | VARCHAR(20) | not_null      |                 |             |                      | MN-7DK294           | License plate number; must be unique                      |
| registration_state       | VARCHAR(30) | not_null      |                 |             |                      | Minnesota           | State where the vehicle is registered                     |
| registration_issue_date  | DATE        | not_null      |                 |             |                      | 2025-01-10 00:00:00 | Date when registration was issued                         |
| registration_expiry_date | DATE        | not_null      |                 |             |                      | 2026-01-10 00:00:00 | Date when registration expires (must be after issue date) |
| registration_status      | VARCHAR(20) | not_null      | ‘Active’        |             |                      | Active              | Registration status: Active, Suspended, Cancelled, etc.   |
| created_at               | DATETIME    | not_null      | GETDATE()       |             |                      | 2025-02-21 13:30:00 | Timestamp when the record was created                     |
| updated_at               | DATETIME    |               |                 |             |                      | 2025-02-22 10:20:00 | Timestamp when record was last updated                    |


### Vehicle.vehicle_insurance

| Attribute Name     | Data Type   | Allow Null?   | Default Value   | PK or FK?   | FK Reference Table   | Attribute Example   | Description / Business Rule                                             |
|:-------------------|:------------|:--------------|:----------------|:------------|:---------------------|:--------------------|:------------------------------------------------------------------------|
| insurance_id       | INT         | not_null      | Auto Increment  | PK          |                      | 6101                | Unique identifier for each insurance policy record                      |
| vehicle_id         | INT         | not_null      |                 | FK          | Vehicle.Vehicle      | 501                 | Vehicle that this insurance policy covers                               |
| policy_number      | VARCHAR(20) | not_null      |                 |             |                      | INS-2025-94821      | Unique policy number assigned by provider                               |
| provider_name      | VARCHAR(50) | not_null      |                 |             |                      | State Farm          | Name of the insurance provider                                          |
| coverage_type      | VARCHAR(30) | not_null      |                 |             |                      | Comprehensive       | Coverage type: Comprehensive, Collision, Liability, Full Coverage, etc. |
| policy_start_date  | DATE        | not_null      |                 |             |                      | 2025-01-01 00:00:00 | Start date of insurance coverage                                        |
| policy_expiry_date | DATE        | not_null      |                 |             |                      | 2026-01-01 00:00:00 | Expiry date of coverage; must be after start date                       |
| policy_status      | VARCHAR(20) | not_null      | ‘Active’        |             |                      | Active              | Status: Active, Expired, Pending Renewal, Cancelled                     |
| created_at         | DATETIME    | not_null      | GETDATE()       |             |                      | 2025-02-22 11:20:00 | Timestamp when the policy record was created                            |
| updated_at         | DATETIME    |               |                 |             |                      | 2025-02-23 08:15:00 | Timestamp when policy information was last updated                      |


### Vehicle.inspection

| Attribute Name        | Data Type     | Allow Null?   | Default Value   | PK or FK?   | FK Reference Table   | Attribute Example           | Description / Business Rule                          |
|:----------------------|:--------------|:--------------|:----------------|:------------|:---------------------|:----------------------------|:-----------------------------------------------------|
| inspection_id         | INT           | not_null      | Auto Increment  | PK          |                      | 4001                        | Unique identifier for each inspection                |
| employee_id           | INT           | not_null      |                 | FK          | Operation.Employee   | 3001                        | Employee who performed the inspection                |
| vehicle_id            | INT           | not_null      |                 | FK          | Vehicle.Vehicle      | 501                         | Vehicle being inspected                              |
| rental_id             | INT           |               |                 | FK          | Rental.Rental        | 9001                        | Linked rental session (NULL if not part of a rental) |
| inspection_date       | DATETIME      | not_null      |                 |             |                      | 2025-04-01 08:45:00         | Date and time when inspection was conducted          |
| inspection_type       | VARCHAR(4)    | not_null      |                 |             |                      | Pre                         | Must be “Pre” or “Post” inspection                   |
| inspection_mileage    | DECIMAL(10,2) | not_null      |                 |             |                      | 32500.75                    | Vehicle mileage recorded during inspection           |
| fuel_level            | DECIMAL(5,2)  |               |                 |             |                      | 85                          | Fuel level percentage (0–100)                        |
| inspection_media_path | VARCHAR(200)  |               |                 |             |                      | /media/inspections/4001.jpg | Path to inspection images/videos                     |
| inspection_status     | VARCHAR(30)   | not_null      |                 |             |                      | Passed                      | Passed, Failed, or Needs Review                      |
| inspection_signoff    | BIT           | not_null      | 0               |             |                      | 1                           | Indicates inspector approval (0 = no, 1 = yes)       |
| created_at            | DATETIME      | not_null      | GETDATE()       |             |                      | 2025-02-21 14:15:00         | Timestamp when inspection was recorded               |
| updated_at            | DATETIME      |               |                 |             |                      | 2025-02-22 10:10:00         | Timestamp of last update                             |


### Vehicle.damage

| Attribute Name        | Data Type     | Allow Null?   | Default Value   | PK or FK?   | FK Reference Table   | Attribute Example           | Description / Business Rule                               |
|:----------------------|:--------------|:--------------|:----------------|:------------|:---------------------|:----------------------------|:----------------------------------------------------------|
| damage_id             | INT           | not_null      | Auto Increment  | PK          |                      | 8001                        | Unique identifier for each damage report                  |
| inspection_id         | INT           | not_null      |                 | FK          | Vehicle.Inspection   | 4001                        | Damage reported during this specific inspection           |
| damage_description    | VARCHAR(200)  | not_null      |                 |             |                      | Scratch on left rear bumper | Detailed description of the vehicle damage                |
| estimated_repair_cost | DECIMAL(10,2) |               |                 |             |                      | 250                         | Estimated cost to repair (may be null initially)          |
| damage_severity       | VARCHAR(20)   |               |                 |             |                      | Minor                       | Severity category: Minor, Moderate, Severe                |
| damage_status         | VARCHAR(20)   | not_null      | ‘Unresolved’    |             |                      | Unresolved                  | Current damage status: Unresolved, Under Repair, Resolved |
| reported_date         | DATETIME      | not_null      | GETDATE()       |             |                      | 2025-02-21 15:10:00         | When the damage was reported                              |


### Vehicle.maintenance_record

| Attribute Name         | Data Type     | Allow Null?   | Default Value   | PK or FK?   | FK Reference Table   | Attribute Example     | Description / Business Rule                                        |
|:-----------------------|:--------------|:--------------|:----------------|:------------|:---------------------|:----------------------|:-------------------------------------------------------------------|
| maintenance_id         | INT           | not_null      | Auto Increment  | PK          |                      | 9001                  | Unique identifier for each maintenance record                      |
| vehicle_id             | INT           | not_null      |                 | FK          | Vehicle.Vehicle      | 501                   | Vehicle undergoing maintenance                                     |
| service_provider       | VARCHAR(50)   | not_null      |                 |             |                      | Firestone Auto Center | Vendor or shop that completed the maintenance                      |
| maintenance_date       | DATE          | not_null      |                 |             |                      | 2025-02-21 00:00:00   | Date maintenance was performed                                     |
| maintenance_type       | VARCHAR(30)   | not_null      |                 |             |                      | Oil Change            | Type of service (Oil Change, Brake Service, etc.)                  |
| maintenance_cost       | DECIMAL(10,2) | not_null      |                 |             |                      | 89.99                 | Cost of the maintenance; must be ≥ 0                               |
| mileage_at_maintenance | DECIMAL(10,2) |               |                 |             |                      | 32500.5               | Vehicle mileage when maintenance occurred                          |
| next_due_date          | DATE          |               |                 |             |                      | 2025-06-21 00:00:00   | Date of next scheduled maintenance; must be after maintenance_date |
| maintenance_status     | VARCHAR(20)   | not_null      | ‘Completed’     |             |                      | Completed             | Maintenance status: Completed, Scheduled, or Pending               |
| created_at             | DATETIME      | not_null      | GETDATE()       |             |                      | 2025-02-21 15:40:00   | Record creation timestamp                                          |
| updated_at             | DATETIME      |               |                 |             |                      | 2025-02-22 09:20:00   | Timestamp when the record was last updated                         |


### Vehicle.maintenance_inspection

| Attribute Name   | Data Type    | Allow Null?   | Default Value   | PK or FK?   | FK Reference Table         | Attribute Example                  | Description / Business Rule                                     |
|:-----------------|:-------------|:--------------|:----------------|:------------|:---------------------------|:-----------------------------------|:----------------------------------------------------------------|
| maintenance_id   | INT          | not_null      |                 | PK / FK     | Vehicle.Maintenance_Record | 9001                               | Links to the maintenance job this inspection is associated with |
| inspection_id    | INT          | not_null      |                 | PK / FK     | Vehicle.Inspection         | 4001                               | Links to the inspection record involved                         |
| request_date     | DATE         | not_null      | GETDATE()       |             |                            | 2025-02-21 00:00:00                | Date when the maintenance–inspection request was logged         |
| request_type     | VARCHAR(30)  | not_null      |                 |             |                            | Repair Request                     | Type of request (Repair, Preventive, Damage Follow-up, etc.)    |
| description      | VARCHAR(200) |               |                 |             |                            | Damage noted during pre-inspection | Optional details describing the request                         |
| priority_level   | VARCHAR(20)  |               |                 |             |                            | High                               | Priority: Low, Medium, High, or Critical                        |
| status           | VARCHAR(20)  | not_null      | ‘Pending’       |             |                            | Pending                            | Workflow status: Pending, In Progress, Completed, Cancelled     |


### Customer.customer

| Attribute Name   | Data Type    | Allow Null?   | Default Value   | PK or FK?   | FK Reference Table   | Attribute Example            | Description / Business Rule                       |
|:-----------------|:-------------|:--------------|:----------------|:------------|:---------------------|:-----------------------------|:--------------------------------------------------|
| customer_id      | INT          | not_null      | Auto Increment  | PK          |                      | 101                          | Unique identifier for each customer               |
| first_name       | VARCHAR(50)  | not_null      |                 |             |                      | Michael                      | Customer’s first name                             |
| middle_name      | VARCHAR(50)  |               |                 |             |                      | James                        | Optional middle name                              |
| last_name        | VARCHAR(50)  | not_null      |                 |             |                      | Thompson                     | Customer’s last name                              |
| phone_number     | VARCHAR(15)  | not_null      |                 |             |                      | 507-555-2001                 | Customer’s primary phone number                   |
| email            | VARCHAR(100) | not_null      |                 |             |                      | michael.thompson@example.com | Customer’s email address                          |
| date_of_birth    | DATE         | not_null      |                 |             |                      | 1985-04-12 00:00:00          | Customer’s date of birth                          |
| gender           | VARCHAR(10)  | not_null      |                 |             |                      | Male                         | Gender value restricted to Male, Female, or Other |


### Customer.Entity Name

| Attribute Name   | Data Type   | Allow Null?   | Default Value   | PK or FK?   | FK Reference Table   | Attribute Example   | Description / Business Rule   |
|:-----------------|:------------|:--------------|:----------------|:------------|:---------------------|:--------------------|:------------------------------|
| Attribute Name   | Data Type   | Allow Null?   | Default Value   | PK or FK?   | FK Reference Table   | Attribute Example   | Description / Business Rule   |
| Attribute Name   | Data Type   | Allow Null?   | Default Value   | PK or FK?   | FK Reference Table   | Attribute Example   | Description / Business Rule   |
| Attribute Name   | Data Type   | Allow Null?   | Default Value   | PK or FK?   | FK Reference Table   | Attribute Example   | Description / Business Rule   |


### Customer.license

| Attribute Name   | Data Type   | Allow Null?   | Default Value   | PK or FK?   | FK Reference Table   | Attribute Example   | Description / Business Rule                                   |
|:-----------------|:------------|:--------------|:----------------|:------------|:---------------------|:--------------------|:--------------------------------------------------------------|
| license_id       | INT         | not_null      | Auto Increment  | PK          | —                    | 2101                | Unique identifier for each customer license record            |
| customer_id      | INT         | not_null      |                 | FK          | Customer.Customer    | 101                 | Customer who owns the license                                 |
| license_number   | VARCHAR(20) | not_null      |                 | —           | —                    | A1234567890123      | Unique driver license number                                  |
| license_state    | VARCHAR(30) | not_null      |                 | —           | —                    | Minnesota           | State or issuing region                                       |
| license_type     | VARCHAR(20) | not_null      |                 | —           | —                    | Class D             | License type (Class D, Commercial, Motorcycle, International) |
| issue_date       | DATE        | not_null      |                 | —           | —                    | 2020-06-15 00:00:00 | Date license was issued                                       |
| expiry_date      | DATE        | not_null      |                 | —           | —                    | 2028-06-15 00:00:00 | Expiry date; must be after issue_date                         |
| license_status   | VARCHAR(20) | not_null      | ‘Active’        | —           | —                    | Active              | Status: Active, Suspended, Expired, Revoked                   |
| is_verified      | BIT         | not_null      | 0               | —           | —                    | 1                   | Indicates whether license has been verified                   |
| age_verified     | BIT         | not_null      | 0               | —           | —                    | 1                   | Confirms age eligibility (e.g., 25+ for premium cars)         |
| verified_date    | DATE        | not_null      | ‘1900-01-01’    | —           | —                    | 2025-02-23 00:00:00 | Date license was verified (default placeholder date)          |
| created_at       | DATETIME    | not_null      | GETDATE()       | —           | —                    | 2025-02-23 12:30:00 | Timestamp when license record was created                     |


### Customer.customer_address

| Attribute Name      | Data Type    | Allow Null?   | Default Value   | PK or FK?   | FK Reference Table   | Attribute Example     | Description / Business Rule                        |
|:--------------------|:-------------|:--------------|:----------------|:------------|:---------------------|:----------------------|:---------------------------------------------------|
| customer_address_id | INT          | not_null      | Auto Increment  | PK          |                      | 3201                  | Unique identifier for each customer address record |
| customer_id         | INT          | not_null      |                 | FK          | Customer.Customer    | 101                   | Customer to whom the address belongs               |
| street_address      | VARCHAR(100) | not_null      |                 |             |                      | 742 Evergreen Terrace | Primary street address                             |
| address_line2       | VARCHAR(100) |               |                 |             |                      | Apt 4B                | Second address line (optional)                     |
| city                | VARCHAR(50)  | not_null      |                 |             |                      | Minneapolis           | City of residence                                  |
| state               | VARCHAR(30)  | not_null      |                 |             |                      | Minnesota             | State or province                                  |
| zip_code            | VARCHAR(10)  | not_null      |                 |             |                      | 55408                 | ZIP or postal code                                 |


### Customer.customer_payment_method

| Attribute Name        | Data Type    | Allow Null?   | Default Value   | PK or FK?   | FK Reference Table   | Attribute Example   | Description / Business Rule                             |
|:----------------------|:-------------|:--------------|:----------------|:------------|:---------------------|:--------------------|:--------------------------------------------------------|
| payment_method_id     | INT          | not_null      | Auto Increment  | PK          |                      | 2001                | Unique identifier for each stored payment method        |
| customer_id           | INT          | not_null      |                 | FK          | Customer.Customer    | 101                 | Links payment method to the customer                    |
| payment_type          | VARCHAR(20)  | not_null      |                 |             |                      | Credit Card         | Type of payment method (Credit Card, Debit Card, etc.)  |
| card_brand            | VARCHAR(20)  | not_null      |                 |             |                      | Visa                | Card issuer or network brand (Visa, Mastercard, Amex)   |
| payment_token         | VARCHAR(100) | not_null      |                 |             |                      | tok_39Ds8sd2Hq      | Tokenized card identifier (no raw card data stored)     |
| card_last_four        | CHAR(4)      | not_null      |                 |             |                      | 4242                | Last 4 digits of the card for identification            |
| cardholder_first_name | VARCHAR(50)  | not_null      |                 |             |                      | Michael             | First name of the person on the card                    |
| cardholder_last_name  | VARCHAR(50)  |               |                 |             |                      | Thompson            | Last name of the cardholder (optional if not available) |
| expiry_month          | INT          | not_null      |                 |             |                      | 12                  | Expiration month of the card (1–12)                     |
| expiry_year           | INT          | not_null      |                 |             |                      | 2029                | Expiration year of the card                             |
| created_at            | DATETIME     | not_null      | GETDATE()       |             |                      | 2025-02-21 10:15:00 | Timestamp when payment method was created               |
| updated_at            | DATETIME     | not_null      | GETDATE()       |             |                      | 2025-02-21 10:15:00 | Timestamp when payment method was last updated          |


### True.maintenance_record

| Attribute Name         | Data Type     | Allow Null?   | Default Value   | PK or FK?   | FK Reference Table   | Attribute Example   | Description / Business Rule                            |
|:-----------------------|:--------------|:--------------|:----------------|:------------|:---------------------|:--------------------|:-------------------------------------------------------|
| maintenance_id         | INT           | not_null      | Auto Increment  | PK          |                      | 34                  | Unique maintenance record id                           |
| vehicle_id             | INT           | not_null      |                 | FK          | Vehicle              | 34                  | Refences particular vehicle for the maintenance record |
| service_provider       | VARCHAR(50)   | not_null      |                 |             |                      | Mankato Auto Shop   | Maintenance provider                                   |
| maintenance_date       | DATE          | not_null      |                 |             |                      | 2025-10-25 00:00:00 | Date of maintenance performed                          |
| maintenance_type       | VARCHAR(30)   | not_null      |                 |             |                      | Brake Replacement   | Maintenance type                                       |
| maintenance_cost       | DECIMAL(10,2) | not_null      |                 |             |                      | 350                 | Maintenance cost                                       |
| mileage_at_maintenance | DECIMAL(10,2) |               | 0               |             |                      | 36000               | Mileage at the time of Maintenance                     |
| next_due_date          | DATE          |               |                 |             |                      | 2026-04-25 00:00:00 | For preventive cycles.                                 |
| maintenance_status     | VARCHAR(20)   | not_null      | Completed       |             |                      | Completed           | completed, scheduled, pending                          |
| created_at             | DATETIME      | not_null      | Current         |             |                      | 2025-10-25 10:00:00 | Created timestamp                                      |
| updated_at             | DATETIME      | not_null      | Current         |             |                      | 2025-10-25 11:00:00 | Update timestamp.                                      |


### True.Entity Name

| Attribute Name   | Data Type   | Allow Null?   | Default Value   | PK or FK?   | FK Reference Table   | Attribute Example   | Description / Business Rule   |
|:-----------------|:------------|:--------------|:----------------|:------------|:---------------------|:--------------------|:------------------------------|
| Attribute Name   | Data Type   | Allow Null?   | Default Value   | PK or FK?   | FK Reference Table   | Attribute Example   | Description / Business Rule   |
| Attribute Name   | Data Type   | Allow Null?   | Default Value   | PK or FK?   | FK Reference Table   | Attribute Example   | Description / Business Rule   |
| Attribute Name   | Data Type   | Allow Null?   | Default Value   | PK or FK?   | FK Reference Table   | Attribute Example   | Description / Business Rule   |


### False.maintenance_inspection

| Attribute Name   | Data Type    | Allow Null?   | Default Value   | PK or FK?   | FK Reference Table   | Attribute Example          | Description / Business Rule                            |
|:-----------------|:-------------|:--------------|:----------------|:------------|:---------------------|:---------------------------|:-------------------------------------------------------|
| maintenance_id   | INT          | not_null      | Auto Increment  | PK, FK      | Maintenance_Record   | 123                        | Refrencing maintenance record for the maintenance made |
| inspection_id    | INT          | not_null      | Auto Increment  | PK, FK      | Inspection           | 123                        | Refrecing Inspection for the isse found                |
| request_date     | DATE         | nul           |                 |             |                      | 2025-10-20 00:00:00        | Date of issue report                                   |
| request_type     | VARCHAR(30)  |               |                 |             |                      | Preventive                 | E.g., Preventive, Corrective, Accident, Recall.        |
| description      | VARCHAR(200) |               |                 |             |                      | Brake replacement required | Detailed problem description                           |
| priority_level   | VARCHAR(20)  |               |                 |             |                      | High                       | Priority level, used for scheduling                    |


### False.Entity Name

| Attribute Name   | Data Type   | Allow Null?   | Default Value   | PK or FK?   | FK Reference Table   | Attribute Example   | Description / Business Rule   |
|:-----------------|:------------|:--------------|:----------------|:------------|:---------------------|:--------------------|:------------------------------|
| Attribute Name   | Data Type   | Allow Null?   | Default Value   | PK or FK?   | FK Reference Table   | Attribute Example   | Description / Business Rule   |


### True.Inspection

| Attribute Name        | Data Type     | Allow Null?   | Default Value   | PK or FK?   | FK Reference Table   | Attribute Example         | Description / Business Rule                |
|:----------------------|:--------------|:--------------|:----------------|:------------|:---------------------|:--------------------------|:-------------------------------------------|
| inspection_id         | INT           | not_null      | Auto Increment  | PK          |                      | 1001                      | Primary Key.                               |
| employee_id           | INT           | not_null      |                 | FK          | employee             | 301                       | Employee who performed the inspection      |
| vehicle_idq           | INT           | not_null      |                 | FK          | vehicle              | 501                       | Vehicle inspection performed on            |
| rental_id             | INT           |               |                 | FK          | rental_id            | 12                        | Renal inspection related to                |
| inspection_date       | DATE          | not_null      |                 |             |                      | 2025-10-10 00:00:00       | Inspection Performed date                  |
| inspection_type       | VARCHAR(4)    | not_null      |                 |             |                      | Pre                       | Pre or Post                                |
| inspection_mileage    | DECIMAL(10,2) | not_null      |                 |             |                      | 35500                     | Odometer reading at the time of inspection |
| fuel_level            | DECIMAL(5,2)  |               |                 |             |                      | 4.9                       | Fuel level ispection                       |
| inspection_media_path | VARCHAR(200)  |               |                 |             |                      | photos/inspection5010.jpg | Evidence storage.                          |
| inspection_status     | VARCHAR(30 )  | not_null      |                 |             |                      | Completed                 | Pass, Fail or Needs Review                 |
| inspection_sigoff     | BIT           | not_null      | 0               |             |                      | 1                         | Inspection signoff                         |
| created_at            | DATETIME      | not_null      | GETDATE()       |             |                      | 2025-10-28 09:00:00       | Time stamp created                         |
| updated_at            | DATETIME      |               |                 |             |                      | 2025-10-28 10:00:00       | Time stamp updated                         |


### False.Damage

| Attribute Name        | Data Type     | Allow Null?   | Default Value   | PK or FK?   | FK Reference Table   | Attribute Example   | Description / Business Rule    |
|:----------------------|:--------------|:--------------|:----------------|:------------|:---------------------|:--------------------|:-------------------------------|
| damage_id             | INT           |               | Auto Incrememt  | PK          |                      | 1900-01-12 00:00:00 | Unique record                  |
| inspection_id         | INT           |               |                 | FK          | Inspection_Tab       | 1900-02-03 00:00:00 | References Inspection Table    |
| damage_description    | VARCHAR(200)  |               |                 |             |                      | Front collision     | All the front cover is broeken |
| estimated_repair_cost | DECIMAL(10,2) |               |                 |             |                      | 2000                |                                |
| damage_severity       | VARCHAR(20)   |               |                 |             |                      | High                |                                |
| damage_status         | VARCHAR(20)   |               | Unresolved      |             |                      | In Service          |                                |
| reported_date         | DATETIME      |               | GETDATE()       |             |                      |                     |                                |


### Rental.rental

| Attribute Name   | Data Type     | Allow Null?   | Default Value   | PK or FK?   | FK Reference Table   | Attribute Example   | Description / Business Rule                         |
|:-----------------|:--------------|:--------------|:----------------|:------------|:---------------------|:--------------------|:----------------------------------------------------|
| rental_id        | INT           | not_null      | Auto Increment  | PK          |                      | 9001                | Unique identifier for the rental session            |
| reservation_id   | INT           | not_null      |                 | FK          | Rental.Reservation   | 15001               | Links rental to the original reservation            |
| customer_id      | INT           | not_null      |                 | FK          | Customer.Customer    | 205                 | Customer who is renting the vehicle                 |
| vehicle_id       | INT           | not_null      |                 | FK          | Vehicle.Vehicle      | 501                 | Vehicle assigned to the rental                      |
| rental_start     | DATETIME      | not_null      |                 |             |                      | 2025-04-01 09:00:00 | Date and time when the rental officially begins     |
| rental_end       | DATETIME      |               |                 |             |                      | 2025-04-05 10:30:00 | Final return date and time (null until completed)   |
| security_deposit | DECIMAL(10,2) | not_null      | 300             |             |                      | 300                 | Deposit charged at start of rental; default is $300 |
| rental_total     | DECIMAL(10,2) |               |                 |             |                      | 425.75              | Final rental charge after vehicle return            |
| rental_status    | VARCHAR(20)   | not_null      |                 |             |                      | Active              | Must be one of: Active, Completed, Cancelled        |
| created_at       | DATETIME      | not_null      | GETDATE()       |             |                      | 2025-03-28 15:20:00 | Timestamp when record was created                   |
| updated_at       | DATETIME      |               |                 |             |                      | 2025-04-06 11:00:00 | Last updated timestamp                              |


### inance.rental_charge_detail

| Attribute Name   | Data Type     | Allow Null?   | Default Value   | PK or FK?   | FK Reference Table   | Attribute Example   | Description / Business Rule                                 |
|:-----------------|:--------------|:--------------|:----------------|:------------|:---------------------|:--------------------|:------------------------------------------------------------|
| rental_id        | INT           | not_null      |                 | PK / FK     | Rental.Rental        | 9001                | Rental session to which the charge applies                  |
| charge_rate_id   | INT           | not_null      |                 | PK / FK     | Finance.Charge_Rate  | 120                 | Charge rate used during the rental (late fee, add-on, etc.) |
| charge_quantity  | DECIMAL(10,2) | not_null      |                 |             |                      | 3                   | Quantity applied (e.g., hours late, units of add-on)        |
| created_at       | DATETIME      | not_null      | GETDATE()       |             |                      | 2025-04-05 10:45:00 | Timestamp when charge detail was created                    |


### Rental.reservation

| Attribute Name   | Data Type   | Allow Null?   | Default Value   | PK or FK?   | FK Reference Table   |   Attribute Example | Description / Business Rule            |
|:-----------------|:------------|:--------------|:----------------|:------------|:---------------------|--------------------:|:---------------------------------------|
| reservation_id   | INT         | not_null      | Auto Increment  | PK          |                      |               10001 | Unique identifier for each reservation |


### True.reservation

| Attribute Name       | Data Type   | Allow Null?   | Default Value   | PK or FK?   | FK Reference Table   | Attribute Example   | Description / Business Rule                                      |
|:---------------------|:------------|:--------------|:----------------|:------------|:---------------------|:--------------------|:-----------------------------------------------------------------|
| customer_id          | INT         | not_null      |                 | FK          | Customer.Customer    | 205                 | References the customer making the reservation                   |
| vehicle_id           | INT         | not_null      |                 | FK          | Vehicle.Vehicle      | 501                 | Vehicle assigned to this reservation                             |
| pickup_branch_id     | INT         | not_null      |                 | FK          | Operation.Branch     | 1                   | Branch where pickup occurs                                       |
| dropoff_branch_id    | INT         |               |                 | FK          | Operation.Branch     | 3                   | Branch where vehicle will be returned (NULL = same as pickup)    |
| reservation_date     | DATETIME    | not_null      | GETDATE()       |             |                      | 2025-03-21 10:15:00 | Date and time when the reservation was created                   |
| pickup_datetime      | DATETIME    | not_null      |                 |             |                      | 2025-04-01 09:00:00 | Scheduled pickup date and time                                   |
| return_datetime      | DATETIME    | not_null      |                 |             |                      | 2025-04-05 09:00:00 | Scheduled return date and time; must be after pickup             |
| rental_duration_type | VARCHAR(10) | not_null      |                 |             |                      | Daily               | One of: Hourly, Daily, Weekly, Monthly                           |
| reservation_status   | VARCHAR(20) | not_null      |                 |             |                      | Confirmed           | Status of reservation (Pending, Confirmed, Cancelled, Completed) |
| confirmation_number  | VARCHAR(20) | not_null      |                 |             |                      | CNF-A92011          | Unique confirmation code assigned to customer                    |
| created_at           | DATETIME    | not_null      | GETDATE()       |             |                      | 2025-03-21 10:15:00 | Timestamp when record was created                                |
| updated_at           | DATETIME    |               |                 |             |                      | 2025-03-21 12:30:00 | Timestamp when reservation was last updated                      |


### Rental.reservation_charge

| Attribute Name        | Data Type   | Allow Null?   | Default Value   | PK or FK?   | FK Reference Table   |   Attribute Example | Description / Business Rule                                   |
|:----------------------|:------------|:--------------|:----------------|:------------|:---------------------|--------------------:|:--------------------------------------------------------------|
| reservation_charge_id | INT         | not_null      | Auto Increment  | PK          |                      |                 501 | Unique identifier for each reservation charge record          |
| reservation_id        | INT         | not_null      |                 | FK          | Rental.Reservation   |               15001 | Links the charge to a specific reservation                    |
| charge_rate_id        | INT         | not_null      |                 | FK          | Finance.Charge_Rate  |                 110 | Identifies which add-on or fee is being applied               |
| quantity              | INT         | not_null      | 0               |             |                      |                   2 | Quantity of the charge applied (e.g., 1 GPS, 2 extra drivers) |


### Finance.rental_estimate

| Attribute Name   | Data Type   | Allow Null?   | Default Value   | PK or FK?   | FK Reference Table   |   Attribute Example | Description / Business Rule                |
|:-----------------|:------------|:--------------|:----------------|:------------|:---------------------|--------------------:|:-------------------------------------------|
| estimate_id      | INT         | not_null      | Auto Increment  | PK          |                      |                1501 | Unique identifier for each rental estimate |


### True.rental_estimate

| Attribute Name   | Data Type     | Allow Null?   | Default Value                         | PK or FK?   | FK Reference Table   | Attribute Example   | Description / Business Rule                            |
|:-----------------|:--------------|:--------------|:--------------------------------------|:------------|:---------------------|:--------------------|:-------------------------------------------------------|
| reservation_id   | INT           | not_null      |                                       | FK          | Rental.Reservation   | 10001               | Reservation for which cost estimate is generated       |
| vehicle_rate_id  | INT           | not_null      |                                       | FK          | Finance.Vehicle_Rate | 301                 | Rate plan used for calculating base rental cost        |
| base_rate        | DECIMAL(10,2) | not_null      |                                       |             |                      | 250                 | Base rental cost (rate × duration)                     |
| surcharge_total  | DECIMAL(10,2) |               | 0                                     |             |                      | 30                  | Sum of add-ons, service fees, etc.                     |
| discount_total   | DECIMAL(10,2) |               | 0                                     |             |                      | 15                  | Any promotional or loyalty discounts applied           |
| tax_total        | DECIMAL(10,2) |               | 0                                     |             |                      | 20                  | Total taxes applied to the estimate                    |
| total_estimate   | DECIMAL(10,2) | not_null      | (base + surcharges - discounts + tax) |             |                      | 285                 | Final computed amount customer sees during reservation |
| created_at       | DATETIME      | not_null      | GETDATE()                             |             |                      | 2025-02-18 14:10:00 | Timestamp when record was created                      |


### 10.Entity Name

| Attribute Name   | Data Type   | Allow Null?   | Default Value   | PK or FK?   | FK Reference Table   | Attribute Example   | Description / Business Rule   |
|:-----------------|:------------|:--------------|:----------------|:------------|:---------------------|:--------------------|:------------------------------|
| Attribute Name   | Data Type   | Allow Null?   | Default Value   | PK or FK?   | FK Reference Table   | Attribute Example   | Description / Business Rule   |


### True.vehicle_rate

| Attribute Name       | Data Type     | Allow Null?   | Default Value   | PK or FK?   | FK Reference Table   |   Attribute Example | Description / Business Rule    |
|:---------------------|:--------------|:--------------|:----------------|:------------|:---------------------|--------------------:|:-------------------------------|
| vehicle_rate_id      | INT           | not_null      | Auto Increment  | PK          |                      |             2001    | Unique ids for vehicle rate    |
| vehicle_class_id     | INT           | not_null      | Auto Increment  | FK          | vehicle_class        |                1    | Vehicle_Class                  |
| branch_id            | INT           | not_null      |                 | FK          | branch               |                2    | Branch                         |
| vehicle_hourly_rate  | DECIMAL(10,2) |               |                 |             |                      |               49.99 | Hourly rate                    |
| vehicle_daily_rate   | DECIMAL(10,2) |               |                 |             |                      |               49.99 | Amount for the daily rate type |
| vehicle_weekly_rate  | DECIMAL(10,2) |               |                 |             |                      |               49.99 | weekly rate                    |
| vehicle_monthly_rate | DECIMAL(10,2) |               |                 |             |                      |               49.99 | monthly rate                   |


### Finance.Entity Name

| Attribute Name   | Data Type   | Allow Null?   | Default Value   | PK or FK?   | FK Reference Table   | Attribute Example   | Description / Business Rule   |
|:-----------------|:------------|:--------------|:----------------|:------------|:---------------------|:--------------------|:------------------------------|
| Attribute Name   | Data Type   | Allow Null?   | Default Value   | PK or FK?   | FK Reference Table   | Attribute Example   | Description / Business Rule   |
| Attribute Name   | Data Type   | Allow Null?   | Default Value   | PK or FK?   | FK Reference Table   | Attribute Example   | Description / Business Rule   |
| Attribute Name   | Data Type   | Allow Null?   | Default Value   | PK or FK?   | FK Reference Table   | Attribute Example   | Description / Business Rule   |
| Attribute Name   | Data Type   | Allow Null?   | Default Value   | PK or FK?   | FK Reference Table   | Attribute Example   | Description / Business Rule   |
| Attribute Name   | Data Type   | Allow Null?   | Default Value   | PK or FK?   | FK Reference Table   | Attribute Example   | Description / Business Rule   |
| Attribute Name   | Data Type   | Allow Null?   | Default Value   | PK or FK?   | FK Reference Table   | Attribute Example   | Description / Business Rule   |


### Finance.charge_rate

| Attribute Name       | Data Type     | Allow Null?   | Default Value   | PK or FK?   | FK Reference Table   | Attribute Example   | Description / Business Rule                               |
|:---------------------|:--------------|:--------------|:----------------|:------------|:---------------------|:--------------------|:----------------------------------------------------------|
| charge_rate_id       | INT           | not_null      | Auto Increment  | PK          |                      | 101                 | Unique identifier for each charge rate entry              |
| charge_type_id       | INT           | not_null      |                 | FK          | Finance.Charge_Type  | 5                   | Links to the type of charge this rate applies to          |
| charge_unit_rate     | DECIMAL(10,2) | not_null      |                 |             |                      | 9.99                | Price applied per unit based on charge basis; must be ≥ 0 |
| effective_start_date | DATE          | not_null      | GETDATE()       |             |                      | 2024-01-01 00:00:00 | Date when this rate becomes effective                     |
| effective_end_date   | DATE          |               |                 |             |                      | 2025-01-01 00:00:00 | Null = still active; used for historical rate tracking    |
| created_at           | DATETIME      | not_null      | GETDATE()       |             |                      | 2025-02-15 12:30:00 | Timestamp when the record was created                     |
| updated_at           | DATETIME      |               |                 |             |                      | 2025-02-20 09:10:00 | Timestamp when the record was last updated                |


### Finance.estimate_charge

| Attribute Name   | Data Type     | Allow Null?   | Default Value   | PK or FK?   | FK Reference Table      |   Attribute Example | Description / Business Rule                             |
|:-----------------|:--------------|:--------------|:----------------|:------------|:------------------------|--------------------:|:--------------------------------------------------------|
| charge_rate_id   | INT           | not_null      |                 | PK / FK     | Finance.Charge_Rate     |                 105 | Identifies which charge rate is applied to the estimate |
| estimate_id      | INT           | not_null      |                 | PK / FK     | Finance.Rental_Estimate |                1501 | Links this charge to a specific rental estimate         |
| charge_quantity  | DECIMAL(10,2) | not_null      |                 |             |                         |                   2 | Quantity of the charge (e.g., days, units, hours)       |


### Finance.estimate_tax

| Attribute Name   | Data Type     | Allow Null?   | Default Value   | PK or FK?   | FK Reference Table      | Attribute Example   | Description / Business Rule                     |
|:-----------------|:--------------|:--------------|:----------------|:------------|:------------------------|:--------------------|:------------------------------------------------|
| estimate_id      | INT           | not_null      |                 | PK / FK     | Finance.Rental_Estimate | 1501                | Estimate for which the tax is applied           |
| tax_rate_id      | INT           | not_null      |                 | PK / FK     | Finance.Tax_Rate        | 12                  | Tax rate used to calculate tax amount           |
| tax_amount       | DECIMAL(10,2) | not_null      |                 |             |                         | 18.75               | Total tax amount for this estimate and tax type |
| created_at       | DATETIME      | not_null      | GETDATE()       |             |                         | 2025-02-21 10:45:00 | Timestamp when tax record was created           |


### Finance.estimate_promotion

| Attribute Name   | Data Type     | Allow Null?   | Default Value   | PK or FK?   | FK Reference Table      | Attribute Example   | Description / Business Rule                           |
|:-----------------|:--------------|:--------------|:----------------|:------------|:------------------------|:--------------------|:------------------------------------------------------|
| estimate_id      | INT           | not_null      |                 | PK / FK     | Finance.Rental_Estimate | 1501                | Rental estimate to which the promotion is applied     |
| promotion_id     | INT           | not_null      |                 | PK / FK     | Finance.Promotion       | 101                 | Promotion applied to the estimate                     |
| discount_amount  | DECIMAL(10,2) |               |                 |             |                         | 25                  | Discount amount calculated from this promotion        |
| applied          | BIT           | not_null      | 1               |             |                         | 1                   | Indicates whether the promotion was applied (1 = yes) |
| created_at       | DATETIME      | not_null      | GETDATE()       |             |                         | 2025-02-21 11:15:00 | Timestamp when record was created                     |


### Finance.charge_type

| Attribute Name      | Data Type   | Allow Null?   | Default Value   | PK or FK?   | FK Reference Table   | Attribute Example     | Description / Business Rule                                                           |
|:--------------------|:------------|:--------------|:----------------|:------------|:---------------------|:----------------------|:--------------------------------------------------------------------------------------|
| charge_type_id      | INT         | not_null      | Auto Increment  | PK          |                      | 1                     | Unique identifier for each charge type                                                |
| charge_code         | VARCHAR(10) | not_null      |                 |             |                      | GPS                   | Short unique code identifying the charge (e.g., BASE, GPS, INS)                       |
| charge_name         | VARCHAR(50) | not_null      |                 |             |                      | GPS Navigation System | Descriptive name of the charge                                                        |
| charge_category     | VARCHAR(30) |               |                 |             |                      | Add-On                | Category of charge (Rental, Insurance, Fee, Add-On, etc.)                             |
| charge_basis        | VARCHAR(30) |               |                 |             |                      | Per Day               | Defines how the charge is applied (Per Day, Flat Rate, Per Hour, Per Week, Per Month) |
| CK_ChargeType_Basis | CHECK       | not_null      |                 |             |                      |                       | Ensures charge_basis matches allowed values                                           |


### Finance.tax_type

| Attribute Name   | Data Type    | Allow Null?   | Default Value   | PK or FK?   | FK Reference Table   | Attribute Example                   | Description / Business Rule                           |
|:-----------------|:-------------|:--------------|:----------------|:------------|:---------------------|:------------------------------------|:------------------------------------------------------|
| tax_type_id      | INT          | not_null      | Auto Increment  | PK          |                      | 1                                   | Unique identifier for each tax type                   |
| tax_code         | VARCHAR(10)  | not_null      |                 |             |                      | STATE                               | Short code for the tax (STATE, CITY, ENV, TOUR, etc.) |
| tax_name         | VARCHAR(50)  | not_null      |                 |             |                      | State Tax                           | Full descriptive name of the tax                      |
| tax_description  | VARCHAR(150) |               |                 |             |                      | Tax applied by the state government | Additional notes or official description              |


### Finance.payment_id

| Attribute Name    | Data Type     | Allow Null?    | Default Value   | PK or FK?   | FK Reference Table                        | Attribute Example   | Description / Business Rule                   |
|:------------------|:--------------|:---------------|:----------------|:------------|:------------------------------------------|:--------------------|:----------------------------------------------|
| INT               | 7001          | Auto Increment | PK              |             | Unique identifier for each rental payment | not_null            |                                               |
| payment_method_id | INT           | not_null       |                 | FK          | Customer.Customer_Payment_Method          | 2001                | Payment method used for this transaction      |
| rental_id         | INT           | not_null       |                 | FK          | Rental.Rental                             | 9001                | Rental session being paid for                 |
| payment_date      | DATETIME      | not_null       |                 |             |                                           | 2025-04-05 12:45:00 | Timestamp when payment was made               |
| payment_amount    | DECIMAL(10,2) | not_null       |                 |             |                                           | 425.75              | Amount paid by the customer                   |
| payment_status    | VARCHAR(20)   | not_null       |                 |             |                                           | Completed           | Status (Completed, Pending, Failed, Refunded) |
| reference_number  | VARCHAR(30)   | not_null       |                 |             |                                           | TXN-2394A8D29       | Unique transaction reference code             |
| reference_number  | VARCHAR(30)   | not_null       |                 |             |                                           | 389482479238        |                                               |


### Finance.refund

| Attribute Name   | Data Type     | Allow Null?   | Default Value   | PK or FK?   | FK Reference Table     | Attribute Example     | Description / Business Rule                          |
|:-----------------|:--------------|:--------------|:----------------|:------------|:-----------------------|:----------------------|:-----------------------------------------------------|
| refund_id        | INT           | not_null      | Auto Increment  | PK          |                        | 8001                  | Unique identifier for each refund transaction        |
| payment_id       | INT           | not_null      |                 | FK          | Finance.Rental_Payment | 7001                  | Identifies the payment that is being refunded        |
| refund_date      | DATETIME      | not_null      |                 |             |                        | 2025-04-06 09:15:00   | Date and time when the refund was issued             |
| refund_amount    | DECIMAL(10,2) | not_null      |                 |             |                        | 50                    | Amount refunded to the customer                      |
| refund_reason    | VARCHAR(100)  |               |                 |             |                        | Overcharge adjustment | Optional reason describing why the refund was issued |


### Finance.promotion

| Attribute Name        | Data Type     | Allow Null?   | Default Value   | PK or FK?   | FK Reference Table   | Attribute Example         | Description / Business Rule                                 |
|:----------------------|:--------------|:--------------|:----------------|:------------|:---------------------|:--------------------------|:------------------------------------------------------------|
| promotion_id          | INT           | not_null      | Auto Increment  | PK          |                      | 101                       | Unique identifier for each promotion                        |
| promotion_code        | VARCHAR(20)   | not_null      |                 |             |                      | SUMMER25                  | Unique code entered by customer; must be unique             |
| promotion_name        | VARCHAR(50)   | not_null      |                 |             |                      | Summer Discount           | Title/name of the promotion                                 |
| promotion_description | VARCHAR(150)  |               |                 |             |                      | 25% off on weekly rentals | Optional description for internal or customer reference     |
| promotion_value       | DECIMAL(10,2) | not_null      |                 |             |                      | 25                        | Value of the promotion; percentage or amount based on logic |
| promotion_type        | VARCHAR(30)   | not_null      |                 |             |                      | Seasonal                  | One of: Public, Seasonal, Referral, Corporate, Loyalty      |
| promotion_start_date  | DATETIME      | not_null      |                 |             |                      | 2025-06-01 00:00:00       | Start date/time when promotion becomes active               |
| promotion_end_date    | DATETIME      | not_null      |                 |             |                      | 2025-09-01 23:59:00       | End date/time; must be after start date                     |
| is_active             | BIT           | not_null      | 1               |             |                      | 1                         | Indicates if promotion is currently active                  |
| created_at            | DATETIME      | not_null      | GETDATE()       |             |                      | 2025-02-15 10:30:00       | Timestamp when promotion record was created                 |


### Finance.tax_rate

| Attribute Name       | Data Type    | Allow Null?   | Default Value   | PK or FK?   | FK Reference Table   | Attribute Example   | Description / Business Rule                                             |
|:---------------------|:-------------|:--------------|:----------------|:------------|:---------------------|:--------------------|:------------------------------------------------------------------------|
| tax_rate_id          | INT          | not_null      | Auto Increment  | PK          |                      | 10                  | Unique identifier for each tax rate record                              |
| tax_type_id          | INT          | not_null      |                 | FK          | Finance.Tax_Type     | 1                   | Identifies which tax type this rate belongs to (STATE, CITY, ENV, etc.) |
| branch_id            | INT          | not_null      |                 | FK          | Operation.Branch     | 3                   | Branch where this tax rate applies                                      |
| tax_rate             | DECIMAL(5,2) |               |                 |             |                      | 7.5                 | Percentage tax rate; must be ≥ 0                                        |
| effective_start_date | DATE         | not_null      |                 |             |                      | 2025-01-01 00:00:00 | Start date when this tax rate becomes valid                             |
| effective_end_date   | DATE         |               |                 |             |                      | 2026-01-01 00:00:00 | Null means tax rate is still active                                     |


### Finance.invoice

| Attribute Name   | Data Type     | Allow Null?   | Default Value   | PK or FK?   | FK Reference Table   | Attribute Example   | Description / Business Rule                       |
|:-----------------|:--------------|:--------------|:----------------|:------------|:---------------------|:--------------------|:--------------------------------------------------|
| invoice_id       | INT           | not_null      | Auto Increment  | PK          |                      | 5001                | Unique identifier for each invoice                |
| branch_id        | INT           | not_null      |                 | FK          | Operation.Branch     | 1                   | Branch issuing the invoice                        |
| rental_id        | INT           | not_null      |                 | FK          | Rental.Rental        | 9001                | Rental session associated with this invoice       |
| customer_id      | INT           | not_null      |                 | FK          | Customer.Customer    | 205                 | Customer receiving the invoice                    |
| invoice_date     | DATETIME      | not_null      | GETDATE()       |             |                      | 2025-04-06 10:30:00 | Date the invoice was generated                    |
| subtotal_amount  | DECIMAL(10,2) | not_null      |                 |             |                      | 350                 | Total before taxes and discounts                  |
| tax_amount       | DECIMAL(10,2) | not_null      |                 |             |                      | 28.5                | Total tax applied                                 |
| discount_amount  | DECIMAL(10,2) | not_null      | 0               |             |                      | 15                  | Discount applied (promotions, loyalty, etc.)      |
| total_amount     | DECIMAL(10,2) | not_null      |                 |             |                      | 363.5               | Final amount customer pays after all calculations |
| created_at       | DATETIME      |               | GETDATE()       |             |                      | 2025-04-06 10:30:00 | Timestamp when invoice record was created         |


### Finance.invoice_line

| Attribute Name   | Data Type            | Allow Null?   | Default Value         | PK or FK?   | FK Reference Table   | Attribute Example    | Description / Business Rule                                       |
|:-----------------|:---------------------|:--------------|:----------------------|:------------|:---------------------|:---------------------|:------------------------------------------------------------------|
| invoice_line_id  | INT                  | not_null      | Auto Increment        | PK          |                      | 95001                | Unique identifier for each invoice line item                      |
| invoice_id       | INT                  | not_null      |                       | FK          | Finance.Invoice      | 5001                 | Identifies which invoice this line belongs to                     |
| rental_id        | INT                  |               |                       | FK          | Rental.Rental        | 9001                 | Optional reference to rental session (for rental-related charges) |
| line_description | VARCHAR(200)         | not_null      |                       |             |                      | GPS Add-On (Per Day) | Description of the charge or service                              |
| quantity         | DECIMAL(10,2)        | not_null      | 1                     |             |                      | 2                    | Number of units for this line item                                |
| unit_price       | DECIMAL(10,2)        | not_null      |                       |             |                      | 12.5                 | Price per unit                                                    |
| line_amount      | COMPUTED (PERSISTED) | not_null      | quantity * unit_price |             |                      | 25                   | Automatically calculated line total                               |
| tax_rate         | DECIMAL(10,2)        |               |                       |             |                      | 7.5                  | Tax rate (%) applied to this line                                 |
| tax_amount       | DECIMAL(10,2)        |               |                       |             |                      | 1.88                 | Tax dollar amount for the line item                               |
| created_at       | DATETIME             |               | GETDATE()             |             |                      | 2025-04-06 11:00:00  | Timestamp when the line item was created                          |


### Operation.Branch

| Attribute Name   | Data Type   | Allow Null?   | Default Value   | PK or FK?   | FK Reference Table   | Attribute Example   | Description / Business Rule                         |
|:-----------------|:------------|:--------------|:----------------|:------------|:---------------------|:--------------------|:----------------------------------------------------|
| branch_id        | INT         | not_null      | Auto Increment  | PK          |                      | 1                   | Unique identifier for each branch                   |
| branch_name      | VARCHAR(50) | not_null      |                 |             |                      | Minneapolis Airport | Name of the branch                                  |
| branch_type      | VARCHAR(50) | not_null      |                 |             |                      | Airport             | Type of branch (Airport, City, Suburban)            |
| phone_number     | VARCHAR(15) | not_null      |                 |             |                      | 507-555-1000        | Primary phone number of the branch                  |
| email            | VARCHAR(50) | not_null      |                 |             |                      | msp@carrental.com   | Official branch email address                       |
| branch_status    | VARCHAR(20) | not_null      | ‘Active’        |             |                      | Active              | Current status of branch (Active, Inactive, Closed) |


### Operation.branch_address

| Attribute Name    | Data Type    | Allow Null?   | Default Value   | PK or FK?   | FK Reference Table   | Attribute Example   | Description / Business Rule              |
|:------------------|:-------------|:--------------|:----------------|:------------|:---------------------|:--------------------|:-----------------------------------------|
| branch_address_id | INT          | not_null      | Auto Increment  | PK          |                      | 6101                | Unique identifier for a branch address   |
| branch_id         | INT          | not_null      |                 | FK          | Operation.Branch     | 1                   | Branch to which this address belongs     |
| street_address    | VARCHAR(100) | not_null      |                 |             |                      | 2500 Hennepin Ave   | Primary street address of the branch     |
| address_line2     | VARCHAR(100) |               |                 |             |                      | Suite 200           | Secondary address information (optional) |
| city              | VARCHAR(50)  | not_null      |                 |             |                      | Minneapolis         | City where the branch is located         |
| state             | VARCHAR(30)  | not_null      |                 |             |                      | Minnesota           | State or province                        |
| zip_code          | VARCHAR(10)  | not_null      |                 |             |                      | 55403               | ZIP or postal code                       |


### Operation.operating_hours

| Attribute Name      | Data Type   | Allow Null?   | Default Value   | PK or FK?   | FK Reference Table   | Attribute Example   | Description / Business Rule                               |
|:--------------------|:------------|:--------------|:----------------|:------------|:---------------------|:--------------------|:----------------------------------------------------------|
| operating_hours_id  | INT         | not_null      | Auto Increment  | PK          |                      | 5101                | Unique identifier for the operating hours record          |
| branch_id           | INT         | not_null      |                 | FK          | Operation.Branch     | 1                   | Branch associated with these hours                        |
| day_of_week         | VARCHAR(10) | not_null      |                 |             |                      | Monday              | Day of the week; must be a valid weekday name             |
| open_time           | TIME        | not_null      |                 |             |                      | 08:00:00            | Opening time for the branch                               |
| close_time          | TIME        | not_null      |                 |             |                      | 20:00:00            | Closing time for the branch; must be later than open_time |
| after_hours_dropoff | BIT         | not_null      | 0               |             |                      | 1                   | Indicates if after-hours dropoff is allowed (1 = yes)     |
| created_at          | DATETIME    | not_null      | GETDATE()       |             |                      | 2025-02-23 09:20:00 | Timestamp when the record was created                     |


### Operation.Entity Name

| Attribute Name   | Data Type   | Allow Null?   | Default Value   | PK or FK?   | FK Reference Table   | Attribute Example   | Description / Business Rule   |
|:-----------------|:------------|:--------------|:----------------|:------------|:---------------------|:--------------------|:------------------------------|
| Attribute Name   | Data Type   | Allow Null?   | Default Value   | PK or FK?   | FK Reference Table   | Attribute Example   | Description / Business Rule   |
| Attribute Name   | Data Type   | Allow Null?   | Default Value   | PK or FK?   | FK Reference Table   | Attribute Example   | Description / Business Rule   |
| Attribute Name   | Data Type   | Allow Null?   | Default Value   | PK or FK?   | FK Reference Table   | Attribute Example   | Description / Business Rule   |


### Operation.employee

| Attribute Name   | Data Type   | Allow Null?   | Default Value   | PK or FK?   | FK Reference Table      | Attribute Example              | Description / Business Rule                               |
|:-----------------|:------------|:--------------|:----------------|:------------|:------------------------|:-------------------------------|:----------------------------------------------------------|
| employee_id      | INT         | not_null      | Auto Increment  | PK          |                         | 3001                           | Unique identifier for each employee                       |
| branch_id        | INT         | not_null      |                 | FK          | Operation.Branch        | 1                              | Branch where the employee works                           |
| employee_role_id | INT         | not_null      |                 | FK          | Operation.Employee_Role | 5                              | Role defining permissions and position                    |
| first_name       | VARCHAR(30) | not_null      |                 |             |                         | Michael                        | Employee’s first name                                     |
| middle_name      | VARCHAR(30) |               |                 |             |                         | A                              | Employee’s middle name (optional)                         |
| last_name        | VARCHAR(30) | not_null      |                 |             |                         | Thompson                       | Employee’s last name                                      |
| email            | VARCHAR(50) | not_null      |                 |             |                         | michael.thompson@carrental.com | Unique company email                                      |
| phone_number     | VARCHAR(15) | not_null      |                 |             |                         | 507-555-1010                   | Employee’s contact number                                 |
| date_of_birth    | DATE        | not_null      |                 |             |                         | 1988-05-14 00:00:00            | Employee’s birthdate                                      |
| gender           | VARCHAR(10) | not_null      |                 |             |                         | Male                           | Must be Male, Female, or Other                            |
| hire_date        | DATE        | not_null      |                 |             |                         | 2020-03-01 00:00:00            | Date employee was hired                                   |
| status           | VARCHAR(20) | not_null      |                 |             |                         | Active                         | Employment status (Active, On Leave, Terminated, Retired) |


### Operation.employee_role

| Attribute Name   | Data Type   | Allow Null?   | Default Value   | PK or FK?   | FK Reference Table   | Attribute Example   | Description / Business Rule                                  |
|:-----------------|:------------|:--------------|:----------------|:------------|:---------------------|:--------------------|:-------------------------------------------------------------|
| employee_role_id | INT         | not_null      | Auto Increment  | PK          |                      | 10                  | Unique identifier for each employee role                     |
| role             | VARCHAR(30) | not_null      |                 |             |                      | Branch Manager      | Name of the employee role                                    |
| access_level     | VARCHAR(20) |               |                 |             |                      | Manager             | Defines system access level (Admin, Manager, Staff, Limited) |


### True.employee_address

| Attribute Name      | Data Type   | Allow Null?   | Default Value   | PK or FK?   | FK Reference Table   | Attribute Example   | Description / Business Rule   |
|:--------------------|:------------|:--------------|:----------------|:------------|:---------------------|:--------------------|:------------------------------|
| employee_address_id | INT         | not_null      | Auto Increment  | PK          |                      | 901                 |                               |
| employee_id         | INT         | not_null      |                 | FK          | employee             | 501                 | Employee                      |
| street_address      | VARCHAR(50) | not_null      |                 |             |                      | 45 Oak Street       |                               |
| address_line2       | VARCHAR(50) |               |                 |             |                      | Apt 3B              |                               |
| city                | VARCHAR(30) | not_null      |                 |             |                      | Mankato             |                               |
| state               | VARCHAR(30) | not_null      |                 |             |                      | MN                  |                               |
| zip                 | INT         | not_null      |                 |             |                      | 56001               |                               |


### Operation.expense_category

| Attribute Name       | Data Type    | Allow Null?   | Default Value   | PK or FK?   | FK Reference Table   | Attribute Example                  | Description / Business Rule                   |
|:---------------------|:-------------|:--------------|:----------------|:------------|:---------------------|:-----------------------------------|:----------------------------------------------|
| expense_category_id  | INT          | not_null      | Auto Increment  | PK          |                      | 101                                | Unique identifier for each expense category   |
| category_name        | VARCHAR(50)  | not_null      |                 |             |                      | Fuel Expense                       | Unique name of the expense category           |
| category_description | VARCHAR(150) |               |                 |             |                      | Expenses related to fuel purchases | Optional detailed explanation of the category |
| created_at           | DATETIME     | not_null      | GETDATE()       |             |                      | 2025-02-22 12:30:00                | Timestamp when the category was created       |
| updated_at           | DATETIME     |               |                 |             |                      | 2025-02-23 08:45:00                | Timestamp of last update                      |


### Operation.branch_expenses

| Attribute Name      | Data Type     | Allow Null?   | Default Value   | PK or FK?   | FK Reference Table         | Attribute Example                        | Description / Business Rule                          |
|:--------------------|:--------------|:--------------|:----------------|:------------|:---------------------------|:-----------------------------------------|:-----------------------------------------------------|
| expense_id          | INT           | not_null      | Auto Increment  | PK          |                            | 501                                      | Unique identifier for each branch expense entry      |
| branch_id           | INT           | not_null      |                 | FK          | Operation.Branch           | 3                                        | Branch where the expense occurred                    |
| expense_category_id | INT           | not_null      |                 | FK          | Operation.Expense_Category | 101                                      | Category of expense (fuel, utilities, repairs, etc.) |
| vendor_name         | VARCHAR(50)   | not_null      |                 |             |                            | Firestone Auto Center                    | Vendor or company paid for the expense               |
| expense_description | VARCHAR(150)  |               |                 |             |                            | Oil and filter change for fleet vehicles | Optional additional details about the expense        |
| amount              | DECIMAL(10,2) | not_null      |                 |             |                            | 189.99                                   | Total cost incurred for this expense                 |
| expense_date        | DATETIME      | not_null      | GETDATE()       |             |                            | 2025-02-22 14:10:00                      | Date the expense was recorded                        |


### Operation.employee_address

| Attribute Name      | Data Type    | Allow Null?   | Default Value   | PK or FK?   | FK Reference Table   | Attribute Example   | Description / Business Rule                   |
|:--------------------|:-------------|:--------------|:----------------|:------------|:---------------------|:--------------------|:----------------------------------------------|
| employee_address_id | INT          | not_null      | Auto Increment  | PK          |                      | 4101                | Unique identifier for each employee address   |
| employee_id         | INT          | not_null      |                 | FK          | Operation.Employee   | 3001                | Employee to whom the address belongs          |
| street_address      | VARCHAR(100) | not_null      |                 |             |                      | 123 Oakwood Ave     | Primary street address                        |
| address_line2       | VARCHAR(100) |               |                 |             |                      | Apt 12B             | Secondary address information (optional)      |
| city                | VARCHAR(50)  | not_null      |                 |             |                      | Minneapolis         | City of residence                             |
| state               | VARCHAR(30)  | not_null      |                 |             |                      | Minnesota           | State/province of residence                   |
| zip_code            | VARCHAR(10)  | not_null      |                 |             |                      | 55408               | ZIP or postal code                            |
| created_at          | DATETIME     | not_null      | GETDATE()       |             |                      | 2025-02-22 15:30:00 | Timestamp when the address record was created |
| updated_at          | DATETIME     |               |                 |             |                      | 2025-02-23 11:10:00 | Timestamp when the record was last updated    |


## Relationships Notes

| Parent                                   | Child                   | Relationship Name   | Cardinality   | Modality                                  (1 - required, 0 -Optional)   | Line Type   | Notes                                                                                                                                    |
|:-----------------------------------------|:------------------------|:--------------------|:--------------|:------------------------------------------------------------------------|:------------|:-----------------------------------------------------------------------------------------------------------------------------------------|
| Customer                                 | Customer_Address        | has                 | 1 : M         | 1 : 1                                                                   | Dashed      | Each customer must have a valid address to rent a car; an address belongs to exactly one customer. A customer may have multiple address. |
| Customer                                 | License                 | provides            | 1 : M         | 1 : 1                                                                   | Dashed      | A customer have must have a license to rent a car; a license belongs to a one customer only.                                             |
| Customer                                 | Customer_Payment_Method | has                 | 1 : M         | 1 : 0                                                                   | Dashed      | A customer can have multiple payment methods; a payment method belongs to one customer only.                                             |
| Customer                                 | Reservation             | makes               | 1 : M         | 1 : 0                                                                   | Dashed      | A customer can make multiple resservations, however, a reservation is related with only one customer at a time.                          |
|                                          |                         | makes               | 1 : M         | Required on Customer side, Optional on Reservation                      | Dashed      |                                                                                                                                          |
|                                          |                         | has                 | 1 : M         | Required on Customer side, Optional on Rental                           | Dashed      |                                                                                                                                          |
|                                          |                         | triggers            | 1 : M         | Required on Customer side, Optional on Log                              | Dashed      |                                                                                                                                          |
| Vehicle Schema                           |                         |                     |               |                                                                         |             |                                                                                                                                          |
| Parent → Child                           |                         | Relationship Name   | Cardinality   | Modality                                                                | Line Type   | Notes                                                                                                                                    |
| Vehicle_Class → Vehicle                  |                         | categorizes         | 1 : M         | Required on Vehicle side, Optional on Vehicle_Class side                | Dashed      | Each class (Economy, Luxury, etc.) defines many vehicles. Every vehicle must belong to one class.                                        |
| Vehicle_Type → Vehicle                   |                         | defines             | 1 : M         | Required on Vehicle side, Optional on Vehicle_Type side                 | Dashed      | Each vehicle type (Sedan, SUV, etc.) can define many vehicles.                                                                           |
| Fuel_Type → Vehicle                      |                         | powers              | 1 : M         | Required on Vehicle side, Optional on Fuel_Type side                    | Dashed      | Each fuel type (Gasoline, Diesel, Electric) can power many vehicles. Every vehicle must have one fuel type.                              |
| Vehicle_Purchase → Vehicle               |                         | acquired_in         | 1 : M         | Required on Vehicle side, Optional on Vehicle_Purchase side             | Dashed      | Each purchase record may include multiple vehicles. Each vehicle must reference one purchase record.                                     |
| Vehicle → Vehicle_Warranty               |                         | covered_by          | 1 : 0..1      | Optional on both sides                                                  | Dashed      | Not every vehicle has a warranty. Each warranty belongs to exactly one vehicle.                                                          |
| Vehicle → Vehicle_Registration           |                         | registered_with     | 1 : M         | Required on Vehicle side, Optional on Registration side                 | Dashed      | A vehicle may have multiple registrations over time (renewals). Each registration belongs to one vehicle.                                |
| Branch → Vehicle                         |                         | assigned_to         | 1 : M         | Required on Vehicle side, Optional on Branch side                       | Dashed      | Each branch manages many vehicles; each vehicle is assigned to one current branch.                                                       |
| Vehicle → Reservation                    |                         | reserved_in         | 1 : M         | Required on Vehicle side, Optional on Reservation side                  | Dashed      | Each vehicle may appear in multiple reservations but only one active at a time.                                                          |
| Vehicle → Rental                         |                         | used_in             | 1 : M         | Required on Vehicle side, Optional on Rental side                       | Dashed      | A vehicle can have multiple rental transactions over time.                                                                               |
| Vehicle → Maintenance (if applicable)    |                         | undergoes           | 1 : M         | Required on Maintenance side, Optional on Vehicle side                  | Dashed      | One vehicle can undergo multiple maintenance jobs.                                                                                       |
| Parent → Child                           |                         | Relationship Name   | Cardinality   | Modality                                                                | Line Type   | Notes                                                                                                                                    |
| Vehicle → Maintenance_Request            |                         | triggers            | 1 : M         | Required on Vehicle side, Optional on Request side                      | Dashed      | Each vehicle can have many maintenance requests; each request belongs to one vehicle.                                                    |
| Employee → Maintenance_Request           |                         | reports             | 1 : M         | Required on Employee side, Optional on Request side                     | Dashed      | An employee can create many requests; a request is created by one employee.                                                              |
| Maintenance_Request → Maintenance_Record |                         | fulfills            | 1 : 0..1      | Optional on both sides                                                  | Dashed      | A request may or may not result in a maintenance record. Each record references one request.                                             |
| Vehicle → Maintenance_Record             |                         | serviced_in         | 1 : M         | Required on Vehicle side, Optional on Record side                       | Dashed      | Each vehicle can have multiple service records.                                                                                          |
| Employee → Maintenance_Record            |                         | performs            | 1 : M         | Required on Employee side, Optional on Record side                      | Dashed      | Each employee (technician) may perform many services.                                                                                    |
| Vehicle → Inspection                     |                         | inspected_in        | 1 : M         | Required on Vehicle side, Optional on Inspection side                   | Dashed      | Each vehicle can have multiple inspections.                                                                                              |
| Rental → Inspection                      |                         | linked_with         | 1 : 0..2      | Optional on both sides                                                  | Dashed      | Each rental has up to two inspections (check-out/check-in).                                                                              |
| Employee → Inspection                    |                         | conducts            | 1 : M         | Required on Employee side, Optional on Inspection side                  | Dashed      | Each inspection is conducted by one employee.                                                                                            |
| Parent → Child                           |                         | Relationship Name   | Cardinality   | Modality                                                                | Line Type   | Notes                                                                                                                                    |
| Customer → Reservation                   |                         | makes               | 1 : M         | Required on Customer side, Optional on Reservation                      | Dashed      | Each customer can make multiple reservations.                                                                                            |
| Reservation → Rental                     |                         | converts_to         | 1 : 0..1      | Required on Reservation side, Optional on Rental                        | Dashed      | Some reservations never become rentals.                                                                                                  |
| Rental → Rental_Payment                  |                         | processed_with      | 1 : M         | Required on Rental side, Optional on Payment side                       | Dashed      | Each rental can have multiple payments.                                                                                                  |
| Rental → Rental_Charge                   |                         | incurs              | 1 : M         | Required on Rental side, Optional on Charge side                        | Dashed      | A rental can have many charges (fuel, damage, late fee).                                                                                 |
| Charge_Type → Rental_Charge              |                         | categorizes         | 1 : M         | Required on Charge side, Optional on Type side                          | Dashed      | Defines charge category.                                                                                                                 |
| Rental_Payment → Refund                  |                         | reversed_by         | 1 : 0..1      | Optional on both sides                                                  | Dashed      | A payment may or may not be refunded.                                                                                                    |
| Promotion → Reservation                  |                         | applied_to          | 1 : M         | Optional on both sides                                                  | Dashed      | A promotion can apply to many reservations; reservation may have zero or one promotion.                                                  |
| Parent → Child                           |                         | Relationship Name   | Cardinality   | Modality                                                                | Line Type   | Notes                                                                                                                                    |
| Branch → Branch_Address                  |                         | located_at          | 01:01:00      | Required on both sides                                                  | Dashed      | Each branch has one primary address (1:1).                                                                                               |
| Branch → Operating_Hours                 |                         | operates            | 1 : M         | Required on Branch side, Optional on Hours side                         | Dashed      | Each branch can define multiple hour entries (for different days).                                                                       |
| Branch → Employee                        |                         | employs             | 1 : M         | Required on Branch side, Optional on Employee side                      | Dashed      | Each employee belongs to one branch; branch may have many employees.                                                                     |
| Employee_Role → Employee                 |                         | assigned_as         | 1 : M         | Required on Employee side, Optional on Role side                        | Dashed      | Each employee has one role; roles can apply to many employees.                                                                           |
| Employee → Employee_Address              |                         | lives_at            | 1 : M         | Required on Employee side, Optional on Address side                     | Dashed      | Employees may have multiple addresses.                                                                                                   |
| Branch → Vehicle                         |                         | manages             | 1 : M         | Required on Vehicle side, Optional on Branch side                       | Dashed      | Each branch manages multiple vehicles; every vehicle is assigned to one branch.                                                          |
| Branch → Vehicle_Transfer                |                         | initiates           | 1 : M         | Required on Branch side, Optional on Transfer side                      | Dashed      | Each branch can be origin/destination of multiple transfers.                                                                             |
| Vehicle → Vehicle_Transfer               |                         | relocated_through   | 1 : M         | Required on Vehicle side, Optional on Transfer side                     | Dashed      | A vehicle can have many transfer records over time.                                                                                      |
| Branch → Reservation                     |                         | created_for         | 1 : M         | Required on Branch side, Optional on Reservation side                   | Dashed      | Reservations are made at a specific pickup branch.                                                                                       |
| Finance Schema                           |                         |                     |               |                                                                         |             |                                                                                                                                          |
| Tax_Type → Tax_Rate                      |                         | has                 | 1:M           | Requied on both side                                                    | Dashed      | Each tax can have multiple rates - depending on branch or state but must have one. A tax rate has specific tax type.                     |
| Branch → Tax_Rate                        |                         | has                 | 1:M           |                                                                         |             | One branch can have none or multiple taxed depeneding upon the location and government regulations.                                      |
| Branch → Tax_Rate                        |                         |                     |               |                                                                         |             |                                                                                                                                          |


## Table Creation Order and Record Counts

|   Table Order | Schema    | Table_Name                       |   No of Records | Notes                                                               |
|--------------:|:----------|:---------------------------------|----------------:|:--------------------------------------------------------------------|
|             1 | Operation | Operation.Branch                 |              16 |                                                                     |
|             2 | Customer  | Customer.Customer                |             200 |                                                                     |
|             3 | Vehicle   | Vehicle.Vehicle_Purchase         |             211 |                                                                     |
|             4 | Vehicle   | Vehicle.Fuel_Type                |               8 |                                                                     |
|             5 | Vehicle   | Vehicle.Vehicle_Type             |               7 |                                                                     |
|             6 | Vehicle   | Vehicle.Vehicle_Class            |               7 |                                                                     |
|             7 | Vehicle   | Vehicle.Vehicle                  |             112 |                                                                     |
|             8 | Finance   | Finance.Vehicle_Rate             |             112 | Stored Procedure and Trigger does this                              |
|             9 | Rental    | Rental.Reservation               |             510 |                                                                     |
|            10 | Finance   | Finance.Rental_Estimate          |             510 | Stored Procedure and Trigger does this                              |
|            11 | Finance   | Finance.Charge_Type              |              12 |                                                                     |
|            12 | Finance   | Finance.Charge_Rate              |              12 |                                                                     |
|            13 | Finance   | Finance.Tax_Type                 |               9 |                                                                     |
|            14 | Finance   | Finance.Tax_Rate                 |             144 | (16 branches * 9 tax types ) Stored Procedure and Trigger does this |
|            15 | Finance   | Finance.Promotions               |              10 |                                                                     |
|            16 | Finance   | Finance.Estimate_Charge          |              75 | Stored Procedure and Trigger does this                              |
|            17 | Finance   | Finance.Estimate_Tax             |            2718 | Stored Procedure and Trigger does this                              |
|            18 | Finance   | Finance.Estimate_Promotion       |            1994 | Stored Procedure and Trigger does this                              |
|            19 | Rental    | Rental.Reservation_Charge        |              75 |                                                                     |
|            20 | Rental    | Rental.Rental                    |             408 | Stored Procedure and Trigger does this                              |
|            21 | Finance   | Finance.Rental_Charge_Detail     |              21 |                                                                     |
|            22 | Customer  | Customer.Customer_Payment_Method |             200 |                                                                     |
|            23 | Finance   | Finance.Rental_Payment           |             408 | Stored Procedure and Trigger does this                              |
|            24 | Finance   | Finance.Refund                   |              50 |                                                                     |
|            25 | Finance   | Finance.Invoice                  |             408 | Stored Procedure and Trigger does this                              |
|            26 | Finance   | Finance.Invoice_Line             |          207905 | Stored Procedure and Trigger does this                              |
|            27 | Operation | Operation.Employee_Role          |               8 |                                                                     |
|            28 | Operation | Operation.Employee               |              48 |                                                                     |
|            29 | Vehicle   | Vehicle.Vehicle_Warranty         |              30 |                                                                     |
|            30 | Vehicle   | Vehicle.Vehicle_Registration     |             112 |                                                                     |
|            31 | Vehicle   | Vehicle.Inspection               |              27 |                                                                     |
|            32 | Vehicle   | Vehicle.Damage                   |              27 |                                                                     |
|            33 | Vehicle   | Vehicle.Maintenance_Record       |              55 |                                                                     |
|            34 | Vehicle   | Vehicle.Maintenance_Inspection   |              55 |                                                                     |
|            35 | Vehicle   | Vehicle.Insurance                |             112 |                                                                     |
|            36 | Operation | Operation.Expense_Category       |              12 |                                                                     |
|            37 | Operation | Operation.Branch_Expenses        |              80 |                                                                     |
|            38 | Operation | Operation.Employee_Address       |              48 |                                                                     |
|            39 | Operation | Operation.Operating_Hours        |             112 |                                                                     |
|            40 | Operation | Operation.Branch_Address         |              16 |                                                                     |
|            41 | Customer  | Customer.License                 |             200 |                                                                     |
|            42 | Customer  | Customer.Customer_Address        |             200 |                                                                     |

