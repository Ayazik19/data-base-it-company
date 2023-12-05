USE it_company;

DROP TABLE IF NOT EXISTS `Orders`;
CREATE TABLE IF NOT EXISTS `Orders` (
  `id_Order` INT NOT NULL AUTO_INCREMENT,
  `id_Employees` INT NOT NULL,
  `id_Type_payment` INT NOT NULL,
  `id_Client` INT NOT NULL,
  `date_order` DATE NOT NULL, 
  PRIMARY KEY (`id_Order`),
  UNIQUE INDEX `id_Order_UNIQUE` (`id_Employees` ASC) VISIBLE,
  UNIQUE INDEX `id_Type_payment_UNIQUE` (`id_Type_payment` ASC) VISIBLE,
  UNIQUE INDEX `id_Client_UNIQUE` (`id_Client` ASC) VISIBLE);

INSERT INTO Orders(id_Employees, id_Type_Payment, id_Client) VALUES(1,1,1,1,'11.04.2023');
INSERT INTO Orders(id_Employees, id_Type_Payment, id_Client) VALUES(2,2,2,2,'16.04.2023');
INSERT INTO Orders(id_Employees, id_Type_Payment, id_Client) VALUES(3,3,3,3,'30.04.2023');
INSERT INTO Orders(id_Employees, id_Type_Payment, id_Client) VALUES(4,4,4,4,'31.03.2023');
INSERT INTO Orders(id_Employees, id_Type_Payment, id_Client) VALUES(5,5,5,5,'21.03.2023');
INSERT INTO Orders(id_Employees, id_Type_Payment, id_Client) VALUES(6,6,6,6,'10.03.2023');
INSERT INTO Orders(id_Employees, id_Type_Payment, id_Client) VALUES(7,7,7,7,'02.05.2023');
INSERT INTO Orders(id_Employees, id_Type_Payment, id_Client) VALUES(8,8,8,8,'03.05.2023');
INSERT INTO Orders(id_Employees, id_Type_Payment, id_Client) VALUES(9,9,9,9,'16.05.2023');
INSERT INTO Orders(id_Employees, id_Type_Payment, id_Client) VALUES(10,10,10,10,'11.04.2023');

DROP TABLE IF NOT EXISTS `Clients`;
CREATE TABLE IF NOT EXISTS `Clients` (
  `id_Client` INT NOT NULL AUTO_INCREMENT,
  `name` CHAR(100) NOT NULL,
  `phone_number` VARCHAR(11) NOT NULL,
  `email` VARCHAR(50) NOT NULL,
  `id_Employees` INT NOT NULL,
  PRIMARY KEY (`id_Client`),
  UNIQUE INDEX `id_Employees_UNIQUE` (`id_Employees` ASC) VISIBLE,
CONSTRAINT fk_id_Client
FOREIGN KEY (`id_Client`) REFERENCES Orders(`id_Client`)ON UPDATE CASCADE ON DELETE CASCADE);

INSERT INTO Clients(name, phone_number, email, id_Employees) VALUES('Oleg Nichiporenko','89600329001','werwer@gmail.com',1);
INSERT INTO Clients(name, phone_number, email, id_Employees) VALUES('Andrey Kolenko','89600321214','wasdssssr@gmail.com',2);
INSERT INTO Clients(name, phone_number, email, id_Employees) VALUES('Agalatif Zeynally','89123329001','wqweqxvcxv@gmail.com',3);
INSERT INTO Clients(name, phone_number, email, id_Employees) VALUES('Julia Birukova','89600300011','tata@gmail.com',4);
INSERT INTO Clients(name, phone_number, email, id_Employees) VALUES('Semen Turaev','89120837680','hahaah@gmail.com',5);
INSERT INTO Clients(name, phone_number, email, id_Employees) VALUES('Rushan Krilov','89123321546','werwerrar@gmail.com',6);
INSERT INTO Clients(name, phone_number, email, id_Employees) VALUES('Kamilla Rena','89546879001','kamillaa@gmail.com',7);
INSERT INTO Clients(name, phone_number, email, id_Employees) VALUES('Ilyas Siraev','89091299111','pubg111@gmail.com',8);
INSERT INTO Clients(name, phone_number, email, id_Employees) VALUES('Artur Nizamov','89123209897','barca@gmail.com',9);
INSERT INTO Clients(name, phone_number, email, id_Employees) VALUES('Maksim Chirikov','89768909235','erev@gmail.com',10);

DROP TABLE IF NOT EXISTS `Post`;
CREATE TABLE IF NOT EXISTS `Post` (
  `id_Post` INT NOT NULL AUTO_INCREMENT,
  `type_position` VARCHAR(50) NOT NULL,
PRIMARY KEY (`id_Post`),
CONSTRAINT fk_id_Post
FOREIGN KEY (id_Post) REFERENCES Employees(id_Post)ON UPDATE CASCADE ON DELETE CASCADE);

