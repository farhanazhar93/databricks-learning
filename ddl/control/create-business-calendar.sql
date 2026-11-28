CREATE TABLE IF NOT EXISTS dev.control.business_calendar
(
    business_date DATE NOT NULL,
    prev_business_date DATE NOT NULL,
    next_business_date DATE NOT NULL,
    process_flg numeric(1,0) COMMENT '1 - Have batch running on this date, 0 - No batch running on this date',
    business_day_flag STRING COMMENT 'Y/N',
    month_end_flag STRING COMMENT 'Y/N',

    created_by STRING,
    created_ts TIMESTAMP,
    updated_by STRING,
    updated_ts TIMESTAMP
)
USING DELTA;