FROM python:3.11-slim-bullseye

RUN apt-get update && apt-get install -y --no-install-recommends \
    build-essential \
    gfortran \
    libatlas-base-dev \
    liblapack-dev \
    libopenblas-dev \
    linux-headers-$(uname -r) \
    bison \
    flex \
    libelf-dev \
    libbpf-dev \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /app
COPY . /app
RUN python -m venv .venv
RUN . .venv/bin/activate
RUN pip install --upgrade pip
RUN pip install -r requirements.txt
EXPOSE 8501
CMD ["streamlit", "run", "app.py"] # Reemplaza app.py si es necesario
