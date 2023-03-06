use RedLectura

create table pagina(
cPagina int primary key,
nombre varchar(50) not null,
URL varchar(500) not null
)


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

create table autor(
cAutor int primary key not null,
nomrbe varchar(50) not null,
cNacionalidad int references nacionalidad not null
)

create table libro(
cLibro int primary key not null,
nombre varchar(50) not null,
fichaBiblio varchar(150) not null,
cEditorial int references editorial not null
)

create table edicion(
cEdicion int primary key not null,
nombre varchar(50) not null,
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
texto varchar(1000) not null,
cUsuario int references usuario not null
)

create table etiqueta(
cEtiqueta int primary key not null,
nombre varchar(50) not null
)

create table paginaEdicion(
cPagina int references pagina,
cEdicion int references edicion,
primary key(cPagina, cEdicion)
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

create table comentarioEtiqueta(
cComentario int references comentario,
cEtiqueta int references etiqueta,
primary key(cComentario, cEtiqueta)
)

create table libroEtiqueta(
cLibro int references libro,
cEtiqueta int references etiqueta,
primary key(cLibro, cEtiqueta)
)

create table lista(
cLista int primary key,
favorito varchar(1),
leido varchar(1),
porLeer varchar(1),
cUsuario int references usuario,
cLibro int references libro
)

create table amigo(
cUsuario int references usuario,
cUsuario2 int references usuario,
primary key(cUsuario, cUsuario2)
)