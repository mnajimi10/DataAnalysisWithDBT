from airflow import DAG
from airflow.operators.bash import BashOperator
from datetime import timedelta

from datetime import datetime


with DAG(
    dag_id="dbt_movie_pipeline",
    start_date=datetime(2026, 1, 1),
    schedule="@daily",
    catchup=False,
    tags=["dbt", "snowflake"],
) as dag:


    dbt_run = BashOperator(
        task_id="dbt_run",
        bash_command="""
        cd /opt/airflow/netproject &&
        dbt run
        """
    )


    dbt_test = BashOperator(
        task_id="dbt_test",
        bash_command="""
        cd /opt/airflow/netproject &&
        dbt test
        """
    )


    dbt_run >> dbt_test