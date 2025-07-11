
# Netflix Data Analysis Project

## Overview
Analyzes Netflix data in SQL Server 2022 (`NETFLIX` on `DESKTOP-UFR6MA7\SQLEXPRESS`) using `netflix_analysis.ipynb`. Covers four tables: `netflix_stg`, `netflix_genre`, `netflix_country`, `netflix_directors`.

## Objectives
1. Directors with both movies and TV shows.
2. Top countries by comedy movies.
3. Top director by movies per year.
4. Average movie duration by genre.
5. Directors with horror and comedy movies.
6. Genres for Steve Brill.

## Visualizations
- Grouped bar charts, bar charts, count plots.
- Saved as PNG files (e.g., `directors_movies_tvshows.png`).

## Prerequisites
- SQL Server 2022 with `NETFLIX` database.
- ODBC Driver 17 for SQL Server.
- Python 3.10+, Jupyter Notebook.
- Dependencies: `pandas`, `sqlalchemy`, `pyodbc`, `matplotlib`, `seaborn==0.13.2`.
  Install: `pip install pandas sqlalchemy pyodbc matplotlib seaborn==0.13.2`.


## Setup
1. Verify SQL Server and `NETFLIX` database.
2. Install ODBC Driver 17.
3. Set up Python and dependencies.
4. Install Jupyter: `pip install jupyter`.

## Running
1. `cd C:\Users\Abcom\Desktop\CODING_STUFF\ELT`
2. `jupyter notebook`
3. Open and run `netflix_analysis.ipynb`.

## Output
- Console: DataFrame results (`df1` to `df6`).
- PNG files in project directory.

## Troubleshooting
- Check database connection and ODBC driver.
- Verify table data in SSMS.
- Adjust `seaborn-v0_8` style or use `sns.set_theme()` if needed.

## Contact
Vinayak Shinde, email:  shindevinayak233@gmail.com . Open an issue if on GitHub.
