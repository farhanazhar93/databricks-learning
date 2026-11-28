CREATE TABLE IF NOT EXISTS dev.control.process_log (
    process_id BIGINT GENERATED ALWAYS AS IDENTITY,

    run_id BIGINT NOT NULL,

    process_name STRING NOT NULL,

    source_object STRING,
    target_object STRING,

    source_count BIGINT,
    target_count BIGINT,

    inserted_count BIGINT,
    updated_count BIGINT,
    deleted_count BIGINT,

    source_id BIGINT,
    target_id BIGINT,

    start_ts TIMESTAMP,
    end_ts TIMESTAMP,

    status STRING NOT NULL,             -- RUNNING, SUCCESS, FAILED

    error_message STRING,

    created_ts TIMESTAMP DEFAULT CURRENT_TIMESTAMP()

)
USING DELTA;