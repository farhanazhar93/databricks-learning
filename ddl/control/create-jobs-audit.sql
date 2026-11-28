CREATE TABLE IF NOT EXISTS dev.control.jobs_audit (
    run_id BIGINT GENERATED ALWAYS AS IDENTITY,

    job_name STRING NOT NULL,
    parent_job_name STRING,

    start_ts TIMESTAMP NOT NULL,
    end_ts TIMESTAMP,

    status STRING NOT NULL,             -- RUNNING, SUCCESS, FAILED

    records_processed BIGINT,

    error_message STRING,

    triggered_by STRING,
    triggered_type STRING,              -- SCHEDULED, MANUAL, API

    created_ts TIMESTAMP DEFAULT CURRENT_TIMESTAMP()

)
USING DELTA;