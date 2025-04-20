-- Create accessories table
CREATE TABLE tbl_accessories (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    product_id VARCHAR(20) UNIQUE NOT NULL,
    name VARCHAR(100) NOT NULL,
    category VARCHAR(50) NOT NULL,
    compatible_models TEXT[] NOT NULL, -- Array of phone models this works with
    price NUMERIC(10,2) NOT NULL,
    color_options VARCHAR(100),
    stock_quantity INTEGER DEFAULT 0,
    release_date DATE,
    last_restock TIMESTAMP
);

-- Insert 15+ accessories
INSERT INTO tbl_accessories (
    product_id, name, category, compatible_models, price, color_options, stock_quantity, release_date
) VALUES
-- Chargers
('acc_001', 'SuperFast 45W Charger', 'Charger', '{"Damdum X1", "Damdum X5", "Damdum X10"}', 29.99, 'Black, White', 150, '2023-01-15'),
('acc_002', 'Wireless Charging Pad', 'Charger', '{"Damdum X3", "Damdum X7", "Damdum X20"}', 39.99, 'Black', 85, '2023-03-10'),
('acc_003', 'Car Charger Duo', 'Charger', '{"All Damdum Phones"}', 24.99, 'Black, Silver', 200, '2023-02-28'),

-- Cases
('acc_101', 'Armor Case', 'Case', '{"Damdum X1", "Damdum X3"}', 19.99, 'Black, Blue, Red', 300, '2023-01-20'),
('acc_102', 'Clear Gel Case', 'Case', '{"Damdum X5", "Damdum X7"}', 14.99, 'Clear, Smoke', 180, '2023-04-05'),
('acc_103', 'Premium Leather Case', 'Case', '{"Damdum X10", "Damdum X20"}', 34.99, 'Brown, Black', 75, '2023-05-12'),

-- Audio
('acc_201', 'Blast Pro Earbuds', 'Audio', '{"All Damdum Phones"}', 59.99, 'Black, White, Blue', 120, '2023-06-18'),
('acc_202', 'Over-Ear Studio Headphones', 'Audio', '{"All Damdum Phones"}', 129.99, 'Black, Silver', 40, '2023-07-22'),
('acc_203', 'Mini Bluetooth Speaker', 'Audio', '{"All Damdum Phones"}', 45.99, 'Black, Red, Teal', 90, '2023-08-30'),

-- Screen Protectors
('acc_301', 'Tempered Glass (2-Pack)', 'Screen Protector', '{"Damdum X1", "Damdum X3"}', 12.99, 'N/A', 500, '2023-01-25'),
('acc_302', 'Privacy Screen Protector', 'Screen Protector', '{"Damdum X5", "Damdum X7"}', 18.99, 'N/A', 230, '2023-04-15'),

-- Others
('acc_401', 'Stylus Pen', 'Accessory', '{"Damdum X10", "Damdum X20"}', 29.99, 'Black, Silver', 60, '2023-09-05'),
('acc_402', 'PopSocket Grip', 'Accessory', '{"All Damdum Phones"}', 9.99, 'Multicolor', 400, '2023-10-12'),
('acc_403', 'Lens Cleaning Kit', 'Accessory', '{"All Damdum Phones"}', 7.99, 'N/A', 600, '2023-03-15'),
('acc_404', 'Waterproof Pouch', 'Accessory', '{"All Damdum Phones"}', 14.99, 'Clear', 110, '2023-05-20'),
('acc_405', 'Multi-Port Hub', 'Accessory', '{"Damdum X5", "Damdum X10"}', 32.99, 'Space Gray', 65, '2023-11-01');