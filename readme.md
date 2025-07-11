# Netflix Data Analysis

This project performs an analysis of Netflix content using SQL queries on a SQL Server 2022 database, with visualizations generated using Python libraries. The analysis explores various aspects of Netflix movies and TV shows, such as director contributions, country-based comedy movie counts, yearly top directors, average movie duration by genre, and directors producing both horror and comedy movies. The analysis and visualization techniques were inspired by the YouTube tutorial ["Netflix Data Analysis using SQL and Python"](https://www.youtube.com/watch?v=ZnQwO6V7pec) by Ankit Bansal (YouTube channel: [Ankit Bansal](https://www.youtube.com/@ankitbansal21), 156K subscribers, However, the implementation of the analysis and visualization effects in this project was done independently.

## Project Overview

The project executes six SQL queries on the `NETFLIX` database, which contains tables `netflix_stg`, `netflix_genre`, `netflix_country`, and `netflix_directors`. Each query is paired with a visualization (bar charts or count plots) created using Seaborn and Matplotlib. Results are saved as PNG files in the `results` directory. The dataset extraction process is handled in the `extract.ipynb` file, where the dataset is loaded into the database, followed by the analysis performed in the `main.ipynb` file.

## Prerequisites

### Software Requirements
- **SQL Server 2022**: Database hosting the `NETFLIX` database (instance: `DESKTOP-UFR6MA7\SQLEXPRESS`).
- **Python 3.8+**: For running the analysis script.
- **ODBC Driver 17 for SQL Server**: For database connectivity.

### Python Libraries
Install the required Python libraries using the following command:
```bash
pip install pandas sqlalchemy pyodbc matplotlib seaborn
```

### Database Setup
- **Database Name**: `NETFLIX`
- **Tables**:
  - `netflix_stg`: Main table with show details (e.g., `show_id`, `type`, `date_added`, `duration`).
  - `netflix_genre`: Contains genre information for each show.
  - `netflix_country`: Contains country information for each show.
  - `netflix_directors`: Contains director information for each show.
- **Connection**: Uses Windows Authentication with ODBC Driver 17 for SQL Server.

## Project Structure
- `dataset/`: Directory containing the raw dataset files.
- `results/`: Directory where visualization PNG files are saved.
- `sql/`: Directory containing SQL-related files (e.g., `.gitattributes`).
- `extract.ipynb`: Jupyter Notebook for extracting and loading the dataset into the database.
- `main.ipynb`: Jupyter Notebook containing the SQL queries, Python code, and visualizations.
- `README.md`: This file.
- `requirements.txt`: File listing Python dependencies.

## Queries and Visualizations

1. **Directors with Both Movies and TV Shows**
   - **Description**: Counts movies and TV shows by directors who have produced both, ordered by movie count.
   - **Visualization**: Grouped bar chart showing the top 10 directors by movie and TV show counts.
   - **Output File**: `results/directors_movies_tvshows.png`

2. **Top Countries by Comedy Movies**
   - **Description**: Identifies countries with the highest number of comedy movies.
   - **Visualization**: Bar chart of the top 10 countries by comedy movie count.
   - **Output File**: `results/comedy_movies_by_country.png`

3. **Top Director by Movies per Year**
   - **Description**: Finds the director with the most movies released each year (based on `date_added`).
   - **Visualization**: Bar chart showing the top director per year by movie count.
   - **Output File**: `results/top_director_per_year.png`

4. **Average Movie Duration by Genre**
   - **Description**: Calculates the average duration of movies per genre (converting `duration` from string to integer).
   - **Visualization**: Bar chart of genres by average movie duration.
   - **Output File**: `results/avg_duration_by_genre.png`

5. **Directors with Both Horror and Comedy Movies**
   - **Description**: Lists directors who have created both horror and comedy movies, with counts for each genre.
   - **Visualization**: Grouped bar chart showing comedy and horror movie counts by director.
   - **Output File**: `results/comedy_horror_by_director.png`

## Running the Analysis

1. **Set Up the Database**:
   - Ensure SQL Server 2022 is running with the `NETFLIX` database.
   - Verify the database instance (`DESKTOP-UFR6MA7\SQLEXPRESS`) and Windows Authentication.

2. **Install Dependencies**:
   - Run the pip install command listed above or use `pip install -r requirements.txt` to install required Python libraries.

3. **Extract the Dataset**:
   - Open `extract.ipynb` in Jupyter Notebook or JupyterLab.
   - Execute the notebook cells to extract and load the dataset into the `NETFLIX` database.

4. **Run the Analysis**:
   - Open `main.ipynb` in Jupyter Notebook or JupyterLab.
   - Update the `DB_NAME` variable if your database name differs.
   - Execute the notebook cells to run the queries and generate visualizations.

5. **View Results**:
   - Query results are printed in the notebook.
   - Visualizations are saved as PNG files in the `results` directory.

## Notes
- Ensure the `results` and `dataset` directories exist before running the notebooks, or create them manually (`mkdir results dataset`).
- The `seaborn-v0_8` style is used for visualizations to avoid style-related errors.
- The script includes error handling for SQL queries to ensure robustness.
- If you encounter connection issues, verify the SQL Server instance name and ODBC driver installation.
- The analysis and visualization techniques were inspired by Ankit Bansal's YouTube tutorial, but the code and visualizations were implemented independently.

## Sample Results
Below are excerpts of the query results (as shown in the notebook):

### Query 1: Directors with Both Movies and TV Shows
```
   director            no_of_movies  no_of_tv_shows
0  Marcus Raboy                 15               1
1  Quentin Tarantino             7               1
2  Ryan Polito                   7               1
3  Michael Simon                 5               1
4  Oliver Stone                  4               1
```

### Query 2: Top Countries by Comedy Movies
```
   country          no_of_movies
0  United States           615
1  India                   328
2  United States            70
3  Egypt                    63
4  United Kingdom           60
```



## License
This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.

## Contact
For questions or issues, please open an issue on the project repository or contact the maintainer.
