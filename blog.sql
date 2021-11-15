--1. Crear base de datos llamada blog. (1 Punto)

CREATE DATABASE blog;

\c blog;

--2. Crear las tablas indicadas de acuerdo al modelo de datos. (2 Puntos)

CREATE TABLE comentario(
    id INT;
    post_id INT;
    usuario_id VARCHAR(50);
    texto VARCHAR(50);
    fecha DATE;
    PRIMARY KEY (id)
    FOREIGN KEY (usuario_id)
);
CREATE TABLE usuario(
    id INT,
    usuario_id VARCHAR(50);
    PRIMARY KEY (id)
    FOREIGN KEY (usuario_id) REFERENCES comentario (id)
);
CREATE TABLE post(
    id INT,
    usuario_id VARCHAR(50),
    título VARCHAR(50);
    fecha DATE;
    PRIMARY KEY (id)
    FOREIGN KEY (usuario_id) REFERENCES comentario (id)
);

--3. Insertar los siguientes registros. (1 Punto)

INSERT INTO usuario (post_id, usuario_id)
VALUES ('1, usuario01@hotmail.com');

INSERT INTO usuario (post_id, usuario_id)
VALUES ('2, usuario02@hotmail.com');

INSERT INTO usuario (post_id, usuario_id)
VALUES ('3, usuario03@hotmail.com');

INSERT INTO usuario (post_id, usuario_id)
VALUES ('4, usuario04@hotmail.com');

INSERT INTO usuario (post_id, usuario_id)
VALUES ('5, usuario05@hotmail.com');

INSERT INTO usuario (post_id, usuario_id)
VALUES ('6, usuario06@hotmail.com');

INSERT INTO usuario (post_id, usuario_id)
VALUES ('7, usuario07@hotmail.com');

INSERT INTO usuario (post_id, usuario_id)
VALUES ('8, usuario08@hotmail.com');

INSERT INTO usuario (post_id, usuario_id)
VALUES ('9, usuario09@hotmail.com');

INSERT INTO post (id, usuario_id, titulo, fecha)
VALUES ('1, 1, Post 1: Esto es malo, 2020-06-29');

INSERT INTO post (id, usuario_id, titulo, fecha)
VALUES ('2, 5, Post 2: Esto es malo, 2020-06-20');

INSERT INTO post (id, usuario_id, titulo, fecha)
VALUES ('3, 1, Post 3: Esto es excelente, 2020-05-30');

INSERT INTO post (id, usuario_id, titulo, fecha)
VALUES ('4, 9, Post 4: Esto es bueno, 2020-05-09');

INSERT INTO post (id, usuario_id, titulo, fecha)
VALUES ('5, 7, Post 5: Esto es bueno, 2020-07-10');

INSERT INTO post (id, usuario_id, titulo, fecha)
VALUES ('6, 5, Post 6: Esto es excelente, 2020-07-18');

INSERT INTO post (id, usuario_id, titulo, fecha)
VALUES ('7, 8, Post 7: Esto es excelente, 2020-07-07');

INSERT INTO post (id, usuario_id, titulo, fecha)
VALUES ('8, 5, Post 8: Esto es excelente, 2020-05-14');

INSERT INTO post (id, usuario_id, titulo, fecha)
VALUES ('9, 2, Post 9: Esto es bueno, 2020-05-08');

INSERT INTO post (id, usuario_id, titulo, fecha)
VALUES ('10, 6, Post 10: Esto es bueno, 2020-06-02');

INSERT INTO post (id, usuario_id, titulo, fecha)
VALUES ('11, 4, Post 11: Esto es bueno, 2020-05-05');

INSERT INTO post (id, usuario_id, titulo, fecha)
VALUES ('12, 9, Post 12: Esto es malo, 2020-07-23');

INSERT INTO post (id, usuario_id, titulo, fecha)
VALUES ('13, 5, Post 13: Esto es excelente, 2020-05-30');

