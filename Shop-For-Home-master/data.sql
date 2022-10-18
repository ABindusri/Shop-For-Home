-- -----------------------------------------------------
-- Schema shop_for_home
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `ShopForHome`;

CREATE SCHEMA `ShopForHome`;
USE `ShopForHome` ;


-- -----------------------------------------------------
-- Table  `ShopForHome`.`cart`
-- -----------------------------------------------------
-- DROP TABLE IF EXISTS `ShopForHome`.cart;

 create table hibernate_sequence(next_val BIGINT NOT NULL);
 INSERT INTO hibernate_sequence (next_val) VALUES (4);

CREATE TABLE IF NOT EXISTS `ShopForHome`.`cart`
(
    `user_id` BIGINT(20) NOT NULL,
    CONSTRAINT `cart_pkey1` PRIMARY KEY (`user_id`)
)
ENGINE=InnoDB
AUTO_INCREMENT = 1;
	

-- -----------------------------------------------------
-- Table: `ShopForHome`.`discount`
-- -----------------------------------------------------
-- DROP TABLE IF EXISTS `ShopForHome`.`discount`;

CREATE TABLE IF NOT EXISTS `ShopForHome`.`discount`
(
    `id` VARCHAR(255) NOT NULL,
    `status` BIGINT(20),
    CONSTRAINT `discount_pkey` PRIMARY KEY (`id`)
)
ENGINE=InnoDB
AUTO_INCREMENT = 1;


-- -----------------------------------------------------
-- Table: `ShopForHome`.`order_main`
-- -----------------------------------------------------
-- DROP TABLE IF EXISTS `ShopForHome`.order_main;

CREATE TABLE IF NOT EXISTS `ShopForHome`.`order_main`
(
    `order_id` BIGINT(20) NOT NULL,
    `buyer_address` VARCHAR(255) ,
    `buyer_email` VARCHAR(255) ,
    `buyer_name` VARCHAR(255) ,
    `buyer_phone` VARCHAR(255) ,
    `create_time` DATETIME(6),
    `order_amount` DECIMAL(19,2) NOT NULL,
    `order_status` INT(11) NOT NULL DEFAULT 0,
    `update_time` DATETIME(6),
    CONSTRAINT `order_main_pkey` PRIMARY KEY (`order_id`)
)
ENGINE=InnoDB
AUTO_INCREMENT = 1;


-- -----------------------------------------------------
-- Table: `ShopForHome`.`product_category`
-- -----------------------------------------------------

-- DROP TABLE IF EXISTS `ShopForHome`.`product_category`;

CREATE TABLE IF NOT EXISTS `ShopForHome`.`product_category`
(
    `category_id` INT(11) NOT NULL,
    `category_name` VARCHAR(255) ,
    `category_type` INT(11),
    `create_time` DATETIME(6),
    `update_time` DATETIME(6),
    CONSTRAINT `product_category_pkey` PRIMARY KEY (`category_id`),
    CONSTRAINT `uk_6kq6iveuim6wd90cxo5bksumw` UNIQUE (`category_type`)
)
ENGINE=InnoDB
AUTO_INCREMENT = 1;


-- -----------------------------------------------------	
-- Table: `ShopForHome`.`product_in_order`
-- -----------------------------------------------------
-- DROP TABLE IF EXISTS `ShopForHome`.`product_in_order`;

CREATE TABLE IF NOT EXISTS `ShopForHome`.`product_in_order`
(
    `id` BIGINT(20) NOT NULL,
    `category_type` INT(11) NOT NULL,
    `count` INT(11),
    `product_description` VARCHAR(255)  NOT NULL,
    `product_icon` VARCHAR(255) ,
    `product_id` VARCHAR(255) ,
    `product_name` VARCHAR(255) ,
    `product_price` DECIMAL(19,2) NOT NULL,
    `product_stock` INT(11),
    `cart_user_id` BIGINT(20),
    `order_id` BIGINT(20),
    CONSTRAINT `product_in_order_pkey` PRIMARY KEY (`id`),
    CONSTRAINT `fkt0sfj3ffasrift1c4lv3ra85e` FOREIGN KEY (`order_id`)
        REFERENCES `ShopForHome`.`order_main` (`order_id`) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION,
    CONSTRAINT `product_cart_fkey` FOREIGN KEY (`cart_user_id`)
        REFERENCES `ShopForHome`.`cart` (`user_id`) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION,
    CONSTRAINT `product_in_order_count_check` CHECK (count >= 1),
    CONSTRAINT `product_in_order_product_stock_check` CHECK (product_stock >= 0)
)
ENGINE=InnoDB
AUTO_INCREMENT = 1;


