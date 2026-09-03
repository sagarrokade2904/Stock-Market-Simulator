create database mock_sql_project;
use mock_sql_project;
-- =========================
-- 1. SECTORS TABLE
-- =========================
CREATE TABLE sectors (
    sector_id INT AUTO_INCREMENT PRIMARY KEY,
    sector_name VARCHAR(50) NOT NULL,
    index_name VARCHAR(50),
    market_cap BIGINT,
    volatility_level VARCHAR(20),
    created_at DATE
);

INSERT INTO sectors (sector_name,index_name,market_cap,volatility_level,created_at) VALUES
('Automobile','Nifty Auto',450000000000,'High','2020-01-01'),
('Banking','Bank Nifty',900000000000,'Medium','2020-01-01'),
('IT','Nifty IT',800000000000,'Medium','2020-01-01'),
('Pharma','Nifty Pharma',350000000000,'Low','2020-01-01'),
('FMCG','Nifty FMCG',500000000000,'Low','2020-01-01'),
('Energy','Nifty Energy',700000000000,'High','2020-01-01'),
('Metal','Nifty Metal',300000000000,'High','2020-01-01'),
('Realty','Nifty Realty',200000000000,'High','2020-01-01'),
('Telecom','Nifty Telecom',250000000000,'Medium','2020-01-01'),
('Infrastructure','Nifty Infra',400000000000,'Medium','2020-01-01'),
('Financial Services','Nifty Financial',850000000000,'Medium','2020-01-01'),
('Media','Nifty Media',100000000000,'High','2020-01-01'),
('PSU','Nifty PSU',600000000000,'Medium','2020-01-01'),
('Defense','Nifty Defense',150000000000,'High','2020-01-01'),
('Logistics','Nifty Logistics',180000000000,'Medium','2020-01-01');


-- =========================
-- 2. STOCKS TABLE
-- =========================
CREATE TABLE stocks (
    stock_id INT AUTO_INCREMENT PRIMARY KEY,
    stock_name VARCHAR(100) NOT NULL,
    symbol VARCHAR(20) UNIQUE,
    sector_id INT,
    market_cap BIGINT,
    listing_date DATE,
    FOREIGN KEY (sector_id) REFERENCES sectors(sector_id)
);

INSERT INTO stocks (stock_name,symbol,sector_id,market_cap,listing_date) VALUES
('Maruti Suzuki','MARUTI',1,300000000000,'2003-07-09'),
('Tata Motors','TATAMOTORS',1,250000000000,'1995-08-01'),
('HDFC Bank','HDFCBANK',2,600000000000,'1995-01-01'),
('ICICI Bank','ICICIBANK',2,550000000000,'1998-09-17'),
('Infosys','INFY',3,500000000000,'1993-02-15'),
('TCS','TCS',3,700000000000,'2004-08-25'),
('Sun Pharma','SUNPHARMA',4,200000000000,'1994-01-01'),
('ITC','ITC',5,450000000000,'1970-01-01'),
('Reliance','RELIANCE',6,800000000000,'1977-01-01'),
('JSW Steel','JSWSTEEL',7,150000000000,'1995-03-01'),
('DLF','DLF',8,120000000000,'2007-07-05'),
('Bharti Airtel','AIRTEL',9,300000000000,'2002-02-15'),
('L&T','LT',10,400000000000,'1998-06-01'),
('SBI','SBIN',13,500000000000,'1995-01-01'),
('HAL','HAL',14,100000000000,'2018-03-28');


-- =========================
-- 3. INVESTORS TABLE
-- =========================
CREATE TABLE investors (
    investor_id INT AUTO_INCREMENT PRIMARY KEY,
    full_name VARCHAR(100),
    email VARCHAR(100) UNIQUE,
    phone VARCHAR(15),
    risk_profile VARCHAR(20),
    created_at DATE
);

INSERT INTO investors (full_name,email,phone,risk_profile,created_at) VALUES
('Amit Shah','amit@email.com','9999990001','Aggressive','2023-01-01'),
('Priya Mehta','priya@email.com','9999990002','Moderate','2023-01-02'),
('Rahul Verma','rahul@email.com','9999990003','Conservative','2023-01-03'),
('Sneha Iyer','sneha@email.com','9999990004','Aggressive','2023-01-04'),
('Karan Patel','karan@email.com','9999990005','Moderate','2023-01-05'),
('Neha Singh','neha@email.com','9999990006','Aggressive','2023-01-06'),
('Arjun Rao','arjun@email.com','9999990007','Moderate','2023-01-07'),
('Simran Kaur','simran@email.com','9999990008','Conservative','2023-01-08'),
('Vikram Joshi','vikram@email.com','9999990009','Aggressive','2023-01-09'),
('Ananya Desai','ananya@email.com','9999990010','Moderate','2023-01-10'),
('Rohit Sharma','rohit@email.com','9999990011','Aggressive','2023-01-11'),
('Meera Nair','meera@email.com','9999990012','Conservative','2023-01-12'),
('Sahil Khan','sahil@email.com','9999990013','Moderate','2023-01-13'),
('Divya Menon','divya@email.com','9999990014','Aggressive','2023-01-14'),
('Nikhil Gupta','nikhil@email.com','9999990015','Moderate','2023-01-15');


