CREATE TABLE IF NOT EXISTS `__EFMigrationsHistory` (
    `MigrationId` varchar(150) CHARACTER SET utf8mb4 NOT NULL,
    `ProductVersion` varchar(32) CHARACTER SET utf8mb4 NOT NULL,
    CONSTRAINT `PK___EFMigrationsHistory` PRIMARY KEY (`MigrationId`)
) CHARACTER SET=utf8mb4;

START TRANSACTION;

DROP PROCEDURE IF EXISTS MigrationsScript;
DELIMITER //
CREATE PROCEDURE MigrationsScript()
BEGIN
    IF NOT EXISTS(SELECT 1 FROM `__EFMigrationsHistory` WHERE `MigrationId` = '20221014222320_Initial-Migration') THEN

    ALTER DATABASE CHARACTER SET utf8mb4;

    END IF;
END //
DELIMITER ;
CALL MigrationsScript();
DROP PROCEDURE MigrationsScript;

DROP PROCEDURE IF EXISTS MigrationsScript;
DELIMITER //
CREATE PROCEDURE MigrationsScript()
BEGIN
    IF NOT EXISTS(SELECT 1 FROM `__EFMigrationsHistory` WHERE `MigrationId` = '20221014222320_Initial-Migration') THEN

    CREATE TABLE `Customer` (
        `Id` int NOT NULL AUTO_INCREMENT,
        `FirstName` varchar(100) CHARACTER SET utf8mb4 NOT NULL,
        `LastName` varchar(100) CHARACTER SET utf8mb4 NOT NULL,
        `Age` int NOT NULL,
        CONSTRAINT `PK_Customer` PRIMARY KEY (`Id`)
    ) CHARACTER SET=utf8mb4;

    END IF;
END //
DELIMITER ;
CALL MigrationsScript();
DROP PROCEDURE MigrationsScript;

DROP PROCEDURE IF EXISTS MigrationsScript;
DELIMITER //
CREATE PROCEDURE MigrationsScript()
BEGIN
    IF NOT EXISTS(SELECT 1 FROM `__EFMigrationsHistory` WHERE `MigrationId` = '20221014222320_Initial-Migration') THEN

    INSERT INTO `__EFMigrationsHistory` (`MigrationId`, `ProductVersion`)
    VALUES ('20221014222320_Initial-Migration', '6.0.10');

    END IF;
END //
DELIMITER ;
CALL MigrationsScript();
DROP PROCEDURE MigrationsScript;

COMMIT;

START TRANSACTION;

DROP PROCEDURE IF EXISTS MigrationsScript;
DELIMITER //
CREATE PROCEDURE MigrationsScript()
BEGIN
    IF NOT EXISTS(SELECT 1 FROM `__EFMigrationsHistory` WHERE `MigrationId` = '20221014222756_CustomerInitialData') THEN

    INSERT INTO `Customer` (`Id`, `Age`, `FirstName`, `LastName`)
    VALUES (1, 37, 'Erick', 'Orlando');

    END IF;
END //
DELIMITER ;
CALL MigrationsScript();
DROP PROCEDURE MigrationsScript;

DROP PROCEDURE IF EXISTS MigrationsScript;
DELIMITER //
CREATE PROCEDURE MigrationsScript()
BEGIN
    IF NOT EXISTS(SELECT 1 FROM `__EFMigrationsHistory` WHERE `MigrationId` = '20221014222756_CustomerInitialData') THEN

    INSERT INTO `Customer` (`Id`, `Age`, `FirstName`, `LastName`)
    VALUES (2, 68, 'Bill', 'Gates');

    END IF;
END //
DELIMITER ;
CALL MigrationsScript();
DROP PROCEDURE MigrationsScript;

DROP PROCEDURE IF EXISTS MigrationsScript;
DELIMITER //
CREATE PROCEDURE MigrationsScript()
BEGIN
    IF NOT EXISTS(SELECT 1 FROM `__EFMigrationsHistory` WHERE `MigrationId` = '20221014222756_CustomerInitialData') THEN

    INSERT INTO `Customer` (`Id`, `Age`, `FirstName`, `LastName`)
    VALUES (3, 35, 'Mark', 'Zuckeberg');

    END IF;
END //
DELIMITER ;
CALL MigrationsScript();
DROP PROCEDURE MigrationsScript;

DROP PROCEDURE IF EXISTS MigrationsScript;
DELIMITER //
CREATE PROCEDURE MigrationsScript()
BEGIN
    IF NOT EXISTS(SELECT 1 FROM `__EFMigrationsHistory` WHERE `MigrationId` = '20221014222756_CustomerInitialData') THEN

    INSERT INTO `__EFMigrationsHistory` (`MigrationId`, `ProductVersion`)
    VALUES ('20221014222756_CustomerInitialData', '6.0.10');

    END IF;