-- -----------------------------------------------------
-- Table: `ShopForHome`.`product_info`
-- -----------------------------------------------------
-- DROP TABLE IF EXISTS `ShopForHome`.`product_info`;

CREATE TABLE IF NOT EXISTS `ShopForHome`.`product_info`
(
    `product_id` VARCHAR(255)  NOT NULL,
    `category_type` INT(11) DEFAULT 0,
    `create_time` DATETIME(6),
    `product_description` VARCHAR(255) ,
    `product_icon` VARCHAR(255) ,
    `product_name` VARCHAR(255)  NOT NULL,
    `product_price` DECIMAL(19,2) NOT NULL,
    `product_status` INT(11) DEFAULT 0,
    `product_stock` INT(11) NOT NULL,
    `update_time` DATETIME(6),
    CONSTRAINT `product_info_pkey` PRIMARY KEY (`product_id`),
    CONSTRAINT `product_info_product_stock_check` CHECK (product_stock >= 0)
)
ENGINE=InnoDB
AUTO_INCREMENT = 1;


-- -----------------------------------------------------
-- Table: `ShopForHome`.`users`
-- -----------------------------------------------------

-- DROP TABLE IF EXISTS `ShopForHome`.`users`;

CREATE TABLE IF NOT EXISTS `ShopForHome`.`users`
(
    `id` BIGINT(20) NOT NULL auto_increment,
    `active` boolean NOT NULL,
    `address` VARCHAR(255) ,
    `email` VARCHAR(255) ,
    `name` VARCHAR(255) ,
    `password` VARCHAR(255) ,
    `phone` VARCHAR(255) ,
    `role` VARCHAR(255) ,
    CONSTRAINT `users_pkey` PRIMARY KEY (`id`),
    CONSTRAINT `uk_sx468g52bpetvlad2j9y0lptc` UNIQUE (`email`)
)
ENGINE=InnoDB
AUTO_INCREMENT = 1;

-- -----------------------------------------------------
-- Table: ShopForHome.wishlist
-- -----------------------------------------------------

-- DROP TABLE IF EXISTS `ShopForHome`.`wishlist`;

