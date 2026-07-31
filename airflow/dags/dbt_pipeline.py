from airflow import DAG
from airflow.operators.bash import BashOperator
from datetime import timedelta

from datetime import datetime



def notify_failure(context):
    print("❌ Pipeline dbt échoué")



default_args = {
    "retries": 2,
    "retry_delay": timedelta(minutes=2),
    "on_failure_callback": notify_failure
}



with DAG(
    dag_id="dbt_movie_pipeline",
    start_date=datetime(2026, 1, 1),
    schedule="@daily",
    catchup=False,
    default_args=default_args,
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