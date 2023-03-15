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

