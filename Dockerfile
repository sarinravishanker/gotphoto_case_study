FROM apache/airflow:2.6.3-python3.9

# Switch to root to install git and set permissions
USER root

# Install git (required by dbt for package management)
RUN apt-get update && apt-get install -y git && rm -rf /var/lib/apt/lists/*

# Make sure airflow user can access git
RUN chmod +x /usr/bin/git

USER airflow

# Set working directory
WORKDIR /opt/airflow

# Copy dependency files
COPY requirements.txt .

# Install dependencies
RUN pip install --no-cache-dir -r requirements.txt
