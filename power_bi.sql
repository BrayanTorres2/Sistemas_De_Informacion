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



create procedure Generar_fechas
as
	Truncate Table Calendario;
	declare @fec_inicio date;
	declare @fec_fin date;
	declare @año int;
	declare @mes_num int;
	declare @mes_corto varchar(20);
	declare @mes_largo varchar(20);
	declare @dia int;

set @fec_inicio=(select CAST(min (OrderDate) as date ) from [Sales].[SalesOrderHeader]);
set @fec_fin=(select CAST(max (ShipDate) as date ) from [Sales].[SalesOrderHeader]);

while @fec_inicio<= @fec_fin
begin 
	set @año=(select YEAR(@fec_inicio));
	set @mes_num=(select MONTH(@fec_inicio));
	set @mes_corto=(select FORMAT(@fec_inicio, 'MMM','PE'));
	SET @mes_largo=(select FORMAT(@fec_inicio, 'MMMM','es-PE' ));
	set @dia=(select day (@fec_inicio))
	INSERT into  Calendario(fecha,año,mes_numero,mes,mes_largo,dia)
	select @fec_inicio,@año,@mes_num,@mes_corto,@mes_largo,@dia;
	set @fec_inicio=DATEADD(DAY,1,@fec_inicio)
end;
drop procedure Generar_fechas
exec  Generar_fechas
create table Calendario(
fecha date,
año int,
mes_numero int,
mes varchar (3),
mes_largo varchar (20),
dia int
)
select * from Calendario
