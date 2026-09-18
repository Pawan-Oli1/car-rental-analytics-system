# Car Rental Analytics & Management System — Business Rules

This document defines the business rules governing reservation, rental, pricing,
inspection, damage, financial, and fleet-management workflows for the Car Rental
system. Each rule follows an Event–Condition–Action structure: the triggering
event, the condition the system evaluates, and the resulting action (with the
alternative outcome when the condition is not met).

This is the single authoritative business-rules document for the project,
consolidating and correcting an earlier draft that used an inconsistent
numbering scheme and, in places, described a different (and sometimes
contradictory) set of thresholds.

---

## 1. Customer Eligibility & Licensing

**BR-01 — Minimum Age.** Customers must be at least 20 years old to rent a
vehicle. When a customer attempts to create a reservation, the system
calculates the customer's age from their date of birth. If the customer is
younger than 20, the reservation is not allowed and the system displays a
message stating the minimum age requirement. Otherwise, the reservation
process continues normally.

**BR-02 — Young Renter Surcharge.** Customers aged 20 to 24 (inclusive) are
subject to a young renter surcharge. When the system creates a rental estimate
for a reservation, it calculates the customer's age from their date of birth.
If the customer falls within this age range, the system adds a surcharge using
the established charge type for young renters, with the amount determined by
the corresponding charge rate. Customers 25 and older are not charged this fee.

**BR-03 — Valid License Required at Check-Out.** All primary drivers must have
a valid driver's license to check out a vehicle. When an employee processes a
vehicle check-out or finalizes a rental, the system verifies the customer's
license information. If the license status is expired, suspended, or revoked,
or the expiry date has passed, the system blocks the check-out and prompts the
employee to request a valid license.

**BR-04 — Verified License Required to Reserve.** Customers must have a
verified license before making reservations. When a customer attempts to
create a reservation, the system verifies that a license on file has been
verified by an employee. Unverified licenses must be verified before the
customer can proceed.

---

## 2. Reservation Lifecycle & Vehicle Assignment

**BR-05 — Valid Date Range.** All reservations must have a return date/time
later than the pickup date/time. When the system attempts to save a new or
modified reservation, it validates that the return datetime exceeds the pickup
datetime. If not, the reservation is not saved and an error is displayed.

**BR-06 — Confirmation Requires Payment Authorization.** Reservations are
confirmed only after successful payment authorization. When a customer submits
a request to confirm a reservation, the system authorizes the customer's
payment method for the estimated amount. On success, the reservation status
becomes confirmed, a confirmation number is generated, and the assigned
vehicle's status is updated to reserved. On failure, the reservation remains
pending and a payment authorization failure message is shown.

**BR-07 — Estimate Required Before Confirmation.** Every confirmed reservation
must have an associated rental estimate. When updating a reservation's status
to confirmed, the system verifies a rental estimate exists with a populated
total estimate value.

**BR-08 — Re-Pricing on Modification.** Any modification to a confirmed
reservation that affects pricing requires recalculation and customer approval.
When a customer modifies dates, vehicle class, or branch, the system
determines whether the change affects rate calculation. If so, it recalculates
base rate, surcharge total, discount total, tax total, and total estimate,
updates the estimate, and requires customer confirmation before finalizing.
Modifications that don't affect pricing are applied without recalculation.

**BR-09 — Cancellation Fee Window.** Cancellation fees apply when a confirmed
reservation is cancelled less than 48 hours before pickup. The system creates
a cancellation fee charge, updates the reservation status to cancelled, and
returns the assigned vehicle to available status. Cancellations 48+ hours
before pickup are processed without a fee, but the reservation is still
cancelled and the vehicle still returned to available.

**BR-10 — No-Show Fee.** Customers who fail to pick up a reserved vehicle
within the grace period (typically 2 hours after scheduled pickup) are charged
a no-show fee. If no rental has been created for the reservation once the
grace period lapses, the system updates the reservation status to no-show,
creates a no-show fee charge, and returns the vehicle to available status.

**BR-11 — One Rental per Reservation.** Each reservation can be linked to only
one rental transaction. When the system attempts to create a new rental, it
verifies the specified reservation has not already been used in another
rental; if one exists, the new rental is prevented.
> **Schema note:** this must be enforced with a `UNIQUE` constraint on
> `Rental.Rental.reservation_id` — see the accompanying gap-closing script.

