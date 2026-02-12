# Hospitality-Data-Analysis
SQL-driven analysis of 119,000+ hotel records to identify revenue leakage, cancellation patterns, and ADR optimization strategies in the hospitality sector.

# Hospitality Revenue & Operational Analysis (SQL)

## Executive Summary
This project analyzes a dataset of 119,390 hotel bookings (City vs. Resort properties) to identify key drivers of cancellations and opportunities for ADR (Average Daily Rate) optimization. As a former Front Desk Manager with 15 years of experience, I applied industry logic to the data to move beyond simple metrics and into actionable business intelligence.

## Key Business Insights
The TA/TO Cancellation "Cliff": Identified that Travel Agent/Tour Operator (TA/TO) channels experience a 41% cancellation rate overall, jumping to 53% for bookings made 90+ days in advance.

Property Type Variance: Confirmed that City Hotels are significantly more vulnerable to long-lead cancellations than Resort Hotels, suggesting a need for tiered deposit policies based on property mission.

Yield & Segment Analysis: Identified Transient guests as the primary revenue drivers for City Hotels, maintaining the highest ADR ($110.42) across the largest volume (32,306 bookings). In contrast, Group segments represented a negligible market share (264 bookings) at a significantly lower ADR ($87.40), indicating that a shift toward individual leisure/business travelers would optimize total RevPAR (Revenue Per Available Room) more effectively than pursuing bulk group contracts.

## Technical Skills Demonstrated
SQL Aggregations: Using COUNT, SUM, and AVG to summarize massive datasets.

Data Segmentation: Utilizing CASE statements to categorize lead times and booking windows.

Data Cleaning/Filtering: Focusing on non-canceled bookings (is_canceled = 0) to ensure accurate revenue reporting.

Business Intelligence: Translating raw query results into managerial recommendations.

## Data Source
Kaggle: Hotel Booking Demand Dataset (Jesse Mostipak).
