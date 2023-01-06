-- 4.2.1
SELECT mhl_cities.name, mhl_cities.commune_ID 
FROM mhl_cities 
    LEFT JOIN mhl_communes
        ON mhl_communes.id = mhl_cities.commune_ID
WHERE mhl_communes.name IS NULL

-- 4.2.2
SELECT mhl_cities.name, IFNULL (mhl_communes.name,"INVALID")
FROM mhl_cities
    JOIN mhl_communes 
        ON mhl_communes.id = mhl_cities.commune_ID
    
-- 4.2.3
SELECT 
    rubriek.id AS ID,
    rubriek.name AS hoofdrubriek,
    sub_rubriek.name AS sub_rubriek
FROM mhl_rubrieken AS rubriek
    LEFT JOIN mhl_rubrieken AS sub_rubriek
        ON sub_rubriek.parent = rubriek.id
ORDER BY hoofdrubriek, sub_rubriek

-- 4.2.4
-- ! niet duidelijk -> cross join
SELECT
    mhl_suppliers.name,
    mhl_propertytypes.name,
    IFNULL(mhl_yn_properties.content, "NOT SET") as value
FROM mhl_suppliers
CROSS JOIN mhl_propertytypes
LEFT JOIN mhl_yn_properties ON mhl_suppliers.id=mhl_yn_properties.supplier_ID AND  mhl_propertytypes.id=mhl_yn_properties.propertytype_ID
JOIN mhl_cities ON mhl_suppliers.city_ID=mhl_cities.id
WHERE mhl_cities.name='amsterdam' AND mhl_propertytypes.proptype="A"



