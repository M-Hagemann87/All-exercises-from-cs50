##### USERS

CREATE TABLE `users` (
    `id` INT AUTO_INCREMENT,
    `first_name` VARCHAR(30) NOT NULL,
    `last_name` VARCHAR(30) NOT NULL,
    `user_name` TINYTEXT NOT NULL,
    `password` TINYTEXT NOT NULL,
    PRIMARY KEY(`id`)
);

##### Schools and Universities

CREATE TABLE `schools` (
    `id` INT AUTO_INCREMENT,
    `name` TINYTEXT NOT NULL,
    `type` ENUM ('Primary', 'Secondary', 'Higher Education') NOT NULL,
    `location` TINYTEXT,
    `year` VARCHAR(4),
    PRIMARY KEY(`id`)
);

##### Companies

CREATE TABLE `companies` (
    `id` INT AUTO_INCREMENT,
    `name` TINYTEXT NOT NULL,
    `industry` ENUM ('Technology','Education','Business'),
    `location` TINYTEXT,
    PRIMARY KEY(`id`)
);

#### Connections

CREATE TABLE `connections` (
    `id` INT AUTO_INCREMENT,
    `user_id` INT NOT NULL,
    `school_id` INT NOT NULL,
    `company_id` INT NOT NULL,
    `school_start_date` DATE NOT NULL,
    `school_end_date` DATE NOT NULL,
    `school_degree` TINYTEXT,
    `companies_start_date` DATE NOT NULL,
    `companies_end_date`  DATE NOT NULL,
     FOREIGN KEY(`company_id`) REFERENCES `companies`(`id`),
     FOREIGN KEY(`school_id`) REFERENCES `schools`(`id`),
     FOREIGN KEY(`user_id`) REFERENCES `users`(`id`),
     PRIMARY KEY(`id`)
);
