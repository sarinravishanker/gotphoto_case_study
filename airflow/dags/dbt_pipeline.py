from airflow import DAG
from airflow.operators.python import PythonOperator
from airflow.operators.bash import BashOperator
from datetime import datetime, timedelta
import logging

# Log a message to confirm the DAG is being loaded
logging.info("Loading DAG: staging.py")

# Define default arguments for the DAG
default_args = {
    "depends_on_past": False,
    "retries": None
}

# Define the DAG
with DAG(
    dag_id="dbt_pipeline",
    default_args=default_args,
    description="dbt_pipeline",
    schedule_interval="0 */4 * * *",  # Every 4 hours
    start_date=datetime(2025, 7, 15),
    catchup=False,
) as dag:
    
    # Task to execute DBT staging models and their dependencies
    execute_dbt_task = BashOperator(
        task_id="execute_dbt_models",
        bash_command="""
        cd /opt/airflow/dbt_project && dbt deps &&
        dbt run --profiles-dir profiles --full-refresh
        """
    )

    # Define task dependencies
    execute_dbt_task