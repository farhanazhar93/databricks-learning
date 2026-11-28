CREATE TABLE IF NOT EXISTS dev.control.file_registry
(
    -- Surrogate Key
    file_id BIGINT GENERATED ALWAYS AS IDENTITY,

    -- File Identification
    file_name STRING NOT NULL,
    source_system STRING NOT NULL,
    source_path STRING NOT NULL,
    file_pattern STRING NOT NULL,

    -- Scheduling
    file_frequency STRING NOT NULL COMMENT 'D - DAILY, W - WEEKLY, M - MONTHLY, A - ADHOC',

    -- File Format
    expected_extension STRING COMMENT 'CSV, PARQUET, JSON, XLSX',
    delimiter STRING,
    has_header STRING COMMENT 'Y/N',

    -- Loading Configuration
    load_type STRING COMMENT 'FULL, INCREMENTAL, CDC',
    target_catalog STRING,
    target_schema STRING,
    target_table STRING NOT NULL,

    -- Metadata
    unique_key STRING COMMENT 'Column used to uniquely identify records',
    watermark_column STRING COMMENT 'Column used to identify new or changed records during incremental load processing',

    -- Governance
    active_flag STRING COMMENT 'Y/N',
    file_owner STRING,

    -- Audit Columns
    created_by STRING,
    created_ts TIMESTAMP,
    updated_by STRING,
    updated_ts TIMESTAMP
)
USING DELTA;