CREATE TABLE IF NOT EXISTS `ShopForHome`.`wishlist`
(
    `id` BIGINT(20) NOT NULL,
    `created_date` DATETIME(6),
    `user_id` BIGINT(20),
    `product_id` VARCHAR(255) ,
    CONSTRAINT `wishlist_pkey` PRIMARY KEY (`id`),
    CONSTRAINT `product_wish_fkey` FOREIGN KEY (`product_id`)
        REFERENCES `ShopForHome`.`product_info` (`product_id`) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION,
    CONSTRAINT `user_wish_Fkey` FOREIGN KEY (`user_id`)
        REFERENCES `ShopForHome`.`users` (`id`) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE CASCADE
)
ENGINE=InnoDB
AUTO_INCREMENT = 1;
use ShopForHome;
INSERT INTO product_info (product_id, product_name, product_description, product_icon, product_status, product_stock, product_price, category_type,create_time) VALUES ('A550', 'CURTAIN', '108 inch x 48 inch, POLYESTER', 'assets/images/products/mypics/50.jpg',1,100,279, 1, NOW());
INSERT INTO product_info (product_id, product_name, product_description, product_icon, product_status, product_stock, product_price, category_type,create_time) VALUES ('A551', 'CURTAIN', '54 inch x 24 inch, POLYESTER', 'assets/images/products/mypics/51.jpg',1,75,500, 1, NOW());
INSERT INTO product_info (product_id, product_name, product_description, product_icon, product_status, product_stock, product_price, category_type,create_time) VALUES ('A552', 'CURTAIN', '75 inch x 30 inch, POLYESTER', 'assets/images/products/mypics/52.jpg',1,120,300, 1, NOW());
INSERT INTO product_info (product_id, product_name, product_description, product_icon, product_status, product_stock, product_price, category_type,create_time) VALUES ('A553', 'CURTAIN', '108 inch x 48 inch, COTTON', 'assets/images/products/mypics/53.jpg',1,50,250, 1, NOW());
INSERT INTO product_info (product_id, product_name, product_description, product_icon, product_status, product_stock, product_price, category_type,create_time) VALUES ('A554', 'CURTAIN', '108 inch x 48 inch, POLYESTER', 'assets/images/products/mypics/54.jpg',1,200,279, 1, NOW());
INSERT INTO product_info (product_id, product_name, product_description, product_icon, product_status, product_stock, product_price, category_type,create_time) VALUES ('A555', 'LAMP', 'COMPACT, METAL BASE', 'assets/images/products/mypics/55.jpg',1,100,700, 1, NOW());
INSERT INTO product_info (product_id, product_name, product_description, product_icon, product_status, product_stock, product_price, category_type,create_time) VALUES ('A556', 'LAMP', 'HANGING, METAL', 'assets/images/products/mypics/56.jpg',1,150, 300, 1, NOW());
INSERT INTO product_info (product_id, product_name, product_description, product_icon, product_status, product_stock, product_price, category_type,create_time) VALUES ('A557', 'LAMP',' RESIN WOOD, PORTABLE', 'assets/images/products/mypics/57.jpg',1,80, 450, 1, NOW());
INSERT INTO product_info (product_id, product_name, product_description, product_icon, product_status, product_stock, product_price, category_type,create_time) VALUES ('A558', 'LAMP', 'HANGING, LED', 'assets/images/products/mypics/58.jpg',1,95,150, 1, NOW());
INSERT INTO product_info (product_id, product_name, product_description, product_icon, product_status, product_stock, product_price, category_type,create_time) VALUES ('A559', 'LAMP', 'TABLE LAMP', 'assets/images/products/mypics/59.jpg',1,100,279, 1, NOW());
INSERT INTO product_info (product_id, product_name, product_description, product_icon, product_status, product_stock, product_price, category_type,create_time) VALUES ('A560', 'WALL ART', 'HANGING,METAL', 'assets/images/products/mypics/60.jpg',1,75,500, 1, NOW());
INSERT INTO product_info (product_id, product_name, product_description, product_icon, product_status, product_stock, product_price, category_type,create_time) VALUES ('A561', 'WALL ART', 'WALL MOUNT,WOOD', 'assets/images/products/mypics/61.jpg',1,120,300, 1, NOW());
INSERT INTO product_info (product_id, product_name, product_description, product_icon, product_status, product_stock, product_price, category_type,create_time) VALUES ('A562', 'WALL ART', 'WALL MOUNT,RESIN,', 'assets/images/products/mypics/62.jpg',1,50,250, 1, NOW());
INSERT INTO product_info (product_id, product_name, product_description, product_icon, product_status, product_stock, product_price, category_type,create_time) VALUES ('A563', 'WALL ART', 'WALL MOUNT,IRON', 'assets/images/products/mypics/63.jpg',1,200,279, 1, NOW());
INSERT INTO product_info (product_id, product_name, product_description, product_icon, product_status, product_stock, product_price, category_type,create_time) VALUES ('A564', 'WALL ART', 'WALL MOUNT,WOOD', 'assets/images/products/mypics/64.jpg',1,100,700, 1, NOW());
INSERT INTO product_info (product_id, product_name, product_description, product_icon, product_status, product_stock, product_price, category_type,create_time) VALUES ('A565', 'CHAIR', 'WOOD, 100 KILOGRAMS', 'assets/images/products/mypics/65.jpg',1,150, 700, 1, NOW());
INSERT INTO product_info (product_id, product_name, product_description, product_icon, product_status, product_stock, product_price, category_type,create_time) VALUES ('A566', 'SOFA','COTTON, 77 cm x 77 cm', 'assets/images/products/mypics/66.jpg',1,80, 1000, 1, NOW());
INSERT INTO product_info (product_id, product_name, product_description, product_icon, product_status, product_stock, product_price, category_type,create_time) VALUES ('A567', 'CHAIR', 'WOOD,FOLDABLE', 'assets/images/products/mypics/67.jpg',1,95,500, 1, NOW());



