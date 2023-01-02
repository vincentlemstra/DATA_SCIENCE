-- 4.1.1
SELECT mhl_suppliers.name, mhl_suppliers.straat, mhl_suppliers.huisnr, mhl_suppliers.postcode 
FROM mhl_suppliers 
    JOIN mhl_cities 
        ON mhl_suppliers.city_ID = mhl_cities.id
        AND mhl_cities.name = 'Amsterdam'

-- 4.1.2
SELECT 
    mhl_suppliers.name, 
    mhl_suppliers.straat, 
    mhl_suppliers.huisnr, 
    mhl_suppliers.postcode, 
    mhl_cities.name AS plaatsnaam -- AS plaatsnaam = edit Educom antwoord
FROM mhl_suppliers
    JOIN mhl_cities
        ON mhl_cities.id = mhl_suppliers.city_ID
    JOIN mhl_communes
        ON mhl_communes.id = mhl_cities.commune_ID
        AND mhl_communes.name = 'Steenwijkerland'

-- 4.1.3
-- ? klopt niet met antwoord op educom learning. Zitten daar nog duplicates in?
SELECT
    suppliers.name AS supplier_name,
    suppliers.straat,
    suppliers.huisnr,
    suppliers.postcode,
    rubriek.name AS rubriek_name
FROM mhl_suppliers_mhl_rubriek_view AS koppeltabel
    INNER JOIN mhl_suppliers AS suppliers
        ON suppliers.id = koppeltabel.mhl_suppliers_ID
    INNER JOIN mhl_rubrieken AS rubriek
        ON rubriek.id = koppeltabel.mhl_rubriek_view_ID
    LEFT JOIN mhl_rubrieken AS rubriek_parent -- LEFT JOIN mhl_rubrieken = edit Educom antwoord
        ON rubriek_parent.parent = rubriek.id
    INNER JOIN mhl_cities AS city
        ON suppliers.city_ID = city.id
WHERE city.name = 'Amsterdam' AND (rubriek.name = 'drank' OR rubriek_parent.parent = 'drank')
ORDER BY rubriek_name, supplier_name

-- 4.1.4
SELECT 
    mhl_suppliers.name, 
    mhl_suppliers.straat, 
    mhl_suppliers.huisnr, 
    mhl_suppliers.postcode
FROM mhl_yn_properties
    JOIN mhl_suppliers
        ON mhl_suppliers.id = mhl_yn_properties.supplier_ID
    JOIN mhl_propertytypes
        ON mhl_propertytypes.id = mhl_yn_properties.propertytype_ID
WHERE mhl_propertytypes.name = 'specialistische leverancier' OR mhl_propertytypes.name = 'ook voor particulieren'

-- 4.1.5
SELECT
    suppliers.name,
    suppliers.straat,
    suppliers.huisnr,
    suppliers.postcode,
    geo.lat,
    geo.lng
FROM mhl_suppliers AS suppliers
    JOIN pc_lat_long AS geo
        ON suppliers.postcode = geo.pc6
ORDER BY geo.lat DESC
LIMIT 5

-- 4.1.6
SELECT 
    hitcount.hitcount,
    supplier.name AS suppliernaam,
    city.name AS plaatsnaam,
    commune.name AS gemeentenaam,
    district.name AS provincienaam
FROM mhl_suppliers AS supplier
    JOIN mhl_cities AS city
        ON city.id = supplier.city_ID
    JOIN mhl_communes AS commune
        ON commune.id = city.commune_ID
    JOIN mhl_districts AS district
        ON district.id = commune.district_ID
    JOIN mhl_hitcount AS hitcount
        ON hitcount.supplier_ID = supplier.id AND hitcount.year = 2014 AND hitcount.month = 1
WHERE district.name = 'Limburg' OR district.name = 'Brabant' OR district.name = 'Zeeland'

-- 4.1.7
SELECT
    C1.name AS C1_name,
    C2.name AS C2_name,
    C1.id AS C1_id,
    C2.id AS C2_id,
    C1.commune_ID AS C1_commune_ID,
    C2.commune_ID AS C2_commune_ID
FROM mhl_cities AS C1
    JOIN mhl_cities AS C2
        ON C2.name = C1.name 
-- GROUP BY C1.name (fout) > Educom antwoord:
WHERE C1.id < C2.id
ORDER BY C1_name

-- 4.1.8
SELECT
    C1.name AS C1_name,
    C2.name AS C2_name,
    C1.id AS C1_id,
    C2.id AS C2_id,
    C1.commune_ID AS C1_commune_ID,
    C2.commune_ID AS C2_commune_ID,
    C1_commune.name AS C1_commune_name,
    C2_commune.name AS C2_commune_name
FROM mhl_cities AS C1
    JOIN mhl_cities AS C2
        ON C2.name = C1.name 
    JOIN mhl_communes AS C1_commune
        ON C1_commune.id = C1.commune_ID
    JOIN mhl_communes AS C2_commune
        ON C2_commune.id = C2.commune_ID
WHERE C1.id < C2.id AND NOT C1.commune_ID = 0
ORDER BY C1_name

