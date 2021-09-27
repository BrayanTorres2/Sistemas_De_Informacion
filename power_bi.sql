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
