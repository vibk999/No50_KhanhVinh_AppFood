

CREATE DATABASE restaurant_db;
USE restaurant_db;


CREATE TABLE user (
    user_id INT AUTO_INCREMENT PRIMARY KEY,
    full_name VARCHAR(255),
    email VARCHAR(255),
    password VARCHAR(255),
    `deletedBy` INT NOT NULL DEFAULT 0,
	`isDeleted` TINYINT(1) NOT NULL DEFAULT 0,
	`deletedAt` TIMESTAMP NULL DEFAULT NULL,
	`createdAt` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
	`updatedAt` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);
INSERT INTO user (full_name, email, password) VALUES
('Nguyễn Văn A', 'nguyenvana@gmail.com', '123456'),
('Trần Thị B', 'tranthib@gmail.com', 'abcdef'),
('Lê Văn C', 'levanc@gmail.com', 'password'),
('Nguyễn Văn M', 'nguyenvana@gmail.com', '123456'),
('Trần Thị B', 'tranthib@gmail.com', 'abcdef'),
('Lê Văn C', 'levanc@gmail.com', 'password');

CREATE TABLE restaurant (
    res_id INT AUTO_INCREMENT PRIMARY KEY,
    res_name VARCHAR(255),
    image VARCHAR(255),
    `desc` VARCHAR(255),
    `deletedBy` INT NOT NULL DEFAULT 0,
	`isDeleted` TINYINT(1) NOT NULL DEFAULT 0,
	`deletedAt` TIMESTAMP NULL DEFAULT NULL,
	`createdAt` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
	`updatedAt` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);
INSERT INTO restaurant (res_name, image, `desc`) VALUES
('Nhà hàng A', 'a.jpg', 'Chuyên món Việt'),
('Nhà hàng B', 'b.jpg', 'Hải sản tươi ngon'),
('Nhà hàng C', 'c.jpg', 'Món Âu cao cấp');

CREATE TABLE food_type (
    type_id INT AUTO_INCREMENT PRIMARY KEY,
    type_name VARCHAR(255),
    `deletedBy` INT NOT NULL DEFAULT 0,
	`isDeleted` TINYINT(1) NOT NULL DEFAULT 0,
	`deletedAt` TIMESTAMP NULL DEFAULT NULL,
	`createdAt` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
	`updatedAt` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);
INSERT INTO food_type (type_name) VALUES
('Món chính'),
('Món phụ'),
('Tráng miệng');

CREATE TABLE food (
    food_id INT AUTO_INCREMENT PRIMARY KEY,
    food_name VARCHAR(255),
    image VARCHAR(255),
    price FLOAT,
    `desc` VARCHAR(255),
    type_id INT,
    FOREIGN KEY (type_id) REFERENCES food_type(type_id),
    `deletedBy` INT NOT NULL DEFAULT 0,
	`isDeleted` TINYINT(1) NOT NULL DEFAULT 0,
	`deletedAt` TIMESTAMP NULL DEFAULT NULL,
	`createdAt` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
	`updatedAt` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);
INSERT INTO food (food_name, image, price, `desc`, type_id) VALUES
('Bún bò Huế', 'bunbo.jpg', 50000, 'Món ăn truyền thống Việt Nam', 1),
('Pizza hải sản', 'pizza.jpg', 120000, 'Pizza với tôm, mực, cua', 1),
('Bánh flan', 'flan.jpg', 30000, 'Món tráng miệng thơm ngon', 3);

CREATE TABLE sub_food (
    sub_id INT AUTO_INCREMENT PRIMARY KEY,
    sub_name VARCHAR(255),
    sub_price FLOAT,
    food_id INT,
    FOREIGN KEY (food_id) REFERENCES food(food_id),
    `deletedBy` INT NOT NULL DEFAULT 0,
	`isDeleted` TINYINT(1) NOT NULL DEFAULT 0,
	`deletedAt` TIMESTAMP NULL DEFAULT NULL,
	`createdAt` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
	`updatedAt` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);
