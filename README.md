# 📊 Superstore Sales Analysis Project

An end-to-end data analysis project on retail sales data — covering data cleaning, database analysis, and interactive visualization to uncover insights on sales, profit, and performance trends.

## 🧰 Tools & Technologies

- **Excel** – Initial data inspection and cleaning
- **Python** – Data cleaning and preprocessing (Pandas)
- **MySQL** – Data storage and analytical querying
- **Power BI** – Dashboard creation and data visualization

## 📁 Project Workflow

1. **Data Cleaning (Excel & Python)**
   - Handled raw Superstore sales data
   - Cleaned inconsistent formatting, standardized column values, and computed derived fields (e.g. Profit Margin, Month, Year)
   - Exported the cleaned dataset as `CSV_Superstore_Cleaned.csv`

2. **Database Setup & Analysis (MySQL)**
   - Created a `SuperStore` database and `sales` table
   - Loaded the cleaned CSV using `LOAD DATA LOCAL INFILE`
   - Converted date columns from string to proper `DATE` format using `STR_TO_DATE`
   - Performed exploratory and business analysis queries, including:
     - Overall sales & profit summary
     - Year-wise and month-wise sales trends
     - Country-wise sales and profit breakdown
     - Top-performing and loss-making products

3. **Visualization (Power BI)**
   - Connected Power BI to the MySQL database / cleaned dataset
   - Built an interactive dashboard to visualize:
     - Sales & profit trends over time
     - Regional performance
     - Top and bottom performing products
     - Discount vs. profit relationship

## 📌 Key Insights

- Identified top revenue-generating products and countries
- Highlighted loss-making products for further review
- Uncovered seasonal/monthly sales trends across multiple years
- Analyzed the impact of discounts on overall profitability

## 🗂️ Repository Structure<img width="1234" height="691" alt="Screenshot 2026-07-03 193654" src="https://github.com/user-attachments/assets/8596d316-a919-4bce-9056-7a133faa2ae7" />
