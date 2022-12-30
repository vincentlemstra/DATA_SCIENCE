-- 3.2.1
SELECT name, straat, huisnr, postcode FROM mhl_suppliers WHERE city_ID = 104

-- 3.2.2
SELECT name, straat, huisnr, postcode FROM mhl_suppliers WHERE membertype IN (1, 2, 3, 8)

-- 3.2.3
SELECT name, straat, huisnr, postcode FROM mhl_suppliers WHERE city_ID = 104 AND NOT p_city_ID = 104

-- 3.2.4
SELECT name, straat, huisnr, postcode FROM mhl_suppliers WHERE city_ID = 104 OR p_city_ID = 172

-- 3.2.5
SELECT name, straat, huisnr, postcode FROM mhl_suppliers WHERE huisnr BETWEEN 11 AND 19

-- 3.2.6
SELECT name, straat, huisnr, postcode FROM mhl_suppliers WHERE (huisnr BETWEEN 11 AND 19) OR (huisnr > 100)

-- 3.2.7
SELECT name, straat, huisnr, postcode FROM mhl_suppliers WHERE name LIKE "'t%"

-- 3.2.8
SELECT name, straat, huisnr, postcode FROM mhl_suppliers WHERE name LIKE "%handel"

-- 3.2.9
SELECT name, straat, huisnr, postcode FROM mhl_suppliers WHERE name LIKE "%groothandel%"

-- 3.2.10
-- mijn antwoord:
SELECT name, straat, huisnr, postcode FROM mhl_suppliers WHERE name LIKE "%&____;%"
-- correcte antwoord:
SELECT name, straat, huisnr, postcode FROM mhl_suppliers WHERE name REGEXP '&[^\s]*;'