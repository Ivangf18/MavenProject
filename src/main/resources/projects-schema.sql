DROP TABLE IF EXISTS project_category;
DROP TABLE IF EXISTS step;
DROP TABLE IF EXISTS material;
DROP TABLE IF EXISTS category;
DROP TABLE IF EXISTS project;

CREATE TABLE project (
    project_id INT AUTO_INCREMENT PRIMARY KEY,
    project_name VARCHAR(255) NOT NULL,
    estimated_hours DECIMAL(5,2),
    actual_hours DECIMAL(5,2),
    difficulty INT NOT NULL,
    notes TEXT
);

CREATE TABLE category (
    category_id INT AUTO_INCREMENT PRIMARY KEY,
    category_name VARCHAR(100) NOT NULL
);

CREATE TABLE material (
    material_id INT AUTO_INCREMENT PRIMARY KEY,
    project_id INT NOT NULL,
    material_name VARCHAR(255) NOT NULL,
    num_required INT NOT NULL,
    cost DECIMAL(10,2) NOT NULL,
    FOREIGN KEY (project_id) REFERENCES project(project_id) ON DELETE CASCADE
);

CREATE TABLE step (
    step_id INT AUTO_INCREMENT PRIMARY KEY,
    project_id INT NOT NULL,
    step_number INT NOT NULL,
    instruction TEXT NOT NULL,
    FOREIGN KEY (project_id) REFERENCES project(project_id) ON DELETE CASCADE
);

CREATE TABLE project_category (
    project_id INT NOT NULL,
    category_id INT NOT NULL,
    PRIMARY KEY (project_id, category_id),
    FOREIGN KEY (project_id) REFERENCES project(project_id) ON DELETE CASCADE,
    FOREIGN KEY (category_id) REFERENCES category(category_id) ON DELETE CASCADE
);