-- CMS field mapping:
-- field6 = State Code
-- field46 = Total Costs
--
-- Question: Which states have the highest average hospital total costs?

SELECT
    field6 AS state_code,
    COUNT(*) AS hospital_count,
    ROUND(AVG(CAST(field46 AS REAL)), 2) AS average_total_cost
FROM CostReport_2024_final
WHERE field1 <> 'rpt_rec_num'
  AND field6 IS NOT NULL
  AND field46 IS NOT NULL
  AND field46 <> ''
GROUP BY field6
HAVING COUNT(*) >= 5
ORDER BY average_total_cost DESC;