-- =========================
-- 4. PORTFOLIO TABLE
-- =========================
CREATE TABLE portfolio (
    portfolio_id INT AUTO_INCREMENT PRIMARY KEY,
    investor_id INT,
    stock_id INT,
    quantity INT,
    avg_buy_price DECIMAL(10,2),
    investment_date DATE,
    FOREIGN KEY (investor_id) REFERENCES investors(investor_id),
    FOREIGN KEY (stock_id) REFERENCES stocks(stock_id)
);

INSERT INTO portfolio (investor_id,stock_id,quantity,avg_buy_price,investment_date) VALUES
(1,1,40,9000,'2023-06-01'),
(2,3,25,1500,'2023-06-02'),
(3,5,35,1200,'2023-06-03'),
(4,6,15,3200,'2023-06-04'),
(5,9,10,2500,'2023-06-05'),
(6,8,50,450,'2023-06-06'),
(7,4,20,800,'2023-06-07'),
(8,2,30,600,'2023-06-08'),
(9,10,60,700,'2023-06-09'),
(10,12,40,850,'2023-06-10'),
(11,14,45,600,'2023-06-11'),
(12,7,18,1000,'2023-06-12'),
(13,13,8,2200,'2023-06-13'),
(14,11,15,500,'2023-06-14'),
(15,15,10,1500,'2023-06-15');


-- =========================
-- 5. TRANSACTIONS TABLE
-- =========================
CREATE TABLE transactions (
    transaction_id INT AUTO_INCREMENT PRIMARY KEY,
    portfolio_id INT,
    transaction_type VARCHAR(10),
    quantity INT,
    transaction_price DECIMAL(10,2),
    transaction_date DATE,
    FOREIGN KEY (portfolio_id) REFERENCES portfolio(portfolio_id)
);

INSERT INTO transactions (portfolio_id,transaction_type,quantity,transaction_price,transaction_date) VALUES
(1,'BUY',50,9000,'2023-06-01'),
(1,'SELL',10,9500,'2023-12-01'),

(2,'BUY',30,1500,'2023-06-02'),
(2,'SELL',5,1650,'2023-11-15'),

(3,'BUY',40,1200,'2023-06-03'),
(3,'SELL',5,1350,'2023-10-10'),

(4,'BUY',20,3200,'2023-06-04'),
(4,'SELL',5,3400,'2023-12-20'),

(5,'BUY',15,2500,'2023-06-05'),
(5,'SELL',5,2700,'2023-11-01'),

(6,'BUY',60,450,'2023-06-06'),
(6,'SELL',10,520,'2023-12-05');


-- =========================
-- 6. PRICE HISTORY TABLE
-- =========================
CREATE TABLE price_history (
    price_id INT AUTO_INCREMENT PRIMARY KEY,
    stock_id INT,
    trade_date DATE,
    open_price DECIMAL(10,2),
    close_price DECIMAL(10,2),
    volume BIGINT,
    FOREIGN KEY (stock_id) REFERENCES stocks(stock_id)
);

INSERT INTO price_history VALUES
(1,1,'2024-01-01',8800,9100,2000000),
(2,2,'2024-01-01',580,610,3000000),
(3,3,'2024-01-01',1450,1520,4000000),
(4,4,'2024-01-01',780,820,3500000),
(5,5,'2024-01-01',1100,1250,2800000),
(6,6,'2024-01-01',3100,3300,1500000),
(7,7,'2024-01-01',950,1020,1800000),
(8,8,'2024-01-01',430,470,2200000),
(9,9,'2024-01-01',2400,2600,5000000),
(10,10,'2024-01-01',650,720,1200000),
(11,11,'2024-01-01',480,520,900000),
(12,12,'2024-01-01',820,880,2500000),
(13,13,'2024-01-01',2100,2300,1000000),
(14,14,'2024-01-01',580,630,3100000),
(15,15,'2024-01-01',1400,1550,700000);


