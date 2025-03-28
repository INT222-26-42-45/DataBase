CREATE database `skorshop`;
USE `skorshop`;

DROP TABLE IF EXISTS `Brands`;
CREATE TABLE `Brands` (
    `BrandId` INT(10) NOT NULL AUTO_INCREMENT,
    `BrandName` VARCHAR(40) NOT NULL,
     PRIMARY KEY (BrandId)
);

DROP TABLE IF EXISTS `Colors`;
CREATE TABLE `Colors` (
    `ColorId` INT(10) NOT NULL AUTO_INCREMENT,
    `ColorName` VARCHAR(15) NOT NULL,
     PRIMARY KEY (ColorId)
);

DROP TABLE IF EXISTS `Products`;
CREATE TABLE `Products` (
    `ProductId` INT(10) NOT NULL AUTO_INCREMENT,
    `ProductName` VARCHAR(40) NOT NULL,
    `ProductDescription` VARCHAR(1000) NOT NULL,
    `ProductType` VARCHAR(20) NOT NULL,
    `ProductSize` VARCHAR(10) NOT NULL,
    `ProductPrice` DECIMAL(10,2) NOT NULL,
    `ProductDate` DATE NOT NULL,
    `ProductImg` VARCHAR(255),
    `BrandId` INT(10) NOT NULL,
    `ColorId` INT(10) NOT NULL,
     PRIMARY KEY (ProductId)
);
ALTER TABLE `Products`
    ADD CONSTRAINT `product_brand_fk` FOREIGN KEY ( `BrandId` )
        REFERENCES `Brands` ( `BrandId` );
ALTER TABLE `Products`
    ADD CONSTRAINT `product_color_fk` FOREIGN KEY ( `ColorId` )
        REFERENCES `Colors` ( `ColorId` );

DROP TABLE IF EXISTS `Users`;
CREATE TABLE `Users` (
   `UserId` INT(10) NOT NULL AUTO_INCREMENT,
   `FirstName` VARCHAR(45) NOT NULL,
   `LastName` VARCHAR(45) NOT NULL,
   `DOB` DATE NOT NULL,
   `Gender` VARCHAR(10) NOT NULL,
   `Email` VARCHAR(45) NOT NULL,
   `Tel` VARCHAR(10) NOT NULL,
   `UserName` VARCHAR(30) NOT NULL,
   `Password` VARCHAR(1000) NOT NULL,
    PRIMARY KEY (UserId) 
);
ALTER TABLE `Users` ADD CONSTRAINT `username_uk` UNIQUE ( `UserName` );

DROP TABLE IF EXISTS `Roles`;
CREATE TABLE `Roles` (
    `RoleId` INT(3) NOT NULL,
    `RoleName` VARCHAR(15) NOT NULL
);
ALTER TABLE `Roles` ADD CONSTRAINT `role_pk` PRIMARY KEY ( `RoleId` );

DROP TABLE IF EXISTS `UserRole`;
CREATE TABLE `UserRole` (
    `UserId` INT(10) NOT NULL,
    `RoleId` INT(3) NOT NULL
);
	ALTER TABLE `UserRole` ADD CONSTRAINT `userrole_pk` PRIMARY KEY ( `UserId`, `RoleId` );
	ALTER TABLE `UserRole` ADD CONSTRAINT `userrole_user_fk` FOREIGN KEY ( `UserId` ) 
	REFERENCES `Users` ( `UserId` );
	ALTER TABLE `UserRole` ADD CONSTRAINT `userrole_role_fk` FOREIGN KEY ( `RoleId` )
        REFERENCES `Roles` ( `RoleId` );

DROP TABLE IF EXISTS `Carts`;
CREATE TABLE `Carts` (
    `CartId` INT(10) NOT NULL AUTO_INCREMENT,
    `UserId` INT(10) NOT NULL,
    `ProductId` INT(10) NOT NULL,
    `Quantity` INT(3) NOT NULL,
    `Total` DECIMAL(10,2) NOT NULL,
     PRIMARY KEY (CartId) 
);
ALTER TABLE `Carts`
    ADD CONSTRAINT `userid` FOREIGN KEY ( `UserId` )
        REFERENCES `Users` ( `UserId` );
ALTER TABLE `Carts`
    ADD CONSTRAINT `productid` FOREIGN KEY ( `ProductId` )
        REFERENCES `Products` ( `ProductId` );

/*Insert Data Collection*/

/*Data for the table Brands*/
insert into `Brands` (BrandId, BrandName) values
(1, 'Adidas'),
(2, 'Nike'),
(3, 'New Balance'),
(4, 'Converse'),
(5, 'Vans'),
(6, 'Fila');

