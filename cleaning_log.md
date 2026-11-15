# Cleaning log

- Rows and columns:2075259 , 10
- Missing values per column:25979
- Missing as % of all rows:1.25
- Duplicate rows:0
- Date range: 16 Dec 2006 to 26 Nov 2010, about four years.
- Missing data: 25,979 minutes, about 18 days in total, spread over 71 separate outage blocks.
- Pattern: the longest blocks are multi-day (the longest is 7,226 minutes, about 5 days, in Aug 2010). That points to the meter being offline for days at a time, not random bad readings.
- Decision: the missing minutes were dropped, not filled in, because there is no reading to correct.
- No scattered cells noticed , just blank rows indicating power outages
- 34,168 hourly rows after aggregation