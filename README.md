# Eurovision Database Project

A Python and SQLite project for exploring Eurovision Song Contest winners and song details through SQL queries. The project combines two related tables to answer questions about winning countries, songs, languages, performance types, and song lengths.

## Features

- Count Eurovision wins by country and check Israel's wins.
- List winner and song details by joining the winners and song-details tables on year.
- Query song lengths, languages, genres, and solo performances.
- Run an example database update for the 2018 song entry.
- Use parameter-ready SQLite helper functions for reading and updating data.
- Run the project locally with Python or in a Docker container.

## Technology

- Python 3
- SQLite
- SQL (`SELECT`, filtering, aggregation, sorting, and joins)
- Docker and Docker Compose (optional)

## Project files

```text
.
├── main.py
├── db.py
├── eurovision.db
├── eurovision.sql
├── Dockerfile
├── compose.docker.yml
└── README.md
```

`main.py` runs example queries and prints their results. `db.py` contains the SQLite connection and query helper functions. `eurovision.db` is the database file, and `eurovision.sql` contains example analysis queries.

## Run locally

Requires Python 3. No third-party Python packages are needed for the supplied code because `sqlite3` is part of the Python standard library.

1. Ensure `main.py`, `db.py`, and `eurovision.db` are in the same directory.
2. Run:

   ```bash
   python main.py
   ```

The script prints the count of Israeli wins, joined winner/song details, and the result of its example update to the 2018 song length.

> **Note:** The supplied example changes the 2018 song length to 180 seconds. Running it modifies `eurovision.db`. Use a backup if you want to preserve the original data.

## Run with Docker Compose

Requires Docker Engine and the Docker Compose plugin.

```bash
docker compose -f compose.docker.yml up --build
```

To stop the container, press `Ctrl+C`, then run:

```bash
docker compose -f compose.docker.yml down
```

The Compose configuration mounts the local `eurovision.db` into the container, so database updates persist on the host. Back up the database before running update examples.

## Database structure

The database contains two tables:

### `eurovision_winners`

| Column | Description |
|---|---|
| `year` | Contest year; primary key |
| `country` | Winning country |
| `winner` | Winning performer |
| `host_country` | Host country |
| `song_name` | Winning song title |

### `song_details`

| Column | Description |
|---|---|
| `year` | Contest year; primary key used to join to the winners table |
| `song_length_seconds` | Song length in seconds |
| `solo_performance` | Whether the performance is marked as solo |
| `genre` | Song genre |
| `language` | Song language |

## Example analysis questions

The SQL examples explore questions such as:

- How many times has Israel won?
- Which countries have won most often?
- What is the average or longest song length in the dataset?
- How many songs are listed as English-language songs?
- Which winners performed solo?
- What are Israel's first and most recent wins in the dataset?

## Scope and limitations

This is a learning project demonstrating Python database access and SQL analysis. Results depend on the records present in the supplied SQLite database; the project is not presented as a live or complete Eurovision data service.
