
Create database product_inventory;

use product_inventory;


CREATE TABLE products ( 

    id INT AUTO_INCREMENT PRIMARY KEY, 

    name VARCHAR(100) NOT NULL, 

    description TEXT, 

    price DECIMAL(10,2), 

    quantity INT, 

    created_at DATETIME DEFAULT CURRENT_TIMESTAMP, 

    updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP 

); 

DELIMITER //

CREATE PROCEDURE sp_get_all_products()
BEGIN
    SELECT * FROM products;
END //

DELIMITER ;

DELIMITER //

CREATE PROCEDURE sp_get_product_by_id(
    IN p_id INT
    
)
BEGIN
    
	SELECT * from products 
    WHERE Id = p_id;
      
      
END //

DELIMITER ;

DELIMITER //

CREATE PROCEDURE sp_add_products(
    IN p_name VARCHAR(100),
    IN p_description VARCHAR(255),
    IN p_price DECIMAL(10,2),
    IN p_quantity INT
)
BEGIN
    -- add products
    INSERT INTO products (Name, Description, Price, Quantity)
    VALUES (p_name, p_description, p_price, p_quantity);

	SELECT * FROM products WHERE Id = LAST_INSERT_ID();
END //

DELIMITER ;

DELIMITER //

CREATE PROCEDURE sp_update_products(
    IN p_id INT,
    IN p_name VARCHAR(100),
    IN p_description VARCHAR(255),
    IN p_price DECIMAL(10,2),
    IN p_quantity INT
)
BEGIN
    -- Update only if at least one value is different
    UPDATE products
    SET 
        Name = p_name,
        Description = p_description,
        Price = p_price,
        Quantity = p_quantity,
        updated_at = NOW()
    WHERE Id = p_id
      AND (
            Name <> p_name
         OR Description <> p_description
         OR Price <> p_price
         OR Quantity <> p_quantity
      );
END //

DELIMITER ;

DELIMITER //

CREATE PROCEDURE sp_delete_product(
    IN p_id INT
)
BEGIN
    DELETE FROM products
    WHERE Id = p_id;
END //

DELIMITER ;

DELIMITER //

CREATE PROCEDURE sp_search_product_name(
    IN p_name VARCHAR(100)
)
BEGIN
    select * From products
Where Name like CONCAT('%',p_name,'%');
END //

DELIMITER ;



INSERT INTO products 
(name, description, price, quantity)
VALUES 
('Acer Laptop','Gaming Laptop', 1999.99, 99),
('Asus Laptop','Gaming Laptop', 2999.99, 99),
('Rog Laptop','Gaming Laptop', 3999.99, 99),
('Monster Laptop','Gaming Laptop', 4999.99, 99),
('Dragon Laptop','Gaming Laptop', 5999.99, 99),
('Fast Laptop','Gaming Laptop', 6999.99, 99),
('Acer Laptop','Gaming Laptop', 1999.99, 99),
('Asus Laptop','Gaming Laptop', 2999.99, 99),
('Rog Laptop','Gaming Laptop', 3999.99, 99),
('Monster Laptop','Gaming Laptop', 4999.99, 99),
('Dragon Laptop','Gaming Laptop', 5999.99, 99),
('Fast Laptop','Gaming Laptop', 6999.99, 99);

SELECT * FROM products