INSERT INTO product_info (product_id, product_name, product_description, product_icon, product_status, product_stock, product_price, category_type,create_time) VALUES ('B101', 'MacBook Air', 'Best Laptop', 'assets/images/products/mypics/macbook_air.jpg',2,100, 120000, 0, NOW());
INSERT INTO product_info (product_id, product_name, product_description, product_icon, product_status, product_stock, product_price, category_type,create_time) VALUES ('B102', 'Predator Helios 300', 'Best Gaming Laptop', 'assets/images/products/mypics/predator_helios_300.jpg', 1, 80,80000, 0, NOW());
INSERT INTO product_info (product_id, product_name, product_description, product_icon, product_status, product_stock, product_price, category_type,create_time) VALUES ('B103', 'iPhone 13', 'Best Mobile phone', 'assets/images/products/mypics/iphone13.jpg', 1, 85, 150000, 2, NOW());
INSERT INTO product_info (product_id, product_name, product_description, product_icon, product_status, product_stock, product_price, category_type,create_time) VALUES ('B104', 'Apple Airpods Pro', 'Best bluetooth earpods', 'assets/images/products/mypics/apple_airpods_pro.jpg', 1, 10, 40000, 2, NOW());
INSERT INTO product_info (product_id, product_name, product_description, product_icon, product_status, product_stock, product_price, category_type,create_time) VALUES ('B105', 'Apple iMac Pro', 'Best Desktop', 'assets/images/products/mypics/imac.jpg', 1, 50, 100000, 0, NOW());
INSERT INTO product_info (product_id, product_name, product_description, product_icon, product_status, product_stock, product_price, category_type,create_time) VALUES ('B106', 'iWatch Series 7', 'Best Watches', 'assets/images/products/mypics/iwatch7.jpg', 1, 60, 40000, 2, NOW());
INSERT INTO product_info (product_id, product_name, product_description, product_icon, product_status, product_stock, product_price, category_type,create_time) VALUES ('B107', 'NIKE Shoes', 'Revolution 5 Running shoes for woman', 'assets/images/products/mypics/nike_shoes.jpg', 1, 50, 5000, 3, NOW());
INSERT INTO product_info (product_id, product_name, product_description, product_icon, product_status, product_stock, product_price, category_type,create_time) VALUES ('B108', 'Allen Solly Shirt', 'Best Self Designed formal Men Full Sleeve', 'assets/images/products/mypics/shirt.jpg', 1, 105, 2500, 3, NOW());
INSERT INTO product_info (product_id, product_name, product_description, product_icon, product_status, product_stock, product_price, category_type,create_time) VALUES ('B109', 'Boat Storm', '1.3 inch Curved Display Smart Watch', 'assets/images/products/mypics/boat_watch.jpg', 1, 70, 2499, 2, NOW());
INSERT INTO product_info (product_id, product_name, product_description, product_icon, product_status, product_stock, product_price, category_type,create_time) VALUES ('B110', 'Realme Narzo 50i', 'realme narzo 50i ,Carbon Black,32Gb , 2GB Ram', 'assets/images/products/mypics/realme_narzo.jpg', 1, 50, 6999, 2, NOW());
INSERT INTO product_info (product_id, product_name, product_description, product_icon, product_status, product_stock, product_price, category_type,create_time) VALUES ('B111', 'REDMI 9i Sport', '13mp Camera, 5000 mah battery,Helio G25 ,4Gb Ram , 64GB ROM', 'assets/images/products/mypics/redmi_9i.jpg', 1, 30, 8799, 2, NOW());
INSERT INTO product_info (product_id, product_name, product_description, product_icon, product_status, product_stock, product_price, category_type,create_time) VALUES ('B112', 'Infinix Note 11', '5000mah battery, 6.7 inch display, 50mp + 2 mp + AI lens', 'assets/images/products/mypics/infinix_note11.jpg', 1, 65, 11499, 2, NOW());
INSERT INTO product_info (product_id, product_name, product_description, product_icon, product_status, product_stock, product_price, category_type,create_time) VALUES ('B113', 'Fastrack Sunglass', 'UV protection,Wayfarer Sunglasses, Free Size', 'assets/images/products/mypics/fastrack_sunglass.jpg', 1,55, 1899, 3, NOW());


