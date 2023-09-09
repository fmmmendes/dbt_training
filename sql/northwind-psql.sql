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

CREATE INDEX idx_city_c ON northwind.employees (city);
CREATE INDEX idx_company_c ON northwind.employees (company);
CREATE INDEX idx_first_name_c ON northwind.employees (first_name);
CREATE INDEX idx_last_name_c ON northwind.employees (last_name);
CREATE INDEX idx_zip_postal_code_c ON northwind.employees (zip_postal_code);
CREATE INDEX idx_state_province_c ON northwind.employees (state_province);




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

CREATE INDEX idx_city_sh ON northwind.shippers (city);
CREATE INDEX idx_company_sh ON northwind.shippers (company);
CREATE INDEX idx_first_name_sh ON northwind.shippers (first_name);
CREATE INDEX idx_last_name_sh ON northwind.shippers (last_name);
CREATE INDEX idx_zip_postal_code_sh ON northwind.shippers (zip_postal_code);
CREATE INDEX idx_state_province_sh ON northwind.shippers (state_province);


CREATE TABLE IF NOT EXISTS northwind.orders_tax_status (
  id SMALLINT NOT NULL,
  tax_status_name VARCHAR(50) NOT NULL,
  PRIMARY KEY (id)
);


CREATE TABLE IF NOT EXISTS northwind.orders_status (
  id SMALLINT NOT NULL,
  status_name VARCHAR(50) NOT NULL,
  PRIMARY KEY (id)
);


CREATE TABLE IF NOT EXISTS northwind.orders (
  id SERIAL PRIMARY KEY,
  employee_id INT,
  customer_id INT,
  order_date TIMESTAMP,
  shipped_date TIMESTAMP,
  shipper_id INT,
  ship_name VARCHAR(50),
  ship_address TEXT,
  ship_city VARCHAR(50),
  ship_state_province VARCHAR(50),
  ship_zip_postal_code VARCHAR(50),
  ship_country_region VARCHAR(50),
  shipping_fee NUMERIC(19, 4) DEFAULT '0.0000',
  taxes NUMERIC(19, 4) DEFAULT '0.0000',
  payment_type VARCHAR(50),
  paid_date TIMESTAMP,
  notes TEXT,
  tax_rate DOUBLE PRECISION DEFAULT '0',
  tax_status_id SMALLINT,
  status_id SMALLINT DEFAULT '0',
  FOREIGN KEY (customer_id) REFERENCES northwind.customers(id) ON DELETE NO ACTION ON UPDATE NO ACTION,
  FOREIGN KEY (employee_id) REFERENCES northwind.employees(id) ON DELETE NO ACTION ON UPDATE NO ACTION,
  FOREIGN KEY (shipper_id) REFERENCES northwind.shippers(id) ON DELETE NO ACTION ON UPDATE NO ACTION,
  FOREIGN KEY (tax_status_id) REFERENCES northwind.orders_tax_status(id) ON DELETE NO ACTION ON UPDATE NO ACTION,
  FOREIGN KEY (status_id) REFERENCES northwind.orders_status(id) ON DELETE NO ACTION ON UPDATE NO ACTION
);


CREATE TABLE IF NOT EXISTS northwind.products (
  supplier_ids TEXT,
  id SERIAL PRIMARY KEY,
  product_code VARCHAR(25),
  product_name VARCHAR(50),
  description TEXT,
  standard_cost NUMERIC(19,4) DEFAULT '0.0000',
  list_price NUMERIC(19,4) NOT NULL DEFAULT '0.0000',
  reorder_level INT,
  target_level INT,
  quantity_per_unit VARCHAR(50),
  discontinued BOOLEAN NOT NULL DEFAULT false,
  minimum_reorder_quantity INT,
  category VARCHAR(50),
  attachments BYTEA
);


CREATE TABLE IF NOT EXISTS northwind.purchase_order_status (
  id INT NOT NULL,
  status VARCHAR(50) DEFAULT NULL,
  PRIMARY KEY (id)
);


