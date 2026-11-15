--CREATE TABLE
CREATE TABLE hourly_power (
    datetime TIMESTAMP PRIMARY KEY,
    global_active_power NUMERIC,
    global_reactive_power NUMERIC,
    voltage NUMERIC,
    global_intensity NUMERIC,
    sub_metering_1 NUMERIC,
    sub_metering_2 NUMERIC,
    sub_metering_3 NUMERIC
);
-- Peak Hours
SELECT EXTRACT(HOUR FROM datetime) AS hr,
       ROUND(AVG(global_active_power), 2) AS avg_kw
FROM hourly_power
GROUP BY EXTRACT(HOUR FROM datetime)
ORDER BY avg_kw DESC;
--Weekday vs Weekend
SELECT 'Weekend' AS day_type,
       ROUND(AVG(global_active_power), 2) AS avg_kw
FROM hourly_power
WHERE EXTRACT(ISODOW FROM datetime) IN (6, 7);

SELECT 'Weekday' AS day_type,
       ROUND(AVG(global_active_power), 2) AS avg_kw
FROM hourly_power
WHERE EXTRACT(ISODOW FROM datetime) NOT IN (6, 7);
-- MONTHLY TRENDS
SELECT DATE_TRUNC('month', datetime) AS month_start,
       ROUND(AVG(global_active_power), 2) AS avg_kw,
       COUNT(*) AS hours_recorded
FROM hourly_power
GROUP BY month_start
ORDER BY month_start