INSERT INTO product_info (product_id, product_name, product_description, product_icon, product_status, product_stock, product_price, category_type,create_time) VALUES ('B114', 'AISLIN', 'Polarized UV Protection, Rectangular Sunglasses', 'assets/images/products/mypics/sunglass.jpg', 1, 67, 3999, 3, NOW());
INSERT INTO product_info (product_id, product_name, product_description, product_icon, product_status, product_stock, product_price, category_type,create_time) VALUES ('B115', 'THE MAN COMPANY', 'Skin Brightening cream, multani mitti coco butter, Defence Theory', 'assets/images/products/mypics/themancompany_cream.jpg',1, 119, 4890, 3, NOW());
INSERT INTO product_info (product_id, product_name, product_description, product_icon, product_status, product_stock, product_price, category_type,create_time) VALUES ('B116', 'JACK & JONES', 'SKINNY MEN BLUE JEANS , COMFORTABLE', 'assets/images/products/mypics/jackandjones_jeans.jpg', 1, 80, 5777, 3, NOW());
INSERT INTO product_info (product_id, product_name, product_description, product_icon, product_status, product_stock, product_price, category_type,create_time) VALUES ('B117', 'DIESEL', 'ANALOG watch for Men', 'assets/images/products/mypics/dieselwatch.jpg', 1, 49, 25499,2, NOW());
INSERT INTO product_info (product_id, product_name, product_description, product_icon, product_status, product_stock, product_price, category_type,create_time) VALUES ('B118', 'iPhone 13', 'Best Mobile phone', 'assets/images/products/mypics/iphone13.jpg', 1, 40, 90000, 2, NOW());
INSERT INTO product_info (product_id, product_name, product_description, product_icon, product_status, product_stock, product_price, category_type,create_time) VALUES ('B119', 'Predator Helios 300', 'Best Gaming Laptop', 'assets/images/products/mypics/predator_helios_300.jpg', 1, 50, 130000, 0, NOW());
INSERT INTO product_info (product_id, product_name, product_description, product_icon, product_status, product_stock, product_price, category_type,create_time) VALUES ('B120', 'THE MAN COMPANY', 'Skin Brightening cream, multani mitti coco butter, Defence Theory', 'assets/images/products/mypics/themancompany_cream.jpg', 1, 40, 799, 3, NOW());


-- -----------------------------------------------------
-- Categories
-- -----------------------------------------------------