INSERT INTO post (id, usuario_id, titulo, fecha)
VALUES ('14, 8, Post 14: Esto es excelenteo, 2020-05-01');

INSERT INTO post (id, usuario_id, titulo, fecha)
VALUES ('15, 7, Post 15: Esto es malo, 2020-06-17');

INSERT INTO comentario (id, usuario_id, post_id, texto, fecha)
VALUES ('1, 3, 6, Este es el comentario 1, 2020-07-08');

INSERT INTO comentario (id, usuario_id, post_id, texto, fecha)
VALUES ('2, 4, 2, Este es el comentario 2, 2020-06-07');

INSERT INTO comentario (id, usuario_id, post_id, texto, fecha)
VALUES ('3, 6, 4, Este es el comentario 3, 2020-06-16');

INSERT INTO comentario (id, usuario_id, post_id, texto, fecha)
VALUES ('4, 2, 13, Este es el comentario 4, 2020-06-15');

INSERT INTO comentario (id, usuario_id, post_id, texto, fecha)
VALUES ('5, 6, 6, Este es el comentario 5, 2020-05-14');

INSERT INTO comentario (id, usuario_id, post_id, texto, fecha)
VALUES ('6, 3, 3, Este es el comentario 6, 2020-07-08');

INSERT INTO comentario (id, usuario_id, post_id, texto, fecha)
VALUES ('7, 6, 1, Este es el comentario 7, 2020-05-22');

INSERT INTO comentario (id, usuario_id, post_id, texto, fecha)
VALUES ('8, 6, 7, Este es el comentario 8, 2020-07-09');

INSERT INTO comentario (id, usuario_id, post_id, texto, fecha)
VALUES ('9, 8, 13, Este es el comentario 9, 2020-06-30');

INSERT INTO comentario (id, usuario_id, post_id, texto, fecha)
VALUES ('10, 8, 6, Este es el comentario 10, 2020-06-19');

INSERT INTO comentario (id, usuario_id, post_id, texto, fecha)
VALUES ('11, 5, 1, Este es el comentario 11, 2020-05-09');

INSERT INTO comentario (id, usuario_id, post_id, texto, fecha)
VALUES ('12, 8, 15, Este es el comentario 12, 2020-06-17');

INSERT INTO comentario (id, usuario_id, post_id, texto, fecha)
VALUES ('13, 1, 9, Este es el comentario 13, 2020-05-01');

INSERT INTO comentario (id, usuario_id, post_id, texto, fecha)
VALUES ('14, 2, 5, Este es el comentario 14, 2020-05-31');

INSERT INTO comentario (id, usuario_id, post_id, texto, fecha)
VALUES ('15, 4, 3, Este es el comentario 15, 2020-06-28');


--4. Seleccionar el correo, id y título de todos los post publicados por el usuario 5. (1 Punto)

SELECT post.usuario_id, post.post_id 
FROM post
JOIN comentario 
ON post.id=usuario.usuario_id 
WHERE usuario.id = ´5´;

--5. Listar el correo, id y el detalle de todos los comentarios que no hayan sido realizados por el usuario con email usuario06@hotmail.com. (1 Punto)

SELECT * 
FROM comentario 
LEFT JOIN usuario_id 
ON usuario06@hotmail.com; 

--6. Listar los usuarios que no han publicado ningún post. (1 Punto)

SELECT rol.*
FROM rol
LEFT JOIN usuario 
ON rol.id = usuario.id_rol 
WHERE usuario.id_rol IS NULL;

--7. Listar todos los post con sus comentarios (incluyendo aquellos que no poseencomentarios). (1 Punto)

SELECT *
FROM usuario
FULL OUTER JOIN texto
ON usuario.usuario_id=usuarios.id;

--8. Listar todos los usuarios que hayan publicado un post en Junio. (2 Puntos)

SELECT * FROM usuario
WHERE post
) as x
INNER JOIN nombre_tabla1 as y on x.columna1 = y.columna1;