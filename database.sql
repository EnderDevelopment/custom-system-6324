CREATE TABLE IF NOT EXISTS custom_system_data (
    id INT AUTO_INCREMENT PRIMARY KEY,
    player_id INT NOT NULL,
    value INT NOT NULL,
    last_updated TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

INSERT INTO custom_system_data (player_id, value) VALUES (1, 100);