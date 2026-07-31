# End-to-End Data Pipeline with Snowflake, dbt, Airflow, s3 & Power BI

## Overview

This project implements an end-to-end data pipeline for analytics using modern data engineering tools.

The pipeline ingests raw files into Amazon S3, loads them into Snowflake, transforms the data using dbt following the Medallion Architecture (Bronze, Silver, Gold), orchestrates the workflow with Apache Airflow, and visualizes business insights in Power BI.


## Architecture

```
Data Sources
      │
      ▼
 Amazon S3
      │
      ▼
Snowflake (COPY INTO)
      │
      ▼
Bronze Layer
      │
      ▼
Silver Layer
      │
      ▼
Gold Layer
      │
      ▼
dbt Transformations
      │
      ▼
Power BI Dashboards
```

Airflow orchestrates the pipeline, while the CI/CD pipeline automates testing and deployment.

## Technologies

* Amazon S3
* Snowflake
* dbt Core
* Apache Airflow
* Power BI
* Git & GitHub
* CI/CD

## Project Structure

```
.
├── models/
├── macros/
├── tests/
├── seeds/
├── snapshots/
├── dags/
├── dbt_project.yml
└── README.md
```

## Workflow

1. Upload raw files to Amazon S3.
2. Load data into Snowflake using `COPY INTO`.
3. Store raw data in the Bronze layer.
4. Clean and standardize data in the Silver layer.
5. Create business-ready models in the Gold layer using dbt.
6. Schedule and orchestrate the pipeline with Airflow.
7. Connect Power BI to the Gold layer to build dashboards.

## Getting Started

Clone the repository:

```bash
git clone <repository_url>
cd <project_name>
```

Install dbt dependencies:

```bash
dbt deps
```

Run the models:

```bash
dbt run
```

Run the tests:

```bash
dbt test
```

## Author

Mimoune Najimi
