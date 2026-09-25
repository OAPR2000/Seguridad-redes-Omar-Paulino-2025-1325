CREATE DATABASE tienda;
USE tienda;

CREATE TABLE usuarios (
  id INT AUTO_INCREMENT PRIMARY KEY,
  username VARCHAR(50) NOT NULL,
  password VARCHAR(255) NOT NULL
);

CREATE TABLE productos (
  id INT AUTO_INCREMENT PRIMARY KEY,
  nombre VARCHAR(100),
  precio DECIMAL(10,2)
);

INSERT INTO usuarios (username, password) VALUES
  ('admin','admin123'), ('omar','2025-1325');
INSERT INTO productos (nombre, precio) VALUES
  ('Laptop', 850.00), ('Mouse', 19.99), ('Teclado', 45.50);

CREATE USER 'webuser'@'10.13.25.130' IDENTIFIED BY 'Web1325!Pass';
GRANT SELECT, INSERT, UPDATE ON tienda.* TO 'webuser'@'10.13.25.130';
FLUSH PRIVILEGES;

-- /etc/mysql/mysql.conf.d/mysqld.cnf
-- bind-address = 10.13.25.146
-- skip-name-resolve   (fix de latencia de conexion, ~10.2s -> ~0.12s)