CREATE TABLE IF NOT EXISTS northwind.suppliers (
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

-- Create indexes
CREATE INDEX IF NOT EXISTS idx_city_sp ON northwind.suppliers (city);
CREATE INDEX IF NOT EXISTS idx_company_sp ON northwind.suppliers (company);
CREATE INDEX IF NOT EXISTS idx_first_name_sp ON northwind.suppliers (first_name);
CREATE INDEX IF NOT EXISTS idx_last_name_sp ON northwind.suppliers (last_name);
CREATE INDEX IF NOT EXISTS idx_zip_postal_code_sp ON northwind.suppliers (zip_postal_code);
CREATE INDEX IF NOT EXISTS idx_state_province_sp ON northwind.suppliers (state_province);


CREATE TABLE IF NOT EXISTS northwind.purchase_orders (
  id SERIAL PRIMARY KEY,
  supplier_id INT,
  created_by INT,
  submitted_date TIMESTAMP,
  creation_date TIMESTAMP,
  status_id INT DEFAULT '0',
  expected_date TIMESTAMP,
  shipping_fee NUMERIC(19, 4) NOT NULL DEFAULT '0.0000',
  taxes NUMERIC(19, 4) NOT NULL DEFAULT '0.0000',
  payment_date TIMESTAMP,
  payment_amount NUMERIC(19, 4) DEFAULT '0.0000',
  payment_method VARCHAR(50),
  notes TEXT,
  approved_by INT,
  approved_date TIMESTAMP,
  submitted_by INT,
  CONSTRAINT fk_purchase_orders_employees1
    FOREIGN KEY (created_by)
    REFERENCES northwind.employees (id)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT fk_purchase_orders_purchase_order_status1
    FOREIGN KEY (status_id)
    REFERENCES northwind.purchase_order_status (id)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT fk_purchase_orders_suppliers1
    FOREIGN KEY (supplier_id)
    REFERENCES northwind.suppliers (id)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
);

-- Create indexes
CREATE UNIQUE INDEX IF NOT EXISTS idx_id_po ON northwind.purchase_orders (id);
CREATE INDEX IF NOT EXISTS idx_created_by_po ON northwind.purchase_orders (created_by);
CREATE INDEX IF NOT EXISTS idx_status_id_po ON northwind.purchase_orders (status_id);
CREATE INDEX IF NOT EXISTS idx_supplier_id_po ON northwind.purchase_orders (supplier_id);


CREATE TABLE IF NOT EXISTS northwind.inventory_transactions (
  id SERIAL PRIMARY KEY,
  transaction_type SMALLINT NOT NULL,
  transaction_created_date TIMESTAMP,
  transaction_modified_date TIMESTAMP,
  product_id INT NOT NULL,
  quantity INT NOT NULL,
  purchase_order_id INT,
  customer_order_id INT,
  comments VARCHAR(255),
  CONSTRAINT fk_inventory_transactions_orders1
    FOREIGN KEY (customer_order_id)
    REFERENCES northwind.orders (id)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT fk_inventory_transactions_products1
    FOREIGN KEY (product_id)
    REFERENCES northwind.products (id)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT fk_inventory_transactions_purchase_orders1
    FOREIGN KEY (purchase_order_id)
    REFERENCES northwind.purchase_orders (id)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT fk_inventory_transactions_inventory_transaction_types1
    FOREIGN KEY (transaction_type)
    REFERENCES northwind.inventory_transaction_types (id)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
);

-- Create indexes
CREATE INDEX IF NOT EXISTS idx_customer_order_id ON northwind.inventory_transactions (customer_order_id);
CREATE INDEX IF NOT EXISTS idx_product_id ON northwind.inventory_transactions (product_id);
CREATE INDEX IF NOT EXISTS idx_purchase_order_id ON northwind.inventory_transactions (purchase_order_id);
CREATE INDEX IF NOT EXISTS idx_transaction_type ON northwind.inventory_transactions (transaction_type);


CREATE TABLE IF NOT EXISTS northwind.invoices (
  id SERIAL PRIMARY KEY,
  order_id INT,
  invoice_date TIMESTAMP,
  due_date TIMESTAMP,
  tax NUMERIC(19, 4) DEFAULT '0.0000',
  shipping NUMERIC(19, 4) DEFAULT '0.0000',
  amount_due NUMERIC(19, 4) DEFAULT '0.0000',
  CONSTRAINT fk_invoices_orders1
    FOREIGN KEY (order_id)
    REFERENCES northwind.orders (id)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
);

-- Create indexes
CREATE INDEX IF NOT EXISTS idx_id ON northwind.invoices (id);
CREATE INDEX IF NOT EXISTS idx_fk_invoices_orders1 ON northwind.invoices (order_id);

--------
CREATE TABLE IF NOT EXISTS northwind.order_details_status (
  id INT NOT NULL,
  status_name VARCHAR(50) NOT NULL,
  PRIMARY KEY (id)
);


CREATE TABLE IF NOT EXISTS northwind.order_details (
  id SERIAL PRIMARY KEY,
  order_id INT NOT NULL,
  product_id INT,
  quantity NUMERIC(18,4) NOT NULL DEFAULT '0.0000',
  unit_price NUMERIC(19,4) DEFAULT '0.0000',
  discount DOUBLE PRECISION NOT NULL DEFAULT '0',
  status_id INT,
  date_allocated TIMESTAMP,
  purchase_order_id INT,
  inventory_id INT,
  CONSTRAINT fk_order_details_orders1
    FOREIGN KEY (order_id)
    REFERENCES northwind.orders (id)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT fk_order_details_products1
    FOREIGN KEY (product_id)
    REFERENCES northwind.products (id)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT fk_order_details_order_details_status1
    FOREIGN KEY (status_id)
    REFERENCES northwind.order_details_status (id)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
);

-- Create indexes
CREATE INDEX IF NOT EXISTS idx_order_details_id ON northwind.order_details (id);
CREATE INDEX IF NOT EXISTS idx_order_details_inventory_id ON northwind.order_details (inventory_id);
CREATE INDEX IF NOT EXISTS idx_order_details_product_id ON northwind.order_details (product_id);
CREATE INDEX IF NOT EXISTS idx_order_details_purchase_order_id ON northwind.order_details (purchase_order_id);
CREATE INDEX IF NOT EXISTS idx_order_details_order_id ON northwind.order_details (order_id);
CREATE INDEX IF NOT EXISTS idx_order_details_status_id ON northwind.order_details (status_id);


CREATE TABLE IF NOT EXISTS northwind.purchase_order_details (
  id SERIAL PRIMARY KEY,
  purchase_order_id INT NOT NULL,
  product_id INT,
  quantity NUMERIC(18,4) NOT NULL,
  unit_cost NUMERIC(19,4) NOT NULL,
  date_received TIMESTAMP,
  posted_to_inventory BOOLEAN NOT NULL DEFAULT false,
  inventory_id INT,
  CONSTRAINT fk_purchase_order_details_inventory_transactions1
    FOREIGN KEY (inventory_id)
    REFERENCES northwind.inventory_transactions (id)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT fk_purchase_order_details_products1
    FOREIGN KEY (product_id)
    REFERENCES northwind.products (id)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT fk_purchase_order_details_purchase_orders1
    FOREIGN KEY (purchase_order_id)
    REFERENCES northwind.purchase_orders (id)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
);

-- Create indexes
CREATE INDEX IF NOT EXISTS idx_purchase_order_details_id ON northwind.purchase_order_details (id);
CREATE INDEX IF NOT EXISTS idx_purchase_order_details_inventory_id ON northwind.purchase_order_details (inventory_id);
CREATE INDEX IF NOT EXISTS idx_purchase_order_details_product_id ON northwind.purchase_order_details (product_id);
CREATE INDEX IF NOT EXISTS idx_purchase_order_details_purchase_order_id ON northwind.purchase_order_details (purchase_order_id);



CREATE TABLE IF NOT EXISTS northwind.sales_reports (
  "group_by" VARCHAR(50) NOT NULL,
  display VARCHAR(50),
  title VARCHAR(50),
  filter_row_source TEXT,
  "default" BOOLEAN NOT NULL DEFAULT false,
  PRIMARY KEY ("group_by")
);

CREATE TABLE IF NOT EXISTS northwind.strings (
  string_id SERIAL PRIMARY KEY,
  string_data VARCHAR(255)
);

