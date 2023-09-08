
DROP SCHEMA IF EXISTS northwind ;
CREATE SCHEMA IF NOT EXISTS northwind ;


CREATE TABLE IF NOT EXISTS northwind.customers (
  id SERIAL PRIMARY KEY,
  company VARCHAR(50),
  last_name VARCHAR(50),
  first_name VARCHAR(50),
  email_address VARCHAR(50),
  job_title VARCHAR(50),
  business_phone VARCHAR(25),
  home_phone VARCHAR(25),
  mobile_phone VARCHAR(25),
  fax_number VARCHAR(25),
  address TEXT,
  city VARCHAR(50),
  state_province VARCHAR(50),
  zip_postal_code VARCHAR(15),
  country_region VARCHAR(50),
  web_page TEXT,
  notes TEXT,
  attachments BYTEA
);

CREATE INDEX idx_city ON northwind.customers (city);
CREATE INDEX idx_company ON northwind.customers (company);
CREATE INDEX idx_first_name ON northwind.customers (first_name);
CREATE INDEX idx_last_name ON northwind.customers (last_name);
CREATE INDEX idx_zip_postal_code ON northwind.customers (zip_postal_code);
CREATE INDEX idx_state_province ON northwind.customers (state_province);


CREATE TABLE IF NOT EXISTS northwind.employees (
  id SERIAL PRIMARY KEY,
  company VARCHAR(50),
  last_name VARCHAR(50),
  first_name VARCHAR(50),
  email_address VARCHAR(50),
  job_title VARCHAR(50),
  business_phone VARCHAR(25),
  home_phone VARCHAR(25),
  mobile_phone VARCHAR(25),
  fax_number VARCHAR(25),
  address TEXT,
  city VARCHAR(50),
  state_province VARCHAR(50),
  zip_postal_code VARCHAR(15),
  country_region VARCHAR(50),
  web_page TEXT,
  notes TEXT,
  attachments BYTEA
);

CREATE INDEX idx_city ON northwind.employees (city);
CREATE INDEX idx_company ON northwind.employees (company);
CREATE INDEX idx_first_name ON northwind.employees (first_name);
CREATE INDEX idx_last_name ON northwind.employees (last_name);
CREATE INDEX idx_zip_postal_code ON northwind.employees (zip_postal_code);
CREATE INDEX idx_state_province ON northwind.employees (state_province);




CREATE TABLE IF NOT EXISTS northwind.privileges (
  id SERIAL PRIMARY KEY,
  privilege_name VARCHAR(50)
);


CREATE TABLE IF NOT EXISTS northwind.employee_privileges (
  employee_id INT NOT NULL,
  privilege_id INT NOT NULL,
  PRIMARY KEY (employee_id, privilege_id),
  CONSTRAINT fk_employee_privileges_employees1
    FOREIGN KEY (employee_id)
    REFERENCES northwind.employees (id)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT fk_employee_privileges_privileges1
    FOREIGN KEY (privilege_id)
    REFERENCES northwind.privileges (id)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
);

CREATE INDEX idx_employee_id ON northwind.employee_privileges (employee_id);
CREATE INDEX idx_privilege_id ON northwind.employee_privileges (privilege_id);
CREATE INDEX idx_privilege_id_2 ON northwind.employee_privileges (privilege_id);



CREATE TABLE IF NOT EXISTS northwind.inventory_transaction_types (
  id SMALLINT NOT NULL,
  type_name VARCHAR(50) NOT NULL,
  PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS northwind.shippers (
  id SERIAL PRIMARY KEY,
  company VARCHAR(50),
  last_name VARCHAR(50),
  first_name VARCHAR(50),
  email_address VARCHAR(50),
  job_title VARCHAR(50),
  business_phone VARCHAR(25),
  home_phone VARCHAR(25),
  mobile_phone VARCHAR(25),
  fax_number VARCHAR(25),
  address TEXT,
  city VARCHAR(50),
  state_province VARCHAR(50),
  zip_postal_code VARCHAR(15),
  country_region VARCHAR(50),
  web_page TEXT,
  notes TEXT,
  attachments BYTEA
);

CREATE INDEX idx_city ON northwind.shippers (city);
CREATE INDEX idx_company ON northwind.shippers (company);
CREATE INDEX idx_first_name ON northwind.shippers (first_name);
CREATE INDEX idx_last_name ON northwind.shippers (last_name);
CREATE INDEX idx_zip_postal_code ON northwind.shippers (zip_postal_code);
CREATE INDEX idx_state_province ON northwind.shippers (state_province);


CREATE TABLE IF NOT EXISTS northwind.orders_tax_status (
  id SMALLINT NOT NULL,
  tax_status_name VARCHAR(50) NOT NULL,
  PRIMARY KEY (id)
);