-- =========================
-- 7. INDICATORS TABLE (SMA INCLUDED)
-- =========================
CREATE TABLE indicators (
    indicator_id INT AUTO_INCREMENT PRIMARY KEY,
    stock_id INT,
    trade_date DATE,
    rsi DECIMAL(5,2),
    macd DECIMAL(6,2),
    signal_line DECIMAL(6,2),
    sma_20 DECIMAL(10,2),
    FOREIGN KEY (stock_id) REFERENCES stocks(stock_id)
);

INSERT INTO indicators (stock_id,trade_date,rsi,macd,signal_line,sma_20) VALUES
(1,'2024-01-01',72.5,1.2,1.0,8900),
(2,'2024-01-01',65.3,0.8,0.7,600),
(3,'2024-01-01',58.1,1.5,1.3,1480),
(4,'2024-01-01',49.2,0.6,0.5,800),
(5,'2024-01-01',74.8,1.8,1.4,1180),
(6,'2024-01-01',68.0,1.1,0.9,3200),
(7,'2024-01-01',55.4,0.7,0.6,980),
(8,'2024-01-01',62.9,0.9,0.8,450),
(9,'2024-01-01',71.2,1.6,1.2,2550),
(10,'2024-01-01',48.7,0.5,0.4,690),
(11,'2024-01-01',52.1,0.4,0.3,500),
(12,'2024-01-01',67.5,1.0,0.8,860),
(13,'2024-01-01',73.4,1.7,1.5,2250),
(14,'2024-01-01',60.2,0.6,0.5,600),
(15,'2024-01-01',69.8,1.3,1.1,1500);



-- List all stocks with their sector name and market cap.
select st.stock_id, st.stock_name,se.sector_name,se.market_cap
from stocks st 
join sectors se
using (sector_id)
group by st.stock_id,se.sector_name;



-- Show all investors along with the stocks they invested in and quantity.
select i.investor_id,i.full_name,st.stock_name,p.quantity
from portfolio p 
join investors i 
using (investor_id)
join stocks st 
using (stock_id)
group by i.investor_id,i.full_name,st.stock_name,p.quantity;


-- Find total investment (quantity × avg_buy_price) per investor.
select i.investor_id,i.full_name,sum(p.quantity*p.avg_buy_price) as total_investment
from investors i
join portfolio p
using (investor_id)
group by i.investor_id,i.full_name;


-- Find top 3 investors based on total investment value.
select * from 
(select i.investor_id,i.full_name,sum(p.quantity*p.avg_buy_price) as total_investment,
dense_rank() over (order by sum(p.quantity*p.avg_buy_price) desc) as rnk
from investors i
join portfolio p
using (investor_id)
group by i.investor_id,i.full_name) t
where rnk<=3 ;


-- Find sector-wise total market capitalization.
select sector_id,sector_name,sum(market_cap) as total_market_cap
from sectors
group by sector_id,sector_name;


-- Find investors who have invested in more than 1 stock.
select i.investor_id,i.full_name,count(stock_id) as number_of_stocks
from portfolio p
join investors i 
using (investor_id)
join stocks st 
using (stock_id)
group by i.investor_id,i.full_name
having count(stock_id) >1;


-- Find stocks whose market cap is above average market cap.
select stock_id,stock_name,market_cap
from stocks
where market_cap >
(select avg(market_cap) as average_market_cap
from stocks);


-- Find total BUY and SELL quantity per stock.
SELECT st.stock_id, st.stock_name,
SUM(CASE WHEN t.transaction_type = 'BUY' THEN t.quantity ELSE 0 END) AS total_buy_qty,
SUM(CASE WHEN t.transaction_type = 'SELL' THEN t.quantity ELSE 0 END) AS total_sell_qty
FROM stocks st
JOIN portfolio p 
ON st.stock_id = p.stock_id
JOIN transactions t 
ON p.portfolio_id = t.portfolio_id
GROUP BY st.stock_id, st.stock_name;

select st.stock_id,st.stock_name,
sum(case when t.transaction_type='BUY' then t.quantity else 0 end) as total_buy_qty,
sum(case when t.transaction_type='SELL' then t.quantity else 0 end) as total_sell_qty
from stocks st
join portfolio p 
using (stock_id)
join transactions t 
using (portfolio_id)
group by st.stock_id,st.stock_name;


-- Find investors who never made any SELL transaction.
select i.investor_id,i.full_name
from investors i 
where not exists
(select 1 
from transactions t 
join portfolio p
using (portfolio_id)
where t.transaction_type='SELL' and p.investor_id=i.investor_id);
 