END //
DELIMITER ;
CALL MigrationsScript();
DROP PROCEDURE MigrationsScript;

COMMIT;

START TRANSACTION;

DROP PROCEDURE IF EXISTS MigrationsScript;
DELIMITER //
CREATE PROCEDURE MigrationsScript()
BEGIN
    IF NOT EXISTS(SELECT 1 FROM `__EFMigrationsHistory` WHERE `MigrationId` = '20221014224342_MoreTables') THEN

    ALTER TABLE `Customer` ADD `Status` tinyint(1) NOT NULL DEFAULT FALSE;

    END IF;
END //
DELIMITER ;
CALL MigrationsScript();
DROP PROCEDURE MigrationsScript;

DROP PROCEDURE IF EXISTS MigrationsScript;
DELIMITER //
CREATE PROCEDURE MigrationsScript()
BEGIN
    IF NOT EXISTS(SELECT 1 FROM `__EFMigrationsHistory` WHERE `MigrationId` = '20221014224342_MoreTables') THEN

    CREATE TABLE `Product` (
        `Id` int NOT NULL AUTO_INCREMENT,
        `Code` varchar(20) CHARACTER SET utf8mb4 NOT NULL,
        `Description` varchar(200) CHARACTER SET utf8mb4 NOT NULL,
        `UnitPrice` decimal(11,2) NOT NULL,
        `Status` tinyint(1) NOT NULL,
        CONSTRAINT `PK_Product` PRIMARY KEY (`Id`)
    ) CHARACTER SET=utf8mb4;

    END IF;
END //
DELIMITER ;
CALL MigrationsScript();
DROP PROCEDURE MigrationsScript;

DROP PROCEDURE IF EXISTS MigrationsScript;
DELIMITER //
CREATE PROCEDURE MigrationsScript()
BEGIN
    IF NOT EXISTS(SELECT 1 FROM `__EFMigrationsHistory` WHERE `MigrationId` = '20221014224342_MoreTables') THEN

    CREATE TABLE `Sale` (
        `Id` int NOT NULL AUTO_INCREMENT,
        `CustomerId` int NOT NULL,
        `SaleDate` datetime(6) NOT NULL,
        `SaleNumber` varchar(20) CHARACTER SET utf8mb4 NOT NULL,
        `TotalSale` decimal(11,2) NOT NULL,
        `Status` tinyint(1) NOT NULL,
        CONSTRAINT `PK_Sale` PRIMARY KEY (`Id`),
        CONSTRAINT `FK_Sale_Customer_CustomerId` FOREIGN KEY (`CustomerId`) REFERENCES `Customer` (`Id`) ON DELETE CASCADE
    ) CHARACTER SET=utf8mb4;

    END IF;
END //
DELIMITER ;
CALL MigrationsScript();
DROP PROCEDURE MigrationsScript;

DROP PROCEDURE IF EXISTS MigrationsScript;
DELIMITER //
CREATE PROCEDURE MigrationsScript()
BEGIN
    IF NOT EXISTS(SELECT 1 FROM `__EFMigrationsHistory` WHERE `MigrationId` = '20221014224342_MoreTables') THEN

    CREATE TABLE `SaleDetail` (
        `Id` int NOT NULL AUTO_INCREMENT,
        `SaleId` int NOT NULL,
        `ProductId` int NOT NULL,
        `Quantity` decimal(11,2) NOT NULL,
        `UnitPrice` decimal(11,2) NOT NULL,
        `TotalPrice` decimal(11,2) NOT NULL,
        `Status` tinyint(1) NOT NULL,
        CONSTRAINT `PK_SaleDetail` PRIMARY KEY (`Id`),
        CONSTRAINT `FK_SaleDetail_Product_ProductId` FOREIGN KEY (`ProductId`) REFERENCES `Product` (`Id`) ON DELETE CASCADE,
        CONSTRAINT `FK_SaleDetail_Sale_SaleId` FOREIGN KEY (`SaleId`) REFERENCES `Sale` (`Id`) ON DELETE CASCADE
    ) CHARACTER SET=utf8mb4;

    END IF;
END //
DELIMITER ;
CALL MigrationsScript();
DROP PROCEDURE MigrationsScript;

DROP PROCEDURE IF EXISTS MigrationsScript;
DELIMITER //
CREATE PROCEDURE MigrationsScript()
BEGIN
    IF NOT EXISTS(SELECT 1 FROM `__EFMigrationsHistory` WHERE `MigrationId` = '20221014224342_MoreTables') THEN

    UPDATE `Customer` SET `Status` = TRUE
    WHERE `Id` = 1;
    SELECT ROW_COUNT();


    END IF;
