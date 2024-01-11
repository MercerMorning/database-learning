-- Создание схемы storehouse
CREATE SCHEMA IF NOT EXISTS storehouse;

-- Создание таблиц в схеме storehouse
CREATE TABLE storehouse.producer (
                                     id SERIAL PRIMARY KEY,
                                     name VARCHAR(255) NOT NULL,
                                     inn VARCHAR(255) NOT NULL UNIQUE,
                                     CONSTRAINT check_inn_length_producer CHECK (LENGTH(inn) = 12)
);

CREATE TABLE storehouse.vendor (
                                   id SERIAL PRIMARY KEY,
                                   name VARCHAR(255) NOT NULL,
                                   inn VARCHAR(255) NOT NULL UNIQUE,
                                   CONSTRAINT check_inn_length_vendor CHECK (LENGTH(inn) = 12)
);

CREATE TABLE storehouse.product (
                                    id SERIAL PRIMARY KEY,
                                    producer_fk INTEGER NOT NULL,
                                    name VARCHAR(255) NOT NULL,
                                    description VARCHAR(255),
                                    CONSTRAINT fk_producer FOREIGN KEY (producer_fk) REFERENCES storehouse.producer(id)
);

-- Остальные таблицы в схеме storehouse

CREATE TABLE storehouse.vendor_product (
                                           id SERIAL PRIMARY KEY,
                                           vendor_fk INTEGER NOT NULL,
                                           product_fk INTEGER NOT NULL,
                                           price DECIMAL NOT NULL,
                                           amount INTEGER NOT NULL,
                                           CONSTRAINT fk_vendor_product_vendor FOREIGN KEY (vendor_fk) REFERENCES storehouse.vendor(id),
                                           CONSTRAINT fk_vendor_product_product FOREIGN KEY (product_fk) REFERENCES storehouse.product(id)
);

CREATE TABLE storehouse.basket (
                                   amount INTEGER NOT NULL,
                                   vendor_product_fk INTEGER NOT NULL,
                                   CONSTRAINT fk_vendor_product_basket FOREIGN KEY (vendor_product_fk) REFERENCES storehouse.vendor_product(id)
);

CREATE TABLE storehouse.review (
                                   vendor_product_fk INTEGER NOT NULL,
                                   score INTEGER NOT NULL,
                                   review VARCHAR(255),
                                   CONSTRAINT fk_vendor_product_review FOREIGN KEY (vendor_product_fk) REFERENCES storehouse.vendor_product(id)
);

-- Остальные таблицы в схеме storehouse

-- Создание схемы sales
CREATE SCHEMA IF NOT EXISTS sales;

-- Создание таблиц в схеме sales
CREATE TABLE storehouse.customer (
                                     id SERIAL PRIMARY KEY,
                                     first_name VARCHAR(255) NOT NULL,
                                     last_name VARCHAR(255) NOT NULL,
                                     phone VARCHAR(255) NOT NULL
);

-- Остальные таблицы в схеме sales

CREATE TABLE sales.sale (
                            id SERIAL PRIMARY KEY,
                            number VARCHAR(255) NOT NULL,
                            customer_fk INTEGER NOT NULL,
                            created_at TIMESTAMP NOT NULL,
                            total DECIMAL NOT NULL,
                            CONSTRAINT fk_sale_customer FOREIGN KEY (customer_fk) REFERENCES storehouse.customer(id)
);

CREATE TABLE sales.sale_product (
                                    id SERIAL PRIMARY KEY,
                                    amount INTEGER NOT NULL,
                                    total DECIMAL NOT NULL,
                                    sale_fk INTEGER NOT NULL,
                                    vendor_product_fk INTEGER NOT NULL,
                                    CONSTRAINT fk_sale_product_sale FOREIGN KEY (sale_fk) REFERENCES sales.sale(id),
                                    CONSTRAINT fk_sale_product_vendor_product FOREIGN KEY (vendor_product_fk) REFERENCES storehouse.vendor_product(id)
);
