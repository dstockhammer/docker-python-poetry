# docker-python-poetry

Docker image containing [Python](https://www.python.org) + [Poetry](https://python-poetry.org).

## Usage

```dockerfile
FROM dstockhammer/python-poetry:3.11 AS builder

WORKDIR /app

COPY pyproject.toml poetry.lock ./
RUN poetry install --only=main --no-root --no-ansi --no-interaction


FROM python:3.11-slim

WORKDIR /app

ENV PYTHONFAULTHANDLER=1 \
    PYTHONHASHSEED=random \
    PYTHONUNBUFFERED=1

RUN addgroup app --gid 1000 \
 && adduser app --home /app --uid 1000 --gid 1000 --disabled-login --disabled-password

COPY --from=builder /app/.venv ./.venv
COPY src ./src

USER 1000

ENTRYPOINT [ "/app/.venv/bin/python" ]
```
