-- Create the cart table
CREATE TABLE tbl_cart (
    cart_id VARCHAR(20) NOT NULL,
    user_id VARCHAR(20) NOT NULL,
    product_id VARCHAR(20) NOT NULL,
    product_name VARCHAR(100) NOT NULL,
    quantity INT NOT NULL,
    added_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
	price_per_unit NUMERIC(10,2) NOT NULL CHECK (price_per_unit > 0),
    is_active BOOLEAN DEFAULT TRUE,
    PRIMARY KEY (cart_id, product_id)
);

-- Insert 5 sample cart items
INSERT INTO tbl_cart (cart_id, user_id, product_id, product_name, quantity, added_at, price_per_unit, is_active)
VALUES
    ('cart_001', 'user_123', 'prod_101', 'Damdum X1 Phone', 1, '2023-10-25 14:30:00', 299.99, TRUE),
    ('cart_001', 'user_123', 'prod_201', 'Fast Charger', 2, '2023-10-25 14:32:00', 19.99, TRUE),
    ('cart_002', 'user_456', 'prod_105', 'Damdum X5 Phone', 1, '2023-10-26 09:15:00', 499.99, TRUE),
    ('cart_003', 'user_789', 'prod_202', 'Wireless Earbuds', 1, '2023-10-26 11:45:00', 59.99, TRUE),
    ('cart_003', 'user_789', 'prod_203', 'Screen Protector', 3, '2023-10-26 11:47:00', 9.99, TRUE);