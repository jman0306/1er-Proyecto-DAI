# First-Project-DAI
Data base + Web Page Project

## Authors

| Name                     | Email            | Github                           |
| ------------------------ | ---------------- |----------------------------------|
| Juan Manuel Ambriz       | jambrizn@itam.mx | https://github.com/jman0306      |
| Daniela del Rio          | ddelriod@itam.mx | https://github.com/Daniela020702 |
| Natalia Gomez            | ngomeza1@itam.mx |                                  |

## SQL

### Link Entity Diagram

![Link Entity Diagram](https://github.com/jman0306/First-Project-DAI/blob/main/1er%20Proyecto/Diagrama%20EV%20RedLectura.jpg)

### Relational Model

```
editorial (cEditorial(PK), nombre dirección)
genero (cGenero(PK), tipo)
nacionalidad (cNacionalidad(PK), nombre)
etiqueta (cEtiqueta(PK), nombre)
autor (cAutor(PK), nombre, cNacionalidad(FK))
libro (cLibro(PK), nombre, fichaBiblio, calificación, suspendido, denuncias, cEditorial(FK))
edicion (cEdicion(PK), nombre, link, cLibro(FK))
usuario (cUsuario(PK), nombre, correo, fNacimiento, contraseña, cNacionalidad(FK))
comentario (cComentario(PK), texto, fecha, denuncia, cUsuario(FK))
lista (cLista(PK), nombre, favorito, leído, porLeer, cUsuario(FK), cLibro(FK))
libroAutor (cLibro(PK)(FK), cAutor(PK)(FK))
libroGenero (cLibro(PK)(FK), cGenero(PK)(FK))
libroEtiqueta (cLibro(PK)(FK), cEtiqueta(PK)(FK))
comentarioEtiqueta (cComentrio(PK)(FK), cEtiqueta(PK)(FK))
amigo (cUsuario(PK)(FK), cUsuario2(PK)(FK))
administrador (cAdministrador(PK), nombre, correo, contraseña)
```

### Creation of tables

```SQL
use RedLectura

create table editorial(
cEditorial int primary key not null,
nombre varchar(50) not null,
direccion varchar(50) not null
)

create table genero(
cGenero int primary key not null,
tipo varchar(50) not null
)

create table nacionalidad(
cNacionalidad int primary key not null,
nombre varchar(50) not null
)

create table etiqueta(
cEtiqueta int primary key not null,
nombre varchar(50) not null
)

create table autor(
cAutor int primary key not null,
nombre varchar(50) not null,
cNacionalidad int references nacionalidad not null
)

create table libro(
cLibro int primary key not null,
nombre varchar(50) not null,
fichaBiblio varchar(150) not null,
calificacion decimal(2,1) not null,
suspendido varchar(1) not null,
denuncias int not null,
cEditorial int references editorial not null
)

create table edicion(
cEdicion int primary key not null,
nombre varchar(50) not null,
link varchar(500),
cLibro int references libro not null
)

create table usuario(
cUsuario int primary key not null,
nombre varchar(100) not null,
correo varchar(100) not null,
fNacimiento date not null,
contraseña varchar(50) not null,
cNacionalidad int references nacionalidad
)

create table comentario(
cComentario int primary key not null,
texto varchar(1500) not null,
fecha date not null,
denuncia varchar(1),
cUsuario int references usuario not null
)

create table lista(
cLista int primary key,
nombre varchar(50),
favorito varchar(1),
leido varchar(1),
porLeer varchar(1),
cUsuario int references usuario,
cLibro int references libro
)

create table libroAutor(
cLibro int references libro,
cAutor int references autor,
primary key(cLibro, cAutor)
)

create table libroGenero(
cLibro int references libro,
cGenero int references genero,
primary key(cLibro, cGenero)
)

create table libroEtiqueta(
cLibro int references libro,
cEtiqueta int references etiqueta,
primary key(cLibro, cEtiqueta)
)

create table comentarioEtiqueta(
cComentario int references comentario,
cEtiqueta int references etiqueta,
primary key(cComentario, cEtiqueta)
)

create table amigo(
cUsuario int references usuario,
cUsuario2 int references usuario,
primary key(cUsuario, cUsuario2)
)

create table administrador(
cAdministrador int,
nombre varchar(100),
correo varchar(100),
contraseña varchar(50)
)
```
### Test data insertion

```SQL
use RedLectura

insert into editorial values(1, 'RM Verlag', 'Calle Girona, 27, Granollers, 08402 , Barcelona')
insert into editorial values(2, 'PLAZA & JANÉS', 'Travessera de Gràcia 47-49, 08021 Barcelona')
insert into editorial values(3, 'Planeta México', 'Av. Presidente Masaryk 111, 11570 Mexico')

insert into genero values(1, 'Novela')
insert into genero values(2, 'Suspenso')
insert into genero values(3, 'Ficcion')

insert into nacionalidad values(1, 'Mexico')
insert into nacionalidad values(2, 'Estados Unidos')
insert into nacionalidad values(3, 'Irlanda')

insert into etiqueta values(1, 'Maravilloso')
insert into etiqueta values(2, 'Predecible')
insert into etiqueta values(3, 'Tedioso')

insert into autor values(1, 'Juan Rulfo', 1)
insert into autor values(2, 'Stephen King', 2)
insert into autor values(3, 'Jo Spain', 3)

insert into libro values(1, 'Pedro Paramo','Rulfo, J. (2019). Pedro Páramo (1.a ed.). RM Verlag, S.L.',9.5, 'F', 0, 1)
insert into libro values(2, 'Billy Summers','King, S. (2021). Billy Summers (Spanish Edition) (Bilingual). Vintage Espanol.',8.5, 'F', 0, 2)
insert into libro values(3, 'Una mentira perfecta','Spain, J. (2023). Una mentira perfecta. Planeta México.',7.5, 'T', 0, 3)

insert into edicion values(1, 'Primera Edicion', 'https://es.scribd.com/book/412287522/Pedro-Paramo', 1)
insert into edicion values(2, 'Español', 'https://www.amazon.com/-/es/Stephen-King-ebook/dp/B08V48WFCT/ref=sr_1_1?__mk_es_US=%C3%85M%C3%85%C5%BD%C3%95%C3%91&crid=1QCMRWYWBV0OV&keywords=billy+summers&qid=1678281134&s=digital-text&sprefix=billy+summers%2Cdigital-text%2C137&sr=1-1', 2)
insert into edicion values(3, 'Bilingue', 'https://latam.casadellibro.com/ebook-una-mentira-perfecta-edicion-mexicana-ebook/9786070795930/13517488', 3)

insert into usuario values(1, 'Natalia Gomez', 'natGom@gmail.com', '2001/09/03', 'Nati09', 1)
insert into usuario values(2, 'Daniela del Rio', 'daniRi@gmail.com', '2001/05/28', 'Dani05', 2)
insert into usuario values(3, 'Juan Manuel Ambriz Nuñez', 'manriz@gmail.com', '2001/06/03', 'Manu06', 3)

insert into comentario values(1, 'Una excelente representación de un pueblo fantasma elegíaco. El lugar inquietante de Rulfos te absorbe y te sumerge en la agitación de su pasado reciente. Como muchas obras de este género, Pedro Páramo es más una obra de humor que otra cosa. No hay una progresión coherente de la trama (aunque eso no quiere decir que nada avance), pero el pueblo y las voces que Rulfo da a sus habitantes son seductores. Puede que el tono nunca deje de ser lúgubre, pero la escasa prosa del autor nunca deja de ser absorbente. Este parece el tipo de historia que un escritor menor extendería durante el doble de tiempo, pero Rulfo mantiene todo bajo control y lo que podría convertirse en un lío confuso, en cambio, se desplaza serenamente de una voz a otra. No son exactamente cinco estrellas, para mí, como yo Me gustan algunas estructuras tradicionales, pero sigue siendo brillante y está muy cerca de la máxima puntuación.', '2023/03/12','F', 1)
insert into comentario values(2, 'Que más se puede decir de este libro, tiene una secuencia de en la narrativa que te atrapa no puedes dejar de leer y leer a pesar de que algunas partes son un tanto predecibles el clic que haces con la historia te mantiene atento en todo momento, lo mejor que he leído en esta pandemia', '2023/03/05', 'F', 2)
insert into comentario values(3, 'Novela lenta y liosa debido a la gran cantidad de personajes, los vecinos de una lujosa urbanización llamada Valle Marchito, donde fallece una de las vecinas y cuyo cuerpo está en casa descomponiéndose y sin que nadie se preocupe por ella durante tres meses.La única voz que engancha es la de Olive, la fallecida, el resto, en tercera persona, no dice mucho. Todos los vecinos tienen sus problemas y sus secretos, todos podían tener motivos para acabar con la vida de Olive, lo cual, pese a estar muy visto, es un gancho, pero el “giro” final es decepcionante, una mentira.Por otro lado, están Frank y Emma, los policías que llevan la investigación, también con sus propios problemas, pero la mayoría de personajes son anodinos.No lo llegaría a considerar thriller pese a haber una muerte y una investigación, tiene un ritmo muy lento pese a su narrativa simple.', '2023/03/01','T', 3)

insert into lista values(1, 'abc', 'T', 'T', 'F', 1, 1)
insert into lista values(2, 'def', 'F', 'F', 'T', 2, 2)
insert into lista values(3, 'ghi', 'F', 'T', 'F', 3, 3)
insert into lista values(4, 'abc', 'T', 'T', 'F', 1, 3)
insert into lista values(5, 'def', 'F', 'T', 'F', 2, 1)
insert into lista values(6, 'ghi', 'F', 'T', 'F', 3, 2)

insert into libroAutor values(1, 1)
insert into libroAutor values(2, 2)
insert into libroAutor values(3, 3)

insert into libroGenero values(1, 1)
insert into libroGenero values(2, 2)
insert into libroGenero values(3, 3)

insert into libroEtiqueta values(1, 1)
insert into libroEtiqueta values(2, 2)
insert into libroEtiqueta values(3, 3)

insert into comentarioEtiqueta values(1, 1)
insert into comentarioEtiqueta values(2, 2)
insert into comentarioEtiqueta values(3, 3)

insert into amigo values(1,2)
insert into amigo values(2,3)
insert into amigo values(3,1)

insert into administrador values(1, 'Enrique Salvador', 'enrisal@gmail.com', 'Redlectura23')
```

### Queries for Web Page

```SQL
use RedLectura

-->Libros por Leer en la lista de cada usuario

select usuario.nombre, libro.nombre as 'Libro por Leer' from usuario inner join lista on usuario.cUsuario=lista.cUsuario
inner join libro on libro.cLibro=lista.cLibro
where lista.porLeer = 'T' and usuario.nombre='Daniela del Rio'


-->Amigos de un usuario

select usuario.nombre from usuario
where usuario.cUsuario=(select amigo.cUsuario2 from usuario inner join amigo on usuario.cUsuario=amigo.cUsuario
where usuario.nombre = 'Daniela del Rio')


-->Lista de todos los libros por orden alfabetico

select libro.nombre as 'Libros' from libro order by libro.nombre asc

/*-------------------------------------------------------------------------------------------------------------------------------------*/

-->nombre del libro, el autor y la calificacion por genero

select libro.nombre, autor.nombre, libro.calificacion from libro inner join libroAutor on libro.cLibro=libroAutor.cLibro
inner join autor on autor.cAutor=libroAutor.cAutor
inner join libroGenero on libro.cLibro=libroGenero.cLibro
inner join genero on genero.cGenero=libroGenero.cGenero
where genero.tipo='Suspenso'

-->nombre del libro, el autor y la calificacion por autor

select libro.nombre, autor.nombre, libro.calificacion from libro inner join libroAutor on libro.cLibro=libroAutor.cLibro
inner join autor on autor.cAutor=libroAutor.cAutor
where autor.nombre = 'Juan Rulfo'

-->nombre del libro, el autor y la calificacion por nombre libro

select libro.nombre, autor.nombre, libro.calificacion from libro inner join libroAutor on libro.cLibro=libroAutor.cLibro
inner join autor on autor.cAutor=libroAutor.cAutor
where libro.nombre = 'Pedro Paramo'

-->todos los atributos del libro (nombre, autor, editorial, genero, edicion, ficha bibliografica y calificación)

select libro.nombre as 'Libro', autor.nombre as 'Autor', editorial.nombre as 'Editorial' ,genero.tipo as 'Genero', edicion.nombre as 'Edicion', libro.fichaBiblio, libro.calificacion from libro inner join libroAutor on libro.cLibro=libroAutor.cLibro
inner join autor on autor.cAutor=libroAutor.cAutor
inner join editorial on editorial.cEditorial=libro.cEditorial
inner join libroGenero on libroGenero.cLibro=libro.cLibro
inner join genero on genero.cGenero=libroGenero.cGenero
inner join edicion on edicion.cLibro=libro.cLibro


-->todas la paginas web de cierto libro

select edicion.link from edicion inner join libro on edicion.cLibro=libro.cLibro
where libro.nombre = 'Pedro Paramo'

-->comentarios de cierto libro

select comentario.texto from comentario inner join usuario on comentario.cUsuario=usuario.cUsuario
inner join lista on lista.cUsuario=usuario.cUsuario
inner join libro on libro.cLibro=lista.cLibro
where libro.nombre='Billy Summers'

select * from libro
select * from comentario

-->nombre y autor de los que son de un genero y top 5 por calificacion

select libro.nombre as 'Libro', autor.nombre as 'Autor' from libro inner join libroAutor on libro.cLibro=libroAutor.cLibro
inner join autor on autor.cAutor=libroAutor.cAutor
inner join libroGenero on libro.cLibro=libroGenero.cLibro
inner join genero on genero.cGenero=libroGenero.cGenero
where genero.tipo='Novela'
order by libro.calificacion desc

-->dar de alta un usuario

insert into usuario values(4, 'Francisco Gutierrez', 'fragu@gmail.com', '1999/06/01', 'Pancho01', 1)

-->dar de alta un libro

insert into libro values(3, 'Una mentira perfecta','Spain, J. (2023). Una mentira perfecta. Planeta México.',7.5, 'T', 0, 3)

-->dar de alta un comentario

insert into comentario values(3, 'Novela lenta y liosa debido a la gran cantidad de personajes, los vecinos de una lujosa urbanización llamada Valle Marchito, donde fallece una de las vecinas y cuyo cuerpo está en casa descomponiéndose y sin que nadie se preocupe por ella durante tres meses.La única voz que engancha es la de Olive, la fallecida, el resto, en tercera persona, no dice mucho. Todos los vecinos tienen sus problemas y sus secretos, todos podían tener motivos para acabar con la vida de Olive, lo cual, pese a estar muy visto, es un gancho, pero el “giro” final es decepcionante, una mentira.Por otro lado, están Frank y Emma, los policías que llevan la investigación, también con sus propios problemas, pero la mayoría de personajes son anodinos.No lo llegaría a considerar thriller pese a haber una muerte y una investigación, tiene un ritmo muy lento pese a su narrativa simple.', '2023/03/01','T', 3)

-->nombre de las listas que esten vinculadas a un usuario

select distinct lista.nombre as 'Listas' from lista inner join usuario on lista.cUsuario=usuario.cUsuario
where usuario.nombre='Natalia Gomez'

-->dar de alta una lista 

insert into lista values(6, 'abc', 'F', 'T', 'F', 3, 2)

-->eliminar una lista 

delete from lista where lista.nombre=(select distinct lista.nombre from lista inner join usuario on lista.cUsuario=usuario.cUsuario
where usuario.contraseña='Nati09' and lista.nombre='abc')

-->todos los libros (nombre y autor) que estan en cierta lista
--> GUARDAR EL USUARIO EN UNA VARIABLE PARA QUE NO VUELVA A INGRESAR SUS DATOS
select libro.nombre as 'Libro', autor.nombre as 'Autor' from libro inner join libroAutor on libro.cLibro=libroAutor.cLibro
inner join autor on libroAutor.cAutor=autor.cAutor
inner join lista on lista.cLibro=libro.cLibro
inner join usuario on usuario.cUsuario=lista.cUsuario
where lista.nombre='abc' and usuario.nombre='Natalia Gomez'
```

## HTML

### Video Explanation

