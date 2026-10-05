CREATE DATABASE tasks_collaborator;

use tasks_collaborator;

CREATE TABLE users
(us_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
us_username VARCHAR(255) NOT NULL UNIQUE,
us_password TEXT NOT NULL,
us_email VARCHAR(255) NOT NULL UNIQUE)
ENGINE=InnoDB;

CREATE TABLE tasks (
ta_id INT NOT NULL UNIQUE AUTO_INCREMENT PRIMARY KEY,
ta_title VARCHAR(255) NOT NULL,
ta_description TEXT,
ta_dueDate DATE,
ta_owner INT NOT NULL,
CONSTRAINT ta_owner FOREIGN KEY (ta_owner) REFERENCES users(us_id) )
ENGINE=InnoDB;

CREATE TABLE comments (
co_id INT NOT NULL UNIQUE AUTO_INCREMENT PRIMARY KEY,
co_comment TEXT NOT NULL,
co_user INT NOT NULL,
co_task INT NOT NULL,
CONSTRAINT co_user FOREIGN KEY (co_user) REFERENCES users(us_id),
CONSTRAINT co_task FOREIGN KEY (co_task) REFERENCES tasks(ta_id) )
ENGINE=InnoDB;

CREATE TABLE collaborate (
col_user INT NOT NULL,
col_task INT NOT NULL,
PRIMARY KEY (col_user,col_task),
CONSTRAINT col_user FOREIGN KEY (col_user) REFERENCES users(us_id),
CONSTRAINT col_task FOREIGN KEY (col_task) REFERENCES tasks(ta_id) )
ENGINE=InnoDB;


CREATE USER 'task_user'@'%' IDENTIFIED BY 'Banane3945$';

GRANT SELECT, UPDATE, DELETE, INSERT ON tasks_collaborator.* TO 'task_user'@'%';

FLUSH PRIVILEGES;