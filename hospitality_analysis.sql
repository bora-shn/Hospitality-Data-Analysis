/* HOSPITALITY DATA ANALYSIS PROJECT
   Author: [Bora Sahin]
   Goal: Identify Revenue Leakage and ADR Optimization Opportunities
*/

-- QUERY 1: Cancellation Rate by Distribution Channel
-- Goal: Identify which booking sources are high-risk.
SELECT 
distribution_channel,
COUNT (*) AS total_bookings,
SUM (is_canceled) AS total_canceled,
ROUND (avg(is_canceled) * 100, 2) AS cancellation_rate
FROM hotel_bookings
GROUP BY distribution_channel
ORDER BY cancellation_rate DESC;

-- QUERY 2: Lead Time Impact on TA/TO Cancellations
-- Goal: Test the theory that long-lead bookings from agents are "Ghost Inventory."
SELECT 
CASE
WHEN lead_time <= 7 THEN '0-7 Days (Last Minute)'
WHEN lead_time <= 30 THEN '8-30 Days (short)'
WHEN lead_time <= 90 THEN '31-90 Days (medium)'
ELSE '90+ Days (Long Lead)'
END AS booking_window,
COUNT(*) AS total_bookings,
round(avg(is_canceled) * 100, 2) AS cancel_rate
FROM hotel_bookings
WHERE distribution_channel = 'TA/TO'
GROUP BY booking_window
ORDER BY cancel_rate DESC;

-- QUERY 3: City vs. Resort Property Vulnerability
-- Goal: Segment the lead-time risk by hotel type to customize policy recommendations.
SELECT 
    hotel,
    CASE 
        WHEN lead_time <= 90 THEN 'Short/Medium Lead'
        ELSE '90+ Days (Long Lead)'
    END AS booking_window,
    COUNT(*) AS total_bookings,
    ROUND(AVG(is_canceled) * 100, 2) AS cancel_rate
FROM 
    hotel_bookings
WHERE 
    distribution_channel = 'TA/TO'
GROUP BY 
    hotel, booking_window
ORDER BY 
    hotel, cancel_rate DESC;

-- QUERY 4: Yield & ADR by Customer Segment
-- Goal: Identify the "Money Makers" (High Volume + High ADR) vs. low-yield segments.
SELECT 
    customer_type,
    hotel,
    ROUND(AVG(adr), 2) AS average_daily_rate,
    COUNT(*) AS total_bookings
FROM 
    hotel_bookings
WHERE 
    is_canceled = 0 
GROUP BY 
    customer_type, hotel
ORDER BY 
    average_daily_rate DESC;
