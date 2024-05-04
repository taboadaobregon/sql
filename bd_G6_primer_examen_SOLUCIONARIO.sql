--SOLUCION DE EXAMEN
--USE BD_G6_PRIMER_EXAMEN
select * from tb_cliente

select '44476373', 'cliN1', 'cliA1',getdate(),'SOLTERO','F',1

select * from tb_modoPago
select * from tb_tipoPago
select * from tb_credito
select * from tb_tarjeta
select 1,1,3,0.03,getdate(),'USER_INSERT',getdate(),'USER_INSERT',1

select * from tb_cliente
where dniCliente = '29939081'

select * from tb_tarjetaCliente

select 3 as idCliente,5 as modoPago, 1 as estado

--P5
select c.nombreCliente, tc.idTarjetaCliente
from tb_tarjetaCliente tc right join tb_cliente c
on tc.idCliente = c.idCliente
where tc.idTarjetaCliente IS NULL

--P6
select * from tb_modoPago
select * from tb_tipoPago

select * 
from tb_tarjeta t
where t.idModoPago = 1 and t.idTipoTarjeta = 1

UPDATE t
SET interesesTarjeta = (interesesTarjeta * 0.05) + interesesTarjeta,
usuarioModificacionTarjeta = 'USER_UPDATE',
fechaModificacionTarjeta = GETDATE()
from tb_tarjeta t
where t.idModoPago = 1 and t.idTipoTarjeta = 1

--P7
select tc.idTarjetaCliente, c.idCliente, c.nombreCliente,
tp.idTipoTarjeta, tp.detalleTipoTarjeta
from tb_tarjetaCliente tc inner join tb_cliente c
on tc.idCliente = c.idCliente inner join tb_tarjeta t
on tc.idTarjeta = t.idTarjeta inner join tb_tipoPago tp
on t.idTipoTarjeta = tp.idTipoTarjeta
where tp.detalleTipoTarjeta in ('VISA','MASTERCARD')

select * from tb_movimientoTarjeta
INSERT INTO tb_movimientoTarjeta 
(idTarjetaCliente, nombreEstablecimiento, montoTotalConsumido, fechaCompra)
select 1,'xyz',1500, GETDATE() UNION ALL
select 1,'xyz',400, GETDATE()

--P8
select c.dniCliente,c.nombreCliente + ' '+ c.apellidosCliente,
tp.detalleTipoTarjeta, mp.detalleModoPago, cr.detalleCredito,mt.montoTotalConsumido,
(cr.detalleCredito - mt.montoTotalConsumido) as diferencia,
CASE 
	WHEN cr.detalleCredito<mt.montoTotalConsumido
		THEN 'Estimado Cliente, su compra excedió al crédito obtenido'
END
from tb_tarjetaCliente tc inner join tb_cliente c
on tc.idCliente = c.idCliente inner join tb_tarjeta t
on tc.idTarjeta = t.idTarjeta inner join tb_tipoPago tp
on t.idTipoTarjeta = tp.idTipoTarjeta inner join tb_modoPago mp
on t.idModoPago = mp.idModoPago inner join tb_credito cr
on t.idCredito = cr.idCredito inner join tb_movimientoTarjeta mt
on tc.idTarjetaCliente = mt.idTarjetaCliente

--P9
select idTarjeta, c.detalleCredito, tp.detalleTipoTarjeta,
mp.detalleModoPago, estadoTarjeta
from tb_tarjeta t inner join tb_credito c
on t.idCredito = c.idCredito inner join tb_tipoPago tp
on t.idTipoTarjeta = tp.idTipoTarjeta inner join tb_modoPago mp
on t.idModoPago = mp.idModoPago
where (detalleCredito<1450 and detalleTipoTarjeta = 'VISA')
OR ((detalleCredito BETWEEN 1450 AND 1600) and 
detalleTipoTarjeta = 'Mastercard' and detalleModoPago = 'Débido')

UPDATE t
SET T.estadoTarjeta = 0,
usuarioModificacionTarjeta = 'USER_UPDATE',
fechaModificacionTarjeta = GETDATE()
from tb_tarjeta t inner join tb_credito c
on t.idCredito = c.idCredito inner join tb_tipoPago tp
on t.idTipoTarjeta = tp.idTipoTarjeta inner join tb_modoPago mp
on t.idModoPago = mp.idModoPago
where (detalleCredito<1450 and detalleTipoTarjeta = 'VISA')
OR ((detalleCredito BETWEEN 1450 AND 1600) and 
detalleTipoTarjeta = 'Mastercard' and detalleModoPago = 'Débido')