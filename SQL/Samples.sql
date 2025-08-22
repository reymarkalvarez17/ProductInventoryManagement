
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

CREATE PROCEDURE sp_delete_product(
    IN p_id INT
)
BEGIN
    DELETE FROM products
    WHERE Id = p_id;
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
    INSERT INTO products (Name, Description, Price, Quantity, created_at, updated_at)
    VALUES (p_name, p_description, p_price, p_quantity, NOW(), NOW());
END //

DELIMITER ;

DELIMITER ;
use product_inventory;
CALL sp_update_products(2, 'Intel102 Laptop', 'Gaming Laptop', 1999.99, 1211);
select * from products;

UPDATE products
Set created_at = now()
Where id = 1;

truncate TABLE products;

INSERT INTO products 
(name, description, price, quantity, created_at)
VALUES 
('Acer Laptop','Gaming Laptop', 1999.99,99,now());