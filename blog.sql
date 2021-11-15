--1. Crear base de datos llamada blog. (1 Punto)

DROP DATABASE blog;

CREATE DATABASE blog;

\c blog;

--2. Crear las tablas indicadas de acuerdo al modelo de datos. (2 Puntos)

CREATE TABLE usuario(
    id INT,
    email VARCHAR(50),
    PRIMARY KEY (id)   
);
CREATE TABLE post(
    id INT,
    usuario_id INT,
    titulo VARCHAR(50),
    fecha DATE,
    PRIMARY KEY (id),
    FOREIGN KEY (usuario_id) REFERENCES usuario (id)
);
CREATE TABLE comentario(
    id INT,
    usuario_id INT,
    post_id INT,
    texto VARCHAR(50),
    fecha DATE,
    PRIMARY KEY (id),
    FOREIGN KEY (post_id) REFERENCES post (id),
    FOREIGN KEY (usuario_id) REFERENCES usuario (id) 
);
--3. Insertar los siguientes registros. (1 Punto)

INSERT INTO usuario (id, email)
VALUES (1, 'usuario01@hotmail.com'),
(2, 'usuario02@hotmail.com'),
(3, 'usuario03@hotmail.com'),
(4, 'usuario04@hotmail.com'),
(5, 'usuario05@hotmail.com'),
(6, 'usuario06@hotmail.com'),
(7, 'usuario07@hotmail.com'),
(8, 'usuario07@hotmail.com'),
(9, 'usuario07@hotmail.com');

INSERT INTO post (id, usuario_id, titulo, fecha)
VALUES (1, 1, 'Post 1: Esto es malo','2020-06-29'),
(2, 5, 'Post 2: Esto es malo','2020-06-20'),
(3, 1, 'Post 3: Esto es excelente','2020-05-30'),
(4, 9, 'Post 4: Esto es bueno','2020-05-09'),
(5, 7, 'Post 5: Esto es bueno','2020-07-10'),
(6, 5, 'Post 6: Esto es excelente','2020-07-18'),
(7, 8, 'Post 7: Esto es excelente','2020-07-07'),
(8, 5, 'Post 8: Esto es excelente','2020-05-14'),
(9, 2, 'Post 9: Esto es bueno','2020-05-08'),
(10, 6, 'Post 10: Esto es bueno','2020-06-02'),
(11, 4, 'Post 11: Esto es bueno','2020-05-05'),
(12, 9, 'Post 12: Esto es malo', '2020-07-23'),
(13, 5, 'Post 13: Esto es excelente','2020-05-30'),
(14, 8, 'Post 14: Esto es excelenteo','2020-05-01'),
(15, 7, 'Post 15: Esto es malo','2020-06-17');

INSERT INTO comentario (id, usuario_id, post_id, texto, fecha)
VALUES (1, 3, 6, 'Este es el comentario 1', '2020-07-08'),
(2, 4, 2, 'Este es el comentario 2', '2020-06-07'),
(3, 6, 4, 'Este es el comentario 3', '2020-06-16'),
(4, 2, 13, 'Este es el comentario 4', '2020-06-15'),
(5, 6, 6, 'Este es el comentario 5', '2020-05-14'),
(6, 3, 3, 'Este es el comentario 6', '2020-07-08'),
(7, 6, 1, 'Este es el comentario 7', '2020-05-22'),
(8, 6, 7, 'Este es el comentario 8', '2020-07-09'),
(9, 8, 13, 'Este es el comentario 9', '2020-06-30'),
(10, 8, 6, 'Este es el comentario 10', '2020-06-19'),
(11, 5, 1, 'Este es el comentario 11', '2020-05-09'),
(12, 8, 15, 'Este es el comentario 12', '2020-06-17'),
(13, 1, 9, 'Este es el comentario 13', '2020-05-01'),
(14, 2, 5, 'Este es el comentario 14', '2020-05-31'),
(15, 4, 3, 'Este es el comentario 15', '2020-06-28');


--4. Seleccionar el correo, id y título de todos los post publicados por el usuario 5. (1 Punto)

SELECT usuario.email, post.id, post.titulo 
FROM post
JOIN usuario 
ON post.usuario_id = usuario.id 
WHERE post.usuario_id = 5;

--5. Listar el correo, id y el detalle de todos los comentarios que no hayan sido realizados por el usuario con email usuario06@hotmail.com. (1 Punto)

SELECT usuario.email, comentario.id, comentario.texto 
FROM comentario 
JOIN usuario 
ON comentario.usuario_id = usuario.id 
WHERE usuario.email != 'usuario06@hotmail.com';

--6. Listar los usuarios que no han publicado ningún post. (1 Punto)

SELECT *
FROM usuario
LEFT JOIN post
ON usuario.id = post.usuario_id 
WHERE post.id IS NULL;

--7. Listar todos los post con sus comentarios (incluyendo aquellos que no poseencomentarios). (1 Punto)

SELECT *
FROM post
FULL OUTER JOIN comentario
ON post.id = comentario.usuario_id; 

--8. Listar todos los usuarios que hayan publicado un post en Junio. (2 Puntos)

SELECT * 
FROM usuario
JOIN post
ON usuario.id = post.usuario_id
WHERE extract(month from fecha)=6;