INSERT INTO product_info (product_id, product_name, product_description, product_icon, product_status, product_stock, product_price, category_type,create_time) VALUES ('A502', 'SAMSUNG Galaxy Book Go', 'Snapdragon 7c', 'assets/images/products/mypics/1.jpg', 0, 10, 50, 4, NOW());
INSERT INTO product_info (product_id, product_name, product_description, product_icon, product_status, product_stock, product_price, category_type,create_time) VALUES ('A506', 'Lenovo Ideapad 3 AMD Ryzen 5 5500U', '15.6 (39.62cm) FHD Thin & Light Laptop (8GB/512GB SSD/Windows 11/Office 2021/Backlit Keyboard/2Yr Warranty/Arctic Grey/1.65Kg', 'assets/images/products/mypics/2.jpg', 0, 50, 16.99, 4, NOW());
INSERT INTO product_info (product_id, product_name, product_description, product_icon, product_status, product_stock, product_price, category_type,create_time) VALUES ('A510', 'Dell Inspiron 15 3000', 'Intel Graphics,Core i3-11G', 'assets/images/products/mypics/3.jpg', 0, 70, 16.99, 4, NOW());
INSERT INTO product_info (product_id, product_name, product_description, product_icon, product_status, product_stock, product_price, category_type,create_time) VALUES ('A593', 'ASUS ROG Strix G17', '17.3-inch (43.94 cms) FHD 144Hz, AMD Ryzen 7 4800H, RTX 3050 Ti 4GB Graphics', 'assets/images/products/mypics/4.jpg', 0, 60, 76.99, 4, NOW());
INSERT INTO product_info (product_id, product_name, product_description, product_icon, product_status, product_stock, product_price, category_type,create_time) VALUES ('A591', 'ASUS Vivobook S15 OLED', 'Intel Core Evo i5-12500H 12th Gen, Thin and Light Laptop (16GB/512GB SSD/Iris Xe Graphics/Windows 11/Office 2021/Grey/1.8 kg', 'assets/images/products/mypics/5.jpg', 0, 80, 50.99, 4, NOW());
INSERT INTO product_info (product_id, product_name, product_description, product_icon, product_status, product_stock, product_price, category_type,create_time) VALUES ('A984', 'OPPO A54', 'Crystal Black, 4GB RAM, 64GB Storage', 'assets/images/products/mypics/6.jpg', 0, 20, 10.99, 3, NOW());
INSERT INTO product_info (product_id, product_name, product_description, product_icon, product_status, product_stock, product_price, category_type,create_time) VALUES ('A655', 'iQOO Neo 6 5G', '(Dark Nova, 8GB RAM, 128GB Storage) | Snapdragon® 870 5G | 80W FlashCharge', 'assets/images/products/mypics/7.jpg', 0, 50, 11.99, 3, NOW());
INSERT INTO product_info (product_id, product_name, product_description, product_icon, product_status, product_stock, product_price, category_type,create_time) VALUES ('A603', 'OPPO F21 Pro', 'Sunset Orange, 8GB RAM, 128 Storage', 'assets/images/products/mypics/8.jpg', 0, 10, 20.99, 3, NOW());
INSERT INTO product_info (product_id, product_name, product_description, product_icon, product_status, product_stock, product_price, category_type,create_time) VALUES ('A607', 'Redmi Note 11 Pro + 5G', 'Stealth Black, 6GB RAM, 128GB Storage) | 67W Turbo Charge | 120Hz Super AMOLED Display', 'assets/images/products/mypics/9.jpg', 0, 400, 30.99, 3, NOW());
INSERT INTO product_info (product_id, product_name, product_description, product_icon, product_status, product_stock, product_price, category_type,create_time) VALUES ('A611', 'Motorola a10 keypad Mobile', '32GB,FM with 1750 mAh Battery, Rose Gold', 'assets/images/products/mypics/10.jpg', 0, 110, 35.99, 3, NOW());
INSERT INTO product_info (product_id, product_name, product_description, product_icon, product_status, product_stock, product_price, category_type,create_time) VALUES ('A614', 'realme Buds Air 2', 'Best bluetooth earpods with ANC', 'assets/images/products/mypics/11.jpg', 0, 150, 40.99, 3, NOW());
INSERT INTO product_info (product_id, product_name, product_description, product_icon, product_status, product_stock, product_price, category_type,create_time) VALUES ('A608', 'Fastrack Reflex Play', '24x7 HRM, SpO2, 25+ Multisport Modes, Sleep Monitor & Women’s Health Tracker', 'assets/images/products/mypics/12.jpg', 0, 50, 16.99, 6, NOW());
INSERT INTO product_info (product_id, product_name, product_description, product_icon, product_status, product_stock, product_price, category_type,create_time) VALUES ('A605', 'Noise ColorFit', '1.4" Full Touch HD Display, SpO2, Heart Rate, Sleep Monitors & 10-Day Battery - Deep Wine', 'assets/images/products/mypics/13.jpg', 0, 40, 17.99, 6, NOW());
INSERT INTO product_info (product_id, product_name, product_description, product_icon, product_status, product_stock, product_price, category_type,create_time) VALUES ('A612', 'Fossil Gen 5E', 'Digital Dial Womens Watch', 'assets/images/products/mypics/14.jpg', 0, 80, 18.99, 6, NOW());
INSERT INTO product_info (product_id, product_name, product_description, product_icon, product_status, product_stock, product_price, category_type,create_time) VALUES ('A609', 'NIKE Shoes', 'Nike Girls React Miler Running Shoe', 'assets/images/products/mypics/15.jpg', 0, 70, 15.99, 7, NOW());
INSERT INTO product_info (product_id, product_name, product_description, product_icon, product_status, product_stock, product_price, category_type,create_time) VALUES ('A617', 'Centrino', 'Men Formal Shoes', 'assets/images/products/mypics/16.jpg', 0, 120, 16.99, 7, NOW());
INSERT INTO product_info (product_id, product_name, product_description, product_icon, product_status, product_stock, product_price, category_type,create_time) VALUES ('A619', 'Dennis Shirt', 'Lingo Men Casual Shirt', 'assets/images/products/mypics/17.jpg', 0, 90, 18.99, 7, NOW());
INSERT INTO product_info (product_id, product_name, product_description, product_icon, product_status, product_stock, product_price, category_type,create_time) VALUES ('A620', 'Peter England Shirt', 'Mens Regular Shirt', 'assets/images/products/mypics/18.jpg', 0, 60, 19.99, 7, NOW());
INSERT INTO product_info (product_id, product_name, product_description, product_icon, product_status, product_stock, product_price, category_type,create_time) VALUES ('A621', 'Shaftesbury London Shirt', 'Womens Polycotton Slim Fit Formal Shirt', 'assets/images/products/mypics/19.jpg', 0, 10, 20.99, 7, NOW());
INSERT INTO product_info (product_id, product_name, product_description, product_icon, product_status, product_stock, product_price, category_type,create_time) VALUES ('A613', 'Boat Xtend', '1.5 inch Curved Display Smart Watch', 'assets/images/products/mypics/20.jpg', 0, 70, 22.99, 3, NOW());
INSERT INTO product_info (product_id, product_name, product_description, product_icon, product_status, product_stock, product_price, category_type,create_time) VALUES ('A618', 'GUESS', 'Jensen Crossbody Bucket', 'assets/images/products/mypics/21.jpg', 0, 106, 25.99, 3, NOW());
INSERT INTO product_info (product_id, product_name, product_description, product_icon, product_status, product_stock, product_price, category_type,create_time) VALUES ('A622', 'Micheal Kors', 'Jet Set Travel Large Chain Shoulder Tote', 'assets/images/products/mypics/22.jpg', 0, 109, 6.99, 3, NOW());
INSERT INTO product_info (product_id, product_name, product_description, product_icon, product_status, product_stock, product_price, category_type,create_time) VALUES ('A626', 'Lee Cooper', 'Men-Women Wayfarer Sunglasses', 'assets/images/products/mypics/23.jpg', 0, 103, 16.99, 3, NOW());
INSERT INTO product_info (product_id, product_name, product_description, product_icon, product_status, product_stock, product_price, category_type,create_time) VALUES ('A623', 'LAKME', 'Ivory Fair 01, SPF 8 Natural Finish Matte Cream', 'assets/images/products/mypics/24.jpg', 0, 125, 26.99, 3, NOW());
INSERT INTO product_info (product_id, product_name, product_description, product_icon, product_status, product_stock, product_price, category_type,create_time) VALUES ('A683', 'LEVIS', 'Mens Skinny Tapered Fit Jeans', 'assets/images/products/mypics/25.jpg', 0, 80, 46.99, 3, NOW());
INSERT INTO product_info (product_id, product_name, product_description, product_icon, product_status, product_stock, product_price, category_type,create_time) VALUES ('A624', 'WildHorn', 'Brown Leather Mens Leather Wallet', 'assets/images/products/mypics/26.jpg', 0, 20, 30.99, 3, NOW());
INSERT INTO product_info (product_id, product_name, product_description, product_icon, product_status, product_stock, product_price, category_type,create_time) VALUES ('A625', 'CURTAIN', '108 inch x 48 inch, POLYESTER', 'assets/images/products/mypics/50.jpg', 0, 100, 50, 0, NOW());