INSERT INTO sub_food (sub_name, sub_price, food_id) VALUES
('Thêm chả', 10000, 1),
('Thêm phô mai', 20000, 2),
('Thêm caramel', 5000, 3);

CREATE TABLE `order` (
    user_id INT,
    food_id INT,
    amount INT,
    code VARCHAR(255),
    arr_sub_id VARCHAR(255),
    FOREIGN KEY (user_id) REFERENCES user(user_id),
    FOREIGN KEY (food_id) REFERENCES food(food_id),
    `deletedBy` INT NOT NULL DEFAULT 0,
	`isDeleted` TINYINT(1) NOT NULL DEFAULT 0,
	`deletedAt` TIMESTAMP NULL DEFAULT NULL,
	`createdAt` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
	`updatedAt` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);
INSERT INTO `order` (user_id, food_id, amount, code, arr_sub_id) VALUES
(1, 1, 2, 'ORD001', '1'),
(2, 2, 1, 'ORD002', '2'),
(3, 3, 3, 'ORD003', '3'),
(1, 1, 5, 'ORD001', '1'),
(2, 2, 2, 'ORD002', '2');

CREATE TABLE like_res (
    user_id INT,
    res_id INT,
    date_like DATETIME,
    FOREIGN KEY (user_id) REFERENCES user(user_id),
    FOREIGN KEY (res_id) REFERENCES restaurant(res_id),
    `deletedBy` INT NOT NULL DEFAULT 0,
	`isDeleted` TINYINT(1) NOT NULL DEFAULT 0,
	`deletedAt` TIMESTAMP NULL DEFAULT NULL,
	`createdAt` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
	`updatedAt` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);
INSERT INTO like_res (user_id, res_id, date_like) VALUES
(1, 1, '2024-03-10 12:00:00'),
(2, 2, '2024-03-11 15:30:00'),
(3, 3, '2024-03-12 18:45:00'),
(1, 1, '2024-03-10 12:00:00'),
(4, 1, '2024-03-10 12:00:00'),
(5, 1, '2024-03-11 15:30:00'),
(6, 1, '2024-03-12 18:45:00');

CREATE TABLE rate_res (
    user_id INT,
    res_id INT,
    amount INT,
    date_rate DATETIME,
    FOREIGN KEY (user_id) REFERENCES user(user_id),
    FOREIGN KEY (res_id) REFERENCES restaurant(res_id),
    `deletedBy` INT NOT NULL DEFAULT 0,
	`isDeleted` TINYINT(1) NOT NULL DEFAULT 0,
	`deletedAt` TIMESTAMP NULL DEFAULT NULL,
	`createdAt` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
	`updatedAt` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);
INSERT INTO rate_res (user_id, res_id, amount, date_rate) VALUES
(1, 1, 5, '2024-03-10 13:00:00'),
(2, 2, 4, '2024-03-11 16:00:00'),
(3, 3, 3, '2024-03-12 19:00:00');

-- bt 1
SELECT user_id, COUNT(res_id) AS like_count
FROM like_res
GROUP BY user_id
ORDER BY like_count DESC
LIMIT 5;

-- bt 2
SELECT res_id, COUNT(user_id) AS like_count
FROM like_res
GROUP BY res_id
ORDER BY like_count DESC
LIMIT 2;

-- bt3
SELECT user_id, COUNT(food_id) AS order_count
FROM `order`
GROUP BY user_id
ORDER BY order_count DESC
LIMIT 1;

-- 4
SELECT u.user_id, u.full_name
FROM user u
LEFT JOIN `order` o ON u.user_id = o.user_id
LEFT JOIN like_res l ON u.user_id = l.user_id
LEFT JOIN rate_res r ON u.user_id = r.user_id
WHERE o.user_id IS NULL AND l.user_id IS NULL AND r.user_id IS NULL;
