-- crear las siguientes vistas:
select C.CustomerID,CONCAT_WS(' ', p.FirstName, p.LastName) as nombres, C.StoreID,c.TerritoryID
from [Sales].[Customer] as C
LEFT JOIN [Person].[Person] AS p
on C.PersonID= p.BusinessEntityID
where C.PersonID is not null;

select a.TerritoryID,
case
  when a.CountryRegionCode= 'US'  THEN 'United States' else a.name END as Pais
  ,a.CountryRegionCode,
  [Group] as Grupo
from [Sales].[SalesTerritory] as a;

select
P.ProductID,
P.Name AS 'Producto',
S.Name as 'Subcategoria',
C.Name as 'Categoria' 
from [Production].[Product] AS p
left join [Production].[ProductCategory] as S
on P.ProductSubcategoryID=S.ProductCategoryID
left join [Production].[ProductCategory] as C
on s.ProductCategoryID= C.ProductCategoryID

select 
H.SalesOrderID,
CAST(H.OrderDate as date) as Fecha_pedido,
CAST(H.ShipDate as date) as Fecha_envio,
H.TerritoryID, H.CustomerID,
D.ProductID,
D.OrderQty as unidades,
D.UnitPrice as precio_unitario,
D.OrderQty*D.UnitPrice as SubTotal
from 
[Sales].[SalesOrderHeader] as H
left join [Sales].[SalesOrderDetail] as D
on H.SalesOrderID=D.SalesOrderID
