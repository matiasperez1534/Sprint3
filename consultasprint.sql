/*crear usuario*/
CREATE USER 'admin'@'localhost' IDENTIFIED BY 'admin';
/*otorgar privilegios*/
GRANT ALL PRIVILEGES ON sprint_telovendo.* TO 'admin'@'localhost';
/*activar privilegios*/
FLUSH PRIVILEGES;


/*insertar clientes*/
insert into cliente(nombre,apellido,direccion) values('Bernardo','Lopez','arlegui #62');
insert into cliente(nombre,apellido,direccion) values('Alejandro','Mendez','prat #32');
insert into cliente(nombre,apellido,direccion) values('Maria','Vasquez','Dolores #78');
insert into cliente(nombre,apellido,direccion) values('Nancy','Muller','Baquedano #66');
insert into cliente(nombre,apellido,direccion) values('Vicente','Soto','Rodriguez #45');

select * from cliente;

/*insertar proveedor*/
insert into proveedor(nom_representante,nom_corporativo,telefono,nom_contacto,correo,cat_prod,stock) values('Adela Rosales','Samsung','93263253','Juan Savedra','juan@samsung.com','computadores portatiles',1000);
insert into proveedor(nom_representante,nom_corporativo,telefono,nom_contacto,correo,cat_prod,stock) values('Eliza Saban','Pcfactory','93263253','Rodrigo Lopez','rodrigo@pcfactory.com','accesorios computacionales',800);
insert into proveedor(nom_representante,nom_corporativo,telefono,nom_contacto,correo,cat_prod,stock) values('Hugo Leon','Falabella','93263253','Francisco Astudillo','francisco@falabella.com','electrodomesticos',1500);
insert into proveedor(nom_representante,nom_corporativo,telefono,nom_contacto,correo,cat_prod,stock) values('Manuel Alarcon','Motorola','93263253','Romina Salazar','romina@motorola.com','telefonia movil',1200);
insert into proveedor(nom_representante,nom_corporativo,telefono,nom_contacto,correo,cat_prod,stock) values('Mario Galindo','LG','93263253','Claudia Lazo','claudia@lg.com','Television',2000);
select * from proveedor;

/*insertar producto*/
insert into producto(nom_prod,precio,cat_prod,proveedor,stock,color,Cliente_idCliente,Proveedor_idProveedor)values('notebook',800000,'computadores portatiles','samsung','10','gris',1,1);
insert into producto(nom_prod,precio,cat_prod,proveedor,stock,color,Cliente_idCliente,Proveedor_idProveedor)values('smart-tv 40"',300000,'Television','LG','20','negro',1,1);
insert into producto(nom_prod,precio,cat_prod,proveedor,stock,color,Cliente_idCliente,Proveedor_idProveedor)values('smart-tv 50"',400000,'Television','LG','30','negro',2,5);
insert into producto(nom_prod,precio,cat_prod,proveedor,stock,color,Cliente_idCliente,Proveedor_idProveedor)values('refrigerador mademsa',300000,'electrodomesticos','Falabella','20','blanco',3,3);
insert into producto(nom_prod,precio,cat_prod,proveedor,stock,color,Cliente_idCliente,Proveedor_idProveedor)values('refrigerador fensa',350000,'electrodomesticos','Falabella','15','blanco',5,3);
insert into producto(nom_prod,precio,cat_prod,proveedor,stock,color,Cliente_idCliente,Proveedor_idProveedor)values('celular motog9',150000,'telefonia movil','Motorola','30','azul',4,4);
insert into producto(nom_prod,precio,cat_prod,proveedor,stock,color,Cliente_idCliente,Proveedor_idProveedor)values('celular motog10',200000,'telefonia movil','Motorola','40','gris',5,4);
insert into producto(nom_prod,precio,cat_prod,proveedor,stock,color,Cliente_idCliente,Proveedor_idProveedor)values('mouse',10000,'accesorios computacionales','Pcfactory','50','gris',3,2);
insert into producto(nom_prod,precio,cat_prod,proveedor,stock,color,Cliente_idCliente,Proveedor_idProveedor)values('teclado',20000,'accesorios computacionales','Pcfactory','60','blanco',2,2);
insert into producto(nom_prod,precio,cat_prod,proveedor,stock,color,Cliente_idCliente,Proveedor_idProveedor)values('hervidor',50000,'electrodomesticos','Falabella','50','gris',1,3);
select * from producto;

/*Cuál es la categoría de productos que más se repite.*/
select cat_prod,count(*) cantidad
from producto
group by cat_prod
order by cantidad desc limit 1;


/*Cuáles son los productos con mayor stock*/
select nom_prod,stock
from producto
where stock = (select max(stock) from producto);

/*Qué color de producto es más común en nuestra tienda.*/
select color,count(*) cantidad
from producto
group by color
order by cantidad desc
limit 1;

/*Cual o cuales son los proveedores con menor stock de productos.*/
select nom_corporativo,stock
from proveedor
where stock = (select min(stock) from proveedor);


/*Cambien la categoría de productos más popular por ‘Electrónica y computación’.*/
/*Para activar los updates*/
SET SQL_SAFE_UPDATES = 0;

update producto set cat_prod ='Electrónica y computación' 
where cat_prod =(select * from(select cat_prod
from producto 
group by cat_prod 
order by count(*) desc limit 1)as algo);

select * from producto;






