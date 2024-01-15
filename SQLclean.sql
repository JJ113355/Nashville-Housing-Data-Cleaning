SELECT * 
FROM NashvilleHousing

SELECT COUNT(DISTINCT UniqueID) FROM NashvilleHousing
SELECT COUNT(*) FROM NashvilleHousing


-- Standardize Date Format

-- The Original Data type is Datetime

SELECT FORMAT(SaleDate, 'yyyy-MM-dd') AS standardized_date, UniqueID
FROM NashvilleHousing
ORDER BY standardized_date DESC;


-- Populate Propery address data

SELECT PropertyAddress FROM NashvilleHousing



-- Breaking out addresss into individual colums (address, city, state)
-- PropertyAddress (address, City)
-- OwnerAddress (Address,City, State)


SELECT
    Propertyaddress,
    SUBSTRING(Propertyaddress, 1, CHARINDEX(',', Propertyaddress) - 1) AS Propertyaddress_address,
    SUBSTRING(Propertyaddress, CHARINDEX(',', Propertyaddress) + 2, CHARINDEX(',', Propertyaddress, CHARINDEX(',', Propertyaddress) + 1) - CHARINDEX(',', Propertyaddress) - 2) AS Propertyaddress_City,
FROM NashvilleHousing;

SELECT
    Owneraddress,
    SUBSTRING(Owneraddress, 1, CHARINDEX(',', Owneraddress) - 1) AS Owneraddress_address,
    SUBSTRING(Owneraddress, CHARINDEX(',', Owneraddress) + 2, CHARINDEX(',', Owneraddress, CHARINDEX(',', Owneraddress) + 1) - CHARINDEX(',', Owneraddress) - 2) AS Owneraddress_city,
    SUBSTRING(Owneraddress, CHARINDEX(',', Owneraddress, CHARINDEX(',', Owneraddress) + 1) + 2, LEN(Owneraddress) - CHARINDEX(',', REVERSE(Owneraddress))) AS Owneraddress_state
FROM NashvilleHousing;

SELECT
    PARSENAME(REPLACE(Owneraddress, ',', '.'), 3) AS Owneraddress_address,
    PARSENAME(REPLACE(Owneraddress, ',', '.'), 2) AS Owneraddress_city,
    PARSENAME(REPLACE(Owneraddress, ',','.'), 1) AS Owneraddress_state
FROM NashvilleHousing;


-- Change Y and N to Yes and NO in "SOld as Vacnan' Field





-- remove duplicates




-- delete unused columns

