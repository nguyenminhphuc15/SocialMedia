-- Use the `mysql` database if necessary for administrative tasks
-- USE mysql;

-- Drop the database if it exists and recreate the `SocialMedia` database
DROP DATABASE IF EXISTS `SocialMedia`;
CREATE DATABASE IF NOT EXISTS `SocialMedia`;
USE `SocialMedia`;

-- Drop the `Account` table if it exists and recreate it
DROP TABLE IF EXISTS `Account`;
CREATE TABLE IF NOT EXISTS `Account` (
    Id                BIGINT AUTO_INCREMENT PRIMARY KEY,  
    Email             VARCHAR(255)                              NOT NULL,           
    Password          VARCHAR(255)                              NOT NULL,        
    CreateTime        TIMESTAMP                                 NOT NULL , 
    Status            ENUM('ACTIVE', 'INACTIVE', 'BANNED')      NOT NULL,  
    UpdateTime        TIMESTAMP                                 NOT NULL  ,  
    Role              ENUM('ADMIN', 'USER')                     NOT NULL,    
    Fullname          VARCHAR(255)                              NOT NULL,       
    Birthday          DATE                                      NOT NULL,                        
    Gender            ENUM('MALE', 'FEMALE', 'OTHER')           NOT NULL,   
    Avatar            VARCHAR(255)
);

-- Drop the `AccountActivityLog` table if it exists and recreate it
DROP TABLE IF EXISTS `AccountActivityLog`;
CREATE TABLE IF NOT EXISTS `AccountActivityLog` (
    Id                BIGINT AUTO_INCREMENT PRIMARY KEY,
    AccountId         BIGINT                                    NOT NULL,              
    ActivityTime      TIMESTAMP                                 NOT NULL, 
    ActivityStatus    ENUM('ONLINE', 'OFFLINE') NOT NULL,
    FOREIGN KEY (AccountId) REFERENCES `Account`(Id)
);

DROP TABLE IF EXISTS `OTP`;
CREATE TABLE IF NOT EXISTS `OTP` (
    Id                      BIGINT AUTO_INCREMENT PRIMARY KEY,              
    CreateTime              TIMESTAMP                                                                   NOT NULL, 
    Code                    VARCHAR(25)                                                                 NOT NULL,
    `Category`                ENUM("REGISTER",  "UPDATE_PASSWORD",  "UPDATE_EMAIL", "RESET_PASSWORD")    NOT NULL,
    ExpirationTime          TIMESTAMP                                                                   NOT NULL, 
    AccountId               BIGINT                                                                      NOT NULL,              
    FOREIGN KEY (AccountId) REFERENCES `Account`(Id) 
);

-- Insert sample data into the `Account` table
INSERT INTO `Account` (`Email`, `Password`, `CreateTime`, `Status`, `UpdateTime`, `Role`, `Fullname`, `Birthday`, `Gender`, `Avatar`)
VALUES 
    ('admin@gmail.com', '$2a$10$W2neF9.6Agi6kAKVq8q3fec5dHW8KUA.b0VSIGdIZyUravfLpyIFi', '2025-01-09 14:30:00', 'ACTIVE', '2025-01-10 09:10:00', 'ADMIN', 'John Doe', '1990-05-15', 'MALE', 'john-avatar.jpg'),
    ('devilskipper@gmail.com', '$2a$10$W2neF9.6Agi6kAKVq8q3fec5dHW8KUA.b0VSIGdIZyUravfLpyIFi', '2025-01-09 14:30:00', 'ACTIVE', '2025-01-10 09:10:00', 'USER', 'Jane Smith', '1992-11-22', 'FEMALE', 'jane-avatar.jpg'),
    ('alex.taylor@example.com', '$2a$10$W2neF9.6Agi6kAKVq8q3fec5dHW8KUA.b0VSIGdIZyUravfLpyIFi', '2025-01-08 10:20:00', 'BANNED', '2025-01-09 15:00:00', 'USER', 'Alex Taylor', '1985-03-10', 'OTHER', NULL),
    ('emma.jones@example.com', '$2a$10$W2neF9.6Agi6kAKVq8q3fec5dHW8KUA.b0VSIGdIZyUravfLpyIFi', '2025-01-01 16:45:00', 'INACTIVE', '2025-01-05 12:00:00', 'USER', 'Emma Jones', '1995-07-18', 'FEMALE', 'emma-avatar.png');

-- Insert sample data into the `AccountActivityLog` table
INSERT INTO `AccountActivityLog` (`AccountId`, `ActivityTime`, `ActivityStatus`)
VALUES
    (1, '2025-01-10 09:30:00', 'ONLINE'),
    (2, '2025-01-09 14:45:00', 'ONLINE'),
    (3, '2025-01-08 10:45:00', 'OFFLINE'),
    (4, '2025-01-01 17:00:00', 'OFFLINE');
