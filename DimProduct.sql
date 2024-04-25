-- Cleansed DIM_Products Table
SELECT 
  p.ProductKey, 
  p.ProductAlternateKey AS ProductItemCode, 
  p.EnglishProductName AS Product_Name, 
  ps.EnglishProductSubcategoryName AS Sub_Category, -- Joined in from Sub Category Table
  pc.EnglishProductCategoryName AS Product_Category, -- Joined in from Category Table
  p.Color AS Product_Color, 
  p.Size AS Product_Size, 
  p.ProductLine AS Product_Line, 
  p.ModelName AS Product_Model_Name, 
  p.EnglishDescription AS Product_Description, 
  ISNULL (p.Status, 'Outdated') AS Product_Status 
FROM 
  DimProduct as p LEFT JOIN DimProductSubcategory AS ps 
  ON ps.ProductSubcategoryKey = p.ProductSubcategoryKey 
  LEFT JOIN DimProductCategory AS pc 
  ON ps.ProductCategoryKey = pc.ProductCategoryKey 
order by 
  p.ProductKey asc;