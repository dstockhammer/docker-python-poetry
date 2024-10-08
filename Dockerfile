FROM python:3.13.0

ENV PYTHONFAULTHANDLER=1 \
    PYTHONUNBUFFERED=1 \
    PYTHONHASHSEED=random \
    PIP_NO_CACHE_DIR=off \
    PIP_DISABLE_PIP_VERSION_CHECK=on \
    POETRY_HOME=/opt/poetry \
    POETRY_NO_INTERACTION=1 \
    POETRY_NO_ANSI=1  \
    PATH=$PATH:/opt/poetry/bin

RUN python3 -m venv $POETRY_HOME \
 && $POETRY_HOME/bin/pip install poetry --no-cache-dir