**BR-12 — Duration Type Must Match Actual Duration.** When creating or
modifying a reservation, the system validates that the rental duration type
(hourly, daily, weekly, monthly) matches the duration calculated from
pickup/return datetime, ensuring correct rate application.

**BR-13 — Availability Requires Status and No Conflicts.** Vehicle
availability is determined by both vehicle status and reservation conflicts.
A vehicle class is shown as available at a branch for a date range only when
matching vehicles have available status for the entire duration and no
overlapping pending/confirmed reservations exist. Otherwise, unavailability is
shown, optionally with alternative branches or dates.

**BR-14 — No Double-Booking of a Specific Vehicle.** When assigning a specific
vehicle to a confirmed reservation, the system verifies the vehicle is not
already assigned to an overlapping pending/confirmed reservation and that its
current status is available. If either check fails, the assignment is
prevented and an error is raised.

**BR-15 — Vehicle Must Be at Pickup Branch.** When assigning a vehicle to a
reservation, the system verifies the vehicle's branch matches the pickup
branch. If not, the system should initiate a vehicle transfer or suggest an
alternative vehicle at the correct branch.

---

## 3. Pricing, Promotions, Taxes & Charges

**BR-16 — Promotional Codes.** When a customer applies a promo code, the
system verifies a promotion exists with that code, is active, and that today
falls within its start/end dates. If valid, the system links the promotion to
the estimate, calculates the discount from the promotion value/type, and
reflects it in the estimate's discount total. Invalid, expired, or inactive
codes are rejected.

**BR-17 — One-Way Fee.** When pickup and dropoff branches differ, the system
automatically adds a one-way fee to the estimate using the pre-defined
one-way fee charge type. All one-way routes are currently permitted. Same
pickup/dropoff branch incurs no fee.

**BR-18 — Taxes & Location Fees Applied Automatically.** When calculating an
estimated or final rental cost, the system applies all applicable taxes based
on the pickup branch and effective dates, plus location-specific fees (e.g.
airport concession, tourism surcharge) tied to the branch. These populate the
estimate's tax total and surcharge total, broken down in the estimate tax and
estimate charge tables.

**BR-19 — Charge Rates Must Be Currently Effective.** When creating estimate
charge records, the system verifies the referenced charge rate's effective
date range includes the reservation date.

**BR-20 — Tax Rates Must Be Currently Effective.** When creating estimate tax
records, the system verifies the tax rate's effective date range includes the
reservation pickup date.

---

## 4. Check-Out & Check-In Inspections

**BR-21 — Signed Rental Terms Required at Check-Out.** The system verifies
rental terms have been acknowledged, with exactly one immutable
acknowledgement by the customer, before check-out can proceed.

**BR-22 — Pre-Inspection Required at Check-Out.** Before finalizing check-out
or setting rental status to active, the system verifies a pre-inspection (or
check-out) record exists with mileage, fuel level, and media path populated,
and signed off.

**BR-23 — Return Grace Period.** The check-in inspection's timestamp is the
official return time. Returns within 29 minutes of the scheduled return time
incur no late fee.

**BR-24 — Hourly Late Charge (30 min – 4 hrs).** Returns between 30 minutes
and 4 hours late (inclusive) incur an invoice line for the hourly late charge,
using the established charge type and rate.

**BR-25 — Full-Day Late Charge (> 4 hrs).** Returns more than 4 hours late
incur a full additional day's rental charge at the applicable vehicle rate for
the vehicle's class and branch, instead of the hourly charge.

**BR-26 — Post-Inspection Required at Check-In.** Before finalizing check-in,
updating rental status to completed, and finalizing the invoice, the system
verifies a post-inspection (or check-in) record exists with mileage, fuel
level, and media path populated, and marked complete.

**BR-27 — Signoff Gates Status Changes.** Check-out requires pre-inspection
signoff; completion requires post-inspection signoff. Rental status cannot
advance without the corresponding inspection signoff.

**BR-28 — Discrepancy Flagging.** When a check-in inspection is submitted, the
system compares it against the check-out inspection for the same rental. If
mileage variance exceeds tolerance, fuel level dropped beyond tolerance, or
new damage exists, the rental is flagged for mandatory manager review before
it can be marked completed.

---

## 5. Fuel & Mileage Charges

