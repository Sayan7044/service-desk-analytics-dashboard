SELECT customer_name FROM support_tickets

-----------------------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------KPI ANALYSIS-----------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------------

-- KPI 1 — Total Tickets
SELECT COUNT(*) AS total_tickets
FROM support_tickets

-- KPI 2 — Ticket Status Breakdown
SELECT ticket_status, COUNT(*) AS ticket_count
FROM support_tickets
GROUP BY ticket_status
ORDER BY ticket_status DESC

-- KPI 3 — Closed Ticket %
SELECT ROUND(100.0*SUM(CASE WHEN ticket_status='Closed' THEN 1 ELSE 0 END)/COUNT(*),2) AS Closed_Ticket_Percent
FROM support_tickets

-- KPI 4 — Avg Resolution Time Only valid resolved tickets.
SELECT AVG(resolution_time_hours) AS avg_resolution_time
FROM support_tickets
WHERE data_quality_flag='Valid'

-- KPI 5 — SLA Breach % SLA = 48
SELECT ROUND(100*SUM(CASE WHEN resolution_time_hours>48 THEN 1 ELSE 0 END)/COUNT(resolution_time_hours),2) AS SLA_beach_percen
FROM support_tickets
WHERE resolution_time_hours IS NOT NULL

-- KPI 6 — Avg Customer Satisfaction
SELECT AVG(customer_satisfaction_rating) AS avg_customer_satisfaction
FROM support_tickets
WHERE customer_satisfaction_rating IS NOT NULL

-- KPI 7 — Priority Distribution
SELECT ticket_priority, COUNT(*) AS priority_distribution
FROM support_tickets
GROUP BY ticket_priority
ORDER BY COUNT(*) DESC

-- KPI 8 — Ticket Channel Analysis
SELECT ticket_channel, COUNT(*) AS ticket_channel_count
FROM support_tickets
GROUP BY ticket_channel
ORDER BY COUNT(*) DESC

-- KPI 10 — Customer Satisfaction by Channel
SELECT ticket_channel, AVG(customer_satisfaction_rating) AS customer_satisfaction_channel
FROM support_tickets
WHERE customer_satisfaction_rating IS NOT NULL
GROUP BY ticket_channel
ORDER BY AVG(customer_satisfaction_rating) DESC



















































































































































































