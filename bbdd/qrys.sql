--Obtener la lista de precios de todos los productos
select p.nombre, p.precio as precio_costo, d.precio as precio_venta 
from producto p
inner  join detalle d on p.id_producto=d.id_producto
--o Obtener la lista de productos cuya existencia en el inventario haya llegado al
--mínimo permitido (5 unidades)
select * from producto
where stock <=5
--o Obtener una lista de clientes no mayores de 35 años que hayan realizado compras entre
--el 1 de febrero de 2000 y el 25 de mayo de 2000
select concat(c.nombre,' ',c.apellido) as cliente, DATEDIFF(YEAR,c.fecha_nacimiento,GETDATE()) as Edad, f.fecha as fecha_compra
from cliente c
inner join factura f on c.id_cliente=f.id_cliente
where DATEDIFF(YEAR,c.fecha_nacimiento,GETDATE()) < 35 and f.fecha in ('2000-02-01','2000-05-25')

--o Obtener el valor total vendido por cada producto en el año 2000

select p.nombre, sum(d.precio) as precio_venta--, f.fecha as fecha_venta 
from producto p
left join detalle d on p.id_producto=d.id_producto
left join factura f on d.id_factura=f.num_factura 
where Datepart(yy,convert(datetime,f.fecha,103)) = 2000
group by p.nombre
--o Obtener la última fecha de compra de un cliente y según su frecuencia de compra
--estimar en qué fecha podría volver a comprar.
select max(f.fecha) as ultima_compra, count(c.id_cliente) as cantidad_compras,
case max(f.fecha)
when '2021-01-01' then 'proximos 4 meses'
when '2021-01-01' then 'proximos 12 meses'
else 'pocos datos para estimar' 
end as estimacion
from cliente c
left join factura f on c.id_cliente=f.id_cliente
where c.id_cliente = 1