/*Data for the table Colors*/
insert into `Colors` (ColorId, ColorName) values
(1, '#000000'),
(2, '#FFFFFF'),
(3, '#B7B7A4'),
(4, '#70E000'),
(5, '#56CFE1'),
(6, '#013A63'),
(7, '#BE0AFF'),
(8, '#FF7AA2'),
(9, '#EF233C'),
(10, '#FFE100');

/*Data for the table Products*/
insert  into `Products`(ProductId, ProductName, ProductDescription, ProductType, ProductSize, ProductPrice, ProductDate, ProductImg, BrandId, ColorId) values 
(1, 'STAN SMITH', 'Trying to decide between sporty casual and dressed-up glam? Why not do both? These adidas Stan Smith shoes have the same buttery-soft leather upper as the 1971 original, dressed up with sparkling crystals from Swarovski.', 'Men/Women', '35.5-44', '3200.00', '2020-08-13', 'stansmith.png', 1, 2),
(2, 'NMD R1', 'the NMD legacy in these adidas NMD_R1 Shoes. Plush Boost cushioning keeps your city adventure feeling like you are walking on clouds. And since your head is sometimes up there, it is not a bad place for your feet to be too. Great for those sunup to sundown days, the soft knit textile upper doubles down on the comfort.', 'Men/Women', '35.5-44', '4600.00', '2020-06-04', 'nmdr.png', 1, 1),
(3, 'ULTRABOOST DNA', 'Run to move your body. Run to clear your head. The adidas Ultraboost DNA Shoes give you endless energy over the miles. The sleek silhouette makes them a favourite beyond the world of running. An adidas Primeknit upper brings comfort to your everyday wandering too.', 'Men/Women', '35.5-44', '6000.00', '2020-07-07', 'ultraboostdna.png', 1, 9),
(4, 'ULTRABOOST 21', 'Prototype after prototype. Innovation after innovation. Testing after testing. Meet us in the hot pursuit of the pinnacle harmonization of weight, cushioning, and responsiveness. Ultraboost 21. Say hello to incredible energy return.', 'Men/Women', '35.5-44', '6500.00', '2020-08-21', 'ultraboost21.png', 1, 3),
(5, 'SUPERSTAR', 'Designed for basketball in the 70s, glorified by hip-hop fans of the 80s, the adidas Superstar has become a must-have item for today street-dwellers. The world-famous seashell design retains the original style and protection of the basketball court, eliminating the worry of being hit by your feet at festivals or on the street. Maintain the original look with jagged 3-Stripes and the adidas Superstar logo in a square frame.', 'Men/Women', '35.5-44', '3200.00', '2020-08-15', 'superstar.png', 1, 2),
(6, 'SLIP-ON SUPERSTAR', 'Why waste time tying your shoes? When you are ready to travel and teleport to meet your friends immediately. The adidas Superstar was originally an icon of the basketball court. But now it has become a shoe that stands out on the road, runway, or anywhere else, reinforcing its original design with a smooth upper and comfortable cups. Turn the top design from classic laces into straps for a sleek and easy slip-on style.', 'Men/Women', '35.5-44', '3200.00', '2020-12-06', 'slipon.png', 1, 1),
(7, 'OZWEEGO ZIP', 'Yesterday from the 90s, cutting edge technology And perspectives of the future These adidas OZWEEGO shoes are ready to transform your look with bold style from the past and soft cushioning that will keep you moving forward. Into the future that belongs to you Zippered upper lets you put your shoes on and go quickly.', 'Men/Women', '35.5-44', '4700.00', '2020-10-05', 'ozweego.png', 1, 2),
(8, 'JORDAN DELTA2', 'The Jordan Delta 2 delivers fearless, fresh style that builds on the elements. You want durability, comfort and a Jordan-like attitude to the core - we have revamped the design lines and replaced some of the components.', 'Women', '35.5-40', '5000.00', '2020-02-01', 'jordandelta.png', 2, 2),
(9, 'NIKE AIR FORCE 1 SHADOW', 'The Nike Air Force 1 Shadow brings a playful twist to a classic basketball shoe. Stand out by layering layers. It features a double-stacked brand and an enlarged midsole to emphasize a style approach and double the fun.', 'Women', '35.5-40', '4200.00', '2020-05-13', 'airforce1.png', 2, 2), 
(10, 'NIKE AIR FORCE 1 LV8', 'Nike Air Force 1 has a new twist. Classic basketball shoes from 1982 reimagined for the game. (In a better way) with a pixelated Swoosh and an iridescent pearlescent. With all the details you know and love Who wants to play?', 'Men', '39-44', '2900.00', '2020-04-29', 'airflv8.png', 2, 1),
(11, 'NIKE AIR FORCE 1 07', 'Joy lives in the Nike Air Force 1 07, an iconic basketball shoe that brings a fresh twist to what you know best. Be it the sharp leather, the eye-catching colors and the perfect sparkle that makes you shine.', 'Women', '35.5-40', '3500.00', '2020-07-02', 'airf07.png', 2, 2),
(12, 'NIKE OVERBREAK SP', 'The Nike OverBreak SP fuses iconic BRS track-shoe aesthetics with this sleek Nike OverReact accent, giving everyone an eye-popping style and superior comfort. There is an overlay from synthetic suede that is characterized by gradation dyeing for an added elegance While colorful laces and translucent toe caps are ready to show off.', 'Men', '39-44', '5200.00', '2020-11-11', 'overbreak.png', 2, 3),
(13, 'NIKE BLAZER MID 77 VINTAGE', 'In the 70s, Nike is shoes were the new shoes that just launched. Our brand at the time was still trying to pioneer the basketball scene. And still have to let the basketball team in the city try the shoes to test the prototype. Of course, the design is constantly evolving Over the years But the model name remains the same, the Nike Blazer Mid 77 Vintage has always been a classic. From the first day until today.', 'Men', '41-47', '3600.00', '2021-02-28', 'blazer.png', 2, 2),
(14, 'NIKE DUNK LOW WMNS “EASTER”', 'This Nike Dunk Low features a White leather base with pastel hues covering the overlays, Swooshes, tongue labels, heels, and inner lining. A White midsole atop a Yellow speckled rubber sole completes the design.', 'Women', '35.5-40', '3500.00', '2021-11-13', 'dunkeaster.png', 2, 2),
(15, 'NIKE AIR MAX 90', 'The Nike Air Max 90 follows the original OG running shoe with a signature waffle outsole. Stitched outer overlay And TPU details highlight the classic style color New shades add power to the look The Max Air cushioning system adds comfort to the journey.', 'Women', '35.5-40', '4600.00', '2020-05-12', 'airmax90.png', 2, 2),
(16, 'NIKE AIR FLIGHT 89', 'Keep the fun alive with the Nike Air Flight 89, the iconic basketball shoe that takes you back to OG basketball style with retro colors. The top cover from the leather is sharp. And the straps over the longer feet The pair pays homage to Nike is all-star all-star Roswell Rayguns, featuring retro Raygun colors and embroidered accents. And details according to other trends That will bring you back to the year 1975.', 'Men', '41-47', '4600.00', '2020-04-19', 'airflight.png', 2, 1),
(17, 'MENS MADE IN US 993', 'Superior comfort meets classic style in our men Made in US 993 running shoe. A favorite from the legendary 990 series, the 993 features responsive cushioning and premium materials ready for a run or all-day wear.', 'Men', '40-46', '5800.00', '2020-09-12', 'mens.png', 3, 3),
(18, 'FRESH FOAM ROAV', 'The Fresh FoProductam Roav keeps you comfortable on the go. Fresh Foam cushioning creates a soft underfoot feel, while the Ultra Heel provides a snug, locked-in fit.', 'Men', '40-47', '2600.00', '2020-09-17', 'fresh.png', 3, 3), 
(19, '574', 'The 574 women’s sneaker is a collectible icon. With clean lines, a classic profile, and fun color schemes inspired by classic windbreakers, this shoe makes a standout, everyday statement that remains true to its 80s heritage. Modern comfort upgrades such as supportive ENCAP midsole cushioning and lightweight textile uppers help ensure these kicks feel as good as they look.', 'Women', '35.5-40', '2900.00', '2021-02-14', '574.png', 3, 7),
(20, 'NUMERIC 440 HIGHT', 'Our New Balance Numeric NM440 is now available in a supportive high top with the NM440 High, blending premier technology with soft cushioning to create a go-to shoe for both everyday skate and wear. Featuring a 70s-inspired suede and mesh upper, this modern-retro shoe boasts both breathability and durability. A C-CAP heel wedge in the midsole helps protect against impact, while NDurance rubber outsole technology provides protection in high-wear areas to help get more out of these trusted shoes.', 'Women', '35.5-40', '3200.00', '2021-02-02', 'numeric440.png', 3, 2),
(21, 'SOLA SLEEK', 'Subtle and stylish, the women is Sola Sleek shoe highlights your femininity by accentuating your stance. The almond-shaped toe is unique in its design, while the open collar provides exceptional support without sacrificing style points. With a lightweight EVA foam cushioning and an NB Comfort Insert for added support, these women is shoes are comfortable enough for all-day wear.', 'Women', '35.5-40', '2300.00', '2021-01-03', 'solasleek.png', 3, 8),
(22, 'FUELCELL TRAINER', 'Subtle and stylish, the women Sola Sleek shoe highlights your femininity by accentuating your stance. The almond-shaped toe is unique in its design, while the open collar provides exceptional support without sacrificing style points. With a lightweight EVA foam cushioning and an NB Comfort Insert for added support, these women shoes are comfortable enough for all-day wear.', 'Women', '35.5-40', '4200.00', '2021-04-18', 'fuelcell.png', 3, 2),
(23, 'TWO WXY', 'For the players unbound by position, no longer defined by 1 through 5, the TWO WXY is built for your style of play. Hyper-engineered for speed and agility at both ends of the court, it’s a performance shoe packed with tech for that explosive moment when you switch from offense to defense to offense again. The TWO WXY specializes in versatility—the playmaker of today’s positionless game.', 'Men', '40-46', '5800.00', '2021-04-13', 'twowxy.png', 3, 6);

