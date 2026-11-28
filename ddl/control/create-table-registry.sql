CREATE TABLE IF NOT EXISTS dev.control.table_registry (
    table_id BIGINT GENERATED ALWAYS AS IDENTITY,

    catalog_name STRING NOT NULL,
    schema_name STRING NOT NULL,
    table_type STRING,              -- BRONZE, SILVER, GOLD, CONTROL

    table_name STRING NOT NULL,

    storage_path STRING,
    primary_key STRING,

    load_type STRING,               -- FULL, INCREMENTAL, CDC
    partition_column STRING,

    produce_jobs STRING,
    depends_on_jobs STRING,
    active_flag STRING DEFAULT 'Y',

    created_by STRING,
    created_ts TIMESTAMP DEFAULT CURRENT_TIMESTAMP(),

    updated_by STRING,
    updated_ts TIMESTAMP
)
USING DELTA;