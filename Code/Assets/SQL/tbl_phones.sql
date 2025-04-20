-- Create the damdum_phones table
CREATE TABLE tbl_phones (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    -- product_id VARCHAR(20) UNIQUE,
    brand TEXT NOT NULL,
    model TEXT NOT NULL,
    release_date DATE NOT NULL,
    price NUMERIC(10,2) NOT NULL CHECK (price > 0),
    processor TEXT NOT NULL,
    ram INTEGER NOT NULL,
    storage INTEGER NOT NULL,
    battery_capacity INTEGER NOT NULL,
    display_size NUMERIC(5,2) NOT NULL,
    display_type TEXT NOT NULL,
    camera_main TEXT NOT NULL,
    camera_front TEXT NOT NULL,
    os TEXT NOT NULL,
    network TEXT NOT NULL,
    weight NUMERIC(6,2) NOT NULL,
    dimensions TEXT NOT NULL,
    color_options TEXT NOT NULL
);

-- Insert 50 instances of damdum phones
INSERT INTO tbl_phones (
    brand, model, release_date, price, processor, ram, storage, battery_capacity, display_size, display_type, camera_main, camera_front, os, network, weight, dimensions, color_options
) VALUES
('Damdum', 'Damdum X1', '2023-01-15', 299.99, 'Snapdragon 678', 6, 128, 5000, 6.5, 'AMOLED', '64 MP, f/1.8', '16 MP, f/2.0', 'Android 12, Damdum UI', '5G', 189, '160.9 x 75.8 x 8.1', 'Black, Blue, Green'),
('Damdum', 'Damdum X2', '2023-02-20', 349.99, 'Snapdragon 720G', 8, 128, 4500, 6.4, 'Super AMOLED', '48 MP, f/1.7', '32 MP, f/2.2', 'Android 12, Damdum UI', '5G', 175, '159.8 x 74.5 x 8.4', 'Black, Silver, Red'),
('Damdum', 'Damdum X3', '2023-03-25', 399.99, 'Snapdragon 778G', 8, 256, 5000, 6.7, 'AMOLED', '108 MP, f/1.8', '32 MP, f/2.0', 'Android 13, Damdum UI', '5G', 185, '163.7 x 76.4 x 8.2', 'Blue, White, Gray'),
('Damdum', 'Damdum X4', '2023-04-10', 449.99, 'Snapdragon 855', 12, 256, 4500, 6.6, 'Dynamic AMOLED', '64 MP, f/1.8', '16 MP, f/2.0', 'Android 13, Damdum UI', '5G', 198, '161.9 x 75.1 x 8.5', 'Black, Blue, Pink'),
('Damdum', 'Damdum X5', '2023-05-05', 499.99, 'Snapdragon 865', 12, 512, 5000, 6.8, 'AMOLED', '108 MP, f/1.8', '40 MP, f/2.2', 'Android 14, Damdum UI', '5G', 205, '164.2 x 76.8 x 8.6', 'Black, Silver, Green'),
('Damdum', 'Damdum X6', '2023-06-12', 549.99, 'Snapdragon 888', 16, 512, 5500, 6.9, 'Dynamic AMOLED', '108 MP, f/1.8', '40 MP, f/2.2', 'Android 14, Damdum UI', '5G', 210, '165.1 x 77.2 x 8.7', 'Black, Blue, Gold'),
('Damdum', 'Damdum X7', '2023-07-18', 599.99, 'Snapdragon 8 Gen 1', 16, 1024, 6000, 7.0, 'AMOLED', '200 MP, f/1.7', '50 MP, f/2.0', 'Android 15, Damdum UI', '5G', 215, '166.3 x 78.1 x 8.8', 'Black, Silver, Red'),
('Damdum', 'Damdum X8', '2023-08-22', 649.99, 'Snapdragon 8 Gen 2', 16, 1024, 6500, 7.1, 'Dynamic AMOLED', '200 MP, f/1.6', '50 MP, f/2.0', 'Android 15, Damdum UI', '5G', 220, '167.5 x 79.0 x 8.9', 'Black, Blue, Gold'),
('Damdum', 'Damdum X9', '2023-09-30', 699.99, 'Snapdragon 8 Gen 3', 16, 1024, 7000, 7.2, 'AMOLED', '200 MP, f/1.5', '50 MP, f/2.0', 'Android 16, Damdum UI', '5G', 225, '168.0 x 79.5 x 9.0', 'Black, Silver, Green'),
('Damdum', 'Damdum X10', '2023-10-05', 749.99, 'Snapdragon 8 Gen 4', 16, 1024, 7500, 7.3, 'Dynamic AMOLED', '200 MP, f/1.4', '50 MP, f/2.0', 'Android 16, Damdum UI', '5G', 230, '169.0 x 80.0 x 9.1', 'Black, Blue, Pink'),
('Damdum', 'Damdum X11', '2023-11-10', 799.99, 'Snapdragon 8 Gen 5', 16, 1024, 8000, 7.4, 'AMOLED', '200 MP, f/1.3', '50 MP, f/2.0', 'Android 17, Damdum UI', '5G', 235, '170.0 x 80.5 x 9.2', 'Black, Silver, Red'),
('Damdum', 'Damdum X12', '2023-12-15', 849.99, 'Snapdragon 8 Gen 6', 16, 1024, 8500, 7.5, 'Dynamic AMOLED', '200 MP, f/1.2', '50 MP, f/2.0', 'Android 17, Damdum UI', '5G', 240, '171.0 x 81.0 x 9.3', 'Black, Blue, Gold'),
('Damdum', 'Damdum X13', '2024-01-20', 899.99, 'Snapdragon 8 Gen 7', 16, 1024, 9000, 7.6, 'AMOLED', '200 MP, f/1.1', '50 MP, f/2.0', 'Android 18, Damdum UI', '5G', 245, '172.0 x 81.5 x 9.4', 'Black, Silver, Green'),
('Damdum', 'Damdum X14', '2024-02-25', 949.99, 'Snapdragon 8 Gen 8', 16, 1024, 9500, 7.7, 'Dynamic AMOLED', '200 MP, f/1.0', '50 MP, f/2.0', 'Android 18, Damdum UI', '5G', 250, '173.0 x 82.0 x 9.5', 'Black, Blue, Pink'),
('Damdum', 'Damdum X15', '2024-03-30', 999.99, 'Snapdragon 8 Gen 9', 16, 1024, 10000, 7.8, 'AMOLED', '200 MP, f/0.9', '50 MP, f/2.0', 'Android 19, Damdum UI', '5G', 255, '174.0 x 82.5 x 9.6', 'Black, Silver, Red'),
('Damdum', 'Damdum X16', '2024-04-05', 1049.99, 'Snapdragon 8 Gen 10', 16, 1024, 10500, 7.9, 'Dynamic AMOLED', '200 MP, f/0.8', '50 MP, f/2.0', 'Android 19, Damdum UI', '5G', 260, '175.0 x 83.0 x 9.7', 'Black, Blue, Gold'),
('Damdum', 'Damdum X17', '2024-05-10', 1099.99, 'Snapdragon 8 Gen 11', 16, 1024, 11000, 8.0, 'AMOLED', '200 MP, f/0.7', '50 MP, f/2.0', 'Android 20, Damdum UI', '5G', 265, '176.0 x 83.5 x 9.8', 'Black, Silver, Green'),
('Damdum', 'Damdum X18', '2024-06-15', 1149.99, 'Snapdragon 8 Gen 12', 16, 1024, 11500, 8.1, 'Dynamic AMOLED', '200 MP, f/0.6', '50 MP, f/2.0', 'Android 20, Damdum UI', '5G', 270, '177.0 x 84.0 x 9.9', 'Black, Blue, Pink'),
('Damdum', 'Damdum X19', '2024-07-20', 1199.99, 'Snapdragon 8 Gen 13', 16, 1024, 12000, 8.2, 'AMOLED', '200 MP, f/0.5', '50 MP, f/2.0', 'Android 21, Damdum UI', '5G', 275, '178.0 x 84.5 x 10.0', 'Black, Silver, Red'),
('Damdum', 'Damdum X20', '2024-08-25', 1249.99, 'Snapdragon 8 Gen 14', 16, 1024, 12500, 8.3, 'Dynamic AMOLED', '200 MP, f/0.4', '50 MP, f/2.0', 'Android 21, Damdum UI', '5G', 280, '179.0 x 85.0 x 10.1', 'Black, Blue, Gold'),
('Damdum', 'Damdum X21', '2024-09-30', 1299.99, 'Snapdragon 8 Gen 15', 16, 1024, 13000, 8.4, 'AMOLED', '200 MP, f/0.3', '50 MP, f/2.0', 'Android 22, Damdum UI', '5G', 285, '180.0 x 85.5 x 10.2', 'Black, Silver, Green'),
('Damdum', 'Damdum X22', '2024-10-05', 1349.99, 'Snapdragon 8 Gen 16', 16, 1024, 13500, 8.5, 'Dynamic AMOLED', '200 MP, f/0.2', '50 MP, f/2.0', 'Android 22, Damdum UI', '5G', 290, '181.0 x 86.0 x 10.3', 'Black, Blue, Pink'),
('Damdum', 'Damdum X23', '2024-11-10', 1399.99, 'Snapdragon 8 Gen 17', 16, 1024, 14000, 8.6, 'AMOLED', '200 MP, f/0.1', '50 MP, f/2.0', 'Android 23, Damdum UI', '5G', 295, '182.0 x 86.5 x 10.4', 'Black, Silver, Red'),
('Damdum', 'Damdum X24', '2024-12-15', 1449.99, 'Snapdragon 8 Gen 18', 16, 1024, 14500, 8.7, 'Dynamic AMOLED', '200 MP, f/0.0', '50 MP, f/2.0', 'Android 23, Damdum UI', '5G', 300, '183.0 x 87.0 x 10.5', 'Black, Blue, Gold'),
('Damdum', 'Damdum X25', '2025-01-20', 1499.99, 'Snapdragon 8 Gen 19', 16, 1024, 15000, 8.8, 'AMOLED', '200 MP, f/-0.1', '50 MP, f/2.0', 'Android 24, Damdum UI', '5G', 305, '184.0 x 87.5 x 10.6', 'Black, Silver, Green'),
('Damdum', 'Damdum X26', '2025-02-25', 1549.99, 'Snapdragon 8 Gen 20', 16, 1024, 15500, 8.9, 'Dynamic AMOLED', '200 MP, f/-0.2', '50 MP, f/2.0', 'Android 24, Damdum UI', '5G', 310, '185.0 x 88.0 x 10.7', 'Black, Blue, Pink'),
('Damdum', 'Damdum X27', '2025-03-30', 1599.99, 'Snapdragon 8 Gen 21', 16, 1024, 16000, 9.0, 'AMOLED', '200 MP, f/-0.3', '50 MP, f/2.0', 'Android 25, Damdum UI', '5G', 315, '186.0 x 88.5 x 10.8', 'Black, Silver, Red'),
('Damdum', 'Damdum X28', '2025-04-05', 1649.99, 'Snapdragon 8 Gen 22', 16, 1024, 16500, 9.1, 'Dynamic AMOLED', '200 MP, f/-0.4', '50 MP, f/2.0', 'Android 25, Damdum UI', '5G', 320, '187.0 x 89.0 x 10.9', 'Black, Blue, Gold'),
('Damdum', 'Damdum X29', '2025-05-10', 1699.99, 'Snapdragon 8 Gen 23', 16, 1024, 17000, 9.2, 'AMOLED', '200 MP, f/-0.5', '50 MP, f/2.0', 'Android 26, Damdum UI', '5G', 325, '188.0 x 89.5 x 11.0', 'Black, Silver, Green'),
('Damdum', 'Damdum X30', '2025-06-15', 1749.99, 'Snapdragon 8 Gen 24', 16, 1024, 17500, 9.3, 'Dynamic AMOLED', '200 MP, f/-0.6', '50 MP, f/2.0', 'Android 26, Damdum UI', '5G', 330, '189.0 x 90.0 x 11.1', 'Black, Blue, Pink'),
('Damdum', 'Damdum X31', '2025-07-20', 1799.99, 'Snapdragon 8 Gen 25', 16, 1024, 18000, 9.4, 'AMOLED', '200 MP, f/-0.7', '50 MP, f/2.0', 'Android 27, Damdum UI', '5G', 335, '190.0 x 90.5 x 11.2', 'Black, Silver, Red'),
('Damdum', 'Damdum X32', '2025-08-25', 1849.99, 'Snapdragon 8 Gen 26', 16, 1024, 18500, 9.5, 'Dynamic AMOLED', '200 MP, f/-0.8', '50 MP, f/2.0', 'Android 27, Damdum UI', '5G', 340, '191.0 x 91.0 x 11.3', 'Black, Blue, Gold'),
('Damdum', 'Damdum X33', '2025-09-30', 1899.99, 'Snapdragon 8 Gen 27', 16, 1024, 19000, 9.6, 'AMOLED', '200 MP, f/-0.9', '50 MP, f/2.0', 'Android 28, Damdum UI', '5G', 345, '192.0 x 91.5 x 11.4', 'Black, Silver, Green'),
('Damdum', 'Damdum X34', '2025-10-05', 1949.99, 'Snapdragon 8 Gen 28', 16, 1024, 19500, 9.7, 'Dynamic AMOLED', '200 MP, f/-1.0', '50 MP, f/2.0', 'Android 28, Damdum UI', '5G', 350, '193.0 x 92.0 x 11.5', 'Black, Blue, Pink'),
('Damdum', 'Damdum X35', '2025-11-10', 1999.99, 'Snapdragon 8 Gen 29', 16, 1024, 20000, 9.8, 'AMOLED', '200 MP, f/-1.1', '50 MP, f/2.0', 'Android 29, Damdum UI', '5G', 355, '194.0 x 92.5 x 11.6', 'Black, Silver, Red'),
('Damdum', 'Damdum X36', '2025-12-15', 2049.99, 'Snapdragon 8 Gen 30', 16, 1024, 20500, 9.9, 'Dynamic AMOLED', '200 MP, f/-1.2', '50 MP, f/2.0', 'Android 29, Damdum UI', '5G', 360, '195.0 x 93.0 x 11.7', 'Black, Blue, Gold'),
('Damdum', 'Damdum X37', '2026-01-20', 2099.99, 'Snapdragon 8 Gen 31', 16, 1024, 21000, 10.0, 'AMOLED', '200 MP, f/-1.3', '50 MP, f/2.0', 'Android 30, Damdum UI', '5G', 365, '196.0 x 93.5 x 11.8', 'Black, Silver, Green'),
('Damdum', 'Damdum X38', '2026-02-25', 2149.99, 'Snapdragon 8 Gen 32', 16, 1024, 21500, 10.1, 'Dynamic AMOLED', '200 MP, f/-1.4', '50 MP, f/2.0', 'Android 30, Damdum UI', '5G', 370, '197.0 x 94.0 x 11.9', 'Black, Blue, Pink'),
('Damdum', 'Damdum X39', '2026-03-30', 2199.99, 'Snapdragon 8 Gen 33', 16, 1024, 22000, 10.2, 'AMOLED', '200 MP, f/-1.5', '50 MP, f/2.0', 'Android 31, Damdum UI', '5G', 375, '198.0 x 94.5 x 12.0', 'Black, Silver, Red'),
('Damdum', 'Damdum X40', '2026-04-05', 2249.99, 'Snapdragon 8 Gen 34', 16, 1024, 22500, 10.3, 'Dynamic AMOLED', '200 MP, f/-1.6', '50 MP, f/2.0', 'Android 31, Damdum UI', '5G', 380, '199.0 x 95.0 x 12.1', 'Black, Blue, Gold'),
('Damdum', 'Damdum X41', '2026-05-10', 2299.99, 'Snapdragon 8 Gen 35', 16, 1024, 23000, 10.4, 'AMOLED', '200 MP, f/-1.7', '50 MP, f/2.0', 'Android 32, Damdum UI', '5G', 385, '200.0 x 95.5 x 12.2', 'Black, Silver, Green'),
('Damdum', 'Damdum X42', '2026-06-15', 2349.99, 'Snapdragon 8 Gen 36', 16, 1024, 23500, 10.5, 'Dynamic AMOLED', '200 MP, f/-1.8', '50 MP, f/2.0', 'Android 32, Damdum UI', '5G', 390, '201.0 x 96.0 x 12.3', 'Black, Blue, Pink'),
('Damdum', 'Damdum X43', '2026-07-20', 2399.99, 'Snapdragon 8 Gen 37', 16, 1024, 24000, 10.6, 'AMOLED', '200 MP, f/-1.9', '50 MP, f/2.0', 'Android 33, Damdum UI', '5G', 395, '202.0 x 96.5 x 12.4', 'Black, Silver, Red'),
('Damdum', 'Damdum X44', '2026-08-25', 2449.99, 'Snapdragon 8 Gen 38', 16, 1024, 24500, 10.7, 'Dynamic AMOLED', '200 MP, f/-2.0', '50 MP, f/2.0', 'Android 33, Damdum UI', '5G', 400, '203.0 x 97.0 x 12.5', 'Black, Blue, Gold'),
('Damdum', 'Damdum X45', '2026-09-30', 2499.99, 'Snapdragon 8 Gen 39', 16, 1024, 25000, 10.8, 'AMOLED', '200 MP, f/-2.1', '50 MP, f/2.0', 'Android 34, Damdum UI', '5G', 405, '204.0 x 97.5 x 12.6', 'Black, Silver, Green'),
('Damdum', 'Damdum X46', '2026-10-05', 2549.99, 'Snapdragon 8 Gen 40', 16, 1024, 25500, 10.9, 'Dynamic AMOLED', '200 MP, f/-2.2', '50 MP, f/2.0', 'Android 34, Damdum UI', '5G', 410, '205.0 x 98.0 x 12.7', 'Black, Blue, Pink'),
('Damdum', 'Damdum X47', '2026-11-10', 2599.99, 'Snapdragon 8 Gen 41', 16, 1024, 26000, 11.0, 'AMOLED', '200 MP, f/-2.3', '50 MP, f/2.0', 'Android 35, Damdum UI', '5G', 415, '206.0 x 98.5 x 12.8', 'Black, Silver, Red'),
('Damdum', 'Damdum X48', '2026-12-15', 2649.99, 'Snapdragon 8 Gen 42', 16, 1024, 26500, 11.1, 'Dynamic AMOLED', '200 MP, f/-2.4', '50 MP, f/2.0', 'Android 35, Damdum UI', '5G', 420, '207.0 x 99.0 x 12.9', 'Black, Blue, Gold'),
('Damdum', 'Damdum X49', '2027-01-20', 2699.99, 'Snapdragon 8 Gen 43', 16, 1024, 27000, 11.2, 'AMOLED', '200 MP, f/-2.5', '50 MP, f/2.0', 'Android 36, Damdum UI', '5G', 425, '208.0 x 99.5 x 13.0', 'Black, Silver, Green'),
('Damdum', 'Damdum X50', '2027-02-25', 2749.99, 'Snapdragon 8 Gen 44', 16, 1024, 27500, 11.3, 'Dynamic AMOLED', '200 MP, f/-2.6', '50 MP, f/2.0', 'Android 36, Damdum UI', '5G', 430, '209.0 x 100.0 x 13.1', 'Black, Blue, Pink');

-- Step 1: Add the column (if the table already exists)
ALTER TABLE tbl_phones 
ADD COLUMN product_id VARCHAR(20) UNIQUE;

-- Step 2: Generate IDs for existing phones (e.g., "damdum_X1", "damdum_X2")
UPDATE tbl_phones 
SET product_id = 'damdum_' || LOWER(REPLACE(model, ' ', '_'));