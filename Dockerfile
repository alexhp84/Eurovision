FROM python:3.12-slim

ENV PYTHONDONTWRITEBYTECODE=1 \
    PYTHONUNBUFFERED=1

WORKDIR /app

# sqlite3 is part of Python's standard library; no pip dependencies are required.
COPY main.py db.py eurovision.db ./

CMD ["python", "main.py"]