INSERT INTO Post(type_position) VALUES('C++ programmer');
INSERT INTO Post(type_position) VALUES('data-base analyst');
INSERT INTO Post(type_position) VALUES('python programmer');
INSERT INTO Post(type_position) VALUES('frontend developer');
INSERT INTO Post(type_position) VALUES('manager');
INSERT INTO Post(type_position) VALUES('accountant');
INSERT INTO Post(type_position) VALUES('recruiter');
INSERT INTO Post(type_position) VALUES('tester');
INSERT INTO Post(type_position) VALUES('C++ programmer');
INSERT INTO Post(type_position) VALUES('C++ programmer');

DROP TABLE IF NOT EXISTS `Type_payment`;
CREATE TABLE IF NOT EXISTS `Type_payment` (
  `id_Type_payment` INT NOT NULL AUTO_INCREMENT,
  `amount` INT NOT NULL,
  `category` CHAR(4) NOT NULL,
PRIMARY KEY (`id_Type_payment`)
CONSTRAINT fk_id_Type_payment
FOREIGN KEY (id_Type_payment) REFERENCES Orders(id_Type_payment) ON UPDATE CASCADE ON DELETE CASCADE);

INSERT INTO Type_payment(id_Type_payment, amount,category) VALUES(1,'100000','cash');
INSERT INTO Type_payment(id_Type_payment, amount,category) VALUES(2,'12000','cash');
INSERT INTO Type_payment(id_Type_payment, amount,category) VALUES(3,'6300','card');
INSERT INTO Type_payment(id_Type_payment, amount,category) VALUES(4,'220000','card');
INSERT INTO Type_payment(id_Type_payment, amount,category) VALUES(5,'125000','card');
INSERT INTO Type_payment(id_Type_payment, amount,category) VALUES(6,'350000','cash');
INSERT INTO Type_payment(id_Type_payment, amount,category) VALUES(7,'35000','card');
INSERT INTO Type_payment(id_Type_payment, amount,category) VALUES(8,'10000','cash');
INSERT INTO Type_payment(id_Type_payment, amount,category) VALUES(9,'20000','card');
INSERT INTO Type_payment(id_Type_payment, amount,category) VALUES(10,'30000','cash');

DROP TABLE IF NOT EXISTS `Employees`;
CREATE TABLE `Employees` (
  `id_Employees` int NOT NULL AUTO_INCREMENT,
  `name` char(100) NOT NULL,
  `phone_number` varchar(11) NOT NULL,
  `stag` int NOT NULL,
  `birth` date NOT NULL,
  `gender` char(1) NOT NULL,
  `date_order` date NOT NULL,
  `hometown` varchar(15) NOT NULL,
  `id_Post` int NOT NULL,
  `id_Salary` int DEFAULT NULL,
  PRIMARY KEY (`id_Employees`),
  UNIQUE KEY `id_Post_UNIQUE` (`id_Post`),
  UNIQUE KEY `id_Salary` (`id_Salary`),
  CONSTRAINT `fk_id_Employees` FOREIGN KEY (`id_Employees`) REFERENCES `clients` (`id_Employees`) ON DELETE CASCADE ON UPDATE CASCADE
); 

INSERT INTO Employees(name, phone_number, stag,birth_date, gender,date_order, hometown, id_Post) VALUES('Danil Chirikov','89768909235',5,'10.05.1970','m','11.04.2023','Kazan',1);
INSERT INTO Employees(name, phone_number, stag,birth_date, gender,date_order, hometown, id_Post) VALUES('Aygul Chirikova','89090909099',7,'15.01.2000','f','16.04.2023','Madrid',2);
INSERT INTO Employees(name, phone_number, stag,birth_date, gender,date_order, hometown, id_Post) VALUES('Ivan Chirikov','89768909290',2,'30.03.2001','m','13.04.2023','Madrid',3);
INSERT INTO Employees(name, phone_number, stag,birth_date, gender,date_order, hometown, id_Post) VALUES('Sergey Chirikov','89768909123',8,'31.03.2002','m','31.03.2023','Baku',4);
INSERT INTO Employees(name, phone_number, stag,birth_date, gender,date_order, hometown, id_Post) VALUES('Aleksey Chirikov','89123909235',3,'21.00.1998','m','21.03.2023','Kazan',5);
INSERT INTO Employees(name, phone_number, stag,birth_date, gender,date_order, hometown, id_Post) VALUES('Tambi Chirikov','89768909231',5,'10.01.2000','m','10.03.2023','Kazan',6);
INSERT INTO Employees(name, phone_number, stag, birth_date, gender, date_order, hometown, id_Post) VALUES('Ilya Chirilov', '89433290118', 8, '09.02.2000', 'm', '02.05.2023', 'Kazan', 7);
INSERT INTO Employees(name, phone_number, stag,birth_date, gender,date_order, hometown, id_Post) VALUES('Nikolay Chirikov','89768909235',16,'11.04.1990','m','16.05.2023','Turin',9);
INSERT INTO Employees(name, phone_number, stag,birth_date, gender,date_order, hometown, id_Post) VALUES('Anatoliy Chirikov','89768909243',4,'11.04.1975','m','11.04.2023','Moscow',10);


