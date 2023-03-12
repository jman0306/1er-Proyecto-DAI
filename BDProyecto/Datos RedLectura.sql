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

insert into comentario values(1, 'Una excelente representación de un pueblo fantasma elegíaco. El lugar inquietante de Rulfos te absorbe y te sumerge en la agitación de su pasado reciente. Como muchas obras de este género, Pedro Páramo es más una obra de humor que otra cosa. No hay una progresión coherente de la trama (aunque eso no quiere decir que nada avance), pero el pueblo y las voces que Rulfo da a sus habitantes son seductores. Puede que el tono nunca deje de ser lúgubre, pero la escasa prosa del autor nunca deja de ser absorbente. Este parece el tipo de historia que un escritor menor extendería durante el doble de tiempo, pero Rulfo mantiene todo bajo control y lo que podría convertirse en un lío confuso, en cambio, se desplaza serenamente de una voz a otra. No son exactamente cinco estrellas, para mí, como yo Me gustan algunas estructuras tradicionales, pero sigue siendo brillante y está muy cerca de la máxima puntuación.', '2023/03/12', 1)
insert into comentario values(2, 'Que más se puede decir de este libro, tiene una secuencia de en la narrativa que te atrapa no puedes dejar de leer y leer a pesar de que algunas partes son un tanto predecibles el clic que haces con la historia te mantiene atento en todo momento, lo mejor que he leído en esta pandemia', '2023/03/05', 2)
insert into comentario values(3, 'Novela lenta y liosa debido a la gran cantidad de personajes, los vecinos de una lujosa urbanización llamada Valle Marchito, donde fallece una de las vecinas y cuyo cuerpo está en casa descomponiéndose y sin que nadie se preocupe por ella durante tres meses.La única voz que engancha es la de Olive, la fallecida, el resto, en tercera persona, no dice mucho. Todos los vecinos tienen sus problemas y sus secretos, todos podían tener motivos para acabar con la vida de Olive, lo cual, pese a estar muy visto, es un gancho, pero el “giro” final es decepcionante, una mentira.Por otro lado, están Frank y Emma, los policías que llevan la investigación, también con sus propios problemas, pero la mayoría de personajes son anodinos.No lo llegaría a considerar thriller pese a haber una muerte y una investigación, tiene un ritmo muy lento pese a su narrativa simple.', '2023/03/01', 3)

insert into lista values(1, 'T', 'T', 'F', 1, 1)
insert into lista values(2, 'F', 'F', 'T', 2, 2)
insert into lista values(3, 'F', 'T', 'F', 3, 3)
insert into lista values(4, 'T', 'T', 'F', 1, 3)
insert into lista values(5, 'F', 'T', 'F', 2, 1)
insert into lista values(6, 'F', 'T', 'F', 3, 2)

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