-- Find the stock with highest total quantity held.
select * from
(select st.stock_id,st.stock_name,sum(p.quantity) as total_quantity,
dense_rank () over(order by sum(p.quantity) desc) as rnk
from stocks st 
join portfolio p
using (stock_id)
group by st.stock_id,st.stock_name) t
where rnk=1;


-- Find investors whose total investment is greater than average investment.
select i.investor_id,i.full_name,sum(p.quantity*p.avg_buy_price) as total_investment
from investors i
join portfolio p 
using (investor_id)
group by i.investor_id,i.full_name
having total_investment > (select avg(average_investment) from 
(select investor_id,avg(p.quantity*p.avg_buy_price) as average_investment from portfolio p
group by investor_id) t);

SELECT investor_id, full_name, total_investment
FROM (
    SELECT i.investor_id, i.full_name,
           SUM(p.quantity * p.avg_buy_price) AS total_investment,
           AVG(SUM(p.quantity * p.avg_buy_price)) OVER () AS avg_investment
    FROM investors i
    JOIN portfolio p USING (investor_id)
    GROUP BY i.investor_id, i.full_name
) t
WHERE total_investment > avg_investment;

select investor_id,full_name,total_investment
from 
(select i.investor_id,i.full_name,
sum(p.quantity * p.avg_buy_price) as total_investment,
avg(sum(p.quantity * p.avg_buy_price)) over () as average_investment
from investors i 
join portfolio p
using (investor_id)
group by i.investor_id,i.full_name ) t 
where total_investment > average_investment ;


-- Find stocks that belong to sectors with HIGH volatility.
select st.stock_id,st.stock_name,se.volatility_level
from stocks st 
join sectors se
using (sector_id)
where se.volatility_level='HIGH'
group by st.stock_id,st.stock_name,se.volatility_level;


-- Find total transaction value per investor.
select i.investor_id,i.full_name, sum(case 
when t.transaction_type='BUY' 
then t.transaction_price*t.quantity 
else 0 end ) + 
sum(case
when t.transaction_type='SELL' 
then (t.transaction_price*t.quantity) 
else 0 end ) as total_transaction_value
from transactions t
join portfolio p
using(portfolio_id)
join investors i
using (investor_id)
group by i.investor_id,i.full_name;


-- Find investors who invested only once.
SELECT i.investor_id, i.full_name
FROM investors i
JOIN portfolio p USING (investor_id)
GROUP BY i.investor_id, i.full_name
HAVING COUNT(p.portfolio_id) = 1;
SELECT i.investor_id, i.full_name
FROM investors i
JOIN portfolio p USING (investor_id)
JOIN transactions t USING (portfolio_id)
GROUP BY i.investor_id, i.full_name
HAVING COUNT(t.transaction_id) = 1;


-- Find stocks that were bought but never sold.
SELECT s.stock_id, s.stock_name
FROM stocks s
JOIN portfolio p ON s.stock_id = p.stock_id
JOIN transactions t ON p.portfolio_id = t.portfolio_id
GROUP BY s.stock_id, s.stock_name
HAVING 
    SUM(CASE WHEN t.transaction_type = 'BUY' THEN 1 ELSE 0 END) > 0
AND 
    SUM(CASE WHEN t.transaction_type = 'SELL' THEN 1 ELSE 0 END) = 0;




-- Rank investors based on total investment.
select investor_id,full_name,sum(p.quantity*p.avg_buy_price) as total_investment,
dense_rank () over(order by sum(p.quantity*p.avg_buy_price) desc) as rank_based_on_investment
from portfolio p
join investors i
using (investor_id)
group by investor_id,full_name;


-- Find latest transaction per investor.
select i.investor_id,i.full_name,max(t.transaction_date) as latest_transaction_date
from transactions t
join portfolio p 
using (portfolio_id)
join investors i 
using (investor_id)
group by i.investor_id,i.full_name;


-- Find difference between BUY and SELL quantity per stock.
SELECT st.stock_id, st.stock_name,
SUM(CASE 
WHEN t.transaction_type = 'BUY' 
THEN t.quantity 
ELSE 0 END) AS total_buy_qty,
SUM(CASE 
WHEN t.transaction_type = 'SELL' 
THEN t.quantity 
ELSE 0 END) AS total_sell_qty,

       SUM(CASE 
             WHEN t.transaction_type = 'BUY' 
             THEN t.quantity 
             ELSE 0 
           END) 
       -
       SUM(CASE 
             WHEN t.transaction_type = 'SELL' 
             THEN t.quantity 
             ELSE 0 
           END) AS qty_difference