DROP TABLE IF NOT EXISTS `Salary`;
CREATE TABLE `Salary` (
  `id_Salary` int NOT NULL AUTO_INCREMENT,
  `Salary` int NOT NULL,
  `date_salary` date NOT NULL,
  PRIMARY KEY (`id_Salary`),
  CONSTRAINT `fk_id_Salary` FOREIGN KEY (`id_Salary`) REFERENCES `employees` (`id_Salary`)
);

INSERT INTO salary(id_Salary,Salary, date_salary) VALUES(1,'325000','06.05.2023');
INSERT INTO salary(id_Salary,Salary, date_salary) VALUES(2,'30000','06.05.2023');
INSERT INTO salary(id_Salary,Salary, date_salary) VALUES(3,'155000','02.05.2023');
INSERT INTO salary(id_Salary,Salary, date_salary) VALUES(4,'155000','03.05.2023');
INSERT INTO salary(id_Salary,Salary, date_salary) VALUES(5,'50000','01.05.2023');
INSERT INTO salary(id_Salary,Salary, date_salary) VALUES(6,'250000','04.05.2023');
INSERT INTO salary(id_Salary,Salary, date_salary) VALUES(7,'300000','19.05.2023');
INSERT INTO salary(id_Salary,Salary, date_salary) VALUES(8,'75000','10.05.2023');
INSERT INTO salary(id_Salary,Salary, date_salary) VALUES(9,'25000','12.05.2023');
INSERT INTO salary(id_Salary,Salary, date_salary) VALUES(10,'80000','06.05.2023');







// Создание запросов к itcompany
SELECT employees.name AS employees_name, COUNT(orders.id_Order) AS order_count
FROM orders
JOIN employees ON orders.id_Employees = employees.id_Employees
GROUP BY employees_name
ORDER BY order_count DESC;


SELECT Employees.name
FROM Employees
WHERE Employees.id_Employees IN (
    SELECT Salary.id_Salary
    FROM Salary 
    WHERE day(Salary.date_salary) = 06
)

SELECT * FROM orders WHERE YEAR(date_order) = 2016


SELECT * FROM orders_count;


SELECT employees.name AS employees_name, COUNT(orders.id_Order) AS order_count
FROM orders
JOIN employees ON orders.id_Employees = employees.id_Employees
GROUP BY employees_name
ORDER BY order_count DESC;

SELECT * FROM orders o
JOIN type_payment tp ON o.id_Type_payment= tp.id_Type_payment
ORDER BY o.date_order DESC
LIMIT 5; 


// Создадим представление, в котором будут отображены заказы, клиенты, сотрудники, сумма заказа и дату выполнения
CREATE TEMPORARY TABLE orders_count AS
SELECT COUNT(*) AS sum_orders FROM Orders;

// Создайте триггер, который при удалении сотрудника удаляет также его заказы
DELIMITER //
CREATE TRIGGER delete_clients_orders BEFORE DELETE ON clients FOR EACH ROW BEGIN
  DELETE FROM orders WHERE id_Client = OLD.id_Client
END//

Триггер, который будет срабатывать при количестве, больше 10 введённых записей в поле amount
DELIMITER //
CREATE TRIGGER orders_amount_limitation AFTER INSERT ON type_payment
FOR EACH ROW
BEGIN
    SELECT COUNT(*) INTO @amount FROM type_payment;
    IF (@amount > 10) THEN 
    SIGNAL SQLSTATE '45000' 
    SET MESSAGE_TEXT = 'data entry error, limit of 10 entries';
    END IF;
END//
DELIMITER;

// Создать функцию, которая удаляет клиента с таблицы Clients и его заказы
CREATE FUNCTION delete_clients_orders(id_Client INT)
RETURNS BOOLEAN
BEGIN
    DECLARE result_client BOOLEAN DEFAULT FALSE;
    
    START TRANSACTION;
  
    DELETE FROM Orders WHERE id_Client = id_Client;  
    IF ROW_COUNT() > 0 THEN
        DELETE FROM Clients WHERE id_Client = id_Client;
        IF ROW_COUNT() > 0 THEN 
            SET result_client = TRUE; 
        END IF;  
     END IF;

     RETURN result_client;
END//
DELIMITER;



// Создадим представление, в котором будут отображены заказы, клиенты, сотрудники, сумма заказа и дату выполнения
Create view order_info AS
Select
    o.rd_Order,
    c.id_Client,
    e.id_Employees,
    o.date_order
from orders 0
join clients c on o.id_Client = c.id_Client
join employees e on o.id_Order = e.id_Employees


show procedure status;

// Создание пользователей и настройки прав к itcompany

CREATE USER 'superuser'@'localhost' IDENTIFIED BY '1234';
GRANT ALL PRIVILEGES ON it_company.* TO 'superuser'@'localhost';

CREATE USER 'admin'@'localhost' IDENTIFIED BY '4321'; 
GRANT SELECT, UPDATE, DELETE, INSERT ON it_company.* TO 'admin'@'localhost';

CREATE USER 'username'@'localhost' IDENTIFIED BY '2143';GRANT SELECT ON it_company.Orders TO 'username'@'localhost';

SELECT USER FROM mysql.user;