**BR-29 — Fuel Shortfall Charge.** If check-in fuel level is lower than
check-out fuel level, the system calculates the deficit and creates an invoice
line for a refueling service charge at the per-gallon service rate.

**BR-30 — Excess Mileage Charge.** The system compares mileage used
(check-in minus check-out) against the included allowance (from rental
duration × standard daily allowance). Mileage beyond the allowance is charged
at the applicable per-mile rate.

---

## 6. Damage Reporting & Vehicle Service Hold

**BR-31 — Damage Requires Media Evidence.** A damage record cannot be
finalized unless the associated inspection has a populated media path
(photos/video) alongside the damage description.

**BR-32 — Damage Tied to a Completed Inspection.** Damage can only be recorded
against an inspection that exists and has been completed with signoff.

**BR-33 — New Damage Is Billable.** When new damage is recorded at check-in
that wasn't present at check-out for the same rental, the system creates an
invoice line for the damage deductible (or estimated repair cost), linked to
the rental's invoice. Pre-existing damage is not re-billed.

**BR-34 — Damaged Vehicles Require Review Before Return to Service.** If a
vehicle's associated damage records total more than $999 in estimated repair
cost, or any damage is rated moderate or severe, the system moves the vehicle
to maintenance status and requires manager approval before it can be marked
available again.

**BR-35 — Security Deposit Release.** When a rental closes as completed with
all payments marked paid, the system checks the check-in inspection and any
damage records. With no new damage and all charges settled, it releases the
deposit hold. Outstanding charges or damage are deducted from the deposit
first, with only the remainder (if any) released.

---

## 7. Financial Integrity

**BR-36 — Invoice Math Must Balance.** `total_amount` must equal
`subtotal_amount − discount_amount + tax_amount`. Invoices that fail this
check are not saved.

**BR-37 — No Negative Financial Amounts.** All amount fields on invoices,
invoice lines, rental estimates, rental payments, and charge rates must be
zero or positive.

**BR-38 — Line Items Must Sum to Subtotal.** The sum of an invoice's line
amounts must equal its subtotal amount.

**BR-39 — Payments Require a Valid, Unexpired Payment Method.** A rental
payment can only be created against a customer payment method whose
expiry year/month has not passed relative to the current date.

**BR-40 — Refunds Cannot Exceed the Original Payment.** The sum of all refunds
issued against a payment (including the new one) cannot exceed the original
payment amount.

---

## 8. Vehicle Location, Transfers & Operating Hours

**BR-41 — Vehicle Reassigned on Drop-Off.** When a rental completes with a
dropoff branch different from the pickup branch, the vehicle's branch
assignment updates to the dropoff branch automatically.

**BR-42 — Manager-Initiated Transfers.** A manager-role employee may initiate
a vehicle transfer between branches if the vehicle's status is available. The
system logs a transfer record and updates the vehicle's branch assignment;
non-available vehicles cannot be transferred.

**BR-43 — Operating Hours Constraint.** Pickup and return times must fall
within the pickup/dropoff branch's operating hours for that day of week,
unless after-hours dropoff is enabled for that branch.

---

## 9. Vehicle Status & Maintenance

**BR-44 — Valid Status Transitions Only.** Vehicle status changes must follow
the defined transition map: *Available* → Reserved, Rented, or Maintenance;
*Reserved* → Rented or Available; *Rented* → Available or Maintenance;
*Maintenance* → Available. *Retired* vehicles cannot transition to any other
status. Invalid transitions are rejected and logged.
> **Correction from earlier draft:** the prior wording included "Reserved →
> Cancelled," but `Vehicle.status` has no `Cancelled` value — a cancelled
> reservation returns the vehicle to *Available* (see BR-09/BR-10). The
> transition map above reflects the actual allowed values.

**BR-45 — Unscheduled Repair Hold.** When a mechanical issue is reported, an
employee sets the vehicle to maintenance (removing it from availability) and
creates a maintenance record with type "unscheduled repair" and status
"pending." Non-urgent issues are logged for the next preventive cycle instead.

**BR-46 — Maintenance Records Track the Reporting Employee.** Every
maintenance record identifies which employee recorded it. Not every employee
will have logged a maintenance request.

**BR-47 — Preventive Maintenance Flagging.** When a vehicle's mileage or time
since last service meets or exceeds its preventive-maintenance threshold, the
system flags it for scheduled service (performed by an external provider).
The vehicle can continue renting until the service is actually scheduled.

