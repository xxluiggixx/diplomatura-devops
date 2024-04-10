CREATE TABLE estudiantes (
codigo int NOT NULL,
dni varchar(32)  NOT NULL,
nombre varchar(64)  NOT NULL,
apellido varchar(64) NOT NULL,
email varchar(128),
telefono varchar(64)
);

CREATE TABLE cursos (
codigo varchar(16) NOT NULL,
nombre varchar(64)  NOT NULL,
descripcion TEXT,
fecha_ini DATE,
fecha_fin DATE,
PRIMARY KEY(codigo)
);

CREATE TABLE cursos_estudiantes (
codigo_estudiante int NOT NULL,
codigo_curso varchar(16) NOT NULL,
PRIMARY KEY(codigo_estudiante,codigo_curso)
);

ALTER TABLE cursos_estudiantes ADD CONSTRAINT fk_cursos FOREIGN KEY(codigo_curso) REFERENCES cursos(codigo);
ALTER TABLE cursos_estudiantes ADD CONSTRAINT fk_estudiantes FOREIGN KEY(codigo_estudiante) REFERENCES estudiantes(codigo);

CREATE UNIQUE INDEX idx_dni ON estudiantes(dni);

show columns from estudiantes;
INSERT INTO estudiantes VALUES( 1,'2535555','Leonardo','Castillo','leonardo@gmail.com','38742580000');
INSERT INTO estudiantes (codigo, dni, nombre, apellido) VALUES( 2,'253523555','Maria','Araujo');