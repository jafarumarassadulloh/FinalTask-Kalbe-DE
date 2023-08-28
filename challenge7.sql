-- Membuat tabel-tabel dimensi
CREATE TABLE date (
    date_id SERIAL PRIMARY KEY,
    calendar_date DATE,
    day_of_week INT,
    month INT,
    year INT
);

CREATE TABLE item (
    item_id SERIAL PRIMARY KEY,
    item_name VARCHAR(255),
    category VARCHAR(50),
    brand VARCHAR(50)
);

CREATE TABLE store (
    store_id SERIAL PRIMARY KEY,
    store_name VARCHAR(255),
    city VARCHAR(50),
    state VARCHAR(50)
);

CREATE TABLE customer (
    customer_id SERIAL PRIMARY KEY,
    customer_name VARCHAR(255),
    gender VARCHAR(10),
    age INT
);

CREATE TABLE promotion (
    promotion_id SERIAL PRIMARY KEY,
    promotion_name VARCHAR(255),
    start_date DATE,
    end_date DATE
);

-- Membuat tabel faktual sales
CREATE TABLE sales (
    sale_id SERIAL PRIMARY KEY,
    date_id INT REFERENCES date(date_id),
    item_id INT REFERENCES item(item_id),
    store_id INT REFERENCES store(store_id),
    customer_id INT REFERENCES customer(customer_id),
    promotion_id INT REFERENCES promotion(promotion_id),
    amount NUMERIC(10, 2),
    quantity INT
);