---

## 10. Insurance, Registration & Data Validity

**BR-48 — Active Insurance Required for Availability.** A vehicle cannot be
set to available status unless it has at least one insurance record with
active policy status and an expiry date in the future.

**BR-49 — Valid Registration Required to Rent.** A vehicle cannot be assigned
to a reservation or rental unless its registration is active and its expiry
date is on or after the current date. Vehicles with lapsed/inactive
registration should be flagged for maintenance status until renewed.

**BR-50 — Valid Date Ranges on Warranty/Registration.** Warranty end dates
must be later than start dates; registration expiry dates must be later than
issue dates.

**BR-51 — Unique VIN.** Each vehicle identification number must be unique;
duplicate VINs are rejected at creation.

---

## 11. Access & System Accounts

**BR-52 — Admin-Only User Accounts, Role-Gated Reporting.** Only employees
with an "admin" access-level role can be assigned a system user account, and
account creation is optional even for admin-level employees. Each account
requires a unique username and secure password. Cross-branch revenue
visibility is further restricted to admin users whose specific role is
authorized for financial reporting (e.g. CFO, CEO, VP of Finance).

---

## Assumptions

- User accounts are provisioned only by an internal admin. Employees receive a
  one-time password setup link and register with a username and password
  (entered twice). For this project, employee accounts are assumed to already
  be activated.
- Branch 1 is the headquarters of the car rental company.

---

## Future Enhancements (Proposed — Not Yet Implemented)

The items below were raised during an earlier requirements-elicitation pass
and are good candidates for a "roadmap" section of the project, but none of
them are backed by tables, columns, or logic in the current schema. They are
listed here as proposed rules, not implemented ones, so the documentation
doesn't overstate what the system currently does.

- **FE-01 — Audit Logging.** Log user ID, timestamp, entity, and change
  summary for create/update/delete operations on sensitive entities (Customer,
  Vehicle, rate/charge tables, user accounts) to an append-only audit trail.
  *Would require a new `AuditLog` table and either application-level logging
  or `AFTER` triggers on the relevant tables.*
- **FE-02 — PII Masking by Role.** Mask sensitive fields (full license number,
  card details beyond the last four digits) for users whose role isn't
  explicitly permitted to view them. *This is an application/reporting-layer
  concern more than a schema one — the schema already stores only tokenized
  payment data and last-four digits, which is a good foundation for it.*
- **FE-03 — Customer Risk/Blacklist Flag.** Allow flagging a customer account
  (e.g. after repeated damage or non-payment) to block new reservations.
  *Would require a status/flag column on `Customer.Customer` and a check in
  the reservation-creation flow.*
- **FE-04 — Toll & Violation Pass-Through Billing.** Attribute tolls or
  traffic violations incurred during a rental period to the renting customer
  and bill them, with an administrative fee. *Would require a new
  `Violation`/`Toll` table keyed by vehicle and timestamp, matched against
  `Rental.Rental` date ranges.*
- **FE-05 — Corporate / Promotional Rate-Plan Eligibility.** Support
  eligibility-gated rate plans (corporate accounts, AAA, government) distinct
  from the general promotion-code mechanism already in place.
- **FE-06 — Promotion Stacking Rules.** Explicitly allow or disallow combining
  multiple active promotions on one reservation. *Note: this is a genuine
  design decision that needs to be made either way — the current
  `usp_CreateRentalEstimate` procedure stacks every currently-active,
  date-matching promotion automatically, which should either become the
  documented rule or be changed to enforce a stacking restriction.*
- **FE-07 — Vehicle Recall Lockout.** Block check-out of a vehicle with an
  active, unresolved manufacturer recall. *Would require a recall-status
  field on `Vehicle.Vehicle` or a linked recall table.*
- **FE-08 — System User Accounts / Authentication.** A login table
  (`user_id`, `employee_id`, `username`, hashed `password`, `account_status`)
  was designed early on — it appears in
  `02_Data_Model/Data Dictionary, carRent.xlsx` — but was never carried into
  the schema. `Operation.Employee_Role.access_level` currently governs
  role-level access only; there is no table backing individual login
  credentials or account status. *Would require adding the proposed table
  (with `employee_id` as an FK to `Operation.Employee`) and deciding how
  passwords are hashed/stored before implementing.*