INSERT INTO product_info (product_id, product_name, product_description, product_icon, product_status, product_stock, product_price, category_type,create_time) VALUES ('A592', 'SAMSUNG Galaxy Book Go', 'Snapdragon 7c', 'assets/images/products/mypics/1.jpg', 0, 100, 50, 8, NOW());
INSERT INTO product_info (product_id, product_name, product_description, product_icon, product_status, product_stock, product_price, category_type,create_time) VALUES ('A596', 'Lenovo Ideapad 3 AMD Ryzen 5 5500U', '15.6 (39.62cm) FHD Thin & Light Laptop (8GB/512GB SSD/Windows 11/Office 2021/Backlit Keyboard/2Yr Warranty/Arctic Grey/1.65Kg', 'assets/images/products/mypics/2.jpg', 1, 100, 16.99, 8, NOW());
INSERT INTO product_info (product_id, product_name, product_description, product_icon, product_status, product_stock, product_price, category_type,create_time) VALUES ('A590', 'Dell Inspiron 15 3000', 'Intel Graphics,Core i3-11G', 'assets/images/products/mypics/3.jpg', 0, 100, 16.99, 8, NOW());
INSERT INTO product_info (product_id, product_name, product_description, product_icon, product_status, product_stock, product_price, category_type,create_time) VALUES ('A597', 'ASUS ROG Strix G17', '17.3-inch (43.94 cms) FHD 144Hz, AMD Ryzen 7 4800H, RTX 3050 Ti 4GB Graphics', 'assets/images/products/mypics/4.jpg', 0, 100, 76.99, 1, NOW());
INSERT INTO product_info (product_id, product_name, product_description, product_icon, product_status, product_stock, product_price, category_type,create_time) VALUES ('A595', 'ASUS Vivobook S15 OLED', 'Intel Core Evo i5-12500H 12th Gen, Thin and Light Laptop (16GB/512GB SSD/Iris Xe Graphics/Windows 11/Office 2021/Grey/1.8 kg', '4.jpg', 3, 100, 50.99,0, NOW());





