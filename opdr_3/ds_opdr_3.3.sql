-- 3.3.1
SELECT name FROM mhl_cities ORDER BY name

-- 3.3.2
SELECT * FROM mhl_suppliers ORDER BY membertype, city_id, postcode

-- 3.3.3
SELECT * FROM mhl_hitcount ORDER BY year, month ASC, hitcount DESC