-- ========================================
-- L2 Server - Login Database Schema
-- ========================================
-- This is a template schema for the login server database
-- Add your actual table definitions here

-- Example: Accounts table
-- CREATE TABLE IF NOT EXISTS accounts (
--     login VARCHAR(45) NOT NULL,
--     password VARCHAR(255) NOT NULL,
--     lastactive BIGINT(13) UNSIGNED DEFAULT 0,
--     access_level INT DEFAULT 0,
--     lastIP VARCHAR(20),
--     lastServer INT DEFAULT 1,
--     PRIMARY KEY (login)
-- ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Example: Account data table
-- CREATE TABLE IF NOT EXISTS account_data (
--     account_name VARCHAR(45) NOT NULL,
--     var VARCHAR(20) NOT NULL,
--     value VARCHAR(255) NOT NULL,
--     PRIMARY KEY (account_name, var)
-- ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Example: Gameservers table
-- CREATE TABLE IF NOT EXISTS gameservers (
--     server_id INT NOT NULL,
--     hexid VARCHAR(32),
--     host VARCHAR(50),
--     PRIMARY KEY (server_id)
-- ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Add more tables as needed for your L2 server implementation