/*Data for the table Roles*/
insert into `Roles`(RoleId, RoleName) values
(1, 'Admin'),
(2, 'User');

/*Data for the table Users*/
insert into `Users`(UserId, FirstName, LastName, DOB, Gender, Email, Tel, UserName, Password) values 
(1, 'natti', 'mahapan', '2000-12-08', 'Female', 'nattima09@gmail.com', '0925838618', 'natti', '$2a$10$QAPIFKje5c.e6mgEgYU7T.S3f4El6hiM3Pxd2KHY2OXTDHTrgUO7a'),
(2, 'niraphon', 'jongkraijak', '2000-02-21', 'Female', 'nira.apple@gmail.com', '0935960619', 'apple', '$2a$10$1gncpGFM/OgZAdSSSgcK6Olf5OR/dh7cA5DNlXVUZ2Y8INZ6VZtP2'),
(3, 'Donlawan', 'petcharat', '2000-11-13', 'Female', 'donlawan13@gmail.com', '0818947381', 'pukboong', '$2a$10$lMfbVGon2h4wJhH3YSCmne/wMwrhzZ7S1zycyOBQR5QVnp4rOg4ZK'),
(4, 'Enola', 'Holmes', '2005-01-23', 'Female', 'eno.hol@gmail.com', '0999970099', 'enoLa', '$2a$10$1XSjcxerE4TQzKKn3m4ZCOQ1yHL15Ewdtl2XdYoPupwNA3keNrZdq'),
(5, 'John', 'Wick', '1998-05-06', 'Male', 'wick.john@gmail.com', '0873998755', 'johnW', '$2a$10$XVj2jWzViKHMe4Wj86A80.SRRsRmF2U76/sRi95fJgHdHcq9uJ.AK'),
(6, 'Mia', 'Chloe', '1999-12-25', 'Male', 'miao.loe@hotmail.com', '0822394562', 'Cmia', '$2a$10$.QNtpvTB5brpLRnYzPecP.A5/dXEBj273RwiLJ.scL.yf/JUJ6vWS'),
(7, 'Amma', 'Bootang', '1995-02-21', 'Female', 'Amma.Boo@gmail.com', '0657846958', 'Emmaaa', '$2a$10$7JOD.UrK6JZBJtaUG2O7K.nx/8GdrNmsodWI1eCFrsGs8/vQk60S2'),
(8, 'Victoria', 'Genesis', '1999-07-28', 'Female', 'victoria.secret@gmail.com', '0932122333', 'SeaVictoria', '$2a$10$qpsJiWeig9iRamyVvZ2Alu4AP6vUGcXK6ge6b8xleil9p96YlOQxa'),
(9, 'Natacha', 'Rose', '2003-11-09', 'Female', 'rose.nc@gmail.com', '0680773222', 'naTarose', '$2a$10$vBimFlN2XNsrK7t7eV2XT.u/wAAPHeBcZ5OerZno63UCZyVzLiFJy');


/*Data for the table UserRole*/
insert into `UserRole`(UserId, RoleId) values 
(1,1),
(2,1),
(3,1),
(4,2),
(5,2),
(6,2),
(7,2),
(8,2),
(9,2);

COMMIT;

/* create user and grant privileges */
show databases;
select user,host from mysql.user;
create user 'backend'@'%' identified by 'backendproject';

grant create, select, update, delete on skorshop.* to 'backend'@'%';
grant insert on skorshop.Products to 'backend'@'%';
grant insert on skorshop.Brands to 'backend'@'%';
grant insert on skorshop.Users to 'backend'@'%';
grant insert on skorshop.UserRole to 'backend'@'%';
grant insert on skorshop.Colors to 'backend'@'%';
grant insert on skorshop.Carts to 'backend'@'%';
flush privileges;


