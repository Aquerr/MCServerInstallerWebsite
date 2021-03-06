CREATE SCHEMA IF NOT EXISTS mcinstaller AUTHORIZATION mcinstaller;

SET SCHEMA mcinstaller;

CREATE USER IF NOT EXISTS mcinstaller PASSWORD 'mcinstaller' admin;

CREATE TABLE IF NOT EXISTS user (
   id              INT AUTO_INCREMENT              NOT NULL,
   username        VARCHAR(200)        UNIQUE      NOT NULL,
   password        VARCHAR(200)                    NOT NULL,
   PRIMARY KEY (id)
);
CREATE UNIQUE INDEX IF NOT EXISTS user_idx ON user (id);

CREATE TABLE IF NOT EXISTS server (
    id          INT AUTO_INCREMENT                NOT NULL,
    name        VARCHAR(250)                      NOT NULL,
    path        VARCHAR(250)         UNIQUE        NOT NULL,
    PRIMARY KEY (id)
);
CREATE UNIQUE INDEX IF NOT EXISTS server_idx ON server (id);

CREATE TABLE IF NOT EXISTS user_server (
    user_id     INT         NOT NULL,
    server_id   INT         NOT NULL,
    FOREIGN KEY (user_id) REFERENCES user(id) ON DELETE CASCADE,
    FOREIGN KEY (server_id) REFERENCES server(id) ON DELETE CASCADE
);

-- MERGE INTO user (id, username, password) VALUES (1, 'Nerdi', '$2a$10$RsBi7zEwsAHxTgQO8cBX5Oe7iCPvIkGN3ichuibM9uGzmvx6TzFC6')

-- CREATE TABLE IF NOT EXISTS user_server (
--     user_id         INT         NOT NULL,
--     server_id       INT         NOT NULL,
--     FOREIGN KEY (user_id) REFERENCES user(id) ON DELETE CASCADE,
--     FOREIGN KEY (server_id) REFERENCES server(id) ON DELETE CASCADE
-- )
