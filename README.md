

# Data Warehouse & Analytics Portfolio Project

Welcome to my **Data Warehouse & Analytics** project repository! This end-to-end portfolio project demonstrates how to design, build, and utilize a modern data warehouse to uncover actionable business insights.

---

##  Project Architecture

This solution uses the **Medallion Architecture** (Bronze → Silver → Gold) to create scalable and structured data flows:

* **Bronze Layer** — Raw data ingestion from ERP & CRM CSV files into SQL Server.
* **Silver Layer** — Cleaned, standardized, and transformed data for improved quality.
* **Gold Layer** — Business-ready **Star Schema** (fact + dimension tables) for analytics and reporting.

---

##  Key Components

| Area                      | Description                                              |
| ------------------------- | -------------------------------------------------------- |
| **Data Engineering**      | ETL pipelines to load & transform data using SQL Server. |
| **Data Modeling**         | Star schema designed for analytical performance.         |
| **Analytics & Reporting** | SQL-based dashboards and insights for decision-making.   |


---

##  Skills Demonstrated

* SQL Development
* Data Architecture & Modeling
* ETL / Data Engineering
* Analytics & Insight Generation

---

##  Tools & Resources Used

* SQL Server Express + SSMS
* CSV datasets (ERP + CRM)
---

##  Repository Highlights

* `sql_scripts/` – Analytics & exploration SQL queries
* `etl/` – Data ingestion & transformation logic
* `diagrams/` – Project architecture, data model visuals
* `docs/` – Helpful project documentation & templates

---

##  Project Requirements (Scope)

* Build a warehouse consolidating CRM and ERP data
* No historical (slowly changing) logic — work with latest snapshot
* Provide a clean, business-friendly model for analysis
* Prepare exploration scripts for analysts & BI teams

---

##  Analytical SQL Included

A curated collection of SQL scripts for:

* Database discovery
* KPI & metrics calculations
* Time-series and trend analysis
* Cohort & customer segmentation
* Cumulative analysis

---

