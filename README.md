# 📈 Stock Portfolio Performance Simulator — SQL Project

## 📌 Project Overview

The **Stock Portfolio Performance Simulator** is a MySQL-based SQL project designed to model and analyze stock-market portfolio activity.

The project builds a relational database containing information about **sectors, stocks, investors, portfolios, transactions, historical prices, and technical indicators**. SQL queries are then used to analyze investment behavior, portfolio holdings, transactions, stock performance, sector exposure, and technical signals.

The project demonstrates practical SQL skills ranging from basic joins and aggregations to subqueries, conditional aggregation, window functions, ranking, `EXISTS`, `LAG()`, `NTILE()`, and date-based analysis.

---

## 🎯 Project Objectives

The project is designed to answer questions such as:

- Which stocks belong to each sector?
- How much has each investor invested?
- Who are the top investors by investment value?
- Which investors hold multiple stocks or sectors?
- Which stocks have the highest market capitalization?
- What are the BUY and SELL quantities for each stock?
- Which investors have never made a SELL transaction?
- Which stocks were bought but never sold?
- What is the difference between BUY and SELL quantities?
- What is the realized transaction profit/loss for each investor?
- Which stocks show overbought RSI conditions?
- Which stocks show bullish MACD signals?
- Which stocks are trading above their 20-day SMA?
- Which sector has the highest total investment?
- Which stock has the highest price growth?
- Which investors belong to the top investment group?

---

## 🗄️ Database Structure

Database name:

`mock_sql_project`

### Tables

| Table | Purpose |
|---|---|
| `sectors` | Stores sector, index, market capitalization and volatility information |
| `stocks` | Stores stock details and links each stock to a sector |
| `investors` | Stores investor information and risk profiles |
| `portfolio` | Stores investor stock holdings, quantities and average buy prices |
| `transactions` | Stores BUY/SELL transactions for portfolio holdings |
| `price_history` | Stores stock open price, close price and trading volume |
| `indicators` | Stores RSI, MACD, signal line and SMA-20 technical indicators |

---

## 🔗 Database Relationships

The database uses primary and foreign keys to connect related entities.

```text
SECTORS
   │
   └──< STOCKS
           │
           └──< PORTFOLIO >── INVESTORS
                    │
                    └──< TRANSACTIONS

STOCKS
   ├──< PRICE_HISTORY
   └──< INDICATORS
```

### Key Relationships

- `stocks.sector_id` → `sectors.sector_id`
- `portfolio.investor_id` → `investors.investor_id`
- `portfolio.stock_id` → `stocks.stock_id`
- `transactions.portfolio_id` → `portfolio.portfolio_id`
- `price_history.stock_id` → `stocks.stock_id`
- `indicators.stock_id` → `stocks.stock_id`

---

## 📊 Data Included

### Sectors

The dataset contains sectors such as:

- Automobile
- Banking
- IT
- Pharma
- FMCG
- Energy
- Metal
- Realty
- Telecom
- Infrastructure
- Financial Services
- Media
- PSU
- Defense
- Logistics

### Stocks

Examples include:

- Maruti Suzuki — `MARUTI`
- Tata Motors — `TATAMOTORS`
- HDFC Bank — `HDFCBANK`
- ICICI Bank — `ICICIBANK`
- Infosys — `INFY`
- TCS — `TCS`
- Sun Pharma — `SUNPHARMA`
- Reliance — `RELIANCE`
- JSW Steel — `JSWSTEEL`
- DLF — `DLF`
- Bharti Airtel — `AIRTEL`
- L&T — `LT`
- SBI — `SBIN`
- HAL — `HAL`

### Investors

The database contains investor records with:

- Investor name
- Email
- Phone
- Risk profile
- Account creation date

Risk profiles include:

- Aggressive
- Moderate
- Conservative

---

## 🧠 SQL Concepts Demonstrated

### 1. DDL

Database and table creation using:

- `CREATE DATABASE`
- `CREATE TABLE`

### 2. DML

Loading project data using:

- `INSERT INTO`

