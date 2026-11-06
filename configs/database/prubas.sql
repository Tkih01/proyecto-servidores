CREATE USER IF NOT EXISTS 'app_nexo'@'localhost' IDENTIFIED BY 'AppNexo_2026!';
GRANT SELECT, INSERT ON nexocomercial_db.* TO 'app_nexo'@'localhost';
FLUSH PRIVILEGES;
