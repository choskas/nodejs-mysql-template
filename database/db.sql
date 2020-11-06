-- creacion de la base de datos
CREATE DATABASE database_name;
-- usa la base de datos
USE database_name;
-- crea una tabla en la base datos
CREATE TABLE users(
    id INT(11) NOT NULL,
    username VARCHAR(16) NOT NULL,
    password VARCHAR(60) NOT NULL,
    fullname VARCHAR(100) NOT NULL
);
-- altera la tabla y asigna nuevas propiedades
ALTER TABLE users
    ADD PRIMARY KEY (id);


ALTER TABLE users
    MODIFY id INT(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT = 1;

-- Relacionando el user_id con el id de la primera tabla
CREATE TABLE another_table(
    id INT(11) NOT NULL,
    user_id INT(11),
    description TEXT,
    things VARCHAR(100) NOT NULL,
    created_at timestamp NOT NULL DEFAULT current_timestamp,
    CONSTRAINT fk_user FOREIGN KEY (user_id) REFERENCES users(id)
);
-- altera la tabla y agrega nuevas propiedades
ALTER TABLE another_table
    ADD PRIMARY KEY (id);

ALTER TABLE another_table
    MODIFY id INT(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT = 1;


-- UTILIZAR COMO EJEMPLO :
INSERT INTO users (id, username, password, fullname) VALUES
(1, 'Michaela Lehr', 'Berlin', 'asas'),
(2, 'Michael Wanyoike', 'Nairobi', 'asas'),
(3, 'James Hibbard', 'Munich', 'asas'),
(4, 'Karolina Gawron', 'Wrocław', 'asas');

-- usar esto si se obtiene el error ER_ACCESS_DENIED_ERROR, cambia contraseña 'password';
ALTER USER 'root'@'localhost' IDENTIFIED WITH mysql_native_password BY 'password';