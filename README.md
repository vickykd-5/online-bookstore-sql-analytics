# 📚 Online Bookstore Analytics: End-to-End Database Design & Transactional Insights

[![Database](https://img.shields.io/badge/Database-MySQL-blue?style=for-the-badge&logo=mysql)](https://www.mysql.com/)
[![Language](https://img.shields.io/badge/Language-SQL-orange?style=for-the-badge)](https://en.wikipedia.org/wiki/SQL)
[![Data-Type](https://img.shields.io/badge/Data--Type-CSV-green?style=for-the-badge)](https://en.wikipedia.org/wiki/Comma-separated_values)
[![Portfolio](https://img.shields.io/badge/Portfolio-Data%20Analytics-purple?style=for-the-badge)](https://github.com/)

## 📌 Table of Contents
* [📖 Project Overview](#-project-overview)
* [🎯 Objective](#-project-objectives)
* [📊 Dataset Information](#-dataset-information)
  * [1. Books.csv](#1-bookscsv)
  * [2. Customers.csv](#2-customerscsv)
  * [3. Orders.csv](#3-orderscsv)
* [🗄️ Table Definitions & Keys](#table-definitions--keys)
* [💼 Business Problems Analyzed](#-business-problems-analyzed)
  * [🔰 Foundational Queries](#-foundational-queries)
  * [🚀 Advanced Business Analytics Queries](#-advanced-business-analytics-queries)
* [🛠️ SQL Skills Demonstrated](#️-sql-skills-demonstrated)
* [💡 Key Insights](#-key-insights-data-driven-truths)
* [🔄 Project Workflow](#-project-workflow)
* [📁 Folder Structure](#-folder-structure)
* [🚀 How to Run This Project](#how-to-run-this-project)
* [🛠️ Tools & Technologies Used](#tools--technologies-used)
* [👨‍💻 Author & Contact](#author--contact)



## 📖 Project Overview
This project delivers a comprehensive data analytics solution for an **Online Bookstore** operations platform. At its core, the project involves translating raw transactional data into high-value business intelligence. By engineering an relational database architecture from scratch using MySQL, importing extensive customer records, inventory profiles, and order data, this project models real-world business performance. 

The analysis targets essential e-commerce challenges such as inventory lifecycle management, customer retention loops, revenue attribution, and product market demand. The insights extracted enable the bookstore to make data-driven decisions concerning inventory re-ordering schedules, high-value customer segmentation, geographical targeting, and promotional budgeting.

---

## 🎯 Project Objectives
* **Relational Schema Engineering:** Model and build a structural three-tier schema structure (`Books`, `Customers`, `Orders`) ensuring strict data integrity and enforced entity-relationship constraints.
* **Sales and Revenue Attribution:** Calculate overall operational revenue, performance-to-date indicators, and discover the highest-performing genres and authors.
* **Inventory Lifecycle Monitoring:** Identify stocking bottlenecks, locate out-of-stock liabilities, and dynamically compute post-fulfillment stock levels.
* **Behavioral Customer Segmentation:** Track historical order patterns, isolate high-frequency buyers, and discover top-spending customer demographics.
* **Geographic and Market Demand Mapping:** Trace the distribution of high-order value items across global regions and local city centers to optimize marketing campaigns.

---

## 📊 Dataset Information
The system parses and processes **three core CSV datasets**, containing a total of **1,500 distinct records**:

### 1. `Books.csv`
* **Description:** Houses the primary catalog details of the bookstore’s inventory profiles.
* **Total Records:** 500 books
* **Key Columns:** `Book_ID` *(Primary Key)*, `Title`, `Author`, `Genre`, `Published_Year`, `Price`, `Stock`.

### 2. `Customers.csv`
* **Description:** Stores explicit demographic and contact profiles of registered bookstore users.
* **Total Records:** 500 customers
* **Key Columns:** `Customer_ID` *(Primary Key)*, `Name`, `Email`, `Phone`, `City`, `Country`.

### 3. `Orders.csv`
* **Description:** Tracks transactional data logs capturing e-commerce fulfillment history.
* **Total Records:** 500 orders
* **Key Columns:** `Order_ID` *(Primary Key)*, `Customer_ID` *(Foreign Key -> Customers)*, `Book_ID` *(Foreign Key -> Books)*, `Order_Date`, `Quantity`, `Total_Amount`.

---

### Table Definitions & Keys:
1.  **`books`**: Independent Dimension table containing individual title identifiers with hard foreign keys pointing to no external systems. `Book_ID` is set as the primary key.
2.  **`customers`**: Independent Dimension table maintaining distinct customer identifiers. `Customer_ID` is set as the primary key.
3.  **`orders`**: Fact table capturing transactional occurrences. Enforces relational constraints via two explicit foreign keys:
    * `Customer_ID References customers(Customer_ID)`
    * `Book_ID References books(Book_ID)`

---

## 💼 Business Problems Analyzed

The project resolves explicit business questions segmented into Foundational Operational Queries and Advanced Performance Queries:

### 🔰 Foundational Queries
| Question No | Business Problem | SQL Concepts Used |
| :--- | :--- | :--- |
| **Q1** | Retrieve all books classified under the 'Fiction' genre. | `SELECT`, `WHERE` Filter |
| **Q2** | Find all books published after the year 1950. | Relational Operators (`>`) |
| **Q3** | List all registered bookstore customers originating from Canada. | `WHERE` Text Matching |
| **Q4** | Show all transaction records for orders placed in November 2023. | `BETWEEN` Date Range Filter |
| **Q5** | Retrieve the cumulative sum of total book stocks available in storage. | Aggregate `SUM()` |
| **Q6** | Find the full catalog details of the single most expensive book. | `ORDER BY DESC`, `LIMIT` |
| **Q7** | Extract all orders where the single item quantity ordered exceeds 1. | Comparison Operators (`>`) |
| **Q8** | Retrieve all customer orders where the total transactional amount exceeds $20. | Numerical Filtering |
| **Q9** | List all unique, distinct genres available in the catalog. | `DISTINCT` Clause |
| **Q10**| Discover the critical book tracking the absolute lowest inventory stock. | `ORDER BY ASC`, `LIMIT` |
| **Q11**| Calculate the total cumulative revenue generated from all historical orders. | Global `SUM()` Aggregation |

### 🚀 Advanced Business Analytics Queries
| Question No | Business Problem | SQL Concepts Used |
| :--- | :--- | :--- |
| **A1** | Retrieve the total volume of individual books sold aggregated by genre. | `JOIN`, `SUM()`, `GROUP BY` |
| **A2** | Find the specific average price point for books within the 'Fantasy' genre. | `AVG()`, `WHERE` Filter |
| **A3** | Segment and list customers who have demonstrated retention by placing $\ge 2$ orders. | `JOIN`, `COUNT()`, `GROUP BY`, `HAVING` |
| **A4** | Pinpoint the single most frequently ordered book across the marketplace. | `JOIN`, `COUNT()`, `GROUP BY`, `ORDER BY`, `LIMIT` |
| **A5** | Extract the top 3 most premium, expensive books within the 'Fantasy' classification. | Multi-conditional filtering, `LIMIT` |
| **A6** | Aggregate and retrieve the total historical volume of books sold by each individual author. | Multi-table `JOIN`, `SUM()`, `GROUP BY` |
| **A7** | List the distinct geographic cities housing customers who completed transactions over $30. | `DISTINCT`, `JOIN`, `WHERE` |
| **A8** | Discover the all-time high-value customer profile who has spent the most aggregate capital. | `JOIN`, `SUM()`, `GROUP BY`, `ORDER BY`, `LIMIT` |
| **A9** | Generate a ledger calculating remaining inventory balances post-order fulfillment. | `LEFT JOIN`, `COALESCE()`, Arithmetic Multi-fields |

---

## 🛠️ SQL Skills Demonstrated
This repository directly showcases professional mastery over the following production-level SQL capabilities:
* **Multi-Table Joins:** Implement conditional `INNER JOIN` and comprehensive `LEFT JOIN` structures to cross-examine dimensional records against transaction facts.
* **Data Aggregation Engine:** Applied `SUM()`, `AVG()`, and `COUNT()` metrics across multiple group benchmarks.
* **Advanced Group Filtering:** Leveraging `GROUP BY` structural pipelines paired alongside strict post-aggregation `HAVING` criteria blocks.
* **Null-Value Protection Handling:** Utilizing `COALESCE(expression, 0)` algorithms to insulate database outputs from floating `NULL` variables during structural computations.
* **Data Type Operations:** Working with continuous date strings matching `YYYY-MM-DD` and compiling ranges via positional boundary indicators.
* **Result Set Truncation:** Controlling throughput footprints with deterministic `ORDER BY` configurations restricted by strict `LIMIT` allocations.

---

## 💡 Key Insights (Data-Driven Truths)
The following insights were derived directly from running the analytic queries against the provided datasets:

* **Total Revenue Profile:** The bookstore generated an exact gross lifecycle revenue of **`$75,628.66`** across all orders, supported by an existing backend inventory capacity of **`25,056`** active items.
* **High-Yield Market Demands:** The **`Mystery`** genre represents the bookstore's primary market engine with **`504 items sold`**, followed closely by **`Science Fiction` (447 items)** and **`Fantasy` (446 items)**. Marketing pipelines should index heavily into these three verticals.
* **Customer Retention Footprint:** Out of the customer database, **`139 distinct customers`** have entered the retention loop by executing **at least 2 independent orders**, establishing a solid foundation for target loyalty outreach.
* **Top VIP Client Profile:** The maximum historical spend-tier is topped by customer **`Kim Turner (Customer ID: 457)`**, capturing a total aggregate lifetime value (LTV) of **`$1,398.90`**.
* **Product Pricing Structures:** While the average cost of an item within the `Fantasy` spectrum centers at a balanced **`$25.98`**, premium tier items lean towards the ceiling margin, highlighted by catalog listings such as **"Proactive system-worthy orchestration" by Robert Scott** retailing at **`$49.98`**.
* **Critical Inventory Alerts:** Item **"Networked systemic implementation"** has officially depleted its safety margin, sitting at exactly **`0 items` in available stock**, triggering an immediate system restock alert.

---

## 🔄 Project Workflow

┌─────────────────┐      ┌─────────────────┐      ┌─────────────────┐
│ 1. Collection   ├─────►│ 2. Inspection   ├─────►│ 3. Engineering  │
│ (Raw CSV Data)  │      │ (Schema Audit)  │      │ (DDL Validation)│
└─────────────────┘      └─────────────────┘      └────────┬────────┘
│
┌─────────────────┐      ┌─────────────────┐               │
│ 6. Insights     │◄─────┤ 5. Extraction   │◄──────────────┘
│ (LTV & Velocity)│      │ (DML Execution) │
└─────────────────┘      └─────────────────┘

1.  **Data Collection:** Gather unstructured operational inputs mapping to independent CSV blocks tracking customer profiles, sales receipts, and book metadata.
2.  **Data Integrity Audit:** Inspect constraints, structural datatypes, layout formatting anomalies, and target row counts within datasets.
3.  **Database Engineering:** Compose DDL queries containing implicit `DROP TABLE IF EXISTS` protocols, map column datatypes, and set key structures.
4.  **Data Import Processing:** Standardize data ingestion pathways into local MySQL containers ensuring reference integrity.
5.  **SQL Analytic Extraction:** Apply optimized business question scripts matching core operations scenarios.
6.  **Business Intelligence Generation:** Translate pure relational query returns into digestible summaries to support strategic executive reporting.

---

## 📁 Folder Structure

OnlineBookstore-Analytics/
│
├── datasets/
│   ├── Books.csv              # Catalog inventory information profiles
│   ├── Customers.csv          # Client registration and geographic data
│   └── Orders.csv             # Raw point-of-sale receipt ledgers
│
├── sql_queries/
│   └── MySQL project.sql      # Database initialization, DDL tables, and analytical statements
│
└── README.md                  # Comprehensive portfolio documentation showcase

---

<a id="how-to-run-this-project"></a>
## 🚀 How to Run This Project
### Prerequisites
* **MySQL Server** installed locally or hosted within an active Docker container instance.

* **Database client:** MySQL Workbench, DBeaver, or command-line terminal interfaces.

### Step-by-Step Installation
### Clone this Repository:

git clone [https://github.com/yourusername/OnlineBookstore-Analytics.git](https://github.com/yourusername/OnlineBookstore-Analytics.git)
cd OnlineBookstore-Analytics
### Initialize Database Infrastructure:

Open your chosen SQL client editor tool and connect to your active database server.

Open the file located at sql_queries/MySQL project.sql.

Execute the initialization scripts to generate the OnlineBookstore schema shell and structural sub-tables (books, customers, orders).

### Incorporate Target Datasets:

Right-click the books table schema within your interface and select Table Data Import Wizard.

Link the target file source path to datasets/Books.csv and follow defaults.

Repeat the identical wizard sequence for datasets/Customers.csv maps to table customers.

Conclude by mapping datasets/Orders.csv directly into table orders.

### Run Analytical Scripts:

Uncomment or run any targeting analytics query line item inside the script file to query the database and audit real-time information records.

---

<a id="tools--technologies-used"></a>
## 🛠️ Tools & Technologies Used
### Database Engine: MySQL Server 8.0+

### Query Interface: MySQL Workbench / Structured Query Language (SQL)

### Data Layout Layer: Comma-Separated Values (CSV Format)

### Version Distribution System: Git & GitHub Portal Showcase

---

<a id="author--contact"/>
## 👨‍💻 Author & Contact

**Author:** Vivek Deore

📧 Email: vivekkdeore001@gmail.com

🔗 LinkedIn: https://linkedin.com/in/your-profile

🔗 GitHub: https://github.com/yourusername

#DataAnalytics #SQL #MySQL #DatabaseDesign #BusinessIntelligence #PortfolioShowcase