END //
DELIMITER ;
CALL MigrationsScript();
DROP PROCEDURE MigrationsScript;

DROP PROCEDURE IF EXISTS MigrationsScript;
DELIMITER //
CREATE PROCEDURE MigrationsScript()
BEGIN
    IF NOT EXISTS(SELECT 1 FROM `__EFMigrationsHistory` WHERE `MigrationId` = '20221014224342_MoreTables') THEN

    UPDATE `Customer` SET `Status` = TRUE
    WHERE `Id` = 2;
    SELECT ROW_COUNT();


    END IF;
END //
DELIMITER ;
CALL MigrationsScript();
DROP PROCEDURE MigrationsScript;

DROP PROCEDURE IF EXISTS MigrationsScript;
DELIMITER //
CREATE PROCEDURE MigrationsScript()
BEGIN
    IF NOT EXISTS(SELECT 1 FROM `__EFMigrationsHistory` WHERE `MigrationId` = '20221014224342_MoreTables') THEN

    UPDATE `Customer` SET `Status` = TRUE
    WHERE `Id` = 3;
    SELECT ROW_COUNT();


    END IF;
END //
DELIMITER ;
CALL MigrationsScript();
DROP PROCEDURE MigrationsScript;

DROP PROCEDURE IF EXISTS MigrationsScript;
DELIMITER //
CREATE PROCEDURE MigrationsScript()
BEGIN
    IF NOT EXISTS(SELECT 1 FROM `__EFMigrationsHistory` WHERE `MigrationId` = '20221014224342_MoreTables') THEN

    INSERT INTO `Product` (`Id`, `Code`, `Description`, `Status`, `UnitPrice`)
    VALUES (1, '1000', 'Playstation 4', TRUE, 299.0);
    INSERT INTO `Product` (`Id`, `Code`, `Description`, `Status`, `UnitPrice`)
    VALUES (2, '2000', 'Xbox Series X', TRUE, 400.0);
    INSERT INTO `Product` (`Id`, `Code`, `Description`, `Status`, `UnitPrice`)
    VALUES (3, '3000', 'Nintendo Switch', TRUE, 500.0);
    INSERT INTO `Product` (`Id`, `Code`, `Description`, `Status`, `UnitPrice`)
    VALUES (4, '4000', 'Playstation 5', TRUE, 600.0);

    END IF;
END //
DELIMITER ;
CALL MigrationsScript();
DROP PROCEDURE MigrationsScript;

DROP PROCEDURE IF EXISTS MigrationsScript;
DELIMITER //
CREATE PROCEDURE MigrationsScript()
BEGIN
    IF NOT EXISTS(SELECT 1 FROM `__EFMigrationsHistory` WHERE `MigrationId` = '20221014224342_MoreTables') THEN

    CREATE INDEX `IX_Sale_CustomerId` ON `Sale` (`CustomerId`);

    END IF;
END //
DELIMITER ;
CALL MigrationsScript();
DROP PROCEDURE MigrationsScript;

DROP PROCEDURE IF EXISTS MigrationsScript;
DELIMITER //
CREATE PROCEDURE MigrationsScript()
BEGIN
    IF NOT EXISTS(SELECT 1 FROM `__EFMigrationsHistory` WHERE `MigrationId` = '20221014224342_MoreTables') THEN

    CREATE INDEX `IX_SaleDetail_ProductId` ON `SaleDetail` (`ProductId`);

    END IF;
END //
DELIMITER ;
CALL MigrationsScript();
DROP PROCEDURE MigrationsScript;

DROP PROCEDURE IF EXISTS MigrationsScript;
DELIMITER //
CREATE PROCEDURE MigrationsScript()
BEGIN
    IF NOT EXISTS(SELECT 1 FROM `__EFMigrationsHistory` WHERE `MigrationId` = '20221014224342_MoreTables') THEN

    CREATE INDEX `IX_SaleDetail_SaleId` ON `SaleDetail` (`SaleId`);

    END IF;
END //
DELIMITER ;
CALL MigrationsScript();
DROP PROCEDURE MigrationsScript;

DROP PROCEDURE IF EXISTS MigrationsScript;
DELIMITER //
CREATE PROCEDURE MigrationsScript()
BEGIN
    IF NOT EXISTS(SELECT 1 FROM `__EFMigrationsHistory` WHERE `MigrationId` = '20221014224342_MoreTables') THEN

    INSERT INTO `__EFMigrationsHistory` (`MigrationId`, `ProductVersion`)
    VALUES ('20221014224342_MoreTables', '6.0.10');

    END IF;
END //
DELIMITER ;
CALL MigrationsScript();
DROP PROCEDURE MigrationsScript;

COMMIT;