FROM stocks st
JOIN portfolio p USING (stock_id)
JOIN transactions t USING (portfolio_id)
GROUP BY st.stock_id, st.stock_name;


-- Calculate profit/loss per investor.
SELECT i.investor_id, i.full_name,

       SUM(CASE 
             WHEN t.transaction_type = 'SELL' 
             THEN t.quantity * t.transaction_price 
             ELSE 0 
           END) AS total_sell_value,

       SUM(CASE 
             WHEN t.transaction_type = 'BUY' 
             THEN t.quantity * t.transaction_price 
             ELSE 0 
           END) AS total_buy_value,

       -- PROFIT / LOSS
       SUM(CASE 
             WHEN t.transaction_type = 'SELL' 
             THEN t.quantity * t.transaction_price 
             ELSE 0 
           END)
       -
       SUM(CASE 
             WHEN t.transaction_type = 'BUY' 
             THEN t.quantity * t.transaction_price 
             ELSE 0 
           END) AS profit_loss

FROM investors i
JOIN portfolio p USING (investor_id)
JOIN transactions t USING (portfolio_id)
GROUP BY i.investor_id, i.full_name;


-- Find investors whose portfolio value is highest based on latest close price.


-- Find stocks where RSI > 70 (overbought condition).
select st.stock_id,st.stock_name,i.rsi
from indicators i 
join stocks st 
using (stock_id)
where i.rsi > 70;

-- Find stocks where MACD > signal_line (bullish signal).
SELECT st.stock_id, st.stock_name, i.macd, i.signal_line
FROM indicators i
JOIN stocks st USING (stock_id)
WHERE i.macd > i.signal_line;


-- Find stocks where close_price > sma_20.
SELECT st.stock_id, st.stock_name, ph.close_price, i.sma_20
FROM stocks st
JOIN price_history ph 
USING (stock_id)
join indicators i
using (stock_id)
WHERE ph.close_price > i.sma_20;


-- Find sectors contributing highest total investment.
select * from 
(select se.sector_id,se.sector_name, sum(p.quantity*p.avg_buy_price)as total_investment,
dense_rank() over(order by sum(p.quantity*p.avg_buy_price) desc ) as rnk
from portfolio p 
join stocks st 
using (stock_id)
join sectors se 
using (sector_id)
group by se.sector_id,se.sector_name) t
where rnk=1;


-- Find investors investing in multiple sectors.
select i.investor_id,i.full_name,
count(sector_id) as sector_count
from portfolio p 
join stocks st
using (stock_id)
join sectors se
using (sector_id)
join investors i
using (investor_id)
group by i.investor_id,i.full_name
having sector_count > 1;


-- Find stock with highest price growth (close - open).
select stock_id,stock_name 
from
(select st.stock_id,st.stock_name,(ph.close_price-ph.open_price) as growth,
dense_rank () over(order by (ph.close_price-ph.open_price) desc ) as rnk
from price_history ph 
join stocks st
using (stock_id)
group by  st.stock_id,st.stock_name,(ph.close_price-ph.open_price))t
where rnk=1;

-- Find investors who invested in highest market cap stock
select investor_id,full_name,market_cap 
from
(select i.investor_id,i.full_name,st.market_cap, 
dense_rank() over(order by st.market_cap desc) as rnk
from portfolio p 
join stocks st 
using (stock_id)
join investors i
using(investor_id)
group by i.investor_id,i.full_name,st.market_cap) t 
where rnk = 1;


-- Find consecutive transaction days per investor (advanced).
SELECT investor_id, full_name, transaction_date, prev_date
FROM (
    SELECT i.investor_id, i.full_name,
           t.transaction_date,
           LAG(t.transaction_date) OVER (
               PARTITION BY i.investor_id 
               ORDER BY t.transaction_date
           ) AS prev_date
    FROM investors i
    JOIN portfolio p USING (investor_id)
    JOIN transactions t USING (portfolio_id)
) t
WHERE DATEDIFF(transaction_date, prev_date) = 1;


-- Find top 10% investors based on investment.
 SELECT investor_id, full_name, total_investment
FROM (
    SELECT i.investor_id, i.full_name,
           SUM(p.quantity * p.avg_buy_price) AS total_investment,
           NTILE(10) OVER (ORDER BY SUM(p.quantity * p.avg_buy_price) DESC) AS bucket
    FROM investors i
    JOIN portfolio p USING (investor_id)
    GROUP BY i.investor_id, i.full_name) t
WHERE bucket = 1;