### 3. Joins

Used to combine information across related tables:

- `INNER JOIN`
- `JOIN ... USING`
- `JOIN ... ON`

### 4. Aggregate Functions

Examples:

- `SUM()`
- `AVG()`
- `COUNT()`
- `MAX()`

### 5. Conditional Aggregation

Used with:

- `CASE WHEN`
- `SUM(CASE WHEN...)`

This is used for BUY vs SELL analysis and transaction calculations.

### 6. GROUP BY and HAVING

Used for investor, stock and sector-level analysis and filtering aggregated results.

### 7. Subqueries

Used to answer questions such as:

- Stocks above average market capitalization
- Investors above average investment
- Top-ranked results

### 8. Window Functions

The project demonstrates:

- `DENSE_RANK()`
- `LAG()`
- `NTILE()`
- Windowed `AVG()`

### 9. Ranking Analysis

Ranking is used to identify:

- Top investors
- Highest-value stocks
- Highest-performing sectors
- Top investment groups

### 10. EXISTS / NOT EXISTS

Used to identify investors who never performed a SELL transaction.

### 11. Date Functions

`DATEDIFF()` and transaction dates are used for consecutive transaction-day analysis.

---

## 🔍 Key Analysis Areas

### Investor Analysis

Queries analyze:

- Total investment per investor
- Investor rankings
- Investors above average investment
- Investors holding multiple stocks
- Investors investing across multiple sectors
- Investors with no SELL transactions
- Top 10% investors

### Portfolio Analysis

Queries analyze:

- Stock holdings
- Total quantity held
- BUY vs SELL quantities
- Net quantity difference
- Stocks bought but never sold

### Stock Analysis

Queries analyze:

- Market capitalization
- Sector classification
- Price growth
- Highest market-cap stocks
- Stock holdings by investors

### Transaction Analysis

Queries analyze:

- BUY transaction value
- SELL transaction value
- Total transaction value
- Latest transaction dates
- Consecutive transaction days
- Investor-level profit/loss

### Technical Analysis

The project includes:

- RSI
- MACD
- Signal Line
- SMA-20
- Open Price
- Close Price
- Trading Volume

These are used to identify potential technical signals such as:

- RSI > 70 — overbought condition
- MACD > Signal Line — bullish signal
- Close Price > SMA-20 — price above moving average

---

## 📁 Project Structure

```text
stock-portfolio-sql-project/
│
├── README.md
└── stock_portfolio.sql
```

---

## ▶️ How to Run the Project

### Prerequisites

- MySQL Server
- MySQL Workbench

### Steps

1. Open **MySQL Workbench**.
2. Open `stock_portfolio.sql`.
3. Execute the script from top to bottom.
4. The script creates the `mock_sql_project` database.
5. Tables and sample data are inserted automatically.
6. Run the analysis queries to explore the database.

---

## 💼 Business Value

This project demonstrates how SQL can be used to transform structured financial data into useful portfolio insights.

The analysis can help answer questions related to:

- Investor behavior
- Portfolio concentration
- Sector exposure
- Trading activity
- Investment ranking
- Stock performance
- Technical indicators
- Transaction profitability

---

## 🛠️ Tools & Technologies

- **MySQL**
- **MySQL Workbench**
- **SQL**
- Relational Database Design
- Window Functions
- Financial Data Analysis

---

## 📚 SQL Skills Demonstrated

- Database creation
- Table creation
- Primary keys
- Foreign keys
- Constraints
- Relational database design
- Joins
- Aggregations
- Conditional logic
- Subqueries
- CTE-style analytical thinking
- Window functions
- Ranking
- Date functions
- Financial calculations
- Portfolio analysis
- Technical indicator analysis

---

## 👤 Author

**Sagar Rokade**

Aspiring Data Analyst with hands-on experience in SQL, Python, Excel, Power BI, Tableau and MySQL.

---

## 📌 Project Status

**Completed — SQL Practice & Portfolio Project**

The SQL script contains a progression from foundational queries to advanced analytical and window-function-based problems.
