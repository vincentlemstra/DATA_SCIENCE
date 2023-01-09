-- 5.1.1
SELECT 
    COUNT(hitcount),
    MIN(hitcount),
    MAX(hitcount),
    AVG(hitcount),
    SUM(hitcount)
FROM mhl_hitcount

-- 5.1.2
SELECT 
    COUNT(hitcount),
    MIN(hitcount),
    MAX(hitcount),
    AVG(hitcount),
    SUM(hitcount)
FROM mhl_hitcount
GROUP BY year

-- 5.1.3
SELECT 
    COUNT(hitcount),
    MIN(hitcount),
    MAX(hitcount),
    AVG(hitcount),
    SUM(hitcount)
FROM mhl_hitcount
GROUP BY year, month