INSERT INTO product_info (product_id,product_name, product_description, product_icon, product_status, product_stock, product_price, category_type,create_time) VALUES ('B10123', 'Macrip Air', 'Best Laptop', 'assets/images/products/mypics/macbook_air.jpg',0,100, 120000, 2, NOW());



INSERT INTO product_info (product_id, product_name, product_description, product_icon, product_status, product_stock, product_price, category_type,create_time) VALUES ('COFFEEMUG-1024', 'Coffee Mug - Treasure', 'Do you love mathematics? If so, then you need this elegant coffee mug with an amazing fractal design. You don\'t have to worry about boring coffee mugs anymore. This coffee mug will be the topic of conversation in the office, guaranteed! Buy it now!', 'assets/images/products/coffeemugs/coffeemug-luv2code-1024.png', 0, 100, 18.99, 1, NOW());



INSERT INTO product_info (product_id, product_name, product_description, product_icon, product_status, product_stock, product_price, category_type,create_time) VALUES ('MOUSEPAD-1023', 'Mouse Pad - Recursion', 'Fractal images are amazing! You can now own a mouse pad with a unique and amazing fractal. The mouse pad is made of a durable and smooth material. Your mouse will easily glide across the mouse pad. This mouse pad will brighten your workspace. Buy it now!', 'assets/images/products/mousepads/mousepad-luv2code-1023.png', 0, 100, 17.99, 2, NOW());
INSERT INTO product_info (product_id, product_name, product_description, product_icon, product_status, product_stock, product_price, category_type,create_time) VALUES ('MOUSEPAD-1024', 'Mouse Pad - Treasure', 'Fractal images are amazing! You can now own a mouse pad with a unique and amazing fractal. The mouse pad is made of a durable and smooth material. Your mouse will easily glide across the mouse pad. This mouse pad will brighten your workspace. Buy it now!', 'assets/images/products/mousepads/mousepad-luv2code-1024.png', 0, 100, 17.99, 2, NOW());


INSERT INTO product_info (product_id, product_name, product_description, product_icon, product_status, product_stock, product_price, category_type,create_time) VALUES ('LUGGAGETAG-1024', 'Luggage Tag - Countryside', 'This luggage tag will help you identify your luggage. The luggage tag is very unique and it will stand out from the crowd. The luggage tag is created out of a rugged and durable plastic. Buy this luggage tag now to make it easy to identify your luggage!', 'assets/images/products/luggagetags/luggagetag-luv2code-1024.png',0, 100, 16.99, 3, NOW());

-- -----------------------------------------------------
-- Users
-- -----------------------------------------------------

INSERT INTO `ShopForHome`.`users` VALUES (2147483646, true, 'Vijayawada', 'Bindu2@gmail.com', 'Bindu','Bindu@123','1234567890', 'ROLE_MANAGER');
INSERT INTO `ShopForHome`.`users` VALUES (2147483647, true, 'Vijayawada', 'razia@gmail.com', 'Razia','Razia@123', '1234567890', 'ROLE_MANAGER');
INSERT INTO `ShopForHome`.`users` VALUES (2147483648, true, 'Hyderabad', 'navyav@gmail.com','NavyaV', 'Navyav@123', '1234567890', 'ROLE_MANAGER');
INSERT INTO `ShopForHome`.`users` VALUES (2147483649, true, 'Mumbai', 'chetan@gmail.com', 'Chetan','Chetan@123',  '1234567890', 'ROLE_MANAGER');
INSERT INTO `ShopForHome`.`users` VALUES (2147483650, true, 'Mumbai', 'saurav@gmail.com','Saurav', 'Saurav@123','1234567890', 'ROLE_MANAGER');
INSERT INTO `ShopForHome`.`users` VALUES (2147483651, true, 'Hyderabad', 'navyab@gmail.com','NavyaB', 'Navyab@123', '1234567890', 'ROLE_MANAGER');



show tables;  
select * from users; 

INSERT INTO ShopForHome.users VALUES (2147483655, true, 'Plot 2, Shivaji Nagar, Benagluru', 'admin@gmail.com', 'Admin', '$2a$10$LiBwO43TpKU0sZgCxNkWJueq2lqxoUBsX2Wclzk8JQ3Ejb9MWu2Xy', '1234567890', 'ROLE_MANAGER');

drop database ShopForHome;